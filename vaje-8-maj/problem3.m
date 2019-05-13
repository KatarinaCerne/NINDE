%tspan=[0,10];
tspan=0:0.001:10;
Yzero1=[1,1];
Yzero2=[-5,2];
Yzero3=[5,-2];
[t1,Y1]=ode45(@pend,tspan,Yzero1);
[t2,Y2]=ode45(@pend,tspan,Yzero2);
[t3,Y3]=ode45(@pend,tspan,Yzero3);

%plot(Y1(:,1),Y1(:,2),Y2(:,1),Y2(:,2),Y3(:,1),Y3(:,2))

plot(Y1(:,1),Y1(:,2))
hold on
plot(Y2(:,1),Y2(:,2))
hold on 
plot(Y3(:,1),Y3(:,2))
hold off

[y1,y2]=meshgrid(-5:0.5:5,-3:0.5:3);
Dy1Dt=y2;
Dy2Dt=-sin(y1);
quiver(y1,y2,Dy1Dt,Dy2Dt)
hold on
plot(Y1(:,1),Y1(:,2),Y2(:,1),Y2(:,2),Y3(:,1),Y3(:,2),'LineWidth',1)
axis([-5,5,-3,3]);
xlabel y_1(t), ylabel y_2(t)
hold off