- #Septentrio #GNSS #receiver
- ## Table of Contents
	- ((6800c069-6572-427c-bbfd-444869493456))
	- ((6800c074-9383-484f-98fc-f39f44dad838))
	- ((6800c080-5f62-437d-aa40-b940a19c7d43))
		- ((6800c0cb-dc14-4a31-87fa-9c260f2f3921))
- ## Loosely Coupled
  id:: 6800c069-6572-427c-bbfd-444869493456
	- ### SBF
	  ```plaintext
	  SBF-MeasEpoch → Time, Lat/Lon/Altitude, Velocity (NED)
	  SBF-NavCovariance → posCovNN/EE/DD, velCovNN/EE/DD (Covariance Matrix)
	  SBF-NavDOP → GDOP, PDOP, HDOP, VDOP
	  SBF-NavSIG → SNR, C/N0
	  ```
		- ((sep pos))
	- ### NMEA
- ## Tightly Coupled
  id:: 6800c074-9383-484f-98fc-f39f44dad838
- ## Appandix
  id:: 6800c080-5f62-437d-aa40-b940a19c7d43
	- ### Documents
	  id:: 6800c0cb-dc14-4a31-87fa-9c260f2f3921
		- [Official: mosaic-X5 Firmware v4.14.10.1.zip](https://www.septentrio.com/resources/mosaic-X5/mosaic-X5_fwp_4.14.10.1.zip)
		- [RTKLIB/src/rcv/septentrio.c at master · tomojitakasu/RTKLIB](https://github.com/tomojitakasu/RTKLIB/blob/master/src/rcv/septentrio.c)
		  id:: 6800c243-ac71-489a-a6eb-1d0eb5999c2e
	- ### Septentrio Binary Format (SBF)
		- #### Messages from ((6800c243-ac71-489a-a6eb-1d0eb5999c2e)) 
		  collapsed:: true
		  (**Generate by ChatGPT**)
		  | **Message Type**    | **Message ID (Hex)** | **Description**  | **Fields/Details** |
		  |-----------------------|--------------------------|-------------------|---------------------|
		  | **MeasEpoch**           | `0x0101`             | Measurement data for an epoch, including pseudorange, carrier phase, Doppler.   | - Time of Week (TOW) <br /> - Satellite ID <br /> - Pseudorange <br /> - Carrier phase <br /> - Doppler <br /> - SNR     |
		  | **MeasSat**             | `0x0102`             | Measurement data for each individual satellite (pseudorange, Doppler, SNR).      | - Satellite ID <br /> - Pseudorange <br /> - Doppler <br /> - SNR (Signal to Noise Ratio)                            |
		  | **NavEphemeris**        | `0x0103`             | Ephemeris data for satellites (orbital parameters).                             | - Satellite ID <br /> - Orbital parameters (e.g., semi-major axis, eccentricity, etc.)                           |
		  | **NavPose**             | `0x0104`             | Receiver position, velocity, and status (Latitude, Longitude, Altitude).         | - Position (latitude, longitude, altitude) <br /> - Velocity (NED or ENU) <br /> - Receiver status                |
		  | **NavVel**              | `0x0105`             | Velocity solution (typically in the NED frame).                                | - Velocity components (NED or ENU) <br /> - Velocity accuracy or covariance (if available)                      |
		  | **NavTime**             | `0x0106`             | Receiver time data, including GPS time and system time.                        | - GPS Time <br /> - System Time                                                                                   |
		  | **NavCovariance**       | `0x0107`             | Covariance matrix for position and velocity, indicating uncertainty.            | - Covariance matrix for position <br /> - Covariance matrix for velocity                                         |
		  | **NavDOP**              | `0x0108`             | DOP (Dilution of Precision) values, including PDOP, HDOP, VDOP, and TDOP.        | - PDOP, HDOP, VDOP, TDOP                                                                                       |
		  | **NavRaw**              | `0x0109`             | Raw GNSS measurements (pseudorange, carrier phase, Doppler).                   | - Pseudorange <br /> - Carrier phase <br /> - Doppler <br /> - Signal quality (optional)                            |
		  | **Status**              | `0x0110`             | Receiver status, including operational status and error codes.                  | - Operational status <br /> - Error codes                                                                          |
		  | **SatHealth**           | `0x0111`             | Health status of GNSS satellites (healthy or unhealthy).                        | - Satellite health status (healthy/unhealthy)                                                                   |
		  | **SNR**                 | `0x0112`             | Signal-to-Noise Ratio (SNR) for each satellite, indicating signal quality.      | - SNR value for each satellite                                                                                  |
		  | **ExtEvent**            | `0x0201`             | External event data, including position and orientation of base stations.       | - External event time (TOW) <br /> - Relative position (East-North-Up) <br /> - Event status                       |
		  | **BBSamples**           | `0x0400`             | Baseband samples (ADC data), typically used for signal processing.              | - Baseband signal data                                                                                          |
		- ### NavPose (0x0104)
		- ### NavCovariance (0x0107)
		- ### NavDOP (0x0108)
		- ### NavSIG (0x0104)
		- ### MeasEpoch (0x0101)