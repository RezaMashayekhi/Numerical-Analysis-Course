n=6;
a=1/(0.2)^2;
b=1/(0.2)^2;

T=6

for i=1:6
    for j=1:6
        u(i,j)=2*i+j;
    end
end

for j=1:6
    for t=1:T
        g1(j,t)=4*j+t;
    end
end

for j=1:6
    for t=1:T
        g2(j,t)=3*j+t;
    end
end

for i=1:6
    for t=1:T
        h1(i,t)=5*i+t;
    end
end

for i=1:6
    for t=1:T
        h2(i,t)=6*i+t;
    end
end

for t=2:n
    for i=1:(n-2)*(n-2)
       for j=1:(n-2)*(n-2)
           if(i==j)
               m(i,j)=1;
           end
           if i-(n-2)==j
               m(i,j)=-a ;
           end
           if i+(n-2)==j
               m(i,j)=-a ;
           end
           if i+1==j
               m(i,j)=-b ;
           end
           if i-1==j
               m(i,j)=-b ;
           end
       end


    end
    c=1;
    for i=2:n-1
        for j=2 : n-1
            z=u(i,j);
            if(i==2 ) 
                z=z + a*g1(j,t);
            end
            if(i==n-1)
                z=z + a*g2(j,t);
            end
            if(j==2)
                z=z + a*h1(i,t);
            end
            if(j==n-1)
                z=z + a*h2(i,t);
            end
            mb(c)=z;
            c=c+1;
        end
    end
    
    for i=1:(n-2)*(n-2)
        x0(i)=0;
    end
    x=gaussseidelmethod(m,transpose(mb),transpose(x0),0.5,10)
    cp=1;
    for i=2:n-1
        for j=2:n-1
            u(i,j)=x(cp);
            cp=cp+1;
        end
    end
end
