function [Link] = get_link_matrix(Labyrinth)
    nr = 1;
    m = rows(Labyrinth);
    n = columns(Labyrinth);
    Numbers = zeros(m, n);

    for i = 1:m
        for j = 1:n
            Numbers(i, j) = nr;
            nr++;
        endfor
    endfor

    Adj = sparse(m * n + 2);
    Adj(1, 1) = 0;

    for i = 1:m
        for j = 1:n
            x = bitget(Labyrinth(i, j), 4:-1:1);
            for k = 1:4
                if x(1) == 0
                    if i == 1
                        Adj(Numbers(i, j), m * n + 1) = 1;
                    else
                        Adj(Numbers(i, j), Numbers(i - 1, j)) = 1;
                    endif
                endif
                if x(2) == 0
                    if i == m
                        Adj(Numbers(i, j), m * n + 1) = 1;
                    else
                        Adj(Numbers(i, j), Numbers(i + 1, j)) = 1;
                    endif
                endif
                if x(3) == 0
                    if j == n
                        Adj(Numbers(i, j), m * n + 2) = 1;
                    else
                        Adj(Numbers(i, j), Numbers(i, j + 1)) = 1;
                    endif
                endif
                if x(4) == 0
                    if j == 1
                        Adj(Numbers(i, j), m * n + 2) = 1;
                    else
                        Adj(Numbers(i, j), Numbers(i, j - 1)) = 1;
                    endif
                endif
            endfor
        endfor
    endfor

    Adj(m * n + 1, m * n + 1) = 1;
    Adj(m * n + 2, m * n + 2) = 1;
    
    # Using the same procedure as in the Adjacency matrix function, but this time
    # each element is divided by the number of links it has to other cells or
    # win-lose states

    Link = sparse(m * n + 2);
    Link = Adj;
    for i = 1:(m * n + 2)
        fraction = nnz(Adj(i, :));
        for j = 1:(m * n + 2)
            if Link(i, j) ~= 0
                Link(i, j) = 1 / fraction;
            endif
        endfor
    endfor
endfunction

