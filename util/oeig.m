function [V,D] = oeig(M)
% OEIG  returns the eigen-decomposition of the symmetric matrix M
%
% Inputs:
%   M - input matrix
%
% Outputs:
%   V - matrix containing a set of eigenvectors of M
%   D - vector containing the ordered eigenvalues of M
%
% See also SINGLE_PREDICT.
%
% Author: Cassiano Becker, June 2017
%
% ---- BEGIN CODE ----

tol = 1e-10;
if norm(M - M')> tol
   error('Input matrix should be symmetric.') 
end

[V,D] = eig(M);
[~,I] = sort((diag(D)),1,'descend');
V = V(:, I);
diagD = diag(D);
D = diagD(I);

end