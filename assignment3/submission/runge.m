%syms x;
%syms xp;
%f = input('Please enter the function in terms of x: ');
%f1 = input('Please enter the function in terms of xp: ');
n = input('Please enter  the bound of Polynomial: ');
a = input('Please enter the lower limit of interval: ');
b = input('Please enter the upper limit of interval: ');
h = input('Please enter the interval value: ');
runge1(n, a, b, h);


function runge1(n, a, b, h)
%Function that shows the Runge phenomena
%
% The Polynomial interpolation of f(x) =1/(1 +10 * x^2)
% on equal distributed n nodes on [-1 1]
% causes extreme variation near the ends
% as n increases
%INPUT n the # of equally distributed nodes in [-1 1]
%
%
close all
x= a:h:b;
%x=-(pi):0.01*(pi):(pi); % mesh points on [-1 1] used for plotting
y=input('Please enter the function in terms of x: ');
title_string = input('Please enter the title: ', 's');
%y = cos(x);
plot(x,y) % a plot of f
n_bound_str = strcat('         Value of n = ',num2str(n));
title(strcat(title_string, n_bound_str));
xp=linspace(a,b,n); % the interpolation nodes
yp=input('Please enter the function in terms of xp: '); %y_i=f(x_i)
%yp = cos(xp);
hold on;
grid on;
plot(xp,yp,'o') %plotting the data points on the graph of f
C=polyfit(xp,yp,n-1); %computes the coefficients of P_{n-1}
Interp=polyval(C,x); %evaluates the Interpolant P_{n-1} at the mesh points
plot(x,Interp,'r')
hold on;
plot(x, y-Interp, 'g');
end
