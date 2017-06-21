function group_demo()
% GROUP_DEMO illustrates the use of the group spectral mapping
% algorithm through the implementation of the functions 
% group_train and group_predict.
%  
% NOTE: this functions requires the MANOPT optimization toolbox (http://manopt.org)
% to be installed in addedd to the MATLAB path
%
% See also GROUP_TRAIN, GROUP_PREDICT.
%
% Author: Cassiano Becker, June 2017
%
% ---- BEGIN CODE ----

% add toolbox folders to the path
add_folders();

% load structural and functional matrices
load data_matrices.mat;

% select the range of subjects
idx = 1:30;
nsubs = length(idx);

Ss = Ss(idx); %#ok<*NODEF,*USENS>
Fs = Fs(idx);

% performs the mapping considering powers k ranging from kmin to kmax
kmin = 0;
kmax = 7;
ks   = kmin:kmax;
nks  = length(ks);

h = [];

% loop over max walk length parameter
for i=1:nks
    
    k = ks(i);
    
    fprintf('\n\n#### Training Group Spectral Mapping, iteration %d of %d (k=%d) ##### \n\n',i,nks,k);
    
    % find the mapping parameters
    [c{i},Q{i}] = group_train(Fs,Ss,k);
    
    for j=1:nsubs
        
        S = Ss{j};
        F = Fs{j};
        
        % performs approximation
        F_hat  = group_predict(S,c{i},Q{i});
        
        % evaluate correlation
        rhos(j,i) = matcorr(F,F_hat); %#ok<*AGROW>
        
    end

    % finds the subject with median correlation
    rhosk = rhos(:,i);
    [~,idx] = sort(rhosk,'ascend');
    midx = idx(ceil(length(idx)/2));
    
    % matrices of the subject with median correlation
    F_m = Fs{midx};
    S_m = Ss{midx};
    F_hat_m = group_predict(S_m, c{i}, Q{i});
    
    % plots approximation qualtiy
    h = plot_group(S_m,F_m,F_hat_m,rhos,ks,k,midx,h);
    
end

end

% private function to add toolbox folders to the matlab path
function add_folders()

parts = strsplit(mfilename('fullpath'),filesep);
addpath(genpath([filesep fullfile(parts{1:end-2})]));

end