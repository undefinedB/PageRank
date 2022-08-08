function B = PR_Inv(A)
    %voi folosi algoritmul GS modificat pentru a factoriza QR
    %initializez prima data Q si R
    [m, n] = size(A);
    R = zeros(m ,n);
    Q = zeros(m ,n);

    %GS stabil numeric
    %algoritmul este prezentat in laboratorul 3, asa ca
    %doar l-am tradus in octave
    for i = 1:m
        R(i, i) = norm(A(:, i));
        Q(:, i) = A(:, i) / R(i, i);
        for j = 1:n
            R(i, j) = (Q(:, i))' * A(:, j);
            A(:, j) = A(:, j) - Q(:, i) * R(i, j);
        end
    end
    %m = n
    B = zeros(m, n);

    %QR * bi = ei, pe care o rezolv treptat
    %R * bi = Q' * ei, devine un sistem superior triunghiular

    I = eye(m);
    for i = 1:m
        ei = I(:, i);
        B(:, i) = SST(R, Q' * ei);
    end

end
