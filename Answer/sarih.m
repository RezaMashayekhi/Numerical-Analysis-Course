function [ x ] =project(T )
T=6
for i=1:6
    for j=1:6
        u0(i,j)=2*i+j;
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

for i=1:6
      for j=1:6
             u(i,j)=0;
       end
end

a=1/(0.2)^2;
b=1/(0.2)^2;

up=u0;
    for t=1:T
        for i=1:6
            for j=1:6
                
                if t==1
                    u(i,j)=u0(i,j);
                    
                end
                if i==1
                   u(1,j)= g1(j,t);
                end
                if i==6
                   u(6,j)= g2(j,t);
                end
                if j==1
                   u(i,1)= h1(i,t);
                end
                if j==6
                   u(i,6)= h2(i,t);
                end
                if t~=1 && i>=2 && i<=5 && j>=2 && j<=5
                    u(i,j)=(1-2*a-2*b)*up(i,j)+a*(up(i+1,j)+up(i-1,j))+b*(up(i,j+1)+up(i,j-1));
                    
                end
            end
        end
        up=u
    end
end

