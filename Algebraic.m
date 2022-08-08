function R = Algebraic(nume, d)
	%inceputul este ca cel al functiei Iterative
    nodes = 0;
    fid = fopen(nume, 'r');
    nodes = fscanf(fid, "%d", 1);
    A = zeros(nodes, nodes);
      
    for i = 1:nodes
      nod1 = fscanf(fid, "%d", 1);
      nrnoduri = fscanf(fid, "%d", 1);
      for j = 1:nrnoduri
        nod2 = fscanf(fid, "%d", 1);
        A(nod2, nod1) = 1;
      end
      A(i, i) = 0;
    end
    val1 = fscanf(fid, "%f", 1);
    val2 = fscanf(fid, "%f", 2);
    fclose(fid);

    %convertirea lui A in matrice stocastica
    for i = 1:nodes
    sum = 0;
        for j = 1:nodes
            sum = sum + A(j, i);
        end
    A(: , i) = A(:, i) ./ sum;
    end
    
    %formula algebrica este
    %R = d * A * R + C
    %se transforma in (I - d * A) * R = C
    %deci R = Inv(I - d * A) * C

    C = ones(nodes, 1);
    C = C * (1-d) / nodes;

    R = PR_Inv(eye(nodes) - d * A) * C;
end