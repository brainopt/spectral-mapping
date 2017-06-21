function s = sumnorms(M,type,p)
% SUMNORMS is a helper function to find the sum of the power of the norms of the element of the cell
% array M
%
% Inputs:
%   M    - cell array of  matrix
%   type - type of norm (e.g. 1,2,'frob')
%   p    - power  
%
% Outputs:
%   r - sum of norms
%
% Author: Cassiano Becker, June 2017
%
% ---- BEGIN CODE ----

s = 0;
for i=1:length(M)
   s = s + (norm(M{i},type))^(p);
end

end