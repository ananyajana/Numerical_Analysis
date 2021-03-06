#Author: Ananya Jana
# Program for fixed point iteration
from math import sin, exp, log
from sympy import *
import numpy as np
import matplotlib.pyplot as plt
import pdb

def fixed_point(x0, error_bd, max_iterate):
	x0 = float(x0)
	error_bd = float(error_bd)
	max_iterate = int(max_iterate)
	
	x = Symbol('x')
	z = Symbol('z')

	f = x^2 - 3*x + 2;
	#g= 2*x - 3;
	#g =(x**2 - 2)*(2*x - 3);
	#g = 3 - 2/x;
	#g = sqrt(3*x - 2);
	g = (x**2 + 2)/3;
	
	#plotting the function
	xvals = np.arange(-2, 1, 0.01)
	yvals = (xvals**2 + 2)/3
	#yvals = np.cos(xvals)
	#yvals = np.((xvals**2 + 2)/3)
	#yvals = np.g(xvals)
	plt.plot(xvals, yvals)
	plt.show()
	
	it_count = 0
	x1 = x0;
	x2 = g.subs(x, x1);
	print('x1 g(x) error');
	while ((abs(x2-x1) > error_bd) and (it_count <= max_iterate)):
    		x1 = x2;
    		x2 = g.subs(x, x1);
    		print(x1, x2, abs(x2-x1));
    		it_count += 1;


x0 = input('x0 = ')
max_iterate = input('max_iterate = ')
error_bd = input('error_bd = ')
fixed_point(x0, error_bd, max_iterate)
