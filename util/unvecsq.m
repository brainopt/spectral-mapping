function M = unvecsq(V)
% UNVECSQ is the inverse function of the vectorization operator for square
% matrices
%
% Inputs:
%   V - input vector
%
% Outputs:
%   M - square output matrix
%
% Author: Cassiano Becker, June 2017
%
% ---- BEGIN CODE ----

n = sqrt(length(V));
M = reshape(V,n,n);

end