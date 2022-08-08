function R = Iterative(nume, d, eps)
	% Functia care calculeaza matricea R folosind algoritmul iterativ.
	% Intrari:
	%	-> nume: numele fisierului din care se citeste;
	%	-> d: coeficentul d, adica probabilitatea ca un anumit navigator sa continue navigarea (0.85 in cele mai multe cazuri)
	%	-> eps: eruarea care apare in algoritm.
	% Iesiri:
	%	-> R: vectorul de PageRank-uri acordat pentru fiecare pagina.
  
  %incep citirea, pentru numarul de noduri date la inceput 
  %citesc cate o linie si imi formez matricea
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
  %transform matricea A in matrice stocasticsa

  for i = 1:nodes
      sum = 0;
      for j = 1:nodes
          sum = sum + A(i, j);
      end
  end


  
  for i = 1:nodes
    sum = 0;
    for j = 1:nodes
      sum = sum + A(j, i);
    end
    A(: , i) = A(:, i) ./ sum;
  end
  
  %in R tin minte PR la timpul t, iar in R1 tin minte PR la timpul t+1
  %rezolv problema iterativ si initializez PR1 cu 1/N
  %C = vector constant folosit pentru formula
  
  R = zeros(nodes, 1);
  R1 = zeros(nodes, 1);
  
  
  for i = 1:nodes
    R(i, 1) = 1/nodes;
  end

  
  %vector ce va fi folosit doar pentru formula
  C = ones(nodes, 1);
  C = C * (1-d) / nodes;
 
  while 1
    %R = R1;
    R1 = d * A * R + C;
    if abs(norm(R1 - R)) < eps
       %R = R1;
       return;
    end
    R = R1;
  end
  
  end