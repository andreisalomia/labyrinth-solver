function [path] = heuristic_greedy(start_position, probabilities, Adj)
  m = rows(Adj);
  visited = zeros(1, rows(probabilities) - 2);
  path = start_position;
  
  # Initializing the visited vector
  visited(start_position) = 1;
  win = m - 1;
  lose = m;
  check = lose;
  
  while path ~= 0
    position = path(end);
    
    # Checking whether it is a win state
    if Adj(position, m - 1) == 1
      check = win;
      break;
    endif
    
    ok = 1;
    # Ok variable determines whether the position has unvisited neighbours
    for i = 1:(m - 2)
      if Adj(position, i) == 1
        if visited[i] == 0
          ok = 0;
          break;
        endif
      endif
    endfor
    
    if ok == 0
      path(end) = [];
    endif
    
    max = 0;
    # Max stores the maximum probability of going to the next labyrinth cell
    for i = 1:(m - 2)
      if Adj(position, i) == 1
        if visited(i) == 0
          if probabilities(i) > max
            max = probabilities(i);
            neigh = i;
          endif
        endif
      endif
    endfor
    
    visited(neigh) = 1;
    path = [path neigh];
  endwhile
  
  path = path';
  path = [path; check];
endfunction

