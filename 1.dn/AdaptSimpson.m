function [I,napaka]=AdaptSimpson(fun,a,b,delta)
%funkcija AdaptSimpson ra�una pribli�ek za integral funkcije fun na
%intervalu [a,b] po adaptivni metodi, opisani v nalogi
%vhod:
%fun ... funkcija, katere integral ra�unamo
%a ... levo kraji��e intervala, po katerem ra�unamo integral
%b ... desno kraji��e intervala, po katerem ra�unamo integral
%delta ... zahtevana natan�nost
%izhod:
%I ... kon�ni pribli�ek za integral

I1=simpson(fun,a,b); %izra�unamo prvi pribli�ek za inegral po simpsonovem pravilu
I2=simpson(fun,a,(a+b)/2)+simpson(fun,(a+b)/2,b); %drugi pribli�ek: razpolovimo interval,
%na vsakem podintervalu ra�unamo pribli�ek po simpsonovem pravilu

napaka = abs(I1-I2);

if abs(I1-I2)>delta %�e je razlika med pribli�koma I1 in I2 ve�ja od natan�nosti delta
   [int1,n1]=AdaptSimpson(fun,a,(a+b)/2,delta);
   [int2,n2]=AdaptSimpson(fun,(a+b)/2,b,delta);
   I=int1+int2;
   napaka=max(n1,n2);
   %razpolovimo intervala in na vsakem rekurzivno kli�emo funkcijo
   %AdaptSimpson
else %�e je razlika med pribli�koma I1 in I2 manj�a ali enaka delta
    I=I2+(1/15)*(I2-I1); %na I1 in I2 izvedemo en korak Richardosnove ekstrapolacije
    %[a,b];
end

end
