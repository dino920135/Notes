title::
#ROS #PCL #pcl

- ## LZ4 Conflict working ROS with PCL
	- ### Error Message
	  /usr/include/flann/ext/lz4.h:249:72: error: conflicting declaration ‘typedef struct LZ4_streamDecode_t LZ4_streamDecode_t’
	   typedef struct { unsigned long long table[LZ4_STREAMDECODESIZE_U64]; } LZ4_streamDecode_t;
	- ### Solution
	  ```bash
	  sudo mv /usr/include/flann/ext/lz4.h /usr/include/flann/ext/lz4.h.bak
	  sudo mv /usr/include/flann/ext/lz4hc.h /usr/include/flann/ext/lz4hc.h.bak
	  
	  sudo ln -s /usr/include/lz4.h /usr/include/flann/ext/lz4.h
	  sudo ln -s /usr/include/lz4hc.h /usr/include/flann/ext/lz4hc.h
	  ```
-