/*
 * Copyright (c) 2016 by Chris Barlow <chrisbarlow.wordpress.com>
 * Time-Triggered Cooperative Scheduler for arduino.
 *
 * This file is free software; you can redistribute it and/or modify
 * it under the terms of either the GNU General Public License version 2
 * or the GNU Lesser General Public License version 2.1, both as
 * published by the Free Software Foundation.
 */

#include <avr/power.h>
#include <avr/sleep.h>
#include <avr/wdt.h>

#include "Arduino.h"
#include "Tasks.h"

#define SET_TA(t) (*(t.analysis_pin_port) |= t.analysis_pin_bitmask)
#define CLR_TA(t) (*(t.analysis_pin_port) &= ~t.analysis_pin_bitmask)
#define NO_TA 		(0xFF)

TaskSchedule Schedule;

/********** Public methods **********/

/* Create a task list */
void TaskSchedule::begin(uint16_t numTasks){
	_tasksUsed = 0;
	_numTasks = numTasks;
	_taskList = (tasks*)malloc(numTasks*sizeof(tasks));
	_errorFlags.errTooManyTasks = false;
	_errorFlags.errTicksTooLong = false;
	_schedLock = true;
}

/* Call in setup() Adds a task to the task list */
/* Add a standard task */
void TaskSchedule::addTask(String taskName, task_function_t function, uint32_t offset, uint32_t period){
	addNewTask(taskName,function,offset,period,TIMING_NORMAL,NO_TA);
}

/* Add a task with preemptiveness */
void TaskSchedule::addTask(String taskName, task_function_t function, uint32_t offset, uint32_t period, timingType_t isPreemptive){
	addNewTask(taskName,function,offset,period,isPreemptive,NO_TA);
}

/* Add a task with a timing analysis pin */
void TaskSchedule::addTask(String taskName, task_function_t function, uint32_t offset, uint32_t period, uint8_t analysisPin){
	addNewTask(taskName,function,offset,period,TIMING_NORMAL,analysisPin);
}

/* Add a task with preemptiveness and a timing analysis pin */
void TaskSchedule::addTask(String taskName, task_function_t function, uint32_t offset, uint32_t period, timingType_t isPreemptive, uint8_t analysisPin){
	addNewTask(taskName,function,offset,period,isPreemptive,analysisPin);
}

/* Print a report of the last added task (requires Serial to be configured first) */
String TaskSchedule::lastAddedTask(){
	uint16_t lastTask;
	String output = "";

	if(_errorFlags.errTooManyTasks == true){
		output = "*** We're going to need a bigger schedule ***\n\n";
	}
	else if(_tasksUsed > 0){
		lastTask = _tasksUsed - 1;

		output = "---------------------------------------------\n";
		output += "Added task ";
		output += String(lastTask);
		output += ": \"";
		output += _taskList[lastTask].task_name;
		output += "\"\n---------------------------------------------\n";
		output += "Offset:\t\t";
		output += String(_taskList[lastTask].task_delay);
		output += " ms\n";

		output += "Period:\t\t";
		output += String(_taskList[lastTask].task_period);
		output += " ms\n";

		output += "Timing:\t\t";
		output += (_taskList[lastTask].preempt_flag ? "FORCED" : "NORMAL");

		output += "\nT Analysis:\t";
		if(_taskList[lastTask].analysis_pin_bitmask){
			output += "enabled on pin ";
			output += String(_taskList[lastTask].analysis_pin);
		}
		else{
			output += "disabled";
		}
		output += ("\n---------------------------------------------\n\n");
	}
	else{
		output = "*** No tasks in schedule ***\n\n";
	}

	return output;
}

/* Start the timer interrupt (call at the end of setup() )
 * The period is in ms, with a theoretical maximum value of 4194 ms
 * If the period exceeds this maximum, the timer will be disabled and the scheduler will not run */
void TaskSchedule::startTicks(uint16_t period){
	uint16_t scalarMask = 0x0000;
	uint32_t compMatch = 0;
	uint32_t clocks = microsecondsToClockCycles(1000) * (uint32_t)period; /* period is in milliseconds */

	/* This dynamically sets the prescalar in order to acheive the maximum accuracy possible for the required tick period */
	/* Prescalars less than 64 are overkill for a millisecond tick resolution, but it does no harm to include them */
	do{
		scalarMask++;
		switch(scalarMask){
		case 0x0001:
			compMatch = clocks - 1;
			break;
		case 0x0002:
			compMatch = (clocks/8) - 1;
			break;
		case 0x0003:
			compMatch = (clocks/64) - 1;
			break;
		case 0x0004:
			compMatch = (clocks/256) - 1;
			break;
		case 0x0005:
			compMatch = (clocks/1024) - 1;
			break;
		default:
			/* if the period won't fit in the 16 bit compare match register, the timer is disabled by setting all prescalar bits to 0 */
			compMatch = 0;
			scalarMask = 0;
			break;
		}
	}while((scalarMask != 0x0000) && (compMatch > 0xFFFF));

	if(scalarMask == 0x0000){
		_errorFlags.errTicksTooLong = true;
	}
	else{
		_errorFlags.errTicksTooLong = false;
	}

	/* initialize Timer1 */
	wdt_disable();					/* Disable the watchdog timer */
	cli(); 							/* disable global interrupts */

	TCCR1A = 0x0000; 				/* set entire TCCR1A register to 0 */
	TCCR1B = 0x0000; 				/* same for TCCR1B */

	OCR1A = ((uint16_t)compMatch);	/* set compare match register to desired timer count: */
	TCCR1B |= (1 << WGM12);			/* turn on CTC mode - clears counter on compare match */
	TCCR1B |= (scalarMask);			/* set prescalar (scalarMask = 0 disables the timer) */
	TIMSK1 |= (1 << OCIE1A);		/* enable timer compare interrupt: */

	sei(); 							/* enable global interrupts (start the timer)*/
}

