function [PERSON,indexInfected] = InitPeople_SCII(N,T,M,delta1)
    PERSON = zeros([N,6]);
    indexInfected = zeros([1, N*delta1]);
    
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
end



