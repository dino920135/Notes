- #tf2 #ros2 #[[ros2 launch]]
- Use a ROS 2 launch file to conveniently publish static transforms between coordinate frames.
- ```python
  from launch import LaunchDescription
  from launch_ros.actions import Node
  
  def generate_launch_description():
      return LaunchDescription([
          Node(
              package='tf2_ros',
              executable='static_transform_publisher',
              name='link1_broadcaster',
              arguments=['0.0', '0.0', '0.25', '1.5708', '0.0', '0.0', 'parent_frame', 'child_frame']
              # Arguments: [x, y, z, roll(rad), pitch(rad), yaw(rad), parent_frame, child_frame]
          ),
      ])
  
  ```
- ## References
	- [ROS2-TF2.md at main · ros-industrial/ros2_i_training](https://github.com/ros-industrial/ros2_i_training/blob/main/workshop/source/_source/navigation/ROS2-TF2.md)