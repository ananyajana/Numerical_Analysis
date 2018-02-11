#Author: Ananya Jana
# Program to calculate Taylor's polynomial
from sympy import *

def taylor(z, a, n, k):
	z = int(z)
	a = int(a)
	n = int(n)
	k = int(k)
	
	x = Symbol('x')
	f = log(1+x)- log(1-x)
	sum1 = f.subs(x, a)
	sum2 = f.subs(x, a)
	prod = 1
	for j in range(1, n):
		prod = prod*(z-a)/j;
		z1 = diff(f,x,j)
		z1 = z1.subs(x,a)
		sum2=sum2+prod*z1
	
	sum1 = sum2
	for j in  range(1, k):
		prod=prod*(z-a)/(n+j);
		z1 = (f,x,(n+j))
		z1 = z1.subs(x,a)
		sum1=sum1+prod*z1
	
	result2 = sum1
	result1 = sum2
	z1 = f.subs(x, z)
	error_exact = abs(result1 - z1)
	error_calc = abs(result2 - result1)
	
	f.write('%2u %14.10f %14.10f %14.10f\n', x, v, error_exact, error_calc)
	

z = input('z = ')
a = input('a = ')
w = input('Choose the value of n = ')
m = input('Choose the value of m = ')

while (m < w):
	print('Value of m should be greater than that of n')
	m = input('Choose the value of m = ')

f = open('expsin', 'w')
f.write(" n Pn(1) error_exact error_calculated")
 
for n in range(1, int(w) + 1):
	taylor(z, a, n, int(m) - int(w))
