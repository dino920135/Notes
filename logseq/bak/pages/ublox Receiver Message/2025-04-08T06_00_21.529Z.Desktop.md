# UBX
	- ## Observation
		- ### UBX-RXM-RAWX
	- ## Ephemeris
		- ### UBX-RXM-SFRBX
	- ## PVT
		- ### UBX-NAV-PVT (0x01 0x07)
		  Navigation Position Velocity Time Solution
		- Payload description
		  | Byte Offset | Type   | Name     | Scale | Unit | Description                                       |
		  |-------------|--------|----------|-------|------|---------------------------------------------------|
		  | 0           | U4     | iTOW     | -     | ms   | GPS time of week of navigation epoch             |
		  | 4           | U2     | year     | -     | y    | Year (UTC)                                        |
		  | 6           | U1     | month    | -     | month| Month, range 1..12 (UTC)                         |
		  | 7           | U1     | day      | -     | d    | Day of month, range 1..31 (UTC)                  |
		  | 8           | U1     | hour     | -     | h    | Hour of day, range 0..23 (UTC)                   |
		  | 9           | U1     | min      | -     | min  | Minute of hour, range 0..59 (UTC)                |
		  | 10          | U1     | sec      | -     | s    | Seconds of minute, range 0..60 (UTC)             |
		  | 11          | X1     | valid    | -     | -    | Validity flags (validDate, validTime, etc.)      |
		  | 12          | U4     | tAcc     | -     | ns   | Time accuracy estimate (UTC)                     |
		  | 16          | I4     | nano     | -     | ns   | Fraction of second (-1e9 to 1e9 UTC)             |
		  | 20          | U1     | fixType  | -     | -    | GNSS fix type (0=no fix, 1=DR, 2=2D, etc.)       |
		  | 21          | X1     | flags    | -     | -    | Fix status flags (gnssFixOK, diffSoln, etc.)     |
		  | 22          | X1     | flags2   | -     | -    | Additional flags (confirmedAvai, confirmedDate, etc.)|
		  | 23          | U1     | numSV    | -     | -    | Number of satellites used                        |
		  | 24          | I4     | lon      | 1e-7  | deg  | Longitude                                         |
		  | 28          | I4     | lat      | 1e-7  | deg  | Latitude                                          |
		  | 32          | I4     | height   | -     | mm   | Height above ellipsoid                            |
		  | 36          | I4     | hMSL     | -     | mm   | Height above mean sea level                       |
		  | 40          | U4     | hAcc     | -     | mm   | Horizontal accuracy estimate                      |
		  | 44          | U4     | vAcc     | -     | mm   | Vertical accuracy estimate                        |
		  | 48          | I4     | velN     | -     | mm/s | NED north velocity                                |
		  | 52          | I4     | velE     | -     | mm/s | NED east velocity                                 |
		  | 56          | I4     | velD     | -     | mm/s | NED down velocity                                 |
		  | 60          | I4     | gSpeed   | -     | mm/s | Ground speed (2-D)                                |
		  | 64          | I4     | headMot  | 1e-5  | deg  | Heading of motion (2-D)                           |
		  | 68          | U4     | sAcc     | -     | mm/s | Speed accuracy estimate                           |
		  | 72          | U4     | headAcc  | 1e-5  | deg  | Heading accuracy estimate                         |
		  | 76          | U2     | pDOP     | 0.01  | -    | Position DOP                                      |
		  | 78          | X2     | flags3   | -     | -    | Additional flags (invalidLlh, lastCorrectionAge, authTime, nmaFixStatus) |
		  | 80          | U1[4]  | reserved0| -     | -    | Reserved                                          |
		  | 84          | I4     | headVeh  | 1e-5  | deg  | Heading of vehicle (2-D)                          |
		  | 88          | I2     | magDec   | 1e-2  | deg  | Magnetic declination                              |
		  | 90          | U2     | magAcc   | 1e-2  | deg  | Magnetic declination accuracy                     |
	- ## DOP
		- ### UBX-NAV-DOP
		-
- # NMEA
	-