function Q  =  manopt_group(Fs, phis_hat, par,Q0)
% MANOPT_GROUP  optimizes for a common set of functional eigenmodes using
% manifold optimization over the set of orthogonal rotation matrices 
%
% Inputs:
%   Fs       - cell array of functional matrices
%   phis_hat - cell array of ymmetric functional matrix
%   par      - structure of optimization parameters
%   Q0       - initial optimization point
%
% Outputs:
%   Q        - matrix of common eigenmodes
%
% See also GROUP_TRAIN, GROUP_PREDICT
%
% Author: Cassiano Becker, June 2017
%
% ---- BEGIN CODE ----

options.maxiter = par.maxiter;

n = length(Fs{1});
l = length(Fs);

manifold  = rotationsfactory(n, 1);
problem.M = manifold;

problem.cost = @objective;
egrad        = @gradient;

problem.grad = @(X) manifold.egrad2rgrad(X, egrad(X));
ehess        = @(X,S) manifold.zerovec(X);
problem.hess = @(X,S) manifold.ehess2rhess(X, egrad(X), ehess(X,S), S);

nM = sumnorms(phis_hat,'fro',2);
nF = sumnorms(Fs,'fro',2);

    % Euclidean objective function
    function val = objective(X)
        val = 0;
        for j=1:l
            L = zeros(length(Fs{j}),1);
            L(1:length(phis_hat{j})) = phis_hat{j};
            val = val -2*trace(Fs{j}'*X*diag(L)*X');
        end
        val = (nM + nF + val)/(nF);
    end

    % Euclidean Gradient
    function val = gradient(X)
        val = 0;
        for j=1:l
            L = zeros(length(Fs{j}),1);
            L(1:length(phis_hat{j})) = phis_hat{j};
            val = val + (-4*diag(L)*X'*Fs{j})';
        end
        val = val/(nF);
    end

% invoke second order solver
[Q, cost, info ] = trustregions(problem, Q0, options); %#ok<*ASGLU>

end