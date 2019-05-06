ro = @(x) 4.*x.^2.*(4-x).^2;
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

Integ = integral(@(x)f(x).*ro(x),0,4,'AbsTol',0,'RelTol',10^(-15));

[[xn1;ones(9,1)*NaN],[xn2;ones(8,1)*NaN],[xn3;ones(7,1)*NaN],[xn5;ones(5,1)*NaN],xn10];
[[alfa1';ones(9,1)*NaN],[alfa2';ones(8,1)*NaN],[alfa3';ones(7,1)*NaN],[alfa5';ones(5,1)*NaN],alfa10'];
[I1,I2,I3,I5,I10];
[abs(I1-Integ),abs(I2-Integ),abs(I3-Integ),abs(I5-Integ),abs(I10-Integ)]
