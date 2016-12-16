%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
% 
% Autonomous Oscillator Parameter Analysis: 
%         Plots the amplitude vector feild for ranging 
%         oscillator parameters
% 
% Author: Wisam Reid
%  Email: wisam@ccrma.stanford.edu
%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% 
%% CLEAN AND CLEAR

close all 
clear
clc

%% Plots critical hopf sweep alpha

plot_number = 1;

% oscillator params
alpha = 0;
beta1 = 0;
beta2 = 0;
epsilon = 0; 
F = 0;
f_osc = 1;
f_input = 0;

sweep = 1:10;
numSteps = length(sweep);

C = distinguishable_colors(numSteps);

i = 1;
for beta1 = sweep
    fig1 = plotAmplitudeVectorFeild(alpha, -1*beta1, beta2, epsilon,...
                                    F, f_osc, f_input, plot_number, C(i,:));
    i = i + 1 ;                          
end
plot([0 1],[0 0],'k-','linewidth',2)
hold on
plotFPs(alpha, -1*beta1, beta2, epsilon,...
        F, f_osc, f_input, plot_number);
axis([0 1 -0.01 0.002])
title('Autonomous Critical Oscillator: $$\beta_1$$ sweep: $$\alpha = 0$$, $$\beta_2 = 0$$, $$\epsilon = 0$$',...
      'Interpreter', 'latex')
legend({'$$\beta_1 = -1$$','$$\beta_1 = -2$$','$$\beta_1 = -3$$', ... 
        '$$\beta_1 = -4$$','$$\beta_1 = -5$$','$$\beta_1 = -6$$', ...
        '$$\beta_1 = -7$$','$$\beta_1 = -8$$','$$\beta_1 = -9$$', '$$\beta_1 = -10$$'},...
        'Location','southwest', 'Interpreter', 'latex');
grid on    
hold off

%% Plots supercritical hopf sweep alpha hold beta1

plot_number = 2;

% oscillator params
alpha = 1;
beta1 = -10;
beta2 = 0;
epsilon = 0; 
F = 0;
f_osc = 1;
f_input = 0;

sweep = 1:10;
numSteps = length(sweep);

C = distinguishable_colors(numSteps);

i = 1;
for alpha = sweep
    
    fig2 = plotAmplitudeVectorFeild(alpha, beta1, beta2, epsilon,...
                                    F, f_osc, f_input, plot_number, C(i,:));
    i = i + 1;
end
plot([0 1],[0 0],'k-','linewidth',2)
hold on
for alpha = sweep
    plotFPs(alpha, beta1, beta2, epsilon,...
            F, f_osc, f_input, plot_number);
end
axis([0 1 -0.0015 0.004])
title('Autonomous Supercritical Oscillator: $$\alpha$$ sweep: $$\beta_1 = -10$$, $$\beta_2 = 0$$, $$\epsilon = 0$$',...
      'Interpreter', 'latex')
legend({'$$\alpha = 1$$','$$\alpha = 2$$','$$\alpha = 3$$', ... 
        '$$\alpha = 4$$','$$\alpha = 5$$','$$\alpha = 6$$', ...
        '$$\alpha = 7$$','$$\alpha = 8$$','$$\alpha = 9$$', '$$\alpha = 10$$'},...
        'Location','northwest', 'Interpreter', 'latex');
grid on    
hold off

%% Plots supercritical hopf sweep beta1 hold alpha

plot_number = 3;

% oscillator params
alpha = 1;
beta1 = 0;
beta2 = 0;
epsilon = 0; 
F = 0;
f_osc = 1;
f_input = 0;

sweep = 1:10;
numSteps = length(sweep);

C = distinguishable_colors(numSteps);

i = 1;
for beta1 = sweep
    fig3 = plotAmplitudeVectorFeild(alpha, -1*beta1, beta2, epsilon,...
                                    F, f_osc, f_input, plot_number, C(i,:));
    i = i + 1;
end
plot([0 3.5],[0 0],'k-','linewidth',2)
hold on
for beta1 = 1:10
    plotFPs(alpha,-1*beta1, beta2, epsilon,...
            F, f_osc, f_input, plot_number);
end
% axis([0 3.5 -0.004 0.014])
axis([0 1 -0.0001 0.0005])
title('Autonomous Supercritical Oscillator: $$\beta_1$$ sweep: $$\alpha = 10$$, $$\beta_2 = 0$$, $$\epsilon = 0$$',...
      'Interpreter', 'latex')
legend({'$$\beta_1 = -1$$','$$\beta_1 = -2$$','$$\beta_1 = -3$$', ... 
        '$$\beta_1 = -4$$','$$\beta_1 = -5$$','$$\beta_1 = -6$$', ...
        '$$\beta_1 = -7$$','$$\beta_1 = -8$$','$$\beta_1 = -9$$', '$$\beta_1 = -10$$'},...
        'Location','northeast', 'Interpreter', 'latex');

grid on    
hold off

%% Plots supercritical hopf sweep beta1 and alpha

