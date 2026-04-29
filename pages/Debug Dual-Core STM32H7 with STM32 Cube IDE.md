- #STM #[[Dual Core]] #STM32H7 #[[Cube IDE]]
- ## Resources
	- [STM32 Dual Core #1. Getting started with STM32 Dual Core CPUs || STM32H745 || How to DEBUG - YouTube]( https://youtu.be/jI1k6p-fduE?t=534)
	- [Dual Core Debugging on STM32H7 with STM32CubeIDE - YouTube](https://www.youtube.com/watch?v=k3mXhPZSasw)
	- [STM32CubeIDE使用总结（三）——debug调试程序_stm32cubeide debug-CSDN博客](https://blog.csdn.net/tuxinbang1989/article/details/100826820)
- ## Problems for Debugging Dual Core
	- ### Launching Debugger
		- #### Debug Configuration
		- #### Launch Group
	- ### CM7 and CM4 start order
		- #### Default Break Point
		- #### CM7 release CM4 entry point
			- ```c
			  /* When system initialization is finished, Cortex-M7 will release Cortex-M4 by means of
			  HSEM notification */
			  /*HW semaphore Clock enable*/
			  __HAL_RCC_HSEM_CLK_ENABLE();
			  /*Take HSEM */
			  HAL_HSEM_FastTake(HSEM_ID_0);
			  /*Release HSEM in order to notify the CPU2(CM4)*/
			  HAL_HSEM_Release(HSEM_ID_0,0);
			  /* wait until CPU2 wakes up from stop mode */
			  ```
	- ### Halting Cores Simultaneously
	  #+BEGIN_WARNING
	  **CM7 Should aways runs ahead of CM4!**
	  #+END_WARNING
		- #### Priority of CM7 & CM4
		- #### CM7 halting CM4
		- #### ~~CM4 halting CM7~~
		-