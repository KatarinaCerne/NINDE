tspan=[0,3]; %matlab se odlo�i za delilne to�ke
tspan2=0:4; %re�itev se pora�una v to�kah 0,1,2,3,4
tspan3=[0,-0.5,-1]; %lahko gremo nazaj v �asu
yzero=1;
[t,y]=ode45(@myf,tspan2,yzero);
plot(t,y,'*--')
xlabel t, ylabel y(t)

