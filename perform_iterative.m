function [x, err, steps] = perform_iterative(G, c, x0, tol, max_steps)
    [n n] = size(G);
    err = 0;
    steps = max_steps;
    x = zeros(n, 1);

    while max_steps >= 0
        max_steps--;

        # Computing for each iteration the x vector using the previous x,
        # and the G and c parameters
        x = G * x0 + c;

        # Comparing the error to a maximum tolerance to stop the iterative function
        aux = abs(x - x0);
        if norm(aux) < tol
            err = norm(aux);
            break;
        endif

        x0 = x;
    endwhile

    steps = steps - max_steps;
endfunction

