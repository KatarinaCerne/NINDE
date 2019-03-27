fun = @(x) 1./sqrt(x+10.^(-6));
a=0;
b=1;
delta=1/1000;
AdaptSimpson(fun,a,b,delta)

% I1=simpson(fun,a,b);
% I2=simpson(fun,a,(a+b)/2)+simpson(fun,(a+b)/2,b);
% I4=simpson(fun,a,(a+(a+b)/2)/2)+simpson(fun,(a+(a+b)/2)/2,(a+b)/2)+simpson(fun,(a+b)/2,((a+b)/2+b)/2)+simpson(fun,((a+b)/2+b)/2,b);
% (16*I4-I2)/15;