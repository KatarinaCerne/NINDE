ro = @(x) 4.*x.^2.*(4-x);
f = @(x) x.*exp(-x);
am=0;
bm=4;
%n=1,2,3,5,10
n=1;
[alfa1,xn1]=GaussUteziVozli(n+1,ro,am,bm);
I1 = GaussIntegral(f,n+1,ro,am,bm);

n=2;
[alfa2,xn2]=GaussUteziVozli(n+1,ro,am,bm);
I2 = GaussIntegral(f,n+1,ro,am,bm);

n=3;
[alfa3,xn3]=GaussUteziVozli(n+1,ro,am,bm);
I3 = GaussIntegral(f,n+1,ro,am,bm);

n=5;
[alfa5,xn5]=GaussUteziVozli(n+1,ro,am,bm);
I5 = GaussIntegral(f,n+1,ro,am,bm);

n=10;
[alfa10,xn10]=GaussUteziVozli(n+1,ro,am,bm);
I10 = GaussIntegral(f,n+1,ro,am,bm);

Integ = integral(@(x)f(x).*ro(x),0,4);
