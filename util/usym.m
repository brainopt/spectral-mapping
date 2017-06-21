function S = usym(M)
% USYM generates a symmetric matrix using the upper-triangular elements of
% M
%
% Inputs:
%   M - input matrix
%
% Outputs:
%   S - symmetric ouput matrix
%
% Author: Cassiano Becker, June 2017
%
% ---- BEGIN CODE ----

S = triu(M,1) + triu(M)';

end