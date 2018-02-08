#Author: Ananya Jana
#this programs gives the derivatives(upto 5th) of the given function
# which we use later to form the Tayor polynomial of the function f
# for given a = 0 and n = 5
from math import sin, exp, log
from sympy import *	# for derivative

x= Symbol('x')

#f1 = lambda x: exp(x)*sin(x)
#f2 = lambda x: log(1+x) - log(1-x)
f1 = exp(x)*sin(x)
f2 = log(1+x) - log(1-x)


# this part calculates upto the fifth derivative of the given functions
for i in range(1, 6):
	z1 = diff(f1, x, i)
	z1 = z1.subs(x, 0)
	print('z1 = ',z1)
	
	z2 = diff(f1, x, i)
	z2 = z2.subs(x, 0)
	print('z2 = ',z2)


# computing log(3) using the general formula for different values of n
print('Computing log(3)')
sum = 0
prod = 1
for n in range(1,16):
	prod = prod * x;
	sum = sum + ((n % 2) * 2 * prod) / n
	value = sum.subs(x, 0.5)
	print('value=', value)
	error = log(3) - value
	print('error = ', error)