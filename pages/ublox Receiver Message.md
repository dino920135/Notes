-
- ## Overview
  | Data Element | UBX Message(s) | NMEA Sentence(s) |
  | ---- | ---- | ---- |
  | **Time** | `UBX-NAV-PVT`, `UBX-NAV-TIMEGPS` | `ZDA`, `RMC` |
  | **Position (Lat/Lon/Alt)** | `UBX-NAV-PVT`, `UBX-NAV-POSLLH`, `UBX-NAV-HPPOSLLH` | `GGA`, `PUBX,00` |
  | **Velocity (NED)** | `UBX-NAV-VELNED` | `VTG`, `RMC`, `PUBX,00` |
  | **Position Accuracy** | `UBX-NAV-PVT`, `UBX-NAV-COV` | `GST` |
  | **Velocity Accuracy** | `UBX-NAV-COV`, `UBX-NAV-PVT` | N/A (not standard in NMEA) |
  | **DOPs (GDOP, PDOP, HDOP, VDOP)** | `UBX-NAV-DOP` | `GSA` |
  | **Number of Satellites** | `UBX-NAV-SAT`, `UBX-NAV-PVT` | `GGA`, `GSV`, `GSA` |
  | **SNR / C/N₀** | `UBX-NAV-SIG`, `UBX-RXM-RAWX` | `GSV` |
- ## Loosely Coupled
	- ### Requirements
	  collapsed:: true
		- Time
		- Position
		- Velocity
		- Attitude
		- Position Accuracy
		- Velocity Accuracy
		- DOPs
		- Number of Satellites
		- SNR or $C/N_0$
		-
	- ### UBX
		-
	- ### NMEA
		- ((67e10ad0-e2b4-46ea-9f4a-d8e317713799))
		- ((67e11cf5-6658-48ca-94f3-8c14360310ed))
- ## Tightly Coupled
	- ((67e10ad0-83f0-44f8-943f-bfb2092e0363))
	- ((67e10ad0-21b8-4894-b38c-d1c4aa9803bf))
- ## UBX
	- ### UBX-RXM-RAWX
	  id:: 67e10ad0-83f0-44f8-943f-bfb2092e0363
	- ### UBX-RXM-SFRBX
	  id:: 67e10ad0-21b8-4894-b38c-d1c4aa9803bf
	- ### UBX-NAV-PVT (0x01 0x07)
	  collapsed:: true
	  Navigation Position Velocity Time Solution| Message structure | Header    | Class | ID   | Length (Bytes) | Payload   | Checksum   |
	  |-------------------|-----------|-------|------|----------------|-----------|------------|
	  |                   | 0xb5 0x62 | 0x01  | 0x07 | 92             | see below | CK_A CK_B  |
		- Payload description
		  collapsed:: true
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
	- ### UBX-NAV-COV
	- ### UBX-NAV-DOP
	- ### UBX-NAV-SAT
	- ### UBX-NAV-SIG
- # NMEA
	- ### xxRMC
	  id:: 67e10ad0-e2b4-46ea-9f4a-d8e317713799
	- ### xxGGA
	  id:: 67e11cf5-6658-48ca-94f3-8c14360310ed