journal:: ArXiv
volume:: abs/2402.16082
tag:: #journal #paper #radar #slam #uncertainty

- ## Radar Measurement Model
	- Given radar point $^R p_k$ in the radar frame $R$, decompose into two components:
		- $$^Rp_k=[r_k,\ \Omega_k]^T$$
	- range: $r_k \in \R$
		- $$r^{gt}_k = r_k + \delta_{r_k}$$
	- azimuth $(\theta)$, elevation $(\phi)$: $\Omega_k \in S^2$
		- $$\delta_{\Omega_k} \sim \mathcal{N}(0_{2 \times 1},\ \Sigma_{\Omega}),\ 
		  \Sigma_{\Omega} = 
		  \begin{bmatrix}
		  \sigma^2_{\theta} & 0 \\
		  0 & \sigma^2_{\phi}
		  \end{bmatrix}
		  $$