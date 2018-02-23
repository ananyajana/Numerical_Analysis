a = input('Please enter the approximate value of root from where you want to begin this method: ');
error_bound = input('Please enter the error bound for the function: ');
max_iteration = input('Please enter the maximum number of iterations you want your function to allow to reach the desired result: ');

[root] = newtongraphic(a, error_bound, max_iteration);
%disp('The root is: ', root)

function [root] = newtongraphic(x0,error_bd,max_iterate)
syms x real;
syms z real;
%Input function
%f = x^2-2;
%f = 1-exp(x);
f = x^2 - sin(x) - 0.5;
%Taylor's polynomial of degree 1, Tangent line.
p=z^2-2+2*z*(x-z);
format short e;
error = 1;
it_count = 0;
iteration=[];
disp('it_count          x0          new root        fx          dfx             error');
while abs(error) > error_bd && it_count <= max_iterate
    %grid;
    %ezplot(f,[0,2]);
    %hold on;
    %ezplot(subs(p,'z',x0),[0,2]);
    %&grid;
    fx = subs(f,'x',x0);
    dfx = subs(diff(f,x,1),'x',x0);
    if dfx == 0
        disp('The derivative is zero. Stop');
        return;
    end
    x1 = x0 - fx/dfx;
    error = abs(x1 - x0);
    % Internal print of newton method. Tap the carriage
    % return key to continue the computation.
    
    iteration1 = [iteration it_count x0 x1 fx dfx error];
    disp(double(iteration1));
    pause;
    x0 = x1;
    it_count = it_count + 1;
end
if it_count > max_iterate
    disp('The number of iterates calculated exceeded');
    disp('max_iterate. An accurate root was not');
    disp('calculated.');
else
    root =iteration;
end
end