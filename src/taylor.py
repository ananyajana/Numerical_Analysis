#Author: Ananya Jana
#this programs gives the derivatives(upto 5th) of the given function
# which we use later to form the Tayor polynomial of the function f
# for given a = 0 and n = 5



z = input('z = ')
a = input('a = ')
w = input('Choose the value of n = ')
m = input('Choose the value of m = ')

while (m < w):
	print('Value of m should be greater than that of n')
	m = input('Choose the value of m = ')

for n in range(1, w+1):