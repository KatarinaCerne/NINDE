function [alfa,xn] = GaussUteziVozli(n,ro,am,bm)
%funkcija GaussUteziVozli izra�una ute�i in vozle Gaussovega integracijskega
%pravila na intervalu [am,bm] z ute�jo ro in n+1 vozli
%vhod:
%n ... �tevilo vozlov
%ro ... ute�
%am, bm ... kraji��i intervala, po katerem integriramo
%izhod:
%alfa ... seznam ute�i
%xn ... seznam vozlov
alfa = zeros(1,n);
[a_sez,b_sez,polQ] = ONbaza(n,ro,am,bm); %z algoritmom za ra�unanje ON polinomov izra�unamo 
%ortonormirano bazo prostora polinomov stopnje n, elementi so shranjeni v
%celici polQ, izra�unamo �e koeficiente (a_i)i=0...n , (b_i)i=0...n, v
%tri�lenski rekurzivni zvezi, shranjene v seznamih a_sez in b_sez
A = spdiags([b_sez(2:end)',a_sez',b_sez(1:end-1)'],[-1,0,1],n,n); %koeficiente iz seznamov a_sez in b_sez 
%damo v tridiagonalno matriko A
[V,D]=eig(full(A)); %izra�unamo laste vektorje in lastne vrednosti matrike A
%V je matrika, ki na diagonali vsebuje lastne vrednosti
%D je matrika, katere stolpci so lastni vektorji
Z=zeros(n);
xn = diag(D); %lastne vrednosti spravimo v stolpec xn

for i=1:n
    Z(:,i)=V(:,i)/norm(V(:,i));    %normiramo lastne vektorje
end

for i=1:n
   alfa(i)=integral(ro,am,bm,'AbsTol',0,'RelTol',10^(-15))*Z(1,i)^2; %izra�unamo ute�i alfa_{j,n}
end

end