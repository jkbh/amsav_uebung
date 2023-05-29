Fs = 50e3;
t = 0 : 1/Fs : 10 - (1/Fs);
x = cos(2*pi*2500+t) + 0.5 * sin(2*pi*5000*t) + 0.25*cos(2*pi*10000*t) + 0.125*sin(2*pi*15000*t) + randn(size(t));

b = fir1(50, 0.3, 'low');

y_conv = conv(x, b);

y = overlap_add(x, b, 60); 

subplot(1,2,1)
plot(y_conv);
subplot(1,2,2);
plot(y);


