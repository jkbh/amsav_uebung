Fs = 50e3;
t = 0 : 1/Fs : 10 - (1/Fs);
x = cos(2*pi*2500+t) + 0.5 * sin(2*pi*5000*t) + 0.25*cos(2*pi*10000*t) + 0.125*sin(2*pi*15000*t) + randn(size(t));

b = fir1(50, 0.3, 'low');

% filter offline in time domain
y_conv = conv(x, b);

% filter offline in frequency domain
X = fft(x);
B = fft(b, length(x));
Y = X .* B;
y_freq_filt = ifft(Y);

% filter online
N = length(b)+1; % this is the minimal length for N
y = overlap_add(x, b, N); 

subplot(1,3,1)
plot((1:length(y_conv))*1/Fs, y_conv);
xlabel 't'
ylabel 'x filtered offline (time domain)'

subplot(1,3,2)
plot(t, y_freq_filt)
xlabel 't'
ylabel 'x filtered offline (frequency domain)'

subplot(1,3,3);
plot((1:length(y))*1/Fs, y);
xlabel 't'
ylabel 'x filtered online'


