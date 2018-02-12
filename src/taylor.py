#Author: Ananya Jana
# Program to calculate Taylor's polynomial'x'
from math import sin, exp, log
from sympy import *
import pdb

def taylor(z, a, n, k):
	z = int(z)
	a = int(a)
	n = int(n)
	k = int(k)
	
	x = Symbol('x')
	f = log(1 + x)- log(1 - x)
	sum1 = f.subs(x, a)
	sum2 = f.subs(x, a)
	print('sum1 = ', sum1)
	print('sum2 = ', sum2)
	prod = 1
	#pdb.set_trace()
	for j in range(1, n + 1):
		prod = prod * (z - a)/j;
		#print('prod = ', prod)
		z1 = diff(f, x, j)
		#print('z1 = ', z1)
		z1 = z1.subs(x, a)
		sum2 = sum2 + (prod * z1)
	
	sum1 = sum2
	for j in  range(1, k + 1):
		prod=prod * (z - a)/(n + j);
		z1 = diff(f, x, (n + j))
		z1 = z1.subs(x, a)
		sum1 = sum1 + (prod * z1)
	
	result2 = sum1
	result1 = sum2
	z2 = f.subs(x, z)
	error_exact = abs(result1 - z2)
	error_calc = abs(result2 - result1)
	
	f1.write('%14.10f %14.10f %14.10f\n', result1, error_exact, error_calc)
	

z = input('z = ')
a = input('a = ')
w = input('Choose the value of n = ')
m = input('Choose the value of m = ')

while (m < w):
	print('Value of m should be greater than that of n')
	m = input('Choose the value of m = ')

f1 = open('expsin', 'w')
f1.write(" n Pn(1) error_exact error_calculated")

for n in range(1, int(w) + 1):
	taylor(z, a, n, int(m) - int(w))
