function [newPERSON,histInfected,histHealed,histDied,histVaccinated] = ScenarioIV(PERSON,N,T,M,qS,p,rS,tS)  
    % CONSTANTS
    dir = [0,1;1,1;1,0;1,-1;0,-1;-1,-1;-1,0;-1,1];

    histInfected = zeros([1,120]);
    histHealed = zeros([1,120]);
    histDied = zeros([1,120]);
    histVaccinated = zeros([1,120]);

    t = 1;
    while t <= 120
        histInfected(t) = sum(PERSON(:,3) > 0);
        histHealed(t) = sum(PERSON(:,8) > 0);
        histDied(t) = sum(PERSON(:,7) > 0);
        histVaccinated(t) = sum(PERSON(:,9) > 0);

        % MOVEMENT PHASE
        for i = 1:N
            if ~PERSON(i,7)
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
            if ~PERSON(i,7)
                if PERSON(i,3) > 0
                    PERSON(i,3) = PERSON(i,3) - 1;
                    if PERSON(i,4) > 0
                        PERSON(i,4) = PERSON(i,4) - 1;
                    end
        
                    if(PERSON(i,3) == 0)
                        if(rand < 0.95)
                            PERSON(i,8) = 1;
                        else
                            PERSON(i,7) = 1;
                        end
                    end
                end
            end
        end
    
        % INFECT PHASE
        for i = 1:N
            if ~PERSON(i,7)
                for j = i+1:N
                    if ~PERSON(j,7)
                        if((PERSON(i,3) > 0)  ~= (PERSON(j,3) > 0))
                            if(all(PERSON(i,[1,2]) == PERSON(j,[1,2])))
                                if(PERSON(i,3) > PERSON(j,3))
                                    index = j;
                                else
                                    index = i;
                                end
                                if ~PERSON(index,9)
                                    infectedProbability = (~PERSON(index,8)) && (rand < p);
                                else
                                    infectedProbability = (~PERSON(index,8)) && (rand < rS);
                                end
                                isolatedProbability = infectedProbability && (rand < qS);
                                PERSON(index,[3,4]) = [M*infectedProbability, M*isolatedProbability];
                                PERSON(index,[5,6]) = PERSON(index,[1,2]) * isolatedProbability;
                            end
                        end
                    end
                end
            end
        end
    

        % SECOND PHASE VACCINATION
        for i = 1:N
            if ~PERSON(i,7) && ~PERSON(i,8)
                if PERSON(i,9) > 0
                    PERSON(i,9) = PERSON(i,9) - 1;
                    if PERSON(i,9) == 0
                        if rand < w
                            PEA
                        end
                    end
                end
            end
        end

        % VACCINATION PHASE
        if t >= tS
            healthyPEOPLE = find(all(PERSON(:,[3,7,8,9]) == 0,2));
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
                
                    PERSON(healthyPEOPLE(index),9) = 3;
                    indexVaccinated(i) = index;
                end
            end
        end
    

        t = t + 1;
    end
    newPERSON = PERSON;
end