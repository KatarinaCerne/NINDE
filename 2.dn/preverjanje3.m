a3 = 0;
b3 = 10;
h31 = 0.1;
h32 = 0.05;
y30 = [0,1];

Y31 = MilneSistem(@primer3, a3, b3, y30, h31);
Y32 = MilneSistem(@primer3, a3, b3, y30, h32);



