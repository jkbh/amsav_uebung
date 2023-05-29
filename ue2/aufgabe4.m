% a)
x = -10:10;

[rxy, lags] = kreuzkorr(x,x);

stem(lags, rxy);

%%
% b)
Fs = 6e9;
c = 3e8;

s1 = repmat(sqrt(1/100), 1, 100);
s2 = repmat([sqrt(1/100), -sqrt(1/100)], 1, 50);
s3 = [sqrt(1/2), zeros(1, 98), -sqrt(1/2)];

signals = [s1;s2;s3];

for i = 1:3
    signal = signals(i,:);    
    response = transpose(Reflektor(signal));
    response_seconds = length(response)/Fs;    

    [rxy, lags] = kreuzkorr(response, signal);
    
    subplot(3,3,i);
    plot(signal);

    subplot(3,3,i+3);
    plot(response);
    
    subplot(3,3,i+6);
    stem(lags, rxy);

    [v, index] = max(rxy); % get get index of max correlation
    lag = lags(index); % get corresponding lag

    lag_s = lag/Fs; % lag from steps to seconds
    distance = lag_s * c % lag to meters
end