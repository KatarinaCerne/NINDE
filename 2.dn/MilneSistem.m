function res = MilneSistem(fun, a, b, y0, h)
%funkcija izra�una re�itev ena�be y'=fun(x,y) z Milneovo prediktor-korektor
%metodo

%Vhod:
%fun ... funkcija v problemu y'(x)=fun(x,y(x)), v tem primeru je vektor
%(stoplec) funkcij sistema
%a, b ... meji intervala, na katerem se nahajajo delilne to�ke x_i
%y0 ... za�etni pribli�ek, v tem primeru vektor (vrstica), ki vsebuje y(a) in y'(a)
%h ... korak iteracije

%Izhod:
%res ... matrika, ki v 1. stolpcu vsebuje pribli�ke za y(x_i) pri delilnih to�kah
%x_i, v drugem stolpcu pa pribli�ke za y'(x_i)

st_iteracij = (b-a)/h;
X = linspace(a,b,st_iteracij+1); %vrstica, ki vsebuje x_i
vels = max(size(y0));%velikost sistema
Y = zeros(st_iteracij+1,vels); %matrika, ki vsebuje y_i in y'_i v stolpcih
Y(1,:)=y0; %to je vrstica
zacPriblizki = RungeKutta4(fun,a,b,y0,h);
Y(2:4,:)=zacPriblizki(2:4,:); %to so y1,y2,y3

for i=5:st_iteracij+1
   Yp = Y(i-4,:)+h./3.*(8*fun(X(i-1),Y(i-1,:))-4*fun(X(i-2),Y(i-2,:))+8*fun(X(i-3),Y(i-3,:))); %prediktor
   Y(i,:) = Y(i-2,:)+h./3.*(fun(X(i),Yp)+4*fun(X(i-1),Y(i-1,:))+fun(X(i-2),Y(i-2,:))); %korektor
end
res = Y;
end