- {{renderer :tocgen}}
- ## Introduction to Inertial Navigation
	- ### Rigid body modelling in space
	  Time varying position & attitude of moving object  
	  **Navigation State/Sensors/System, Navaid**
	- ### Forms of Navigation
		- Relative  
		  init coordinate,  velocity, heading
		- Absolute  
		  Measurements are made with respect to a **reference system**
	- ### Principle
	  $v=v_0+\int a\ dt$ <=> $s = s_0 + \int v\ dt = s_0 + v_0 t + \int a\ dt\ dt$  
	  $a^n = R^n_b a^b$  
	  where $R^n_b$ can be derived from gyroscope, $A^b$ can be derived from accelerometer
	- ### Accelerometer
		- Not possible to seperate gravitational measurement from motion measurement
		- Output of acceleration due to **gravitation is oppisite in sign** to the acceleration
		  =>specific force $f=a-g$
		- $$f=\frac{\Delta v}{\Delta t}$$
	- ### Gyroscope
		- Fiber Optical Gyro  
		  phase difference between cw ccw signal
- ## Principle of Inertial Navigation
	- $X_t=\int \int a_x\ dt = \frac{1}{2} a_x t^2 + v_0 t + x_0$
	  ![image.png](../assets/image_1676949898967_0.png)
	- ### Reference Frames
	  Accel => $f^i_b$  
	  Gyro => $\omega^b_{ib}=\omega^e_{ie} + \omega^n_{en} + \omega_m$ (stationary component + LLF rotation + motion rotation)
	- ### Theoretical Measurement of Stationary Accelerometer Traid
		- Level
	- ### Theoretical Measurement of Stationary yroscope Traid
		- Gyro  
		  $$\omega=\omega^e + \omega^n_{en} + \omega_m$$  
		  $\omega^n_en$: local level frame rotation due to the earth curvature  
		  $\omega_m$: body rotation due to motion
	- $\omega^n_{in}=\omega^n_{ie}+\omega^n_{en}$  
	  $\omega^n_{ib}=\omega^n_{in}+\omega^n_m$  
	  $\omega^n_{ib}=R^n_b \omega^b_{ib}$
- ## Inertial Sensor Errors
	- ### Systematic errors
	  Repeatability  
	  Stability or Drift-GM,AR,AI...
		- Bias
			- offset-deterministic  
			  polynomial least-square fit
			- drift-stochastic  
			  GM ...
		- Scale factor  
		  (not exaclty linear)
	- ### Nonorthogonality Error
	  Accel & Gyros were assumed to be orthogonal  
	  Nonorthogonality can cause **cross-axis signal coupling**
	- ### Stochastic Modeling of noise
		- wite noise process  
		  (independent to time)
		- $1^{st}$ order Markov Process (For modeling the Auto-correlation function)
	- ### Accelerometer Measurement Model
		- $I_f=f + B_f + S f + N f + \delta g + \epsilon(f)$
	- ### Gyroscope Measurement Model
		-
- ## Calibration of Inertial Sensors
	- Accel Bias could lead to leveling error
	  $e_{\theta}=-b_x/g$
	- ### How Gyro error effect position error  
	  $\delta \theta = \int b_\omega dt = b_\omega t$  
	  $\delta f_y = gsin(\delta \theta) \approx g\delta \theta \approx gb_\omega t$  
	  $\delta v = \int \delta f_y dt=\frac{1}{2}b_\omega g t^2$  
	  $\delta p = \int \delta v dt = \frac{1}{6}b_\omega gt^3$
- ## Initial Alignment of INS
	- ### Static Alignment
		- Course-Alignment
			- Leveling
				- Limited by Accel Bias
			- Gyro Compassing
				- Gyro Bias:  
				  $\delta=\frac{b_{\omega_{x^b}}}{\omega_e cos\phi}$  
				  (eg:plans fly below 80 deg lat)
				- Gyro ARW:  
				  $\delta A=\frac{ARW}{\omega_e cos\phi \sqrt{T_a}} => T_a=(\frac{ARW}{\omega_e cos\phi \delta A})^2$
- ## Surveying with Inertial Navigation
- ## Modeling Motion Using Inertial Data
	- ### Time Derivative of Rotation Metrices
		- $\dot{R^i_b} = R^i_b \Omega^i_{ib}$
		- When the rotations are small:  
		  $R^n_b=R(r)R(p)R(A)=I+\Omega^n_{nb}$
		- $$S=
		  \begin{bmatrix}
		  \theta , \theta, \theta
		  \end{bmatrix}$$  
		  https://youtu.be/BI5rUKu49jA
	- ### Transformation between Computational Frames
		- e->i (Earth Rotation)  
		  $$\omega^l_{ie}=
		  \begin{bmatrix}
		  0 \\
		  \omega^e cos\phi \\
		  \omega^e sin\phi
		  \end{bmatrix}
		  $$
		- e->l (Change of Local level frame)  
		  $$
		  \omega^l_{ie}=
		  \begin{bmatrix}
		  -\dot{\phi} \\
		  \dot{\lambda}cos\phi \\
		  \dot{\lambda}sin\phi
		  \end{bmatrix}
		  $$
	- ### Modeling Motion (Machanization) in the LLF
		- Position  
		  $\dot{\phi}=\frac{V^n}{M+h}$  
		  $\dot{\lambda} = \frac{V^e}{(N+h) cos\phi}$  
		  $\dot{h}=V^u$
		- Velocity
		- Attitude
		- ### Local Level Machanization Equations
		  $\dot{R}^l_b->\dot{V}^l->\dot{r}^l$  
		  $$
		  \begin{bmatrix}
		  \dot{r}^l \\
		  \dot{V}^l \\
		  \dot{R}^l_{ib} \\
		  \end{bmatrix}
		  =
		  \begin{bmatrix}
		  D^{-1} V^l \\
		  R^l_b f^b - (2\Omega^l_{ie} + \Omega^l_{el})V^l + g^l \\
		  R^l_b (\Omega^b_{ib} - \Omega^b_{il}) \\
		  \end{bmatrix}$$  
		  where, $f^b$ is from Accel, $\Omega^b_{ib}$ is from Gyro
		-
- ## Modeling Inertial Sensors Using Kalman Filtering
	- Minimizing INS error with external observations
	- $X_{t+1}=e^{f\Delta t} \cdot X_t$  
	  $e^{f\Delta t} = I + f \cdot \Delta t + \frac{1}{2}f^2 \Delta t^2 + ... (Taylor Expension)$  
	  $\Phi (Transition Matrix) = I +  f \cdot \Delta t$  
	  $X_{t+1} = \Phi \cdot X$
	- ### Velocity Errors
		-