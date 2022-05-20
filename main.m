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
M = 30; %Infection duration
tS = 20; %Vac start iter
rS = 0.05; %Infec prop of vac healthy
tSec = 3; % Number of iter between two vac.
w = 0.8; %Second vac prop of health people
delta3 = function_delta3(20);

% CONSTANTS
dir = [0,1;1,1;1,0;1,-1;0,-1;-1,-1;-1,0;-1,1];

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
[PERSON,indexInfected,indexIsolated] = InitPeople(N,T,delta1,delta2);


t = 0;
while t < 120
    % MOVEMENT PHASE
    for i = 1:N
        index = randi(8);
        movementVector = dir(index,:) * randi([0 3]);
        PERSON(i,[1,2]) = PERSON(i,[1,2]) + movementVector;
        % TODO: If the movement is greater than the boundry of the grid
        % make sure that it is capped at max position


    end

    % INFECT PHASE
    for i = 1:N


    end

    t = t + 1;
end

