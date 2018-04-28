format long;
syms x, syms y;
l = input('Choose 1 for part a, Choose 2 for part b: ');
n = input('Number of iterations: ');
switch l
    case 1
        f(x,y) = x^2+y^2-4;
        g(x,y) = x^2-y^2-1;
        x0 = 1;
        y0 = 1;
        
     case 2
        f(x,y) = x^2+y^2-2*x-2*y+1;
        g(x,y) = x+y-2*x*y;
        x0 = 1.5;
        y0 = 1;
        
    otherwise
        disp('Sorry you enteed wrong number!');
        return;
end
        
        
fx(x,y)= diff(f,'x',1);
fy(x,y) = diff(f,'y',1);
gx(x,y) = diff(g,'x',1);
gy(x,y) = diff(g,'y',1);
z0 = [x0; y0];
k0 = norm(z0, 2);
k1 = norm(z0, 2);
s=0;
while (k1<=k0) && s<=n
    k0 = k1;
    A = [fx(x0, y0) fy(x0, y0); gx(x0, y0) gy(x0, y0)];
    delta = inv(A)*[-f(x0, y0);-g(x0, y0)];
    z1 = z0 +delta;
    k1 = norm(z1-z0, 2);
    disp(double(z1));
    if k1< 0.000001
        break;
    end
    z0 = z1;
    x0 = z1(1);
    y0 = z1(2);
    s = s+1;
    disp (double(k1));
end
disp('Iteration number: ');
disp(s-1);
disp('Value of x and y: ');
disp(double(z1));