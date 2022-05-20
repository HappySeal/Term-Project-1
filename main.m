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
[PERSON,indexInfected,indexIsolated] = InitPeople(N,T,M,delta1,delta2);


t = 0;
while t < 120
    % MOVEMENT PHASE
    for i = 1:N
        minBound = [1,1];
        maxBound = [T,T];
        if PERSON(i,4) > 0
            minBound = PERSON(i,[5,6]) - 1;
            minBound(1) = max(1,minBound(1));
            minBound(2) = max(1,minBound(2));
            
            maxBound = PERSON(i,[5,6]) + 1;
            maxBound(1) = min(T,maxBound(1));
            maxBound(2) = min(T,maxBound(2));
        end

        index = randi(8);
        while any(PERSON(i,[1,2])+dir(index,:)>maxBound) || any(PERSON(i,[1,2])+dir(index,:)<minBound)
            index=randi(8);
        end
        movementVector = dir(index,:) * randi([0 3]);
        while any(PERSON(i,[1,2])+movementVector>maxBound) || any(PERSON(i,[1,2])+movementVector<minBound)
            movementVector = dir(index,:) * randi([0 3]);
        end
        PERSON(i,[1,2]) = PERSON(i,[1,2]) + movementVector;

        % TODO: If the movement is greater than the boundry of the grid
        % make sure that it is capped at max position


    end
    % ITERATION PHASE
    for i = 1:N
        % TODO: make iterations go up/down through the iters.

    end



    % INFECT PHASE
    for i = 1:N
        for j = i+1:N
            if((PERSON(i,3) > 0)  ~= (PERSON(j,3) > 0))
                if(PERSON(i,3) > PERSON(j,3))
                    index = j;
                else
                    index = i;
                end
                infected = PERSON(index,:);
                infectedProbability = (~PERSON(index,8)) && (rand < p);
                isolatedProbability = infectedProbability && (rand < qS);
                PERSON(index,[3,4]) = [M*infectedProbability, M*isolatedProbability];
            end
        end
    end

    t = t + 1;
end

