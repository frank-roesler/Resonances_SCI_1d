% ---------------------------------------------------------------------
% Computes the scattering resonances of a 1d Schrödinger operator given
% its potential as an input. The code is based on a method developed
% in https://arxiv.org/abs/2006.03368.
% ---------------------------------------------------------------------

clear;
%% Setup:
a         = 1;
N         = 51;
ab        = linspace(-a, a, N);
n         = (N-1)/(max(ab)-min(ab));
h         = 1/n;
thr       = 0.007;
midpoints = conv(ab, [0.5 0.5], 'valid');
% Potential
x = midpoints;
q = potential(x);
% Cutoff function:
chi = x<=a+h & x>=-a-h;
% Define lattice in C:
L = build_lattice(-21-8i, 21+2.5i, 10000);

%% Define matrix K_n:
abab = bsxfun(@minus,midpoints', midpoints);
qchi = q'*chi;
% Compute resonances in L:
tic
disp('Computing...')
Resonances = zeros(size(L));
parfor k=1:length(L(:))
    z = L(k);
    Resonances(k) = compute_resonances(z, abab, N, h, qchi, thr);
end
Resonances = logical(Resonances);
disp('Done!')
Time_Elapsed = toc

%% Plot results:
figure('Position',[100,100,1400,600])
subplot(2,1,1)
plot(midpoints,q)
title('Potential');
xlim([min(ab) max(ab)])
ylim([min(q)-1 max(q)+2])

subplot(2,1,2)
plot(L(Resonances),'.','MarkerEdgeColor',[0.4 0.4 1], 'MarkerSize',15);
xlim([min(real(L(:))) max(real(L(:)))]);
ylim([min(imag(L(:))) max(imag(L(:)))]);
title('Resonances:');

