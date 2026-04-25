journal:: ArXiv

	- volume:: abs/2402.16082
	- #journal #paper #Radar #slam #uncertainty
- [[@Modeling Point Uncertainty in Radar SLAM]]
- {{renderer :tocgen2}}
- ## Radar Measurement Model
	- Given radar point $^R p_k$ in the radar frame $R$, decompose into two components:
		- $$^Rp_k=[r_k,\ \Omega_k]^T$$
	- ### Range Component
		- range: $r_k \in \mathbb{R}$
		- $$r^{gt}_k = r_k + \delta_{r_k}, \quad \delta_{r_k} \sim \mathcal{N}(0, \sigma_r^2)$$
	- ### Bearing Component (The $S^2$ Manifold)
		- The bearing direction is represented as a unit vector on the **sphere manifold**: $\Omega_k \in S^2 \subset \mathbb{R}^3$.
		- Unlike range, the bearing cannot be updated with standard vector addition without losing the unit-length constraint. Instead, we use the **Manifold $\boxplus$ (boxplus)** operator.
		- #### Manifold Representation
			- A perturbation $\delta \Omega_k$ is defined in the **2D tangent space** $T_{\Omega}S^2 \approx \mathbb{R}^2$.
			- $$\Omega^{gt}_k = \Omega_k \boxplus \delta \Omega_k$$
			- where $\delta \Omega_k \sim \mathcal{N}(0_{2 \times 1}, \Sigma_{\Omega})$.
		- #### The $\boxplus$ Operator for $S^2$
			- To map the 2D perturbation back to the 3D sphere:
			- $$\Omega \boxplus \delta \Omega = \cos(\|\delta \Omega\|) \Omega + \sin(\|\delta \Omega\|) \frac{\mathbf{B}_{\Omega} \delta \Omega}{\|\delta \Omega\|}$$
			- where $\mathbf{B}_{\Omega} = [b_1, b_2] \in \mathbb{R}^{3 \times 2}$ is an orthonormal basis for the tangent space at $\Omega$.
		- #### Covariance on Manifold
			- The uncertainty is modeled by the $2 \times 2$ covariance matrix $\Sigma_{\Omega} = \text{diag}(\sigma_{\theta}^2, \sigma_{\phi}^2)$.
			- This representation avoids the **gimbal lock** (singularity) associated with traditional Euler-based azimuth/elevation angles at the poles.
- ## Mathematical Foundations: Lie Group vs. Manifold
	- | Concept | Type | Tangent Space | Operator ($\boxplus$) | Operator ($\boxminus$) |
	  |---------|------|---------------|-----------------------|------------------------|
	  | **Rotation** | Lie Group ($SO(3)$) | $\mathfrak{so}(3) \approx \mathbb{R}^3$ | $R \boxplus \delta = R \cdot \exp(\delta^\wedge)$ | $R_1 \boxminus R_2 = \log(R_2^T R_1)^\vee$ |
	  | **Direction** | Manifold ($S^2$) | $T_{\Omega}S^2 \approx \mathbb{R}^2$ | $\Omega \boxplus \delta = \text{Exp}_{\Omega}(\mathbf{B}_{\Omega}\delta)$ | $\Omega_1 \boxminus \Omega_2 = \mathbf{B}_{\Omega_2}^T \text{Log}_{\Omega_2}(\Omega_1)$ |
	- ### Key Differences
		- **Lie Group (李群):** A manifold that also satisfies group axioms (identity, inverse, associativity). In SLAM, we use the group action (multiplication) to apply perturbations.
		- **Manifold (流型):** A space that locally resembles Euclidean space. $S^2$ is a manifold but **not** a Lie group. Because it lacks a group operation, we use a **Retraction** (like $\boxplus$) to map tangent space vectors back to the manifold.
	- ### Conceptual Intuition: The "Walking on Earth" Analogy
		- Imagine you are standing at the North Pole ($\Omega$ on the $S^2$ sphere).
		- #### The Problem with Standard Addition ($+$):
			- If you use standard 3D vector addition to move "Right," you would fly off the Earth's surface into outer space. This breaks the constraint $||\Omega||=1$.
		- #### The Box-Plus Operator ($\boxplus$):
			- Think of this as looking at a **flat map** (the Tangent Space) in your hand. You decide to walk "10 meters East" on the map.
			- The $\boxplus$ operator "bends" that flat instruction so that you walk along the curved surface of the Earth. You stay on the ground.
		- #### The Box-Minus Operator ( $\boxminus$ ):
			- If you are in London and your friend is in Paris, the $\boxminus$ operator calculates: "On my flat map, which direction and how far do I need to walk to get to my friend?" It translates the curved distance back into a 2D vector.
	- ### The $S^2$ Operators
		- **Exponential Map (Geodesic):**
			- $\Omega \boxplus \delta = \cos(\|\delta\|) \Omega + \sin(\|\delta\|) \frac{\mathbf{B}_{\Omega} \delta}{\|\delta\|}$
			- This moves $\Omega$ along the sphere's surface in the direction of the tangent vector $\mathbf{B}_{\Omega} \delta$.
		- **Logarithm Map:**
			- $\text{Log}_{\Omega_2}(\Omega_1) = \frac{\theta}{\sin \theta} (\Omega_1 - \cos \theta \Omega_2)$, where $\theta = \arccos(\Omega_2^T \Omega_1)$.
			- This calculates the tangent vector that points from $\Omega_2$ to $\Omega_1$.
	- ### Why this matters for Radar SLAM
		- **Singularity-Free:** Unlike Azimuth/Elevation angles, the $S^2$ representation does not suffer from **gimbal lock** at the poles.
		- **Minimal Parameterization:** We use 2D coordinates in the tangent space for Kalman Filter covariance ($\Sigma \in \mathbb{R}^{2 \times 2}$), while keeping the 3D unit-vector constraint ($\|\Omega\|=1$) in the state.
