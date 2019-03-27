function I = GaussIntegral(f,n,ro,am,bm)
%funkcija GaussIntegral izra�una pribli�ek za integral funkcije f z
%Gaussovim integracijskom pravilom na intervalu [am,bm] z ute�jo ro in n+1 vozli
%vhod:
%f ... funkcija, ki jo integriramo
%n ... �tevilo vozlov
%ro ... ute�
%am, bm ... kraji��i intervala, po katerem integriramo
%izhod:
%I ... vrednost pribli�ka za integral funkcije f po intervalu [am,bm]

[alfa,xn] = GaussUteziVozli(n,ro,am,bm); %izra�unamo ute�i in vozle Gaussovega integracijskega pravila
%ute�i so shranjene v seznamu alfa, vozli so shranjeni v stolpcu xn
I=0;
for i=1:n
   I=I+alfa(i)*f(xn(i)); 
end

end