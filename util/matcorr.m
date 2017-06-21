function d = matcorr(X1,X2)
% MATCORR finds the correlation between all the entries of the matrices X1
% and X2
%
% Inputs:
%   X1 matrix
%   X2 matrix 
%
% Outputs:
%   d - correlation coefficient
%
% Author: Cassiano Becker, June 2017
%
% ---- BEGIN CODE ----

v1 = vec(X1);
v2 = vec(X2);
m1 = mean(v1);
m2 = mean(v2);

d = (v1 - m1)'*(v2 - m2)/(norm(v1-m1)*(norm(v2-m2)));


end






