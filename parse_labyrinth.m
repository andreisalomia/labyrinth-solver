function [Labyrinth] = parse_labyrinth(file_path)
  f = fopen(file_path, 'r');
  format = '%d';
  # Reading the labyrinth lines and columns
  m = fscanf(f, format, 1);
  n = fscanf(f, format, 1);
  Labyrinth = zeros(m, n);
  for i = 1:m
    for j = 1:n
      # Reading into a variable each element
      aux = fscanf(f, format, 1);
      Labyrinth(i, j) = aux;
    end
  end
  fclose(f);
end
