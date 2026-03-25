- #serial
- # What is TTL?
	- TTL stands for **T**ransistor-**T**ransistor **L**ogic.
	- In TTL logic, a high state (logic '1') is represented by a voltage between 2V and 5V, and a low state (logic '0') is represented by a voltage between 0V and 0.8V. Voltages between 0.8V and 2V are undefined.
- ## Difference between TTL and RS232
  - The main difference between TTL and RS232 is the voltage level and the way they represent logic states.
    | Feature | TTL | RS232 |
    |---|---|---|
    | Logic '1' | 2V to 5V | -3V to -25V |
    | Logic '0' | 0V to 0.8V | +3V to +25V |
    | Noise Margin | Low | High |
    | Distance | Short (board-level) | Long (up to 15m) |
    | Common Use | ICs, embedded systems | Modems, printers, serial ports |
  - As you can see from the table, RS232 has a much larger voltage swing, which gives it a higher noise margin and allows for longer transmission distances. However, the voltage levels are not compatible with modern digital logic, which is why you need a level shifter (like a MAX232 chip) to interface between RS232 and TTL devices.
  - Another key difference is that RS232 logic is inverted compared to TTL. A logic '1' in RS232 is a negative voltage, while a logic '0' is a positive voltage.