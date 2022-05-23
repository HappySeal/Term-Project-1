% CAFER SELLI 2444974
% ZEYNEP BERIL SAHIN 2587848
clear
clc
close all

% EXPERIMENT PARAMETERS

T = 20; % Grid Size
N = 240; % Population Size
delta1 = 0.05; %Percentage of Infected people Init
p = 0.5; %Infection Probability
delta2 = 0.5; %Percentage of Infected && Isolated Init
qS = 0.5;
M = 30; %Infection duration
tS = 20; %Vac start iter
rS = 0.05; %Infec prop of vac healthy
tSec = 3; % Number of iter between two vac.
w = 0.8; %Second vac prop of health people

% ---
%# Scenerio I
% Data per Person
% [1,2] x,y
% [3]   isInfected 
% [4]   isIsolated
% [5,6] whereIsolatedX,whereIsolatedY
% [7]   isDead
% [8]   isImmune
% [9]   isVac

% Initilization
[PERSON,indexInfected,indexIsolated] = InitPeople_SCIV(N,T,M,delta1,delta2);

[PERSON,...
    histTotal,...
    histNew,...
    histVaccinated,...
    histNewVac,...
    histVacDead,...
] = ScenarioIV(PERSON,N,T,M,qS,p,rS,tS,w);


plot(histTotal(1,:))
hold on
plot(histTotal(2,:))
plot(histTotal(3,:))
plot(histVaccinated)
hold off


figure()
subplot(2,2,1);
plot(histTotal(1,:))
subplot(2,2,2);
plot(histTotal(2,:))
subplot(2,2,3);
plot(histTotal(3,:))
subplot(2,2,4);
plot(histVaccinated)
figure()

subplot(3,2,1);
plot(histNew(1,:));
subplot(3,2,2);
plot(histNew(2,:));
subplot(3,2,3);
plot(histNew(3,:));
subplot(3,2,4);
plot(histNewVac);
subplot(3,2,5);
plot(histVacDead);