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
	
	z2 = diff(f2, x, i)
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


# computing f(x) = exp(x)*sin(x) for different values of x	
print('Computing f(x) = exp(x)*sin(x) values');
for m in range(1,9):
	p1 = x + x**2 + (x**3)/3 - (x**5)/30
	value2 = p1.subs(x, m)
	repr(value2)
	print('value2=', value2)



# computing f(x) = log(1 + x)- log(1 - x) for different values of x	
print('Computing f(x) = log(1 + x)- log(1 - x) values');
l = 0.5
while (l < 1):
	p2 = (2 * x) + (2*(x**3))/3 + (2 * (x**5))/5
	value4 = p2.subs(x, l)
	repr(value4)
	print('value2=',value4)
	l = l + 0.1;