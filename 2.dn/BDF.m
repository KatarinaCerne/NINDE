function res = BDF(fun, a, b, y0, h)
%funkcija izra�una re�itev ena�be y'=fun(x,y) z implicitno 4-�lensko BDF metodo

%Vhod:
%fun ... funkcija v problemu y'(x)=fun(x,y(x))
%a, b ... meji intervala, na katerem se nahajajo delilne to�ke x_i
%y0 ... za�etni pribli�ek
%h ... korak iteracije

%Izhod:
%res ... vektor, ki vsebuje pribli�ke za y(x_i) pri delilnih to�kah x_i

st_iteracij = (b-a)/h;
X = linspace(a,b,st_iteracij+1); %vrstica, ki vsebuje x_i
vels = max(size(y0));%velikost sistema
Y = zeros(st_iteracij+1, vels); %stolpec, ki vsebuje y_i
Y(1,:)=y0;
zacPriblizki = RungeKutta4(fun,a,b,y0,h);
size(zacPriblizki)
size(Y)
Y(2:4,:)=zacPriblizki(2:4,:); %to so y1,y2,y3

for i=5:st_iteracij+1
   pomKoef1 = 1+1/2+1/3+1/4;
   pomKoef2 = 0;
   for j=1:4
       for jj=1:j
           pomKoef2 = pomKoef2 + 1/j*(-1)^(jj)*nchoosek(j,jj)*Y(i-jj);
       end
   end
   
    y_priblizek = zacPriblizki(i,:);
    
    fun_y = @(t) t-1/pomKoef1.*(h.*fun(X(i),t)-pomKoef2); %ena�bo za implicitno BDF metodo zapi�emo kot funkcijo
    %v odvisnosti od y_i
    Y(i)=fzero(fun_y,y_priblizek); %ra�unamo nelinearno ena�bo, da dobimo y_i
    %Y(i)=fsolve(fun_y,y_priblizek); %ra�unamo nelinearno ena�bo, da dobimo y_i
    
%     prejsnji=y_priblizek;
%     zdajsnji=1/pomKoef1*(h*fun(X(i),y_priblizek)-pomKoef2);
%     while abs(zdajsnji-prejsnji)>10^(-6) %delamo iteracijo, dokler nista pribli�ka dovolj blizu skupaj
%         prejsnji = zdajsnji;
%         zdajsnji = 1/pomKoef1*(h*fun(X(i),prejsnji)-pomKoef2);
%     end
%    Y(i)=zdajsnji; 
        
end
res = Y;

end