/* Call as the only method in loop(). Handles scheduling of the tasks */
void TaskSchedule::runTasks(void){
	uint16_t i;
	/* Go to sleep. Woken by ISR loop continues, then sleep repeats */
	sleepNow();
/******************** Nothing happens until interrupt tick *****************************************/

	/*_schedLock prevents scheduler from running on non-timer interrupt */
	if (_schedLock == false){
		for(i = 0; i < _tasksUsed; i++){
			if((_taskList[i].preempt_flag == TIMING_NORMAL)&&(_taskList[i].task_delay == 0)){
				dispatchTask(i);
			}
		}
	}
}

/* Error checks */
bool TaskSchedule::checkTooManyTasks(void){
	return _errorFlags.errTooManyTasks;
}

bool TaskSchedule::checkTicksTooLong(void){
	return _errorFlags.errTicksTooLong;
}


/********** Private methods **********/

void TaskSchedule::sleepNow(){
	set_sleep_mode(SLEEP_MODE_IDLE);  	/* sleep mode is set here */
	sleep_enable();						/* enables the sleep bit in the mcucr register */
										/* so sleep is possible. just a safety pin */
	power_adc_disable();				/* Power down some things to save power */
	power_spi_disable();
	power_timer0_disable();
	power_twi_disable();

	_schedLock = true;					/* Prevent schedule from running on accidental wake-up */
	sleep_mode();            			/* here the device is actually put to sleep!! */
/* THE PROGRAM IS WOKEN BY TIMER1 ISR */
}

void TaskSchedule::addNewTask(String taskName, task_function_t function, uint32_t offset, uint32_t period, timingType_t isPreemptive, uint8_t pin){
	uint8_t port;

	if(_tasksUsed < _numTasks){
		strncpy(_taskList[_tasksUsed].task_name, taskName.c_str(), (sizeof(_taskList[_tasksUsed].task_name)-1));

		_taskList[_tasksUsed].task_function = function;
		_taskList[_tasksUsed].task_period = period;
		_taskList[_tasksUsed].task_delay = offset;
		_taskList[_tasksUsed].preempt_flag = isPreemptive;

		if(pin == NO_TA){
				_taskList[_tasksUsed].analysis_pin = 0;
				_taskList[_tasksUsed].analysis_pin_bitmask = 0;
				_taskList[_tasksUsed].analysis_pin_port = portOutputRegister(0);
		}
		else{
				port = digitalPinToPort(pin);
				_taskList[_tasksUsed].analysis_pin = pin;
				_taskList[_tasksUsed].analysis_pin_bitmask = digitalPinToBitMask(pin);
				_taskList[_tasksUsed].analysis_pin_port = portOutputRegister(port);

				pinMode(pin, OUTPUT);
				digitalWrite(pin, LOW);
		}

		_tasksUsed++;
	}
	else{
		_errorFlags.errTooManyTasks = true;
	}
}

void TaskSchedule::dispatchTask(uint16_t taskIndex){
	/* Reload task_delay */
	_taskList[taskIndex].task_delay = (_taskList[taskIndex].task_period - 1);
	SET_TA(_taskList[taskIndex]);
	/* Call task function */
	(*_taskList[taskIndex].task_function)();
	CLR_TA(_taskList[taskIndex]);
}


/* The ISR runs periodically every tick
 * Friend of TaskSchedule                */
void __isrTick(){
	uint16_t i;
	sleep_disable();        /* disable sleep */
	power_all_enable();			/* restore all power */
	for(i = 0; i < Schedule._tasksUsed; i++){
		/* task delay decremented until it reaches zero (time to run) */
		if(Schedule._taskList[i].task_delay > 0){
			Schedule._taskList[i].task_delay--;
		}
		/* Preemptive tasks are executed from the ISR */
		if((Schedule._taskList[i].preempt_flag == TIMING_FORCED)&&(Schedule._taskList[i].task_delay == 0)){
			Schedule.dispatchTask(i);
		}
	}
	Schedule._schedLock = false;		/* allow scheduler to run */
}
ISR(TIMER1_COMPA_vect){
	__isrTick();
}


