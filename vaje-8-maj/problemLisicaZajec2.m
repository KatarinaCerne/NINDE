%tspan=0:0.001:10;
tspan=[0,10];
options=odeset('RelTol',10^(-6),'AbsTol',10^(-6),'Events',@fox2_events);
Yzero=[3,1];
[t,Y,te,ye,ie]=ode45(@fox2,tspan,Yzero,options);
%te=ob katerem èasu se je zgodil dogodek (v našem primeru kdaj lisica ujame
%zajca)
%ye=na katerem mestu se je zgodil dogodek
r = [sqrt(1+t).*cos(t),sqrt(1+t).*sin(t)];
plot(Y(:,1),Y(:,2))
hold on 
plot(r(:,1),r(:,2),'--')
hold on
plot([3,1],[0,0],'o')
hold off
