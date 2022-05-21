function [PERSON,indexInfected,indexIsolated] = InitPeople_SCIII(N,T,M,delta1,delta2)
    PERSON = zeros([N,9]);
    indexInfected = zeros([1, N*delta1]);
    indexIsolated = zeros([1, N*delta1*delta2]);
    
    for i = 1:N
        xRandom = randi(T);
        yRandom = randi(T);
        while all(PERSON(:,[1,2]) == [xRandom,yRandom])
            %fprintf("collision for %d %d",xRandom,yRandom)
            xRandom = randi(T);
            yRandom = randi(T);
        end
        PERSON(i,[1,2]) = [xRandom,yRandom];
    end
    
    for i = 1:N*delta1
        index = randi(N);
        while any(indexInfected == index)
            index = randi(N);
        end
    
        PERSON(index,3) = M;
        indexInfected(i) = index;
    end
    
    for i = 1:N*delta1*delta2
        index = randi(N*delta1);
        while any(indexIsolated == indexInfected(index))
            index = randi(N*delta1);
        end
        index = indexInfected(index);
    
        PERSON(index,4) = M;
        PERSON(index,[5,6]) = PERSON(index,[1,2]);
    
        indexIsolated(i) = index;
    end




