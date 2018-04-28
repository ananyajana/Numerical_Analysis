A = input('Enter the matrix: ');
z0 = input('Enter vector z: ');
n = input('Enter value of n: ');
[lamda, v,s] = largesteigen(A,z0, n);
disp('The largest eigen value for this matrix is: ')
disp(lamda(1));
disp('The corresponding eigen vector for this matrix is: ')
disp(v);
disp('Total number of iterations: ');
disp(s);

function [lamda, v, s] = largesteigen(A,z, n)
w = A*z;
zprev = z;
lamda = w./zprev;
lamdaprev = lamda;
z= w/norm(w, inf);
w = A*z;
zprev = z;
lamda = w./zprev;
z= w/norm(w, inf);

s=3;
while s<n && (abs(lamdaprev(1) - lamda(1))>=0.00001)
    w = A*z;
    zprev = z;
    lamdaprev = lamda;
    lamda = w./zprev;
    z= w/norm(w, inf);
    s= s+1;
end
v =z;
end