format long;
syms x, syms y, syms z;
n = 10;
f(x,y,z) = x^2+y^2+z^2-16;
g(x,y,z) = x^2+ y^2-z^2-8;
h(x,y,z) = x-y+z-2;
fx(x,y,z)= diff(f,'x',1);
fy(x,y,z) = diff(f,'y',1);
fz(x,y,z) = diff(f,'z',1);
gx(x,y,z) = diff(g,'x',1);
gy(x,y,z) = diff(g,'y',1);
gz(x,y,z) = diff(g,'z',1);
hx(x,y,z)= diff(h,'x',1);
hy(x,y,z) = diff(h,'y',1);
hz(x,y,z) = diff(h,'z',1);
x0 = input('Input initial point for x: ');
y0 = input('Input initial point for y: ');
z0 = input('Input initial point for z: ');
k0 = [x0; y0; z0];
for i = 1:n
    A = [fx(x0, y0, z0) fy(x0, y0, z0) fz(x0, y0, z0); gx(x0, y0, z0) gy(x0, y0, z0) gz(x0, y0, z0); hx(x0, y0, z0) hy(x0, y0, z0) hz(x0, y0, z0)];
     %disp(A);
     delta = inv(A)*[-f(x0, y0, z0); -g(x0, y0, z0); -h(x0, y0, z0)];
    %disp(delta);
    k0 = k0 +delta;
    disp(double(k0));
   % k0 = k1;
    x0 = k0(1);
    y0 = k0(2);
    z0 = k0(3);
end