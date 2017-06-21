function [c,Q] = group_train(Fs,Ss,k)
% GROUP_TRAIN  trains a mapping for groups of individuals based on a matrix of common
% functional eignemodes and vector os common coefficients.
%
% Inputs:
%   Ss - cell array of symmetric structural matrices
%   Fs - cell array of symmetric functional matrices
%   k - the maximum power of the polynomial
%
% Outputs:
%   c - common vector of coefficients
%   Q - common matrix of functoinal eigenmodes
%
% See also GROUP_PREDICT.
%
% Author: Cassiano Becker, June 2017
%
% ---- BEGIN CODE ----

%#ok<*ASGLU,*AGROW>

% perform ordered eigendecomposition
for i=1:length(Fs)
    [Vs{i},lams{i}] = oeig(Ss{i}); 
    [Us{i},phis{i}] = oeig(Fs{i});
end

% minimum square estimation of coefficients
l = length(lams);

Ls = cell(l,1);
for i=1:l
    Ls{i}    = vandermonde(lams{i},k);
end

Lv   = cat(1,Ls{:});
phiv = cat(1,phis{:});

Ldag = pinv(Lv);
% vector of coefficients
c    = Ldag*(phiv);

% approximated functional eigenvalues
phis_hat = cell(l,1);
for i=1:l
    phis_hat{i}    = Ls{i}*c;
end

% check is manopt is in the path
if exist('rotationsfactory','file')<1
   error('\nToolbox %s not installed.\nPlease download it from %s and add it to the path.\n','Manopt','http://manopt.org');
end

% maximum number of iterations in manopt
par.maxiter = 20;

% initial matrix point
Q0 = oeig(mean(cat(3,Fs{:}),3));

% performs manifold optimization to find common matrix
Q  = manopt_group(Fs, phis_hat, par,Q0);

end