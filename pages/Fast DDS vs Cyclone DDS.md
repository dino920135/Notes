- #[[ROS2]] #DDS #[[Fast DDS]] #[[Cyclone DDS]] #Middleware
- ## Overview
	- In ROS 2, the Middleware (RMW) layer abstracts the underlying DDS implementation. While **Fast DDS** is the default in Humble and Jazzy, **Cyclone DDS** is a popular alternative for high-performance or resource-constrained scenarios.
- ## Comparison Table
	- | Feature | Fast DDS (Default) | Cyclone DDS |
	  | :--- | :--- | :--- |
	  | **Default in** | Humble, Iron, Jazzy | Galactic (previous) |
	  | **Discovery** | Peer-to-Peer + Discovery Server | Peer-to-Peer (Multicast) |
	  | **CPU Usage** | Higher (rich features) | Lower (15-20% less) |
	  | **Memory** | Larger footprint | Leaner / Embedded-friendly |
	  | **Complexity** | High (extensive XML config) | Moderate (simple XML/env) |
	  | **OS Support** | Linux, Windows, macOS | Primary focus on Linux |
- ## Fast DDS (eProsima)
	- ### Pros
		- **Discovery Server:** Essential for networks without multicast (WiFi, Cloud, VPN).
		- **Rich Feature Set:** Supports Data-Sharing (Shared Memory), security plugins, and extensive monitoring.
		- **Commercial Support:** Backed by eProsima.
	- ### Cons
		- Higher discovery overhead in large networks (unless using Server).
		- Configuration can be overwhelming for simple use cases.
- ## Cyclone DDS (Eclipse)
	- ### Pros
		- **Efficiency:** Significantly lower CPU and memory usage.
		- **Stability:** Often reported as more stable for complex stacks like Nav2 and MoveIt 2.
		- **Simplicity:** Easier to get started and troubleshoot.
	- ### Cons
		- Dependent on multicast for discovery (harder to use in cloud/some WiFi).
		- Lacks a native "Discovery Server" equivalent (requires more network tuning).
- ## How to Switch RMW
	- 1. Install the implementation:
	  ```bash
	  sudo apt install ros-$ROS_DISTRO-rmw-cyclonedds-cpp
	  ```
	- 2. Set the environment variable:
	  ```bash
	  export RMW_IMPLEMENTATION=rmw_cyclonedds_cpp
	  ```
	- 3. Verify:
	  ```bash
	  ros2 doctor --report | grep rmw
	  ```
- ## Performance Tuning
	- ### For Large Data (LiDAR/Camera)
		- **Fast DDS:** Use the preset transport:
		  ```bash
		  export FASTDDS_BUILTIN_TRANSPORTS=LARGE_DATA
		  ```
		- **Cyclone DDS:** Increase kernel receive buffers:
		  ```bash
		  sudo sysctl -w net.core.rmem_max=2147483647
		  ```
- ## Summary Recommendation
	- **Use Fast DDS** if you need the **Discovery Server** (no multicast), are on **Windows**, or require specific enterprise features.
	- **Use Cyclone DDS** if you are on **Linux**, need to **minimize CPU/Memory**, or encounter intermittent connectivity issues with the default middleware.
