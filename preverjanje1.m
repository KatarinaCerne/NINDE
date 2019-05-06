fun = @(x) 1./sqrt(x+10.^(-6));
a=0;
b=1;
delta=1/1000;
[I,napaka]=AdaptSimpson(fun,a,b,delta);

