function [G, c] = get_Jacobi_parameters (Link)

  m = rows(Link);
  # Initializing the G and c parameters of the Jacobi method
  G=sparse(m-2);
  c=sparse(m-2, 1);
  # G will be the Link matrix without the win/lose rows and columns
  # c will be the column of win states
  G=Link(1:(m-2), 1:(m-2));
  c=Link(1:(m-2), m-1);

endfunction
