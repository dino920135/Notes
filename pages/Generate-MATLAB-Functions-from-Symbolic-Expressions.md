- {{renderer :tocgen2}}
- [Generate MATLAB Functions from Symbolic Expressions - MATLAB & Simulink (mathworks.com)](https://www.mathworks.com/help/symbolic/generate-matlab-functions.html)
- ## Matlab Symbolic
- ## Matlab Function
- ## Example
	- Specify polar coordinates $r(t), \phi (t)$, and $\theta (t)$ that are functions of time
	  ```matlab
	  syms r(t) phi(t) theta(t)
	  
	  # Define the coordinate transformation form spherical coordinates to Cartesian coordinates.
	  R = [r*sin(phi)*cos(theta), r*sin(phi)*sin(theta), r*cos(phi)]
	  
	  # Find the Jacobian of the coordinate change from spherical coordinates to Cartesian coordinates.
	  dR = jacobian(R,[r,phi,theta])
	  
	  # Generate Matlab function of dR with matlabFunction
	  matlabFunction(dR,'file','testMatrix.m', 'Optimize', true)
	  ```