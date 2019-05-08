%tspan=0:0.001:10;
tspan=[0,10];
Yzero=[3,1];
[t,Y]=ode45(@fox1,tspan,Yzero);
r = [sqrt(1+t).*cos(t),sqrt(1+t).*sin(t)];
plot(Y(:,1),Y(:,2))
hold on 
plot(r(:,1),r(:,2),'--')
hold on
plot([3,1],[0,0],'o')
hold off

