function Y=EulerIzboljsana(fun,a,b,y0,h)
%funkcija izra�una re�itev ena�be y'=fun(x,y) z izbolj�ano eulerjevo metodo

%Vhod:
%fun ... funkcija v problemu y'(x)=fun(x,y(x))
%a, b ... meji intervala, na katerem se nahajajo delilne to�ke x_i
%y0 ... za�etni pribli�ek
%h ... korak iteracije

%Izhod:
%Y ... vektor, ki vsebuje pribli�ke za y(x_i) pri delilnih to�kah x_i

st_iteracij = (b-a)/h*2;
X = linspace(a,b,st_iteracij+1); %vrstica, ki vsebuje x_i
vels = max(size(y0));%velikost sistema
Y = zeros(st_iteracij+1,vels); %stolpec, ki vsebuje y_i
Y(1,:)=y0;

for i=2:2:st_iteracij
    Y(i,:)=Y(i-1,:)+h./2.*fun(X(i-1),Y(i-1,:));
    Y(i+1,:)=Y(i-1,:)+h.*fun(X(i),Y(i,:));
end

end