% m is the path vector
function sm = assetAtM(params)
[s0, u, d, m] = params{:};
n = length(m);
sm = s0;
for i = 1:n
    % Multiply s0 by the required u and d factors to get a particular S
    switch m(i)
        case 1
            sm = sm.*u(i);
        case -1
            sm = sm.*d(i);
    end
end
end
