% CAFER SELLI 2444974
% ZEYNEP BERIL SAHIN 2587848
clear
clc

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
delta3 = function_delta3(20);

% ---
%# Scenerio I
% Data per Person
% [1,2] x,y
% [3]   isInfected 
% [4]   isIsolated
% [5,6] whereIsolatedX,whereIsolatedY
% [7]   isDead
% [8]   isImmune


% Initilization
[PERSON,indexInfected,indexIsolated] = InitPeople(N,T,M,delta1,delta2);

[PERSON,histInfected,histHealed,histDied] = ScenarioI(PERSON,N,T,M,qS,p);