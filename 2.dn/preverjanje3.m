a3 = 0;
b3 = 10;
h31 = 0.1;
h32 = 0.05;
y30 = [0,1];

Y31 = MilneSistem(@primer3, a3, b3, y30, h31);
Y32 = MilneSistem(@primer3, a3, b3, y30, h32);

st_iteracij31 = (b3-a3)/h31;
X31 = linspace(a3,b3,st_iteracij31+1);

st_iteracij32 = (b3-a3)/h32;
X32 = linspace(a3,b3,st_iteracij32+1);

plot(X31,Y31(:,1));
hold on
plot(X32,Y32(:,1));
hold off

