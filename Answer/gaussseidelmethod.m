function x = gaussseidelmethod( A , b , x0 , delta , akharintekrar  )
[~, n] = size(A);
x(1)=0;
 for i=1 : akharintekrar
       for j=1 : n
           x(j)=1/A(j,j)*((b(j)-A(j,1:j-1)*transpose(x(1:j-1))-A(j,j+1:n)*x0(j+1:n)));
           
       end
       %fprintf('marhaleye %d om barabar ast ba', i );
       %disp(x)
       error=abs(norm(transpose(x)-x0));
          x0=transpose(x);
       if(error<delta)
           break;
       end
 end
end

