function Y = EulerImplicitna(fun, a, b, y0, h)
%funkcija izraèuna rešitev enaèbe y'=fun(x,y) z implicitno eulerjevo metodo
%fun ... funkcija v problemu y'(x)=fun(x,y(x))
%a, b ... meji intervala, na katerem se nahajajo delilne toèke x_i
%y0 ... zaèetni približek
%h ... korak iteracije

st_iteracij = (b-a)/h;
X = linspace(a,b,st_iteracij+1); %vrstica, ki vsebuje x_i
Y = zeros(1,st_iteracij+1); %vrstica, ki vsebuje y_i
Y(1)=y0;

for i=2:st_iteracij+1
    y_priblizek = Y(i-1)+h*fun(X(i-1),Y(i-1)); %zaèetni približek za Y(i) izraèunamo z eksplicitno metodo
    fun_y = @(t) t -h*fun(X(i),t)-Y(i-1); %enaèbo za implicitno eulerjevo metodo zapišemo kot funkcijo
    %v odvisnosti od y_i
    Y(i)=fsolve(fun_y,y_priblizek); %raèunamo nelinearno enaèbo, da dobimo y_i   
end


end