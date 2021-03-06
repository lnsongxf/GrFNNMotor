clear all
close all
clc

% Include the GrFNN toolbox
addpath(genpath('~/Documents/GrFNNToolbox/'))

%% Network parameters
% alpha = 1; beta1 = -1; beta2 = -1000; neps = 1; % Limit Cycle
alpha = 1; beta1 = -1; beta2 = -0.1; delta1 = 0; delta2 = 0; neps = 1; % Limit Cycle

%% Parameter sets for Hebbian plasiticity
w = .05;
lambda =  -.1; mu1 =  0; mu2 =  0; ceps =  4; kappa = 1; % Linear learning rule
% lambda =   0; mu1 = -1; mu2 = -50; ceps =  4; kappa = 1; % Critical learning rule
% lambda =   0; mu1 = -1; mu2 = -50; ceps = 16; kappa = 1; % Critical, stronger nonlinearity
% lambda = .001; mu1 = -1; mu2 = -50; ceps = 16; kappa = 1; % Supercritical learning rule

%% Make the model
s = stimulusMake(1, 'fcn', [0 1], 4000, {'exp'}, 1, 0);

s.x = zeros(size(s.x));
for i=1:500:length(s.x)
    s.x(i:(i+100)) = 10;
end
% plot(s.x)
% pause

n = networkMake(1, 'hopf', alpha, beta1,  beta2, 0, 0, neps, ...
    'lin', 15, 19, 20, 'save', 1, ...
    'display', 10);

n = connectAdd(n, n, [], 'weight', w, 'type', 'all2freq', ...
    'learn', lambda, mu1, mu2, ceps, kappa, ...
    'display', 10,'phasedisp', 'save', 500);

n = connectAdd(s, n, 1); % default connection type for stimulus source is '1freq'

M = modelMake(@zdot, @cdot, s, n);

%% Run the network
tic
M = odeRK4fs(M);
toc



%
% %% Choose a parameter set
%
% % alpha =-1; beta1 =  0; beta2 =  0; delta1 = 0; delta2 = 0; neps = 1; % Linear
% % alpha = 0; beta1 = -1; beta2 = -1; delta1 = 0; delta2 = 0; neps = 1; % Critical
% % alpha = 0; beta1 = -1; beta2 = -1; delta1 = 1; delta2 = 0; neps = 1; % Critical with detuning
% alpha = 1; beta1 = -1; beta2 = -1; delta1 = 0; delta2 = 0; neps = 1; % Limit Cycle
% % alpha =-1; beta1 =  3; beta2 = -1; delta1 = 0; delta2 = 0; neps = 1; % Double limit cycle
%
% %% Make the model
% s = stimulusMake(1, 'fcn', [0 2.6], 4000, {'exp'}, [1], .25, 0, ...
%     'ramp', 0.02, 1, 'display', 10);
%
% s.x = zeros(size(s.x));
% for i=1:500:length(s.x)
% s.x(i:(i+100)) = 1;
% end
% % plot(s.x)
% % pause
%
% n = networkMake(1, 'hopf', alpha, beta1,  beta2, delta1, delta2, neps, ...
%     'lin', 15, 30, 100, 'save', 1, 'display', 10);
%
% n = connectAdd(s, n, -1); % default connection type for stimulus source is '1freq'
%
% M = modelMake(@zdot, @cdot, s, n);
%
% %% Run the network
% tic
% M = odeRK4fs(M);
% toc
%
% %% Display the output
% figure(11); clf; a1 = gca;
% figure(12); clf;
% a2 = subplot('Position', [0.08  0.72  0.78 0.22]);
% a3 = subplot('Position', [0.08  0.10  0.88 0.50]);
%
% outputDisplay(M, 'net', 1, a1, 'ampx', a2, 'fft', a3, 'oscfft')

figure;
plot(10*abs(mean(M.n{1,1}.Z,1)))
hold on
grid on
plot(s.x)