- #Septentrio #GNSS #receiver
- ## Table of Contents
	- ((6800c069-6572-427c-bbfd-444869493456))
		- ((6800c980-80d5-4200-b28f-fdb2223c5d19))
			- ((6800cc30-cfaa-4d4d-8688-5f6991761575))
			- ((6800ca7d-9f67-47f7-83c4-6c4d46d29d4f))
			- ((6800d572-7a35-4070-b7b9-794a5d191967))
			- ((6800caab-906d-42b6-8040-c44b9653accd))
			- ((6800d589-5fc8-421d-8b36-e6747bcf2115))
	- ((6800c074-9383-484f-98fc-f39f44dad838))
	- ((6800c080-5f62-437d-aa40-b940a19c7d43))
		- ((6800c0cb-dc14-4a31-87fa-9c260f2f3921))
- ## Loosely Coupled
  id:: 6800c069-6572-427c-bbfd-444869493456
	- ### SBF
	  id:: 6800c980-80d5-4200-b28f-fdb2223c5d19
	  ```plaintext
	  PVTGeodetic → Time, Lat/Lon/Altitude, Velocity (NED)
	  PosCovGeodetic → posCovNN/EE/DD (Covariance Matrix)
	  VelCovGeodetic → velCovNN/EE/DD (Covariance Matrix)
	  DOP → GDOP, PDOP, HDOP, VDOP
	  Meas3Ranges → SNR, C/N0
	  ```
		- ((6800cc30-cfaa-4d4d-8688-5f6991761575))
		  This block provides the receiver's **Position**, **Velocity**, and **Time** in **Geodetic coordinates**.
			- **Time**
				- `TOW (ms)`: GPS time of week of the navigation epoch (milliseconds).
			- **Position**
				- `lat (deg)`: Latitude (in degrees).
				- `lon (deg)`: Longitude (in degrees).
				- `height (m)`: Height above reference ellipsoid (in meters).
			- **Velocity**
				- `velN (m/s)`: North velocity component.
				- `velE (m/s)`: East velocity component.
				- `velU (m/s)`: Upward velocity component.
			- **Status**
				- `mode`: Navigation mode (e.g., Standalone, RTK Fixed).
				- `nrSV`: Number of satellites used in the solution.
		- ((6800ca7d-9f67-47f7-83c4-6c4d46d29d4f))
		  Provides the position covariance matrix in geodetic coordinates.
			- **Covariance (Position)**
				- `cov_latlat (m²)`: Variance in latitude.
				- `cov_lonlon (m²)`: Variance in longitude.
				- `cov_heightheight (m²)`: Variance in height.
		- ((6800d572-7a35-4070-b7b9-794a5d191967))
		  This block provides the **velocity covariance matrix** in the **North-East-Up (NEU)** frame.
			- **Covariance (Velocity)**
				- `cov_VnVn (m²/s²)`: Variance in north velocity.
				- `cov_VeVe (m²/s²)`: Variance in east velocity.
				- `cov_VuVu (m²/s²)`: Variance in up velocity.
		- ((6800caab-906d-42b6-8040-c44b9653accd))
		  This block provides **Dilution of Precision (DOP)** values, indicating the geometric quality of the satellite constellation.
			- **DOP Values**
				- `GDOP`: Geometric DOP (scaled by 100).
				- `PDOP`: Position DOP (scaled by 100).
				- `HDOP`: Horizontal DOP (scaled by 100).
				- `VDOP`: Vertical DOP (scaled by 100).
				- `TDOP`: Time DOP (scaled by 100).
				- `NDOP`: North DOP (scaled by 100).
				- `EDOP`: East DOP (scaled by 100).
		- ((6800d589-5fc8-421d-8b36-e6747bcf2115)) **(Optional)**
		  **!!! This Block is Optional, It Take Spaces Up to ~40-100 bytes !!!**
		  This block provides **code range measurements** and **C/N₀** (carrier-to-noise density ratio) for each satellite signal tracked.
			- **Per-satellite fields**
				- `svID`: Satellite identifier.
				- `cn0 (dB-Hz)`: Carrier-to-noise density ratio (C/N₀).
				- `codeRange (m)`: Measured pseudorange.
				- `signalType`: GNSS signal (e.g., GPS L1CA, Galileo E1).
	- ### NMEA
