- #FMCW #Radar #mmwave
- ## Constant
	- Speed of light $c: 3 \times 10^8$
- ##
- ## Specification
	- ### Chirp Character
		- Start Frequency $f_c: 77~~GHz$
		- Bandwidth $B: 4~~GHz$
		- Duration $T_c: 40~~\mu s$
		- which gives
			- Slope $S: 100~~MHz/\mu s$
- ## Bandwidth $B$
	- ### Range Resolution: 
	  $$d_{res} = \frac{c}{2B}$$
	- 4 GHz bandwidth: $\frac{3 \times 10^8}{2 \cdot (4 \times 10^9)} = 0.0375~~m = 3.75~~cm$
- ## ADC sampling rate $F_s$
	- ### Max Range
	  $$d_{max} = \frac{F_s c}{2S}$$
	- ### [[AWR1843 BOOST]]
		- $F_s = 2,000~~ksps~~(2~~MHz)$
		- Max distance $d_{max} = \frac{(2 \times 10^6) \cdot 3 \times 10^8}{2 \times 100 \times 10^6 \times 10^6} = 3~~m$?
	- ### [[AWR2243 BOOST]]
		- $F_s = 15,000~~ksps~~(15~~MHz)$
		- 23.5 m ?
- ## Frame Time $T_f$
	- ### Velocity Resolution
	  $$v_{res} = \frac{\lambda}{2 T_f}$$
- ## References
	- [Introduction to mmwave Sensing: FMCWRadars](https://www.ti.com/content/dam/videos/external-videos/ko-kr/2/3816841626001/5415203482001.mp4/subassets/mmwaveSensing-FMCW-offlineviewing_0.pdf)
	- [The fundamentals of millimeter wave radar sensors](https://www.ti.com/lit/wp/spyy005a/spyy005a.pdf?ts=1775612844301&ref_url=https%253A%252F%252Fwww.google.com%252F)