function L = vandermonde(lambdas,k)
% VANDERMONDE builds a Vandermonde matrix containing the `powers' i=0 to k
% of the entries of the vector given by lambdas
%
% Inputs:
%   lambdas - vector of eigenvalues
%   k - the maximum power of the polynomial
%
% Outputs:
%   L - Vandermonde matric
%
% Author: Cassiano Becker, June 2017
%
% ---- BEGIN CODE ----

L = NaN*ones(length(lambdas),k+1);
for i=1:k+1
    L(:,i) = (lambdas).^(i-1);
end

end