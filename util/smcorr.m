function r = smcorr( M1, M2)
% SMCORR finds the correlation between the off-diagonal upper-triangular entries of the matrices M1
% and M2
%
% Inputs:
%   M1 matrix
%   M2 matrix 
%
% Outputs:
%   r - correlation coefficient
%
% Author: Cassiano Becker, June 2017
%
% ---- BEGIN CODE ----


tol = 1e-10;

if sum(abs(vec(M1- M2)))<tol
    r = 1;
    return
end

% test if matrix
if numel(M1) > length(M1)
    vM1 = triuelem(M1);
    vM2 = triuelem(M2);
else
    vM1 = vec(M1);
    vM2 = vec(M2);
end

mvM1 = mean(vM1);
mvM2 = mean(vM2);

rn = (vM1 - mvM1)'*(vM2 - mvM2);
rd = norm(vM1 - mvM1)*norm(vM2 - mvM2);

if rd ~=0
    r = rn/rd;
else
    r = 0;   

end

end