- ## Tightly Coupled
  id:: 6800c074-9383-484f-98fc-f39f44dad838
  For the messages here RTKLIB provides functions parsing this messages, see the link below for more detail: [RTKLIB/src/rcv/septentrio.c at master · tomojitakasu/RTKLIB](https://github.com/tomojitakasu/RTKLIB/blob/master/src/rcv/septentrio.c)
	- ### SBF
		- ### Observation
			- ((6800c3e4-ea2e-44c6-8a53-d1fe4c56550d))
			- ((680109cc-1c3e-4026-b978-69d485441933))
			- ((68010a59-b143-4318-aa1a-058f291e4599)) **(Optional)**
			  Provides the tracking noise variance, might be useful for tightly coupled system
		- ### Ephemeris
		  Select the Ephemeris blocks based on the constellation used
			- ((6801086d-4507-419f-8889-bc45d3e977e9))
			- ((68010a8d-3c0d-4da1-be6c-9b67a0ff326f))
			- ((68010aa5-e4ff-4b6d-a444-a1eefde549bd))
			- ((68010ab0-2805-4480-889c-c4d84e383c3a))
			- ((68010e46-83c2-4663-b877-e5bfe58b4ae1))
			- ((68010e56-533d-4e38-8c1a-8a0e0b06aa18))
- ## Appandix
  id:: 6800c080-5f62-437d-aa40-b940a19c7d43
	- ### Documents
	  id:: 6800c0cb-dc14-4a31-87fa-9c260f2f3921
		- [Official: mosaic-X5 Firmware v4.14.10.1.zip](https://www.septentrio.com/resources/mosaic-X5/mosaic-X5_fwp_4.14.10.1.zip)
		  id:: 6800c0dd-4378-4f50-93f5-a8c04a97ebc4
		- [RTKLIB/src/rcv/septentrio.c at master · tomojitakasu/RTKLIB](https://github.com/tomojitakasu/RTKLIB/blob/master/src/rcv/septentrio.c)
		  id:: 6800c243-ac71-489a-a6eb-1d0eb5999c2e
	- ### Septentrio Binary Format (SBF)
	  It's easier to reference from `Appandix B: List of SBF Blocks` in ((6800c0dd-4378-4f50-93f5-a8c04a97ebc4))
		- ### PVTGeodetic (4007)
		  id:: 6800cc30-cfaa-4d4d-8688-5f6991761575
		- ### PosCovGeodetic (5906)
		  id:: 6800ca7d-9f67-47f7-83c4-6c4d46d29d4f
		- ### VelCovGeodetic (5908)
		  id:: 6800d572-7a35-4070-b7b9-794a5d191967
		- ### DOP (4001)
		  id:: 6800caab-906d-42b6-8040-c44b9653accd
		- ### Meas3Ranges (4109)
		  id:: 6800d589-5fc8-421d-8b36-e6747bcf2115
		- ### MeasEpoch (4027)
		  id:: 6800c3e4-ea2e-44c6-8a53-d1fe4c56550d
		- ### EndOfMeas (5922)
		  id:: 680109cc-1c3e-4026-b978-69d485441933
		- ### GPSNav (5891)
		  id:: 6801086d-4507-419f-8889-bc45d3e977e9
		- ### GLONav (4004)
		  id:: 68010a8d-3c0d-4da1-be6c-9b67a0ff326f
		- ### GALNav (4002)
		  id:: 68010aa5-e4ff-4b6d-a444-a1eefde549bd
		- ### BDSNav (4081)
		  id:: 68010ab0-2805-4480-889c-c4d84e383c3a
		- ### QZSNav (4095)
		  id:: 68010e46-83c2-4663-b877-e5bfe58b4ae1
		- ### GEONav (5896)
		  id:: 68010e56-533d-4e38-8c1a-8a0e0b06aa18
		- ### MeasExtra (4000)
		  id:: 68010a59-b143-4318-aa1a-058f291e4599