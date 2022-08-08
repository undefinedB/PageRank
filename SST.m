function [x] = SST(A, b)
    x = zeros(size(b));
    [n, n] = size(A);
  
    x(n, 1) = b(n, 1) / A(n, n);
    for i = 1:n-1
        x(n - i, 1) = (b(n - i, 1) - A(n - i, n-i+1:n) * x(n-i+1:n, 1)) / A(n-i, n-i);   
    end
end