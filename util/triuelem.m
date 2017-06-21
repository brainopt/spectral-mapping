function u = triuelem(M)
% TRIUELEM returns a vector with the off-diagonal upper-triangular elements
% of M
%
% Inputs:
%   M - input matrix
%
% Outputs:
%   u - vector with off-diagonal upper-triangular elements of M
%
% Author: Cassiano Becker, June 2017
%
% ---- BEGIN CODE ----

M = tril(NaN*ones(size(M))) + triu(M,1);
u = M(~isnan(M));

end