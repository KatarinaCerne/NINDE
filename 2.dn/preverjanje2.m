fun1 = @(t,y) -20.*(y-2);
y01 = 3;
a1=0;
b1=2;
h1=1/25;
h2=1/20;
h3=1/15;
h4=1/10;

Y21=BDF(fun1,a1,b1,y01,h1);
Y22=BDF(fun1,a1,b1,y01,h2);
Y23=BDF(fun1,a1,b1,y01,h3);
Y24=BDF(fun1,a1,b1,y01,h4);

tocnar = @(x) 2+exp(-20.*x);

st_iteracij1 = (b1-a1)/h1;
X1 = linspace(a1,b1,st_iteracij1+1);
Ytocna = tocnar(X1);
rk4 = RungeKutta4(fun1,a1,b1,y01,h1);
maxnapaka=max(abs(Y21-Ytocna));

Ye1=EulerEksplicitna(fun1,a1,b1,y01,h1);
Ye2=EulerEksplicitna(fun1,a1,b1,y01,h2);
Ye3=EulerEksplicitna(fun1,a1,b1,y01,h3);
Ye4=EulerEksplicitna(fun1,a1,b1,y01,h4);

[t,y] = ode45(fun1,a1:h1:b1,y01);
%max(abs(y-Y'));


