function Y = RungeKutta4(fun, a, b, y0, h)
%funkcija izra�una re�itev ena�be y'=fun(x,y) z runge-kutta metodo reda 4

%Vhod:
%fun ... funkcija v problemu y'(x)=fun(x,y(x))
%a, b ... meji intervala, na katerem se nahajajo delilne to�ke x_i
%y0 ... za�etni pribli�ek
%h ... korak iteracije

%Izhod:
%Y ... vektor, ki vsebuje pribli�ke za y(x_i) pri delilnih to�kah x_i

st_iteracij = (b-a)/h;
vels = max(size(y0));%velikost sistema
X = linspace(a,b,st_iteracij+1); %vrstica, ki vsebuje x_i
Y = zeros(st_iteracij+1,vels); %vrstica, ki vsebuje y_i oz. �e imamo sistem, je to matrika, ki 
%v stolpcih vsebuje y_i, y'_i itd.
Y(1,:)=y0;

for i=2:st_iteracij+1
   k1 = fun(X(i-1),Y(i-1,:));
   k2 = fun(X(i-1)+h/2,Y(i-1,:)+h.*k1./2.*ones(1,vels));
   k3 = fun(X(i-1)+h/2,Y(i-1,:)+h.*k2./2.*ones(1,vels));
   k4 = fun(X(i-1)+h,Y(i-1,:)+h.*k3.*ones(1,vels));
   
   Y(i,:)=Y(i-1,:)+h/6.*(k1+2*k2+2*k3+k4).*ones(1,vels);
end


end