% plot_number = 4;
% 
% % oscillator params
% alpha = 10;
% beta1 = 0;
% beta2 = 0;
% epsilon = 0; 
% F = 0;
% f_osc = 1;
% f_input = 0;
% 
% sweep = 1:10;
% numSteps = length(sweep);
% 
% C = distinguishable_colors(numSteps);
% 
% i = 1;
% for beta1 = sweep
%     alpha = 11 - beta1;
%     fig4 = plotAmplitudeVectorFeild(alpha, -1*beta1, beta2, epsilon,...
%                                     F, f_osc, f_input, plot_number, C(i,:));
%     i = i + 1;
% end
% plot([0 3.5],[0 0],'k-','linewidth',2)
% hold on
% for beta1 = sweep
%     alpha = 11 - beta1;
%     plotFPs(alpha,-1*beta1, beta2, epsilon,...
%             F, f_osc, f_input, plot_number);
% end
% axis([0 3.5 -0.0015 0.014])
% title('Autonomous Supercritical Oscillator: $$\alpha$$ and $$\beta_1$$ sweep: $$\beta_2 = 0$$, $$\epsilon = 0$$',...
%       'Interpreter', 'latex')
% legend({'$$\alpha = 1, \beta_1 = 10$$','$$\alpha = 2, \beta_1 = 9$$',...
%         '$$\alpha = 3, \beta_1 = 8$$', '$$\alpha = 4, \beta_1 = 7$$',...
%         '$$\alpha = 5, \beta_1 = 6$$','$$\alpha = 6, \beta_1 = 5$$', ...
%         '$$\alpha = 7, \beta_1 = 4$$','$$\alpha = 8, \beta_1 = 3$$', ...
%         '$$\alpha = 9, \beta_1 = 2$$', '$$\alpha = 10, \beta_1 = 1$$'},...
%         'Location','northeast', 'Interpreter', 'latex');
% grid on    
% hold off

%% Plots supercritical DLC sweep alpha

plot_number = 5;

% oscillator params
alpha = 0;
beta1 = 10;
beta2 = -1;
epsilon = 1; 
F = 0;
f_osc = 1;
f_input = 0;


sweep = 0.2:0.2:2;
numSteps = length(sweep);

C = distinguishable_colors(numSteps);

i = 1;
for alpha = sweep
    
    fig5 = plotAmplitudeVectorFeild(-1*alpha, beta1, beta2, epsilon,...
                                    F, f_osc, f_input, plot_number, C(i,:));
    i = i + 1;
end
plot([0 1],[0 0],'k-','linewidth',2)
hold on
for alpha = sweep
    
    plotFPs(-1*alpha, beta1, beta2, epsilon,...
            F, f_osc, f_input, plot_number);
end
axis([0 1 -0.005 0.005])
title('Autonomous Supercritical DLC Oscillator: $$\alpha$$ sweep: $$\beta_1 = 10$$, $$\beta_2 = -1$$, $$\epsilon = 1$$',...
      'Interpreter', 'latex')
legend({'$$\alpha = -0.2$$','$$\alpha = -0.4$$','$$\alpha = -0.6$$', '$$\alpha = -0.8$$',...
        '$$\alpha = -1$$','$$\alpha = -1.2$$','$$\alpha = -1.4$$','$$\alpha = -1.6$$', ...
        '$$\alpha = -1.8$$', '$$\alpha = -2$$'},...
        'Location','southwest', 'Interpreter', 'latex');
grid on    
hold off

%% Plots supercritical DLC sweep beta1 

plot_number = 6;

% oscillator params
alpha = -2;
beta1 = 10;
beta2 = -1;
epsilon = 1; 
F = 0;
f_osc = 1;
f_input = 0;


for beta1 = 9.2:0.2:11
    
    fig5 = plotAmplitudeVectorFeild(alpha, beta1, beta2, epsilon,...
                                    F, f_osc, f_input, plot_number);
end
plot([0 1],[0 0],'k-','linewidth',2)
hold on
for beta1 = 9.2:0.2:11
    
    plotFPs(alpha, beta1, beta2, epsilon,...
            F, f_osc, f_input, plot_number);
end
axis([0 1 -0.005 0.005])
title('Autonomous Supercritical DLC Oscillator: $$\beta_1$$ sweep: $$\alpha = -2$$, $$\beta_2 = -1$$, $$\epsilon = 1$$',...
      'Interpreter', 'latex')
legend({'$$\beta_1 = 9.2$$','$$\beta_1 = 9.4$$','$$\beta_1 = 9.6$$', '$$\beta_1 = 9.8$$',...
        '$$\beta_1 = 10$$','$$\beta_1 = 10.2$$','$$\beta_1 = 10.4$$','$$\beta_1 = 10.6$$', ...
        '$$\beta_1 = 10.8$$', '$$\beta_1 = 11$$'},...
        'Location','southwest', 'Interpreter', 'latex');
grid on    
hold off

%% Plots supercritical DLC sweep beta2 

plot_number = 7;

% oscillator params
alpha = -2;
beta1 = 10;
beta2 = -1;
epsilon = 1; 
F = 0;
f_osc = 1;
f_input = 0;


for beta2 = 0.5:0.1:1.4
    
    fig5 = plotAmplitudeVectorFeild(alpha, beta1, -1*beta2, epsilon,...
                                    F, f_osc, f_input, plot_number);
end
plot([0 1],[0 0],'k-','linewidth',2)
hold on
for beta2 = 0.5:0.1:1.4
    
    plotFPs(alpha, beta1, -1*beta2, epsilon,...
            F, f_osc, f_input, plot_number);
end
axis([0 1 -0.005 0.005])
title('Autonomous Supercritical DLC Oscillator: $$\beta_2$$ sweep: $$\alpha = -2$$, $$\beta_1 = 10$$, $$\epsilon = 1$$',...
      'Interpreter', 'latex')
legend({'$$\beta_2 = 0.5$$','$$\beta_2 = 0.6$$','$$\beta_2 = 0.7$$', '$$\beta_2 = 0.8$$',...
        '$$\beta_2 = 0.9$$','$$\beta_2 = 1$$','$$\beta_2 = 1.1$$','$$\beta_2 = 1.2$$', ...
        '$$\beta_2 = 1.3$$','$$\beta_2 = 1.4$$'},...
        'Location','southwest', 'Interpreter', 'latex');
grid on    
hold off