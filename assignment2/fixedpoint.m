
x0 = input('Please enter a value for x: ');
%index = input('Please enter the index value: ');
max_iterate = input('Please enter the maximum number of iteration: ');
error_bd = input('Please enter the error bound for the function: ');

[root] = fixed_point_iteration(x0, error_bd, max_iterate);

function [root] = fixed_point_iteration(x0, error_bd, max_iterate)
syms x;
syms z;
f = x^2 - 3*x + 2;
g= 2*x - 3;
% g=(x^2 - 2)*(2*x - 3);
% g = 3 - 2/x;
%g = sqrt(3*x - 2);
% g = (x^2 + 2)/3;

it_count = 0;

x1 = x0;
x2 = subs(g, 'x', x1);
disp('x1 g(x) error');
while abs(x2-x1) > error_bd && it_count <= max_iterate
    x1 = x2;
    x2 = subs(g, 'x', x1);
    disp([x1 x2 abs(x2-x1)]);
    it_count = it_count + 1;
end
root = x2;
end
