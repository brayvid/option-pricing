% run first
clear
clc
addpath(genpath('functions'))

% Override default parameters
n = 3;
r = 0.03;

% Run after setting parameters
run loadParams

% Example script: asset price after random walk
m =zeros(1,n);
for i = 1:n
   dir = binornd(1,p(i));
   if dir == 0
       dir = -1;
   end
   m(i) = dir;
end
sm_prm{4} = m;

asset_m = assetAtM(sm_prm);

mstr = '';
for i = 1:length(m)
    mi = m(i);
    if mi == 1
       ud = 'U';
    else
        ud = 'D';
    end
    if i == 1
       mstr = ud ;
        
    else 
        
        mstr = mstr + ", " + ud ;
    end
end
    
fprintf(strcat('Asset at [',mstr,']:\n\n'))

disp(asset_m)
