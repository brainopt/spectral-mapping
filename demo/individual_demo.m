function individual_demo()
% INDIVIDUAL DEMO illustrates the use of the invidual spectral mapping
% algorithm through the implementation of the functions 
% individual_train and individual_predict.
%
% See also INDIVIDUAL_TRAIN, INDIVIDUAL_PREDICT.
%
% Author: Cassiano Becker, June 2017
%
% ---- BEGIN CODE ----

%#ok<*USENS,*AGROW>

% add toolbox folders to the path
add_folders();

% load structural and functional matrices
load data_matrices.mat;

% select a specific subject 
sidx = 1;

S = Ss{sidx}; 
F = Fs{sidx};

% number of regions in the matrices
n = size(S,2);

% performs the mapping considering powers k ranging from kmin to kmax

kmin = 0;
kmax = 7;
ks   = kmin:kmax;
nks  = length(ks);
h = '';

% loop over max walk length parameter
for i=1:nks
    
    k = ks(i);
    
    % find the mapping parameters
    [a,R] = individual_train(S,F,k);
    
    % performs approximation
    F_hat = individual_predict(S,a,R);
    
    % evaluate correlation     
    rhos(i) = matcorr(F,F_hat);
    
    % plots approximation quality
    h = plot_individual(S,F,F_hat,rhos,k,ks,sidx,h);
    
end

end


% private function to add toolbox folders to the matlab path
function add_folders()

parts = strsplit(mfilename('fullpath'),filesep);
addpath(genpath([filesep fullfile(parts{1:end-2})]));

end