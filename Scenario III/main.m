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
[PERSON,indexInfected,indexIsolated] = InitPeople_SCIII(N,T,M,delta1,delta2);

[PERSON,histInfected,histHealed,histDied,histVaccinated,histNew,histNewVac,histVacDead] = ScenarioIII(PERSON,N,T,M,qS,p,rS,tS);
plot(histInfected,'.-b')
hold on
plot(histHealed,'Color','#0bbf44','Marker','.')
plot(histDied,'.-r')
plot(histVaccinated,'Color','#a35fe3','Marker','.')
hold off
legend('Infected','Healed','Died','Vaccinated')
title('Number of People Through Iterations')

figure()
subplot(3,2,1);
bar(histNew(1,:),'FaceColor','b','EdgeColor','b');
title('Infected per Iteration😒')
subplot(3,2,2);
bar(histNew(2,:),'FaceColor','#0bbf44','EdgeColor','#0bbf44');
title('Healed per Iteration😍')
subplot(3,2,3);
bar(histNew(3,:),'FaceColor','r','EdgeColor','r');
title('Died per Iteration⚰')
subplot(3,2,4);
bar(histNewVac,'FaceColor','#a35fe3','EdgeColor','#a35fe3');
title('Vaccinated per Iteration🙌🎉')
subplot(3,2,5);
bar(histVacDead);
title('Died but Vaccinated per Iteration😥')