% Default parameters - don't overwrite existing ones 
if ~exist('n','var')
    n = 3;
end
if ~exist('s0','var')
    s0 = 100;
end
if ~exist('X','var')
    X = 100;
end
if ~exist('r','var')
    r = 0.05;
end
if ~exist('T','var')
    T = 1;
end
if ~exist('sigma','var')
    sigma  = 0.3;
end
if ~exist('m','var')
   m = ones(1,n);  
end

% Calculated parameters
pud_prm = {n, r, T, sigma};
[p,u,d] = getPUD(pud_prm);

o_prm = {n,r,X,s0,T,p,u,d};
s_prm = {n,s0,u,d};

sm_prm = {s0, u, d, m};

% Flags
call = 1;
put = ~call;

first = 1;
all = ~first;

% Display parameters
parameters = array2table([n;T;s0;X;r;sigma],'RowNames',{'periods','time','spot','strike','rate','sigma'},'VariableNames',{'Parameters'})

