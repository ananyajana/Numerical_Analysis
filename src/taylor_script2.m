z=input('z=');
a=input('a=');
w=input('Choose the value of n=');
m=input('Choose the value of m= ');
while m<n
    disp('Value of m should be greater than that of n');
    m=input('Choose the value of m= ');
end
for n=1:w
 [ result1 ,error_exact, error_calc] = taylor( z,a,n,(m-w));
 v(n)=result1;e1(n)=error_exact; e2(n) = error_calc;
end
x=1:n;
disp( ' n n(1) error_exact error_calc')
disp([x' v' e1' e2'])
fid=fopen('expsin.txt','w');
fprintf(fid,'%s\n',' n Pn(1) error_exact error_calculated');
fprintf(fid,'%2u %14.10f %14.10f %14.10f\n',[x;v;e1;e2]);
fclose(fid);
function [ result1 ,error_exact , error_calc] = taylor( z,a,n,k)
syms x real;
f=log(1+x)- log(1-x);
sum1=subs(f,'x',a);
sum=subs(f,'x',a);
prod=1;
for j=1:n
 prod=prod*(z-a)/j;
 sum=sum+prod*subs(diff(f,x,j),'x',a);
end
sum1=sum
for j=1:k
 prod=prod*(z-a)/(n+j);
 sum1=sum1+prod*subs(diff(f,x,(n+j)),'x',a);
end
format long
result2=double(sum1);
result1 = double(sum);
error_exact=double(abs(result1-subs(f,'x',z)));
error_calc=double(abs(result2 - result1))
end