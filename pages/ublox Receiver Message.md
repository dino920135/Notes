- {{renderer :tocgen2}}
- ## Loosely Coupled
	- ### UBX
	  ```plaintext
	  UBX-NAV-PVT → Time, Lat/Lon/Altitude, Velocity(NED)
	  UBX-NAV-COV → posCovNN/EE/DD, velCovNN/EE/DD (Covariance Matrix)
	  UBX-NAV-DOP → GDOP, PDOP, HDOP, VDOP
	  UBX-NAV-SIG → SNR, C/N0
	  ```
		- ((67e10ad0-f42b-469a-8b04-6cc825560219))
		  This message provides the complete `Navigation Position Velocity Time` solution, including position, velocity, time, and satellite information.
			- Time
				- `iTOW (ms)``: GPS time of week of the navigation epoch (milliseconds).
			- Position
				- `lat (deg)`: Latitude (degrees, in the range of -90 to 90).
				- `lon (deg)`: Longitude (degrees, in the range of -180 to 180).
				- `altitude (mm)`: Altitude above the WGS84 ellipsoid (in millimeters).
			- Velocity
				- `velN (mm/s)`: North velocity component (in millimeters per second).
				- `velE (mm/s)`: East velocity component (in millimeters per second).
				- `velD (mm/s)`: Down velocity component (in millimeters per second).
			- Number of Satellite
				- `numSV`: Number of satellites used in the navigation solution.
		- #### ((67e1159a-0a92-40c0-bc57-dc47f8054ed2))
		  This message provides the `Covariance Matrix` values, used for estimating the uncertainty in the position and velocity measurements.
			- Position Covariance Matrix:
				- `posCovNN (m²)`: Covariance matrix value for position in the North direction.
				- `posCovEE (m²)`: Covariance matrix value for position in the East-East direction.
				- `posCovDD (m²)`: Covariance matrix value for position in the Down direction.
			- Velocity Covariance Matrix:
				- `velCovNN (m²/s²)`: Covariance matrix value for velocity in the North direction.
				- `velCovEE (m²/s²)`: Covariance matrix value for velocity in the East-East direction.
				- `velCovDD (m²/s²)`: Covariance matrix value for velocity in the Down direction.
		- #### ((67e10ad0-be56-4a3a-a3cf-146092ed7bf0)) (DOPs)
		  This message provides `Dilution of Precision (DOP)` values. DOP indicates the quality of the satellite geometry and its effect on the positional accuracy.
		  ***!!! All DOPs are scaled with 100 !!!***
			- `GDOP (Geometric DOP)`: A composite of the position, velocity, and time geometry.
			- `PDOP (Position DOP)`: Indicates the positional accuracy based on the satellite geometry.
			- `HDOP (Horizontal DOP)`: Indicates the accuracy of the horizontal (latitude/longitude) position.
			- `VDOP (Vertical DOP)`: Indicates the accuracy of the vertical (altitude) position.
		- #### ((67e116b0-32af-4301-9753-de056c4cb114)) (SNR & $C/N_0$)
		  This message provides `Signal Information`, including information about the satellite signal quality.
			- `SNR (dB-Hz)`: Signal strength of the received satellite signal.
			- `C/N₀ (dB-Hz)`: Ratio of the signal's carrier power to its noise level, used to evaluate signal quality.
	- ### NMEA
	  ```plaintext
	  $GNRMC → Time, Lat/Lon, Velocity (ground speed & course)
	  $GNGGA → Altitude, Num. Satellites, basic HDOP
	  $GNGSA → GDOP, PDOP, HDOP, VDOP
	  $GNGST → Detailed Position Accuracy (RMS values for lat, lon, altitude)
	  
	  !!! Noted: Velocity accuracy is missing with NMEA !!!
	  ```
		- ((67e10ad0-e2b4-46ea-9f4a-d8e317713799))
		- ((67e11cf5-6658-48ca-94f3-8c14360310ed))
		- ((67e23cd1-2fba-45e4-87ec-3057bec52296))
		- ((67e23cda-b229-40f6-9a66-8d6994c2c1b3))
- ## Tightly Coupled
  For the messages here RTKLIB provides functions parsing this messages, see the link below for more detail: https://github.com/tomojitakasu/RTKLIB/blob/71db0ffa0d9735697c6adfd06fdf766d0e5ce807/src/rcv/ublox.c#L1047
	- ((67e10ad0-83f0-44f8-943f-bfb2092e0363)) (Observation)
	- ((67e10ad0-21b8-4894-b38c-d1c4aa9803bf)) (Ephemeris)
- ## Appandix
  collapsed:: true
	- ### UBX
		- ### UBX-RXM-RAWX (0x02 0x15)
		  id:: 67e10ad0-83f0-44f8-943f-bfb2092e0363
		  This message contains the i**nformation needed to be able to generate a RINEX 3
		  multi-GNSS observation file** (see ftp://ftp.igs.org/pub/data/format/).
		  This message contains **pseudorange, Doppler, carrier phase, phase lock and
		  signal quality information** for GNSS satellites once signals have been
		  synchronized. This message supports all active GNSS.
		  ***!!! Only supports with Time Sync products !!!***
		  | Header    | Class | ID   | Length (Bytes)     | Payload   | Checksum   |
		  |-----------|-------|------|--------------------|-----------|------------|
		  | 0xb5 0x62 | 0x02  | 0x15 | 16 + numMeas·32    | see below | CK_A CK_B  |
		- ### UBX-RXM-SFRBX (0x02 0x13)
		  id:: 67e10ad0-21b8-4894-b38c-d1c4aa9803bf
		  This message reports a **complete subframe of broadcast navigation data
		  decoded from a single signal**. The number of data words reported in each
		  message depends on the nature of the signal.
		  | Header    | Class | ID   | Length (Bytes) | Payload   | Checksum   |
		  |-----------|-------|------|----------------|-----------|------------|
		  | 0xB5 0x62 | 0x02  | 0x13 | 8 + 4*numWords | see below | CK_A CK_B  |
		- ### UBX-NAV-PVT (0x01 0x07)
		  id:: 67e10ad0-f42b-469a-8b04-6cc825560219
		  This message combines **position, velocity and time solution**, including accuracy
		  figures. Note that during a leap second there may be more or less than 60 seconds in a
		  minute. See the description of leap seconds for details.
		  | Header    | Class | ID   | Length (Bytes) | Payload   | Checksum   |
		  |-----------|-------|------|----------------|-----------|------------|
		  | 0xb5 0x62 | 0x01  | 0x07 | 92             | see below | CK_A CK_B  |
		- ### UBX-NAV-COV (0x01 0x36)
		  id:: 67e1159a-0a92-40c0-bc57-dc47f8054ed2
		  This message outputs the **covariance matrices for the position and velocity
		  solutions** in the topocentric coordinate system defined as the local-level North
		  (N), East (E), Down (D) frame. As the covariance matrices are symmetric, only
		  the upper triangular part is output.
		  | Header    | Class | ID   | Length (Bytes) | Payload   | Checksum   |
		  |-----------|-------|------|----------------|-----------|------------|
		  | 0xb5 0x62 | 0x01  | 0x36 | 64             | see below | CK_A CK_B  |
		- ### UBX-NAV-DOP (0x01 0x04)
		  id:: 67e10ad0-be56-4a3a-a3cf-146092ed7bf0
		  | Header    | Class | ID   | Length (Bytes) | Payload   | Checksum   |
		  |-----------|-------|------|----------------|-----------|------------|
		  | 0xB5 0x62 | 0x01  | 0x04 | 18             | see below | CK_A CK_B  |
			- DOP values are dimensionless.
			- All DOP values are **scaled by a factor of 100**. If the unit transmits a value of e.g.
			  156, the DOP value is 1.56.
		- ### UBX-NAV-SIG
		  id:: 67e116b0-32af-4301-9753-de056c4cb114
		  This message displays information about signals currently tracked by the
		  receiver.
		  On the F9 platform the maximum number of signals is 120.
		  ***!!! Only supports on u-blox 9 with protocol version 27.11 !!!***
		  | Message Structure | Header    | Class | ID   | Length (Bytes)  | Payload   | Checksum   |
		  |-------------------|-----------|-------|------|-----------------|-----------|------------|
		  |                   | 0xB5 0x62 | 0x01  | 0x43 | 8 + 16*numSigs  | see below | CK_A CK_B  |
	- ### NMEA
		- ### xxRMC
		  id:: 67e10ad0-e2b4-46ea-9f4a-d8e317713799
		- ### xxGGA
		  id:: 67e11cf5-6658-48ca-94f3-8c14360310ed
		- ### xxGST
		  id:: 67e23cd1-2fba-45e4-87ec-3057bec52296
		- ### xxGSA
		  id:: 67e23cda-b229-40f6-9a66-8d6994c2c1b3