- ## Appendix: Derivation of $S^2$ Operators
	- ### 1. Box-plus ($\boxplus$) - The Exponential Map
		- **Goal:** Move from point $\Omega$ in direction $v = \mathbf{B}_{\Omega}\delta$ by distance $\theta = \|v\|$.
		- **Derivation:**
			- Define the unit tangent vector: $u = \frac{v}{\|v\|}$. Note that $u \perp \Omega$ and $\|u\|=1$.
			  logseq.order-list-type:: number
			- Since $\{\Omega, u\}$ are orthonormal vectors, they span a 2D plane in $\mathbb{R}^3$.
			  logseq.order-list-type:: number
			- Any point on the unit circle in this plane can be written as $\cos(\theta)\Omega + \sin(\theta)u$.
			  logseq.order-list-type:: number
			- This construction ensures the new point is on the sphere because:
			  logseq.order-list-type:: number
				- $$\|\cos(\theta)\Omega + \sin(\theta)u\|^2 = \cos^2\theta \|\Omega\|^2 + \sin^2\theta \|u\|^2 = \cos^2\theta + \sin^2\theta = 1$$
	- ### 2. Box-minus ($\boxminus$) - The Logarithm Map
		- **Goal:** Find the tangent vector $\delta$ at $\Omega_2$ that points toward $\Omega_1$.
		- **Derivation:**
			- **Angle Calculation:** The geodesic distance $\theta$ is the angle between the two vectors: $\theta = \arccos(\Omega_2^T \Omega_1)$.
			  logseq.order-list-type:: number
			- **Orthogonalization:** We need the component of $\Omega_1$ that is orthogonal to $\Omega_2$. Using Gram-Schmidt:
			  logseq.order-list-type:: number
				- $$\Omega_{1 \perp} = \Omega_1 - (\Omega_2^T \Omega_1) \Omega_2 = \Omega_1 - \cos(\theta) \Omega_2$$
			- **Normalization:** The length of this orthogonal component is $\|\Omega_{1 \perp}\| = \sin(\theta)$.
			  logseq.order-list-type:: number
			- **Full 3D Tangent Vector:** The vector with length $\theta$ in the direction of $\Omega_{1 \perp}$ is:
			  logseq.order-list-type:: number
				- $$v = \theta \frac{\Omega_{1 \perp}}{\|\Omega_{1 \perp}\|} = \frac{\theta}{\sin \theta} (\Omega_1 - \cos \theta \Omega_2)$$
			- **Projection:** Finally, project $v$ into the 2D local coordinates: $\delta = \mathbf{B}_{\Omega_2}^T v$.
			  logseq.order-list-type:: number
	- ### Summary of "Magic Factors"
		- #### $\sin / \cos$ in $\boxplus$: Ensures the state stays on the manifold (unit length).
		- **$\theta / \sin \theta$ in $\boxminus$:** A scaling factor that accounts for the curvature of the sphere. As $\theta \to 0$, $\frac{\theta}{\sin \theta} \to 1$, recovering the Euclidean vector subtraction.