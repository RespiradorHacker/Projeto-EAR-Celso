# EAR PROJECT - EMERGENCY AUTOMATIC RESPIRATOR
This project was born because of CoVid19 pandemic.
The project Goal is to provide a full respiration System for CoVid19 serious cases with minimal resorces hospitals.
OPEN HARDWARE - OPEN SOURCE PROJECT
The target is to run an entire ventilation system using an automotive car battery and an O2 can
The initial project leader is Celso Ken Mori Monteiro, automotive designer with +30 yrs experience on automotive embedded systems
as OEM designer for customers as GM, Ford, VW, Fiat, Mercedes Benz, Scania, Navistar, Marcopolo, Agco

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

Pending:
- Gerbers of single sided boards on PTH components pending. Time and size were underestimated because we no longer use these old technologies. Estimated release on March 30, 2020.
- EAR System Developer's SW Guide expected release on March 30, 2020.
- Final mechanical prototype expected for Week 14

Special thanks to all people that made this project real!
It's impossible to list all names involved, I apologize for forgetting someone.
The partial list follows:

Project Contributors:
- Diego Padilha, Lucas Pianizzer: mechanical design and prototyping. 
- Marcelo Pires: electronic CAD, schematics capture & PCB Design.
- Celso Monteiro: eletronics design, system conception and documentation.
- Nicolai Rutkevich: mechanical concepts.
- Gustavo Ortenzi: motor drive alteratives.
- João Cardoso e Leonardo Afonso: Kicad Capture for Open Hardware.
- Bruno Afogliatto: decontamination concepts.
- Suzuki: system concepts.
- Joannes Berque (FR): first design idea.
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

Special thanks to Tissa and Leo, for their unlimited support and to God that inspired and guided me all the time.

