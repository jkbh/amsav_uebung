function [rxy, lags] = kreuzkorr(x, y)    
    lags = -length(y)+1:length(x)-1;
    rxy = conv(conj(flip(x)), y);    
end

