/*
 * Copyright (c) 2016 by Chris Barlow <chrisbarlow.wordpress.com>
 * Time-Triggered Cooperative Scheduler for arduino.
 *
 * This file is free software; you can redistribute it and/or modify
 * it under the terms of either the GNU General Public License version 2
 * or the GNU Lesser General Public License version 2.1, both as
 * published by the Free Software Foundation.
 */

#ifndef _TASKS_H_
#define _TASKS_H_

#include "Arduino.h"

typedef enum{TIMING_NORMAL, TIMING_FORCED}timingType_t;

class TaskSchedule{
  public:
	typedef void (*task_function_t)(void);

	/* Create a task list */
	void begin(uint16_t numTasks);
	/* Call in setup() Adds a task to the task list */
	void addTask(String taskName, task_function_t function, uint32_t offset, uint32_t period);
	void addTask(String taskName, task_function_t function, uint32_t offset, uint32_t period, timingType_t isPreemptive);
	void addTask(String taskName, task_function_t function, uint32_t offset, uint32_t period, uint8_t analysisPin);
	void addTask(String taskName, task_function_t function, uint32_t offset, uint32_t period, timingType_t isPreemptive, uint8_t analysisPin);
	/* Print a report of the last added task (requires Serial to be configured first) */
	String lastAddedTask(void);
	/* Start the timer interrupt (call at the end of setup() )*/
	void startTicks(uint16_t period);
	/* Call as the only method in loop(). Handles scheduling of the tasks */
	void runTasks(void);

	/* Error checks */
	bool checkTooManyTasks(void);
	bool checkTicksTooLong(void);

	/* local ISR function (not accessible to public) */
	friend void __isrTick(void);

  private:
	struct tasks{
		char				task_name[21];			/* Task name */
		task_function_t		task_function;			/* function pointer */
		uint32_t			task_period;			/* period in ticks */
		uint32_t			task_delay;				/* initial offset in ticks */
		uint8_t				analysis_pin;			/* optional GPIO pin to toggle for timing analysis */
		volatile uint8_t	*analysis_pin_port;		/* optional GPIO pin to toggle for timing analysis - port pointer */
		uint8_t				analysis_pin_bitmask;	/* optional GPIO pin to toggle for timing analysis - pin mask */
		timingType_t		preempt_flag;			/* controls whether the task is preemptive (runs in ISR) or cooperative (runs in scheduler) */
	};
	tasks* _taskList;
	uint16_t _tasksUsed;
	uint16_t _numTasks;
	bool _schedLock;

	/* Error flags */
	struct schedulerErrors{
		bool errTooManyTasks;
		bool errTicksTooLong;
	};
	schedulerErrors _errorFlags;

	void sleepNow(void);
	void addNewTask(String taskName, task_function_t function, uint32_t offset, uint32_t period, timingType_t isPreemptive, uint8_t pin);
	void dispatchTask(uint16_t taskIndex);
};

extern TaskSchedule Schedule;

#endif /* _TASKS_H_ */
