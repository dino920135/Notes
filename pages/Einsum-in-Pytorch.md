### Reference from:
	- [https://rockt.github.io/2018/04/30/einsum](https://rockt.github.io/2018/04/30/einsum)
	- [https://zhuanlan.zhihu.com/p/44954540?fbclid=IwAR0Hp8u4jGZL0ya5_T8gqPOzK_LB-TDXmMOvSkOUTwqIviKucyEsYKzpbPc](https://zhuanlan.zhihu.com/p/44954540?fbclid=IwAR0Hp8u4jGZL0ya5_T8gqPOzK_LB-TDXmMOvSkOUTwqIviKucyEsYKzpbPc)
## Import pytorch to workspace with

```python
import pytorch
```
## 1. Matrix Transpose
	- # $B_{ij} = A_{ij}$
	  
	  ```python
	  a = torch.arange(6).reshape(2, 3)
	  b = torch.einsum('ij->ji', [a])
	  '''
	  a = 
	  tensor([[0, 1, 2],
	        [3, 4, 5]])
	  b =
	  tensor([[0, 3],
	        [1, 4],
	        [2, 5]])
	  '''
	  ```
## 2. Sum
	- # $b = \sum_i \sum_j A_{ij} = A_{ij}$
	  
	  ```python
	  a = torch.arange(6).reshape(2, 3)
	  b = torch.einsum('ij->', [a])
	  '''
	  a =
	  tensor([[0, 1, 2],
	        [3, 4, 5]])
	  b =
	  tensor(15)
	  '''
	  ```
## 3. Column Sum
	- # $b_i = \sum_j A_{ij} = A_{ij}$
	  
	  ```python
	  a = torch.arange(6).reshape(2, 3)
	  b = torch.einsum('ij->j', [a])
	  '''
	  a =
	  tensor([[0, 1, 2],
	        [3, 4, 5]])
	  b = 
	  tensor([3, 5, 7])
	  '''
	  ```
## 4. Row Sum
	- # $b_i = \sum_j A_{ij} = A_{ij}$
	  
	  ```python
	  a = torch.arange(6).reshape(2, 3)
	  b = torch.einsum('ij->i', [a])
	  '''
	  a =
	  tensor([[0, 1, 2],
	        [3, 4, 5]])
	  b = 
	  tensor([ 3, 12])
	  '''
	  ```
## 5. Matrix Multiplication
	- # $c_{ij} = \sum_k A_{ik} B_{kj} = A_{ik}B_{kj}$
	  
	  ```python
	  a = torch.arange(6).reshape(2, 3)
	  b = torch.arange(15).reshape(3, 5)
	  c = torch.einsum('ik,kj->ij', [a, b])
	  '''
	  a =
	  tensor([[0, 1, 2],
	        [3, 4, 5]])
	  b = 
	  tensor([[ 0,  1,  2,  3,  4],
	        [ 5,  6,  7,  8,  9],
	        [10, 11, 12, 13, 14]])
	  c = 
	  tensor([[ 25,  28,  31,  34,  37],
	        [ 70,  82,  94, 106, 118]])
	  '''
	  ```
## 6. Vector dot product
	- # $c = \sum_i a_i b_i = a_i b_i$
	  
	  ```python
	  a = torch.arange(3)
	  b = torch.arange(3,6)
	  c = torch.einsum('i,i->', [a, b])
	  '''
	  a = tensor([0, 1, 2])
	  b = tensor([3, 4, 5])
	  c = tensor(14)
	  '''
	  ```
## 7. Matrix dot product
	- # $C = \sum_i \sum_j A_{ij} B_{ij} = A_{ij} B_{ij}$
	  ```python
	  a = torch.arange(6).reshape(2, 3)
	  b = torch.arange(6,12).reshape(2, 3)
	  c = torch.einsum('ij,ij->', [a, b])
	  '''
	  a = 
	  tensor([[0, 1, 2],
	          [3, 4, 5]])
	  b = 
	  tensor([[ 6,  7,  8],
	          [ 9, 10, 11]])
	  c = 
	  tensor(145)
	  '''
	  ```