function y = Apartenenta(x, val1, val2)
	% Functia care primeste ca parametrii x, val1, val2 si care calculeaza valoarea functiei membru in punctul x.
	% Stim ca 0 <= x <= 1
    
    %deduc formulele
    %a * val1 + b = 0
    %a * val2 + b = 1
    %deci b/a = -val1
    %si (1-b)/a = val2
    %a = 1/(val2 - val1)
    %b = val1/(val1 - val2)

    a = 1/(val2 - val1);
    b = val1/(val1 - val2);
    y = x * a + b;
    if x < val1
      y = 0;
    end
    if x > val2
      y = 1;
    end

end