function [R1 R2] = PageRank(nume, d, eps)
	% Calculeaza indicii PageRank pentru cele 3 cerinte
	% Scrie fisierul de iesire nume.out

    R1 = Iterative(nume, d, eps);
    R2 = Algebraic(nume, d);

    %fac rost de val1 si val2
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
    val2 = fscanf(fid, "%f", 1);
    fclose(fid);  
    clear("A");
    clear("nod1");
    clear("nod2");
    
    %sortez
    %construiesc un vector R3 care are ordinea initiala si sortez
    %in functie de valori

    [n m] = size(R2);
    R3 = zeros(n, 2);
    for i = 1:n
        R3(i, 1) = i;
        R3(i, 2) = R2(i, 1);
    end
    R3 = sortrows(R3, -2);
    
    %construiesc R3 ca fiind outputul exact
    for i = 1:n
        R3(i, 2) = Apartenenta(R3(i, 2), val1, val2);
    end

    %scrierea efectiva in fisierul de output
    nume = strcat(nume, ".out");
    fid = fopen(nume, "w");
    
    fprintf(fid, "%d\n", nodes);
    
    for i = 1:nodes
        fprintf(fid, "%.6f\n", R1(i, 1));
    end

    fprintf(fid, "\n");

    for i = 1:nodes
        fprintf(fid, "%.6f\n", R2(i, 1));
    end

    fprintf(fid, "\n");

    for i = 1:nodes
        fprintf(fid, "%d %d %.6f\n", i, R3(i, 1), R3(i, 2));
    end

    fclose(fid);

end