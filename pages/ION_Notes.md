title:: ION_Notes

- GNSS Attitude determination algorithm using Optimization Tech on Riemannian Manifolds
  collapsed:: true
	- GNSS attitude model
	- GNSS attitude model Constrain
		- Integer
		- ortho
	- Riemannian Optimization
		- reduce dimention
		- fewer nnumber of opration
	- Search interger
	- Comparing with MC Lambda
- Combining High Precision and Interference Resilient Positioning Spatial filtering for real-world jamming
  collapsed:: true
	- Antenna array
		- phase center error
	- steering vector
	- How to calulate the beamform
		- eigenbeamformer
		- buikd the real steering vector
			- max sig power
	- slow change jammer
	- rapid change
		- single
		- blind
		- deterninistic
	-
- PPP and IMU refernced LiDAR Data for 3D Mapping and monitoring of arial electric power lines
  collapsed:: true
	- electic line reconstruction
	- AMPERE
	- ![image.png](../assets/image_1663782162325_0.png)
	- ![image.png](../assets/image_1663782192975_0.png)
- GNSS-based Train Localization Integrety Performance Evaluation
  collapsed:: true
	- EUSPA H2020 grant (70%)
	- performance term defenition
	- CI interval performance prediction
		- geo time/track direction sampling
		- Model of masking & evaluation with FDE -> Availiable GNSS measurement
		- Fusion & error model
		- track direction preception & safety factor
		- solution for CI
	-
- Application of ML in to GNSS/IMU Integration for High Precision Positioning on smartphones
  collapsed:: true
	- TULEVA project
		- warehouse managment & smart logistics
	- ML in GNSS
		- model mapping between errors and position estimation
	- MAP PPK
		- **predicting driving path (type)**
	-
- An RTKLIB Opensource based Solution
  collapsed:: true
	- benchmark for "Conventional" PPK
	- [andriod_rinex](https://github.com/rokubun/android_rinex/tree/8ea7ab7ab807745b21cf452955d3589b6d0c8b71)
	- Maximize use of low-quality obs.
		- de-weight
		- elevation based -> C/N0 based
	-
- Two-step Optimization of velocity and position using smartphone's carrier phase obs.
  collapsed:: true
	- 0% fixed
	- FGO
	- two step
		- vel estimate
			- vx vy vz t
			- motion/doppler factor
			- exclude outlier fron cov in U direction
			- **moiddfied akima intrepolation**
		- position est.
			- xx xy xz t(diff const.)
			- Pseudorange factor + TDCP Factor + Doppler&t Factor
	- TDCP Factor
		- M-estimator with HUber func.
	- diff weighting for diff freq.
	- Maybe with Sliding window in realtime
	-
- Improving smartphone ppp/rtk performance using TDCP Obs.
  collapsed:: true
	- Doppler obs. in android cell phone seems to have bias with respect to pseudorange & carrier phase obs.
	-
-