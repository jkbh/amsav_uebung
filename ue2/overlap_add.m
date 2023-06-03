function [y]=overlap_add(x, b, N)    
    M = length(b);
    assert(M < N, 'M >= N');
    L = N - M + 1;
  
    B = fft(b, N);
    
    y = zeros(1, length(x)+M-1);
   
    for block_start = 1:L:length(x)-L
        x_m = x(block_start:block_start+L-1);
        x_m(N) = 0;
        X_m = fft(x_m, N);        
        y_m = ifft(X_m .* B, N);

        y(block_start:block_start+N-1) = y(block_start:block_start+N-1) + y_m;
    end
end
