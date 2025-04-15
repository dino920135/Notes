public:: true

- ## Read csv file with pandas
	- Skip specific rows: `skiprows=[i for i in range(24)]+[25]`
	- Ignore spaces: `skipinitialspace = True`
	- ```python
	  import pandas as pd
	  - ref_data = pd.read_csv(self.curr_sequence / self.ref.path / self.ref.name,
	                                skipinitialspace = True,
	                                sep=',',
	                                skiprows=[i for i in range(24)]+[25])   # Skip matadata(0~23) & unit(25) for IE output
	  ```