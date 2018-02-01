%Author: Ananya Jana
%this programs gives the derivatives(upto 5th) of the given function
% which we use later to form the Tayor polynomial of the function f
% for guven a = 0 and n = 5
syms x;

f1 = exp(x)*sin(x);
f2 = log(1+x) - log(1-x)

% we checked till i=11 to check the pattern and find the general
% Taylor series for the given functions

for i=1:5
    %z1 gives the value of the ith derivative of f1 in the ith iteration 
    z1 = subs(diff(f1, x, i), 'x', 0);
    
    %z2 gives the value of the ith derivative of f2 in the ith iteration
    z2 = subs(diff(f2, x, i), 'x', 0);
    
    disp('z1=');
    disp(z1);
    
    disp('z2=');
    disp(z2);
end


%Computing log(3) using the general formula for different values of n
disp('Computing log(3)');
sum = 0;
prod = 1;
for n=1:15
    prod = prod * x;
    sum = sum + (mod(n, 2) * 2 * prod) / n;
    format long;
    value = double(subs(sum, 'x', 0.5));
    disp('value=');
    disp(value);
    error = double(log(3) - value);
    disp('error=');
    disp(error);
end

%Computing the value of f(x) = exp(x)*sin(x) using the polynomial that we
%obtained. We compute it for different values of x in the rage (1,8)
disp('Computing f(x) = exp(x)*sin(x) values');
for m = 1:8
    p1 = x + x^2 + (x^3)/3 - (x^5)/30;
    value2 = double(subs(p1, 'x', m));
    %disp('value2=');
    disp(value2);
end

%Computing the value of f(x) = log(1 + x)- log(1 - x) using the polynomial that we
%obtained. We compute it for different values of x in the range (0.5, 0.6,
%0.7, 0.8 and 0.9).

disp('Computing f(x) = log(1 + x)- log(1 - x) values');

l = 0.5;
while l < 1
    p2 = (2 * x) + (2*x^3)/3 + (2 * x^5)/5;
    value4 = double(subs(p2, 'x', l));
    %disp('value2=');
    disp(value4);
    l = l + 0.1;
end
