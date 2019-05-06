function Y = RungeKutta4(fun, a, b, y0, h)
%funkcija izra�una re�itev ena�be y'=fun(x,y) z runge-kutta metodo reda 4
%fun ... funkcija v problemu y'(x)=fun(x,y(x))
%a, b ... meji intervala, na katerem se nahajajo delilne to�ke x_i
%y0 ... za�etni pribli�ek
%h ... korak iteracije

st_iteracij = (b-a)/h;
X = linspace(a,b,st_iteracij+1); %vrstica, ki vsebuje x_i
Y = zeros(1,st_iteracij+1); %vrstica, ki vsebuje y_i
Y(1)=y0;

for i=2:st_iteracij+1
   k1 = fun(X(i-1),Y(i-1));
   k2 = fun(X(i-1)+h/2,Y(i-1)+k1/2);
   k3 = fun(X(i-1)+h/2,Y(i-1)+k2/2);
   k4 = fun(X(i-1)+h,Y(i-1)+k3);
   
   Y(i)=Y(i-1)+h/6*(k1+2*k2+2*k3+k4);
end


end