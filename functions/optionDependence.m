% Plot specifications 
function [Param, C, P] = optionDependence(params,paramnum,paramvalues)
len = length(paramvalues);
Param = zeros(len,1);
C = zeros(len,1);
P = zeros(len,1);

count = 1;

for i = 1:len
    params{paramnum} = paramvalues(i); % vary parameter
    % record output
    Param(count) = paramvalues(i);
    C(count) = optionToday(params,1);
    P(count) = optionToday(params,0);
    count = count + 1;
end
end
