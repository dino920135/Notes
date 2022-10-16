- # valgrind - tool for check memeory leak
- ## Installation
  Run `sudo apt-get install valgrind`
- ## Usage
  [Core Command-line Options](https://www.google.com/url?sa=t&rct=j&q=&esrc=s&source=web&cd=&cad=rja&uact=8&ved=2ahUKEwjPhpv7v-T6AhWhQ_UHHdauCD8QFnoECBkQAQ&url=https%3A%2F%2Fvalgrind.org%2Fdocs%2Fmanual%2Fmanual-core.html&usg=AOvVaw0nKXrmHOfAeBnP75c_evUR)
	- ### Execution
	  `valgrind <executable file>`
	- ### Execution with detail
	  `valgrind --leak-check=full --show-leak-kinds=all --verbose <executable file>`
- ## Examples
	- ### Leak Detail
	  ```text
	  ==14711== 200 bytes in 1 blocks are definitely lost in loss record 32 of 75
	  ==14711==    at 0x4C33B25: calloc (in /usr/lib/valgrind/vgpreload_memcheck-amd64-linux.so)
	  ==14711==    by 0x133F5C: HierarchicalModulePOS::InsDataConfig::InsDataConfig() (in /home/point001/TS/wistron-tra/pwrpakRT/build/Pwrpak_TPS)
	  ==14711==    by 0x11AFC0: main (in /home/point001/TS/wistron-tra/pwrpakRT/build/Pwrpak_TPS)
	  ```
	- ### Leak Summary
	  ```text
	  ==14156== HEAP SUMMARY:
	  ==14156==     in use at exit: 60,272 bytes in 830 blocks
	  ==14156==   total heap usage: 1,662,896 allocs, 1,662,066 frees, 4,383,233,592 bytes allocated
	  ==14156== 
	  ==14156== LEAK SUMMARY:
	  ==14156==    definitely lost: 5,088 bytes in 30 blocks
	  ==14156==    indirectly lost: 0 bytes in 0 blocks
	  ==14156==      possibly lost: 0 bytes in 0 blocks
	  ==14156==    still reachable: 55,184 bytes in 800 blocks
	  ==14156==         suppressed: 0 bytes in 0 blocks
	  ==14156== Rerun with --leak-check=full to see details of leaked memory
	  ==14156== 
	  ==14156== For counts of detected and suppressed errors, rerun with: -v
	  ==14156== Use --track-origins=yes to see where uninitialised values come from
	  ==14156== ERROR SUMMARY: 543216 errors from 26 contexts (suppressed: 0 from 0)
	  ```