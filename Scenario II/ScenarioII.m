function [newPERSON,histInfected,histHealed,histDied,histVaccinated,histNew,histNewVac,histVacDead] = ScenarioII(PERSON,N,T,M,p,rS,tS)  
    % CONSTANTS
    dir = [0,1;1,1;1,0;1,-1;0,-1;-1,-1;-1,0;-1,1];

    histInfected = zeros([1,120]);
    histVaccinated = zeros([1,120]);
    histHealed = zeros([1,120]);
    histDied = zeros([1,120]);
    histNew = zeros([3,120]);
    histNewVac = zeros([1,120]);
    histVacDead = zeros([1,120]);

    t = 1;
    vac = 0;
    while t <= 120
        histInfected(t) = sum(PERSON(:,3) > 0);
        histHealed(t) = sum(PERSON(:,5) > 0);
        histDied(t) = sum(PERSON(:,4) > 0);
        if t > 1
            histVaccinated(t) = histVaccinated(t-1) + vac;
            histNewVac(t) = vac;
        end
        vac = 0;

        % MOVEMENT PHASE
        for i = 1:N
            if ~PERSON(i,4)
                minBound = [1,1];
                maxBound = [T,T];
        
                index = randi(8);
                while any(PERSON(i,[1,2])+dir(index,:)>maxBound) || any(PERSON(i,[1,2])+dir(index,:)<minBound)
                    index=randi(8);
                end

                rightMax=   maxBound(1) - PERSON(i,1);
                upMax   =   maxBound(2) - PERSON(i,2);
                leftMax = - minBound(1) + PERSON(i,1);
                downMax = - minBound(2) + PERSON(i,2);

                angles = [];
                
                maxMag  = 3;

                if dir(index,1) == 1
                    angles = [angles rightMax];
                elseif dir(index,1) == -1
                    angles = [angles, leftMax];
                end

                if dir(index,2) == 1
                    angles = [angles upMax];
                elseif dir(index,2) == -1
                    angles = [angles, downMax];
                end
                
                maxMag = min(angles);
                
                movementVector = dir(index,:) * min(maxMag,randi([0 3]));
                PERSON(i,[1,2]) = PERSON(i,[1,2]) + movementVector;
            end
        end
        % ITERATION PHASE
    
        for i = 1:N
            if ~PERSON(i,4)
                if PERSON(i,3) > 0
                    PERSON(i,3) = PERSON(i,3) - 1;
        
                    if(PERSON(i,3) == 0)
                        if(rand < 0.95)
                            PERSON(i,5) = 1;
                            histNew(2,t) = histNew(2,t) + 1; 
                        else
                            PERSON(i,4) = 1;
                            histNew(3,t) = histNew(3,t) + 1; 
                            if(PERSON(i,6) == 1)
                                histVacDead(t) = histVacDead(t) + 1;
                            end
                        end
                    end
                end
            end
        end

        % VACCINATION PHASE
        if t >= tS
            healthyPEOPLE = find(all(PERSON(:,[3,4,5,6]) == 0,2));
            n = length(healthyPEOPLE);
            if n > 0
                delta3 = 1 / (2 * (t - 19));
                numOfVaccinated = delta3 * n;
                
                if rand < numOfVaccinated - floor(numOfVaccinated)
                    numOfVaccinated = ceil(numOfVaccinated);
                else
                     numOfVaccinated = floor(numOfVaccinated);
                end
    
                indexVaccinated = zeros([1,numOfVaccinated]);
                for i = 1:numOfVaccinated
                    index = randi(n);
                    while any(indexVaccinated == index)
                        index = randi(n);
                    end
                
                    PERSON(healthyPEOPLE(index),6) = 1;
                    vac = vac + 1;
                    indexVaccinated(i) = index;
                end
            end
        end
    
        % INFECT PHASE
        for i = 1:N
            if ~PERSON(i,4)
                for j = i+1:N
                    if ~PERSON(j,4)
                        if((PERSON(i,3) > 0)  ~= (PERSON(j,3) > 0))
                            if(all(PERSON(i,[1,2]) == PERSON(j,[1,2])))
                                if(PERSON(i,3) > PERSON(j,3))
                                    index = j;
                                else
                                    index = i;
                                end
                                if ~PERSON(index,6)
                                    infectedProbability = (~PERSON(index,5)) && (rand < p);
                                else
                                    infectedProbability = (~PERSON(index,5)) && (rand < rS);
                                end
                                PERSON(index,3) = M*infectedProbability;
                                histNew(1,t) = histNew(1,t) + 1;
                            end
                        end
                    end
                end
            end
        end
    
        t = t + 1;
%         scatter(PERSON(:,1),PERSON(:,2))
%         pause(0.3);

    end
    newPERSON = PERSON;
end