# e-AR (EAR) PROJECT - EMERGENCY AUTOMATIC RESPIRATOR
This project was born because of CoVid19 pandemic.
The project Goal is to provide an emergency ventilator system to help CoVid19 serious cases using locally available resources.
This is an OPEN HARDWARE - OPEN SOURCE PROJECT.

DISCLAIMER: we will NOT take any responsability on devices built using partial or total information from this project. 
Any device used for life support and medical applications must meet all local requirements and they must be homologated by local regulatory agencies in ANY case.

The target is to run an entire ventilation system using an automotive car battery and an O2 can.
The initial project leader is Celso Ken Mori Monteiro, automotive designer with +30 yrs experience on automotive embedded systems
as OEM designer for customers as GM, Ford, VW, Fiat, Mercedes Benz, Scania, Navistar, Marcopolo, Agco...

The technology for first PCBs was downsized due to components availability in emerging countries so distributed production could be achieved even in small brazilian towns. The electronic parts are:
- PTH components
- Single-sided PCB, obtainable even by DIYs.

Basic concepts:
- FIO2 O2 + AIR mixer based on timed mechanical truck air valves and plastic bag container
- AMBU smasher based on car window motor due to availabilty and great mechanical characteristics
- ECU based on Arduino Pro Mini (the most available in emerging countries) and SPI based IO expension
- 2 motor drive options: relay (need second adjustable supply or buck) and PWM driven mosfet driver

Current Project Status:
- full HW schematics and system component's description available on "EAR System Developer's HW Guide", portuguese only version
- PCB Gerbers available, Single Side PTH version, Motor driver on relay option only. Time and size were underestimated because we no longer use these old technologies. Released on March 30, 2020.
- Mech prototype phase 2 aproved, torque is OK and current is low.
- Gerbers of single sided boards on PTH components published on March 30, 2020. Time and size were underestimated because we no longer use these old technologies. 
- EAR System Developer's SW Guide released on March 30, 2020.
- Functional electronics prototype built and delivered on April 2, 2020. No changes in PCBs are necessary except hardware end-of-courses provided for EAR ECU Motor Driver Board. Test driven by firmware FW00 - focused on HW testing only. Reads input pots, control motor with reversal action, measures motor current and tests IO expansion board. All items are functional.
- FW00 published in April 3, 2020.
- Added Mosfet-based PWM Motor Driver and Absolute position sensor using a car fuel level sensor.
- First working mechanical+electrical prototype delivered in April 6, 2020.

Pending:
- Mechanical drawings for productio expected for Week 15-16
- FR4 SMT PCB design for volume production expected for Week 15-16
- FW02 (Non-asssited Ventilator Firmware) expected for Week 16

Special thanks to all people that made this project real!
It's impossible to list all names involved, I apologize for forgetting someone.
The partial list follows:

Project Contributors, as they joned this project
- Joannes Berque (FR): first design idea.
- Celso Monteiro: eletronics design, system conception and documentation.
- Diego Padilha and Lucas Pianizzer: mechanical design and prototyping. 
- Marcelo Pires: electronic CAD, schematics capture & PCB Design.
- Nicolai Rutkevich: mechanical concepts.
- Bruno Afogliatto: decontamination concepts.
- Gustavo Ortenzi: motor drive alteratives.
- Suzuki: system concepts.
- Rodrigo Azevedo: organized Github Project.
- Douglas Esteves: interface with other projects.
- João Cardoso and Leonardo Afonso: Kicad Capture for Open Hardware.
- Andre Novelli e Victor Acioly: AMBU bags replacement.
- Flevio Alves: firmware design
- David Loos: electronics assembly

References:
- MIT E-Vent: human requirements and system conception ideas.

Healthcare professionals involved:
- Angelica Mammana M.D. helped stablishing specs and performed crytical analysis.
- Fernando Machado M.D. was the first contributing doctor.
- Lucio Flavio M.D.
- Ana Teresa Gama.

Project supporters:
- Fabio Knihs.
- Norberto Tomio.
- Gabriel Casagrande.
- Ivandro Ceccato.

Thanks to my family, special thanks to my dear wife Tissa and my children Joana, Gustavo and Leonardo, for their unlimited support and to all the people that prayed for this project, and God that inspired and guided me all the time.

