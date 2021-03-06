function Y = Heunova(fun, a, b, y0, h)
%funkcija izra�una re�itev ena�be y'=fun(x,y) s heunovo metodo

%Vhod:
%fun ... funkcija v problemu y'(x)=fun(x,y(x))
%a, b ... meji intervala, na katerem se nahajajo delilne to�ke x_i
%y0 ... za�etni pribli�ek
%h ... korak iteracije

%Izhod:
%Y ... vektor, ki vsebuje pribli�ke za y(x_i) pri delilnih to�kah x_i

st_iteracij = (b-a)/h;
X = linspace(a,b,st_iteracij+1); %vrstica, ki vsebuje x_i
vels = max(size(y0));%velikost sistema
Y = zeros(st_iteracij+1,vels); %vels, ki vsebuje y_i
Y(1,:)=y0;

for i=2:st_iteracij+1
%    k1=fun(X(i-1),Y(i-1));
%    k2=fun(X(i-1)+2/3*h,Y(i-1)+2/3*h*k1);
%    Y(i)=Y(i-1)+h*(1/4*k1+3/4*k2);
   
   k1=fun(X(i-1),Y(i-1,:));
   k2=fun(X(i-1)+h,Y(i-1,:)+h.*k1);
   Y(i,:)=Y(i-1,:)+h.*(1/2.*k1+1/2.*k2);
end

end