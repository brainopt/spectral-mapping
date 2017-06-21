function Fhat = group_predict(S, c, Q)
% GROUP_PREDICT  maps a structural matrix to a functional matrix based on
% common vector of coefficients and common functional eigenmodes.
% Inputs:
%   S - symmetric structural matrix
%   c - vector of coefficients
%   Q - matrix of common functional eigenmodes
%
% Outputs:
%   Fhat - the mapped functional matrix approximation
%
% See also GROUP_TRAIN.
%
% Author: Cassiano Becker, June 2017
%
% ---- BEGIN CODE ----

% perform ordered eigendecomposition
[~,lam] = oeig(S);

k = length(c)-1;

L = vandermonde(lam,k);

% apply mapping
Fhat = Q*diag(L*c)*(Q');

end