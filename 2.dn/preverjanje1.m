m=8*10^6;
y0=100;
k=2*10^(-8);
fun = @(t,y) k.*(m-y).*y;
a=0;
b=30;
h=0.1;
Y = EulerImplicitna(fun, a, b, y0, h);
[Y(10/h+1),Y(20/h+1),Y(30/h+1)]
Y1 = EulerIzboljsana(fun, a, b, y0, h);
[Y1(2*10/h+1),Y1(2*20/h+1),Y1(2*30/h+1)]
[t,y] = ode45(fun,[a,b],y0);
Y2 = Heunova(fun, a, b, y0, h);
[Y2(10/h+1),Y2(20/h+1),Y2(30/h+1)]

st_iteracij = (b-a)/h;
X = linspace(a,b,st_iteracij+1);
st_iteracij1 = (b-a)/h*2;
X1 = linspace(a,b,st_iteracij1+1);

plot(X,Y)
hold on
plot(X1,Y1)
hold on
plot(X,Y2)
hold on
plot(t,y)
hold off
