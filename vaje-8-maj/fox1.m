function Yprime = fox1(t,Y)
k = 0.75;
r1=sqrt(1+t)*cos(t);
r2=sqrt(1+t)*sin(t);
r = [r1,r2]';
r1prime=1/2*cos(t)/sqrt(1+t)-sqrt(1+t)*sin(t);
r2prime=1/2*sin(t)/sqrt(1+t)+sqrt(1+t)*cos(t);
rprime=[r1prime,r2prime]';

if norm(rprime-Y)<10^(-4)
    error('Slabo pogojen problem.')
else
    s = k*norm(rprime)/norm(rprime-Y);
    Yprime=s*(r-Y);
end
end
