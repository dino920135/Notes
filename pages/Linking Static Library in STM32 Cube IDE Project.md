- #[[STM/Cube IDE]] #[[Link Library]]
- ## Project Properties
	- ### C/C++ Build
		- **MCU/MPU GCC Compiler > Include paths (*.h)**
		  logseq.order-list-type:: number
			- ![image.png](../assets/image_1777948086757_0.png)
		- **MCU/MPU GCC Linker > Libraries (*.a)**
		  logseq.order-list-type:: number
			- Add  static library name to Libraries:
				- If library file name is **libgps_timer_cm4.a** then
				- type the filename as **gps_timer_cm4** (**without** `lib` and `*.a`)
			- Add library path to Library search path
			- ![image.png](../assets/image_1777948056228_0.png)
	- ### C/C++ General > Path and Symbols
		- Include Path
			- ![image.png](../assets/image_1777948810482_0.png)
		- Libraries
			- ![image.png](../assets/image_1777948825790_0.png)
			- ![image.png](../assets/image_1777948840398_0.png)