function Y = Heunova(fun, a, b, y0, h)
%funkcija izraèuna rešitev enaèbe y'=fun(x,y) s heunovo metodo

%Vhod:
%fun ... funkcija v problemu y'(x)=fun(x,y(x))
%a, b ... meji intervala, na katerem se nahajajo delilne toèke x_i
%y0 ... zaèetni približek
%h ... korak iteracije

%Izhod:
%Y ... vektor, ki vsebuje približke za y(x_i) pri delilnih toèkah x_i

st_iteracij = (b-a)/h;
X = linspace(a,b,st_iteracij+1); %vrstica, ki vsebuje x_i
Y = zeros(1,st_iteracij+1); %vrstica, ki vsebuje y_i
Y(1)=y0;

for i=2:st_iteracij+1
   k1=fun(X(i-1),Y(i-1));
   k2=fun(X(i-1)+2/3*h,Y(i-1)+2/3*h*k1);
   Y(i)=Y(i-1)+h*(1/4*k1+3/4*k2);
end

end