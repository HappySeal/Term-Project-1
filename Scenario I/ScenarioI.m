function [newPERSON,histInfected,histHealed,histDied] = ScenarioI(PERSON,N,T,M,qS,p)  
    % CONSTANTS
    dir = [0,1;1,1;1,0;1,-1;0,-1;-1,-1;-1,0;-1,1];

    histInfected = zeros([1,120]);
    histHealed = zeros([1,120]);
    histDied = zeros([1,120]);

    t = 1;
    while t <= 120
        histInfected(t) = sum(PERSON(:,3) > 0);
        histHealed(t) = sum(PERSON(:,8) > 0);
        histDied(t) = sum(PERSON(:,7) > 0);

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
                movementVector = dir(index,:) * randi([0 3]);
                while any(PERSON(i,[1,2])+movementVector>maxBound) || any(PERSON(i,[1,2])+movementVector<minBound)
                    movementVector = dir(index,:) * randi([0 3]);
                end
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
                                infectedProbability = (~PERSON(index,8)) && (rand < p);
                                isolatedProbability = infectedProbability && (rand < qS);
                                PERSON(index,[3,4]) = [M*infectedProbability, M*isolatedProbability];
                                PERSON(index,[5,6]) = PERSON(index,[1,2]) * isolatedProbability;
                            end
                        end
                    end
                end
            end
        end
    
        t = t + 1;
    end
    newPERSON = PERSON;
end