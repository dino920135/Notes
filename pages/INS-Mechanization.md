- Reference form [ucalgary.ca/engo_webdocs/NES/01.20156.EHShin.pdf](https://www.ucalgary.ca/engo_webdocs/NES/01.20156.EHShin.pdf)
- # Inertial Navigation Equation
	- Position:  
	  $$\underline{{{r}}}^{n}=(\varphi\ \lambda\ h)^{T}$$
	- Velocity:  
	  $${\underline{{v}}}^{n}={\left(\begin{array}{l}{v_{N}}\\ {v_{E}}\\ {v_{D}}\end{array}\right)}={\left(\begin{array}{c c c}{(M+h)}&{0}&{0}\\ {0}&{(N+h)\cos\varphi}&{0}\\ {0}&{0}&{-1}\end{array}\right)}{\left(\begin{array}{c}{\dot{\varphi}}\\ {\dot{\lambda}}\\ {\dot{h}}\end{array}\right)}$$
- # Local Geographic Navigation frame Mechanization (n-frame)
	- ## Gyroscope
	  From **Gyro Meas.**($\omega^{b}_{ib}$) to **Attitude** $(\phi ,\ \theta,\ \psi)$
		- Measurement:  
		  $$\omega^{b}_{ib}$$
		- ## Error Compensation
			- Corrected Meas. = Measured Meas. - Gyro Bias x Time increment  
			  $$\omega^{b}_{ib} = \tilde{\omega}^{b}_{ib} - b_{\omega} \Delta t$$
		- ## Attitude Integration (n-frame)
			- The **body Gyro Meas.** with respect to **n-frame**
			  $$\omega^{b}_{nb} = ( \omega_{x} \ \omega_{y} \ \omega_{z})^{T} = \omega^{b}_{ib} - C_{n}^{b}(\omega^{n}_{ie}+\omega^{n}_{en}) \Delta t$$
			- ### Four Types of Attitude Integral
				- Euler Angle
				  Gives an intuitive attitude representation, but suffers from **Gimbal Lock**, which is not suitable for full attitude estimation.
				- DCM
				  Doesn't suffer from gimbal lock, but more unknown parameters (9, 3$\times$3 matrix) needed to be solve.
				- Quaternion
				- Rotation Vector
			- Angular increment
	- ## Accelerometer
		-