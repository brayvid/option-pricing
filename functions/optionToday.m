function CorP = optionToday(in,call)

[n,r,X,s0,T,p,u,d] = in{:};

dT = T/n;

sparams = {n,s0,u,d};

S = assetTree(sparams);

CorP = zeros(size(S));

for i = size(S,2):-1:1 % for each column of S
    
    for j = size(S,1):-1:1 % for each row of S
       
        if j <= 2^(i-1) % entries with higher j are unused 
            
           if i == size(S,2)
               if call
                   CorP(j,i) = max([S(j,i) - X,0]); % call
               else
                   CorP(j,i) = max([X - S(j,i),0]); %put
                   
               end 
           else
               if call
                   CorP(j,i) = exp(-r*(i-1)*dT)*(p(i)* CorP(2*j-1, i+1) + (1-p(i))* CorP(2*j,i+1) ); % call
               else
                  CorP(j,i) = exp(-r*(i-1)*dT)*(p(i)* CorP(2*j-1, i+1) + (1-p(i))* CorP(2*j,i+1) ); %put
               end
           end
       end
    end  
end

CorP = CorP(1,1);
end
