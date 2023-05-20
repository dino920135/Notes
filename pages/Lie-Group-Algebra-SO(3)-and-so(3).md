# Lie Group / Algebra (SO(3) / so(3))

Created: June 1, 2021 3:29 PM
Tags: SO(3), lie algebra, lie group, tranformation
# 3D Motion Representation
	- Rotation
	- Translation
- # Vectors
  
  Under coordinate system $e$ with basis $[e_1, e_2, e_3]$*.* Vector ***a*** can be written as :  
  $a = \begin{bmatrix} e_1, e_2, e_3 \end{bmatrix} \begin{bmatrix} a_1 \\ a_2 \\ a_3 \end{bmatrix}$
  
  Dot product :  
  $a\cdot b = a^Tb = \sum_{i = 1} ^{3} a_i b_i$
  
  Cross product :  
  $a \times b = \begin{bmatrix} a_2 b_3 - a_3 b_2 \\ a_3 b_1 - a_1 b_3 \\ a_1 b_2 - a_2 b_1  \end{bmatrix} = a \times b = \begin{bmatrix} 0 & -a_3 & a_2 \\ a_3& 0& -a_1 \\ -a_2 & a_1 & 0  \end{bmatrix}b=$ a^b,  
   
  where a^ =$\begin{bmatrix} 0 & -a_3 & a_2 \\ a_3& 0& -a_1 \\ -a_2 & a_1 & 0  \end{bmatrix}$is   
  
  **Skew Symmetric Matrix** ($A^T = -A$)
  
  Cross product can also represent rotation : rotation angle & rotation axis
- # Rotation
  For a same coordinate $a$ vector under two coordinate system $e,e'$   
  $\begin{bmatrix} e_1, e_2, e_3 \end{bmatrix} \begin{bmatrix} a_1 \\ a_2 \\ a_3 \end{bmatrix} = \begin{bmatrix} e'_1, e'_2, e'_3 \end{bmatrix} \begin{bmatrix} a'_1 \\ a'_2 \\ a'_3 \end{bmatrix}$ 
  
  By multiplying both side with   
  $\begin{bmatrix} e_1, e_2, e_3 \end{bmatrix}^{-1}=\begin{bmatrix} e^T_1, e^T_2, e^T_3 \end{bmatrix}$
  
  $\begin{bmatrix} a_1 \\ a_2 \\ a_3 \end{bmatrix}=\begin{bmatrix} e^T_1 e'_1 & e^T_1 e'_2 & e^T_1 e'_3 \\ e^T_2 e'_1& e^T_2 e'_2& e^T_2 e'_3 \\ e^T_3 e'_1 & e^T_3 e'_2 & e^T_3 e'_3  \end{bmatrix}\begin{bmatrix} a'_1 \\ a'_2 \\ a'_3 \end{bmatrix} =Ra'$
  
  Where $R$ is the  
  ***Direction Cosine Matrix (DCM)***  
  The group of $R$ define as ***Special Orthogonal Group*** :  
  $SO(n)=\{ R\in R^{n\times n} | RR^T=I,det(R)=1 \}$
## Rotation Angle & Axis

Rodrigues' rotation formula

$\theta = arcos(\frac{Tr(R)-1}{2})$

$\omega = \frac{1}{2sin(\theta)} \begin{bmatrix} R_{32}-R_{23}\\ R_{13}-R_{31}\\ R_{21}-R_{12} \end{bmatrix}$