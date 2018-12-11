% run first
clear
clc
addpath(genpath('functions'))

% Override default parameters
r = 0.03;
sigma = 0.28;

% Run after setting parameters
run loadParams

% Examples
asset_tr = assetTree(s_prm);
fprintf('Asset tree:\n\n')
disp(asset_tr)

opt_tod = optionToday(o_prm, call);
fprintf('Call today:\n\n')
disp(opt_tod)

put_tod = optionToday(o_prm, put);
fprintf('Put today:\n\n')
disp(put_tod)