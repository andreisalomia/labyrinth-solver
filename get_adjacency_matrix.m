function [Adj] = get_adjacency_matrix(Labyrinth)
  nr = 1;
  m = rows(Labyrinth);
  n = columns(Labyrinth);
  Numbers = zeros(m, n);

  for i = 1:m
    for j = 1:n
      # Creating a helping matrix with numbers from 1 to m*n
      Numbers(i, j) = nr;
      nr++;
    end
  end

  # Initializing the sparse matrix
  Adj = sparse(m*n+2);
  Adj(1, 1) = 0;

  for i = 1:m
    for j = 1:n
      # Creating an array of the binary form of the labyrinth cell code
      x = bitget(Labyrinth(i, j), 4:-1:1);

      # Creating the adjacency matrix by placing 1 where there are no walls
      # between cells
      # Each bit of the array has a special case in which the cell in question 
      # could have an exit to a win/lose state
      if x(1) == 0
        if i == 1
          Adj(Numbers(i, j), m*n+1) = 1;
        else
          Adj(Numbers(i, j), Numbers(i-1, j)) = 1;
        endif
      endif
      if x(2) == 0
        if i == m
          Adj(Numbers(i, j), m*n+1) = 1;
        else
          Adj(Numbers(i, j), Numbers(i+1, j)) = 1;
        endif
      endif
      if x(3) == 0
        if j == n
          Adj(Numbers(i, j), m*n+2) = 1;
        else
          Adj(Numbers(i, j), Numbers(i, j+1)) = 1;
        endif
      endif
      if x(4) == 0
        if j == 1
          Adj(Numbers(i, j), m*n+2) = 1;
        else
          Adj(Numbers(i, j), Numbers(i, j-1)) = 1;
        endif
      endif
    end
  end

  Adj(m*n+1, m*n+1) = 1;
  Adj(m*n+2, m*n+2) = 1;
end

