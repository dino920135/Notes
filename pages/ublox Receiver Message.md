- {{renderer :tocgen2}}
- ## Loosely Coupled
	- ### Requirements
	  | Data Element | UBX Message(s) | NMEA Sentence(s) |
	  | ---- | ---- | ---- |
	  | **Time** | `UBX-NAV-PVT` | `RMC` |
	  | **Position (Lat/Lon/Alt)** | `UBX-NAV-PVT` | `GGA` |
	  | **Velocity (NED)** | `UBX-NAV-PVT` | `RMC`|
	  | **Position Accuracy** | `UBX-NAV-COV` | `GST` |
	  | **Velocity Accuracy** | `UBX-NAV-COV` | N/A (not standard in NMEA) |
	  | **DOPs (GDOP, PDOP, HDOP, VDOP)** | `UBX-NAV-DOP` | `GSA` |
	  | **Number of Satellites** | `UBX-NAV-PVT` | `GGA`|
	  | **SNR / C/N₀** | `UBX-NAV-SIG` | `GGA`, `GSV` |
	- ### UBX
	  ```plaintext
	  UBX-NAV-PVT* → Time, Lat/Lon/Altitude, Velocity(NED)
	  UBX-NAV-COV* → Covariance Matrix
	  UBX-NAV-DOP → GDOP, PDOP, HDOP, VDOP
	  UBX-NAV-SIG → SNR, C/N0
	  
	  *Required feild
	  ```
		- ((67e10ad0-f42b-469a-8b04-6cc825560219))
		  This message provides the complete `Navigation Position Velocity Time` solution, including position, velocity, time, and satellite information.
			- Time
			  collapsed:: true
				- `iTOW (ms)``: GPS time of week of the navigation epoch (milliseconds).
			- Position
			  collapsed:: true
				- `lat (deg)`: Latitude (degrees, in the range of -90 to 90).
				- `lon (deg)`: Longitude (degrees, in the range of -180 to 180).
				- `altitude (mm)`: Altitude above the WGS84 ellipsoid (in millimeters).
			- Velocity
			  collapsed:: true
				- `velN (mm/s)`: North velocity component (in millimeters per second).
				- `velE (mm/s)`: East velocity component (in millimeters per second).
				- `velD (mm/s)`: Down velocity component (in millimeters per second).
			- Number of Satellite
			  collapsed:: true
				- `numSV`: Number of satellites used in the navigation solution.
		- ((67e1159a-0a92-40c0-bc57-dc47f8054ed2))
		  This message provides the `Covariance Matrix` values, used for estimating the uncertainty in the position and velocity measurements.
			- Position Covariance Matrix:
			  collapsed:: true
				- `posCovNN (m²)`: Covariance matrix value for position in the North direction.
				- `posCovEE (m²)`: Covariance matrix value for position in the East-East direction.
				- `posCovDD (m²)`: Covariance matrix value for position in the Down direction.
			- Velocity Covariance Matrix:
			  collapsed:: true
				- `velCovNN (m²/s²)`: Covariance matrix value for velocity in the North direction.
				- `velCovEE (m²/s²)`: Covariance matrix value for velocity in the East-East direction.
				- `velCovDD (m²/s²)`: Covariance matrix value for velocity in the Down direction.
		- ((67e10ad0-be56-4a3a-a3cf-146092ed7bf0)) (DOPs)
		  This message provides `Dilution of Precision (DOP)` values. DOP indicates the quality of the satellite geometry and its effect on the positional accuracy.
			- DOPs
			  collapsed:: true
				- collapsed:: true
				  
				  `GDOP (Geometric DOP)`: A composite of the position, velocity, and time geometry.
				- collapsed:: true
				  
				  `PDOP (Position DOP)`: Indicates the positional accuracy based on the satellite geometry.
				- collapsed:: true
				  
				  `HDOP (Horizontal DOP)`: Indicates the accuracy of the horizontal (latitude/longitude) position.
				- collapsed:: true
				  
				  `VDOP (Vertical DOP)`: Indicates the accuracy of the vertical (altitude) position.
		- ((67e116b0-32af-4301-9753-de056c4cb114)) (SNR & $C/N_0$)
		  This message provides `Signal Information`, including information about the satellite signal quality.
			- `SNR (dB-Hz)`: Signal strength of the received satellite signal.
			- `C/N₀ (dB-Hz)`: Ratio of the signal's carrier power to its noise level, used to evaluate signal quality.
	- ### NMEA
	  ```plaintext
	  $GNRMC → Time, Lat/Lon, Velocity (ground speed & course)
	  $GNGGA → Altitude, Num. Satellites, basic HDOP
	  $GNGSA → GDOP, PDOP, HDOP, VDOP
	  $GNGST → Detailed Position Accuracy (RMS values for lat, lon, altitude)
	  ```
		- ((67e10ad0-e2b4-46ea-9f4a-d8e317713799))
		- ((67e11cf5-6658-48ca-94f3-8c14360310ed))
		- ((67e23cd1-2fba-45e4-87ec-3057bec52296))
		- ((67e23cda-b229-40f6-9a66-8d6994c2c1b3))
- ## Tightly Coupled
	- ((67e10ad0-83f0-44f8-943f-bfb2092e0363)) (Observation)
	- ((67e10ad0-21b8-4894-b38c-d1c4aa9803bf)) (Ephemeris)
- ## UBX
	- ### UBX-RXM-RAWX (0x02 0x15)
	  id:: 67e10ad0-83f0-44f8-943f-bfb2092e0363
	  collapsed:: true
	  | Message structure | Header    | Class | ID   | Length (Bytes)     | Payload   | Checksum   |
	  |-------------------|-----------|-------|------|--------------------|-----------|------------|
	  |                   | 0xb5 0x62 | 0x02  | 0x15 | 16 + numMeas·32    | see below | CK_A CK_B  |
		- Payload
	- ### UBX-RXM-SFRBX
	  id:: 67e10ad0-21b8-4894-b38c-d1c4aa9803bf
	- ### UBX-NAV-PVT (0x01 0x07)
	  id:: 67e10ad0-f42b-469a-8b04-6cc825560219
	  collapsed:: true
	  Navigation Position Velocity Time Solution
	  | Message structure | Header    | Class | ID   | Length (Bytes) | Payload   | Checksum   |
	  |-------------------|-----------|-------|------|----------------|-----------|------------|
	  |                   | 0xb5 0x62 | 0x01  | 0x07 | 92             | see below | CK_A CK_B  |
		- Payload description
		  | Byte Offset | Type   | Name     | Scale | Unit | Description                                       |
		  |-------------|--------|----------|-------|------|---------------------------------------------------|
		  | 0           | U4     | iTOW     | -     | ms   | <u>GPS time of week of navigation epoch</u>             |
		  | 4           | U2     | year     | -     | y    | Year (UTC)                                        |
		  | 6           | U1     | month    | -     | month| Month, range 1..12 (UTC)                         |
		  | 7           | U1     | day      | -     | d    | Day of month, range 1..31 (UTC)                  |
		  | 8           | U1     | hour     | -     | h    | Hour of day, range 0..23 (UTC)                   |
		  | 9           | U1     | min      | -     | min  | Minute of hour, range 0..59 (UTC)                |
		  | 10          | U1     | sec      | -     | s    | Seconds of minute, range 0..60 (UTC)             |
		  | 11          | X1     | valid    | -     | -    | Validity flags (validDate, validTime, etc.)      |
		  | 12          | U4     | tAcc     | -     | ns   | Time accuracy estimate (UTC)                     |
		  | 16          | I4     | nano     | -     | ns   | Fraction of second (-1e9 to 1e9 UTC)             |
		  | 20          | U1     | fixType  | -     | -    | <u>GNSS fix type (0=no fix, 1=DR, 2=2D, etc.)</u>       |
		  | 21          | X1     | flags    | -     | -    | <u>Fix status flags (gnssFixOK, diffSoln, etc.)</u>     |
		  | 22          | X1     | flags2   | -     | -    | Additional flags (confirmedAvai, confirmedDate, etc.)|
		  | 23          | U1     | numSV    | -     | -    | <u>Number of satellites used</u>                        |
		  | 24          | I4     | lon      | 1e-7  | deg  | <u>Longitude</u>                                         |
		  | 28          | I4     | lat      | 1e-7  | deg  | <u>Latitude</u>                                          |
		  | 32          | I4     | height   | -     | mm   | <u>Height above ellipsoid</u>                            |
		  | 36          | I4     | hMSL     | -     | mm   | Height above mean sea level                       |
		  | 40          | U4     | hAcc     | -     | mm   | <u>Horizontal accuracy estimate</u>                      |
		  | 44          | U4     | vAcc     | -     | mm   | <u>Vertical accuracy estimate</u>                        |
		  | 48          | I4     | velN     | -     | mm/s | <u>NED north velocity</u>                                |
		  | 52          | I4     | velE     | -     | mm/s | <u>NED east velocity</u>                                 |
		  | 56          | I4     | velD     | -     | mm/s | <u>NED down velocity</u>                                 |
		  | 60          | I4     | gSpeed   | -     | mm/s | Ground speed (2-D)                                |
		  | 64          | I4     | headMot  | 1e-5  | deg  | <u>Heading of motion (2-D)</u>                           |
		  | 68          | U4     | sAcc     | -     | mm/s | <u>Speed accuracy estimate</u>                           |
		  | 72          | U4     | headAcc  | 1e-5  | deg  | <u>Heading accuracy estimate</u>                         |
		  | 76          | U2     | pDOP     | 0.01  | -    | <u>Position DOP</u>                                      |
		  | 78          | X2     | flags3   | -     | -    | Additional flags (invalidLlh, lastCorrectionAge, authTime, nmaFixStatus) |
		  | 80          | U1[4]  | reserved0| -     | -    | Reserved                                          |
		  | 84          | I4     | headVeh  | 1e-5  | deg  | <u>Heading of vehicle (2-D)</u>                          |
		  | 88          | I2     | magDec   | 1e-2  | deg  | <u>Magnetic declination</u>                             |
		  | 90          | U2     | magAcc   | 1e-2  | deg  | <u>Magnetic declination accuracy</u>                     |
	- ### UBX-NAV-COV (0x01 0x36)
	  id:: 67e1159a-0a92-40c0-bc57-dc47f8054ed2
	  collapsed:: true
	  | Message structure | Header    | Class | ID   | Length (Bytes) | Payload   | Checksum   |
	  |-------------------|-----------|-------|------|----------------|-----------|------------|
	  |                   | 0xb5 0x62 | 0x01  | 0x36 | 64             | see below | CK_A CK_B  |
		- Payload description
		  | Byte Offset | Type   | Name        | Scale | Unit        | Description                                |
		  |-------------|--------|-------------|-------|-------------|--------------------------------------------|
		  | 0           | U4     | iTOW        | -     | ms          | GPS time of week of navigation epoch       |
		  | 4           | U1     | version     | -     | -           | Message version (0x00 for this version)    |
		  | 5           | U1     | posCovValid | -     | -           | Position covariance validity flag          |
		  | 6           | U1     | velCovValid | -     | -           | Velocity covariance validity flag          |
		  | 7           | U1[9]  | reserved0   | -     | -           | Reserved                                   |
		  | 16          | R4     | posCovNN    | -     | m²          |<u>Position covariance matrix value p_NN</u>|
		  | 20          | R4     | posCovNE    | -     | m²          | Position covariance matrix value p_NE      |
		  | 24          | R4     | posCovND    | -     | m²          | Position covariance matrix value p_ND      |
		  | 28          | R4     | posCovEE    | -     | m²          |<u>Position covariance matrix value p_EE</u>|
		  | 32          | R4     | posCovED    | -     | m²          | Position covariance matrix value p_ED      |
		  | 36          | R4     | posCovDD    | -     | m²          |<u>Position covariance matrix value p_DD</u>|
		  | 40          | R4     | velCovNN    | -     | m²/s²       |<u>Velocity covariance matrix value v_NN</u>|
		  | 44          | R4     | velCovNE    | -     | m²/s²       | Velocity covariance matrix value v_NE      |
		  | 48          | R4     | velCovND    | -     | m²/s²       | Velocity covariance matrix value v_ND      |
		  | 52          | R4     | velCovEE    | -     | m²/s²       |<u>Velocity covariance matrix value v_EE</u>  |
		  | 56          | R4     | velCovED    | -     | m²/s²       | Velocity covariance matrix value v_ED      |
		  | 60          | R4     | velCovDD    | -     | m²/s²       | <u>Velocity covariance matrix value v_DD</u>|
	- ### UBX-NAV-DOP
	  id:: 67e10ad0-be56-4a3a-a3cf-146092ed7bf0
	- ### UBX-NAV-SAT
	- ### UBX-NAV-SIG
	  id:: 67e116b0-32af-4301-9753-de056c4cb114
- # NMEA
	- ### xxRMC
	  id:: 67e10ad0-e2b4-46ea-9f4a-d8e317713799
	- ### xxGGA
	  id:: 67e11cf5-6658-48ca-94f3-8c14360310ed
	- ### xxGST
	  id:: 67e23cd1-2fba-45e4-87ec-3057bec52296
	- ### xxGSA
	  id:: 67e23cda-b229-40f6-9a66-8d6994c2c1b3
	- ### xxGSV
	  id:: 67e23cdf-1e70-4c16-ba61-23a3b658e8de