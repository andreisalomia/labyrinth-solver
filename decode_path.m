function [decoded_path] = decode_path (path, lines, cols)
  path(end)=[];
  number=rows(path);
  decoded_path=zeros(number,2);
  aux=zeros(lines,cols);
  nr=1;
  
  for i=1:lines
    for j=1:cols
      # Creating a helping matrix with numbers from 1 to lines*cols
      aux(i,j)=nr;
      nr++;
    endfor
  endfor
  
  for k=1:number
    for i=1:lines
      ok=0;
      for j=1:cols
        if path(k)==aux(i,j)
          # While going through all the indexes of my helping matrix I compare
          # the element in the path with the element in the helping matrix. If
          # they are equal the indexes are saved in the decoded_path matrix.
          decoded_path(k,1)=i;
          decoded_path(k,2)=j;
          ok=1;
          break;
        endif
      endfor
      if ok==1
        break;
      endif
    endfor
  endfor
endfunction

