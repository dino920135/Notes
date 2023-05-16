- ## Reference
	- [Quickstart: Building with CMake | GoogleTest](https://google.github.io/googletest/quickstart-cmake.html)
	- [VSCode + CMake + googletest 基本入门_vscode怎么make runtest_Sprinkle_WPD的博客-CSDN博客](https://blog.csdn.net/qq_26915769/article/details/107028696?spm=1001.2101.3001.6650.1&utm_medium=distribute.pc_relevant.none-task-blog-2%7Edefault%7ECTRLIST%7ERate-1-107028696-blog-130151637.235%5Ev35%5Epc_relevant_increate_t0_download_v2_base&depth_1-utm_source=distribute.pc_relevant.none-task-blog-2%7Edefault%7ECTRLIST%7ERate-1-107028696-blog-130151637.235%5Ev35%5Epc_relevant_increate_t0_download_v2_base&utm_relevant_index=2)
- ## Declare Depedencies in CMakeLists.txt
	- Add the following lines to `CMakeLists.txt` file to declare the dependency on GoogleTest (**Require CMake at least 3.14**). GoogleTest official suggested to use `FetchContent` Cmake module (**Require CMake at least 3.11**).
	  
	  ```Cmake
	  # GoogleTest requires at least C++14
	  set(CMAKE_CXX_STANDARD 14)
	  
	  # FetchContent required at least Cmake 3.11
	  include(FetchContent)
	  FetchContent_Declare(
	    googletest
	    URL https://github.com/google/googletest/archive/03597a01ee50ed33e9dfd640b249b4be3799d395.zip
	  )
	  # For Windows: Prevent overriding the parent project's compiler/linker settings
	  set(gtest_force_shared_crt ON CACHE BOOL "" FORCE)
	  FetchContent_MakeAvailable(googletest)
	  ```
	  
	  The above configuration declares a dependency on GoogleTest which is downloaded from GitHub. In the above example, `03597a01ee50ed33e9dfd640b249b4be3799d395` is the Git commit hash of the GoogleTest version to use; it is recommend **updating the hash often to point to the latest version**.
- ## Creating Test Script
	- ```c
	  #include <gtest/gtest.h>
	  
	  // Demonstrate some basic assertions.
	  TEST(HelloTest, BasicAssertions) {
	    // Expect two strings not to be equal.
	    EXPECT_STRNE("hello", "world");
	    // Expect equality.
	    EXPECT_EQ(7 * 6, 42);
	  }
	  ```
	- ```cmake
	  enable_testing()
	  
	  add_executable(
	    hello_test
	    hello_test.cc
	  )
	  target_link_libraries(
	    hello_test
	    GTest::gtest_main
	  )
	  
	  include(GoogleTest)
	  gtest_discover_tests(hello_test)
	  ```