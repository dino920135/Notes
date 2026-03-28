alias:: RS232

- # Serial Communication: RS232
	- RS232 (Recommended Standard 232) is a standard that defines the electrical characteristics and signal timing for serial communication between devices. It's commonly used for connecting peripherals like modems, printers, and industrial equipment to computers.
	- ## Key Characteristics
		- **Voltage Levels:**
			- Logic `1` (Mark state): Represented by a **negative voltage** (typically -3V to -25V).
			- Logic `0` (Space state): Represented by a **positive voltage** (+3V to +25V).
		- **Logic Inversion:** RS232 uses inverted logic compared to TTL. A logic `1` is represented by a negative voltage, and a logic `0` by a positive voltage.
		- **Asynchronous Communication:** Data is sent without a shared clock signal. Start and stop bits are used to frame each data byte.
	- ## Common Connector: DB9
		- The most common connector for RS232 is the 9-pin DB9 connector. Here's a typical pinout:
		- | Pin | Signal Name | Direction (DTE) | Description |
		  |---|---|---|---|
		  | 1 | DCD | Input | Data Carrier Detect |
		  | 2 | RXD | Input | Receive Data |
		  | 3 | TXD | Output | Transmit Data |
		  | 4 | DTR | Output | Data Terminal Ready |
		  | 5 | GND | - | Signal Ground |
		  | 6 | DSR | Input | Data Set Ready |
		  | 7 | RTS | Output | Request To Send |
		  | 8 | CTS | Input | Clear To Send |
		  | 9 | RI | Input | Ring Indicator |
	- ## Interfacing with TTL
		- RS232 voltage levels are not directly compatible with TTL (Transistor-Transistor Logic) levels.
		- **Voltage Mismatch**: RS232 uses a wide voltage swing (±3V to ±25V), while TTL operates on much lower voltages (0V to 0.8V for low, 2V to 5V for high).
		- **Logic Inversion**: RS232 signals are inverted relative to TTL. A logical '1' in RS232 is negative voltage, and a logical '0' is positive.
		- **Level Shifting**: To communicate between RS232 and TTL devices, a **level shifter** (e.g., a MAX232 or MAX3232 chip) is essential to translate the voltage levels and logic.
	- ## RS232 vs. TTL: Quick Comparison
		- | Feature | TTL | RS232 |
		  |---|---|---|
		  | Logic '1' (High) | +2V to +5V | -3V to -25V |
		  | Logic '0' (Low) | 0V to +0.8V | +3V to +25V |
		  | Distance | Short (board-level) | Long (up to 15m) |
		  | Noise Margin | Low | High |
		  | Common Use | Board-level, MCUs, ICs | Industrial equipment, Modems |
		- For more detailed comparisons, see the [[Serial/Comparison]] page.
		- ---
		- tags: [serial, communication, protocol, rs232] status: finalized