% Cox-Ross-Rubenstein parameters
function [p, u, d] = getPUD(pud_params)
[n, r, T, sigma] = pud_params{:};
u = exp(sigma*sqrt(T/n)).*ones(n,1);
d = (1./u).*ones(n,1);
p = ((exp(r*T/n)-d)./(u-d)).*ones(n,1);
end