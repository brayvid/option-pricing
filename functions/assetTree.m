function tree = assetTree(in)
[n,s0,u,d] = in{:};

% Calculate Asset Prices
for i= 0:n  
    % count nodes for this timestep, start at terminal nodes
    numstep = ((1/2)^i)*(2^n);
    
    % Generate the list of routes for this timestep
    routes = permn([1 -1],log2(numstep));

    % Calculate each S for this timestep
    for j = 1:numstep
        m = routes(j,:);
        asset_params = {s0, u, d, m};
        S(j,i+1) = assetAtM(asset_params);
    end
end
% Arrange in chronological order
tree = flip(S,2);

end
