function [a,R] = individual_train(S,F,k)
% INDIVIDUAL_TRAIN  trains a mapping for single subjects based on a vector of
% coefficents and a rotation matrix.
%
% Inputs:
%   S - symmetric structural matrix
%   F - symmetric functional matrix
%   k - the maximum power of the polynomial
%
% Outputs:
%   a - vector of coefficients
%   R - rotation matrix
%
% See also INDIVIDUAL_PREDICT.
%
% Author: Cassiano Becker, June 2017
%
% ---- BEGIN CODE ----

% perform ordered eigendecomposition
[V,lam] = oeig(S);
[U,phi] = oeig(F);

L = vandermonde(lam,k);

Ldag = pinv(L);

% vector of cofficients
a    = Ldag*(phi);

% rotation matrix
R    = U*V';

end