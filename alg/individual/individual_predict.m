function Fhat = individual_predict(S,a,R)
% INDIVIDUAL_PREDICT  maps a structural matrix to a functional matrix.
%
% Inputs:
%   S - symmetric structural matrix
%   F - symmetric functional matrix
%   a - vector of coefficients
%   R - rotation matrix
%
% Outputs:
%   Fhat - the mapped functional matrix approximation
%
% See also INDIVIDUAL_TRAIN.
%
% Author: Cassiano Becker, June 2017
%
% ---- BEGIN CODE ----

% perform ordered eigendecomposition
[V,lam] = oeig(S);

k = length(a)-1;

L = vandermonde(lam,k);

% apply mapping
Fhat = R*V*diag(L*a)*(V')*(R');

end