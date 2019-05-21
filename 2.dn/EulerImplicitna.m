function Y = EulerImplicitna(fun, a, b, y0, h)
%funkcija izraèuna rešitev enaèbe y'=fun(x,y) z implicitno eulerjevo metodo

%Vhod:
%fun ... funkcija v problemu y'(x)=fun(x,y(x))
%a, b ... meji intervala, na katerem se nahajajo delilne toèke x_i
%y0 ... zaèetni približek
%h ... korak iteracije

%Izhod:
%Y ... vektor, ki vsebuje približke za y(x_i) pri delilnih toèkah x_i

st_iteracij = (b-a)/h;
X = linspace(a,b,st_iteracij+1); %vrstica, ki vsebuje x_i
vels = max(size(y0));%velikost sistema
Y = zeros(st_iteracij+1,vels); %stolpec, ki vsebuje y_i
Y(1,:)=y0;

for i=2:st_iteracij+1
    y_priblizek = Y(i-1,:)+h.*fun(X(i-1),Y(i-1,:)); %zaèetni približek za Y(i) izraèunamo z eksplicitno metodo
    
    fun_y = @(t) t -h*fun(X(i),t)-Y(i-1,:); %enaèbo za implicitno eulerjevo metodo zapišemo kot funkcijo
    %v odvisnosti od y_i
    Y(i)=fzero(fun_y,y_priblizek); %raèunamo nelinearno enaèbo, da dobimo y_i
    %Y(i)=fsolve(fun_y,y_priblizek); 
    
%     prejsnji=y_priblizek;
%     zdajsnji=Y(i-1)+h*fun(X(i),y_priblizek);
%     while abs(zdajsnji-prejsnji)>10^(-6) %delamo iteracijo, dokler nista približka dovolj blizu skupaj
%         prejsnji = zdajsnji;
%         zdajsnji = Y(i-1) +h*fun(X(i),prejsnji);
%     end
%    Y(i)=zdajsnji; 
  
end


end