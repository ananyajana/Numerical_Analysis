a = input('Please enter a value for a: ');
b = input('Please enter a value for b: ');
index = input('Please enter the index value: ');
max_iteration = input('Please enter the maximum number of iteration: ');
error_bound = input('Please enter the error bound for the function: ');

[root] = bisect(a, b, error_bound, max_iteration, index);

function [root] = bisect(a0,b0,ep,max_iterate,index_f)

if a0 >= b0
    disp('a0 < b0 is not true. Stop!');
    return;
end
format short e;
a = a0; 
b = b0;
fa = f(a,index_f); 
fb = f(b,index_f);
if sign(fa)*sign(fb) > 0
    disp('f(a0) and f(b0) are of the same sign. Stop!');
    return;
end
c = (a+b)/2;
it_count = 0;
disp('it_count    a      b       c       fc         b-c/ 2^(n+1)');
while b-c > ep && it_count < max_iterate
    it_count = it_count + 1;
    fc = f(c,index_f);
    k = (b-c)/2^it_count;
    % Internal print of bisection method. Tap the carriage
    % return key to continue the computation.
    iteration = [it_count a b c fc k];
    disp(double(iteration));
    if sign(fb)*sign(fc) <= 0
        a = c;
        fa = fc;
    else
        b = c;
        fb = fc;
    end
    c = (a+b)/2;
    pause
end
format long;
root = c;
format short e;
error_bound = b-c;
format short;
it_count;
end
%%%%%%%%%%%%%%%%%%%%%%%%%%%%
function value = f(x,index)
% function to define equation for rootfinding problem.
switch index
case 1
    value = x.^6 - x - 1;
case 2
    value = x - exp(-x);
case 3
    value= x^2-1;
case 4
    value=x-1-.5*sin(x);
case 5
    value=x-3-2*sin(x);
case 6
    value = x*2-sin(x)- 0.5
end
end