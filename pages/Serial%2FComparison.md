# Serial Communication Comparison: TTL vs RS232
	- ## Key Differences
		- | Feature | TTL | RS232 | 
		  |---|---|---| 
		  | **Logic '1' (High)** | +2V to +5V | -3V to -25V | 
		  | **Logic '0' (Low)** | 0V to +0.8V | +3V to +25V | 
		  | **Logic Type** | Non-inverted (Positive Logic) | **Inverted** (Negative Logic) | 
		  | **Noise Margin** | Low (Susceptible to noise) | High (Robust against noise) | 
		  | **Transmission Distance** | Short (Typically < 1m) | Long (Up to 15m or more) | 
		  | **Voltage Swing** | Small (~5V) | Large (Up to 50V) | 
		  | **Common Use** | Board-level, MCUs, ICs | Industrial equipment, Modems |
	- ## Interfacing Considerations
		- **Voltage Levels**: RS232 levels are incompatible with digital logic (TTL/CMOS). Connecting an RS232 signal directly to a TTL pin can **damage** the device.
		- **Level Shifting**: A level shifter (e.g., **MAX232** or **MAX3232**) is required to translate between the two standards.
		- **Inversion**: Remember that RS232 is logically inverted. A logic `1` (mark) is a negative voltage, and a logic `0` (space) is a positive voltage.
	- ## Related Pages
		- [[Serial/TTL]]
		- [[Serial/RS232]]