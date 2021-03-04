function val = compute_resonances(z, abab, N, h, qchi, thr)
%   Returns 1 if z ia an approximate resonance and 0 otherwise.

    % Fundamental Solution:
    if z==0
        G = abs(abab)/2;
    else
        G = 1i*exp(1i*z*abs(abab))/z/2; 
    end
    % Approximation K_n of q(-\Delta-z^2)^{-1} \chi:
    K = h*qchi.*G;
    % Test whether resolvent norm of K_n at point -1 is less then thr:
    [R, flag] = chol((eye(N-1)+K)'*(eye(N-1)+K)-eye(N-1)*thr^2);
    val = flag;
end