% run first
clear
clc
addpath(genpath('functions'))

% Override default parameters
r = 0.03;
sigma = 0.28;
% Run after setting parameters
run loadParams

% Plot C and P as functions of r, X, s0
for i = 1:3
    switch i
        case 1
            var = r;
            which = 2;
            titl1 = 'Risk-free rate effect on call value';
            titl2 = 'Risk-free rate effect on put value';
            xlabl = 'Risk-free rate';
        case 2
            var = X;
            which = 3;
            titl1 = 'Strike price effect on call value';
            titl2 = 'Strike price effect on put value ';
            xlabl = 'Strike price';
            
        case 3
            var = s0;
            which = 4;
            titl1 = 'Spot price effect on call value';
            titl2 = 'Spot price effect on put value';
            xlabl = 'Spot price';
    end
    
    interval = [0.5*var 1.5*var];
    samples = round((n+1)^2);
    
    spacing = (interval(2)-interval(1))/samples;

    paramvals = interval(1):spacing:interval(2);
    
    [VAR, C, P] = optionDependence(o_prm,which,paramvals);
    
    subplot(3,2,2*i-1)
    
    plot(VAR,C)
    grid on
    title(titl1)
    xlabel(xlabl)
    ylabel('Call Value')
    
    subplot(3,2,2*i)
    
    plot(VAR,P)
    grid on
    title(titl2)
    xlabel(xlabl)
    ylabel('Put Value')
end
