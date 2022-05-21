# TERM PROJECT
---
## Initial Conditions for the Environment
- T =Grid Size=20
- N=Population Size=240
- Initially infected percentage=%5
- Each cell has only one individual at the beginning.They move randomly U[0,3].(Be careful that their positions may not change.) 
- If they hit a boundry or corner,they can move in the next move. Their movements have equal chances again in the next move.(In such a way they can move ,not in the way of boundry or corner. )
- Each infected can be healed after M=30 iterations(infection duration). Their chance of healing is 0.95.
- Examine results for t=120 iterations.
![[Ekran Görüntüsü (333).png]]



# Scenario I - Representation of the Current Condition and Spread of the Pandemia
## Conditions for Scenerio 1
----
- Vaccination has not started in this Scenerio so no need to think about variables of vaccination.
- Initially it is assumed that %50 of the infected people are isolated until they are getting healed(for M=30 iterations).
- !! Isolation means infected person can be found in the neighbour cells where the infection has occured (If person go did not get infected in boundaries or corners, it can be found in 9 cells during its isolation. Otherwise,you have to check corner cells where it got infected. ) The probability of moving is the same for all directions.!!
![[Ekran Görüntüsü (335).png]]

- If a non-infected and infected person coincide in a cell, the probability of infection is 0.5.
- A newly infected person will be isolated with a probability of 0.5.(And stay isolated for 30 iterations). It may break the rule with 0.5 probability and in this case,it continues to move around regularly.
- If an infected point is not isolated,do not try to isolate it for the following iterations.
- The points that cannot be healed after 30 iterations will be dead.(Decrease them from the total population.)
- Once an infected point is healed, it will not be infected again.

-----

## Variables for Objects in Scenerio 1
- 20x20=400 cells in total.
- 240 people in total their cells are random.
- Initially 12 people are infected.
- Initially 6 people are infected and isolated for 30 iterations.They can move between their neighbour cells. Remaining 6 continues to move randomly.
- Each infected(12 points) has %95 chance to heal after 30 iterations.Once an infected point is healed, it will not be infected again. Otherwise, they will be dead and decreased from the total population.
- The probability of infection is 0.5 if a non infected and infected coincide.


------
# Scenario II - Spread Under Vaccination

## Conditions for Scenerio 2
- There is no isolation like in the Scenerio 1.
- After ts=20 iteration, vaccination starts.
-  In each iteration, 1/(2(tv-19)) of **healthy people** gets vaccinated. (The people that has not vaccinated before,since people can be vaccinated only once.) tv=ts,ts+1,ts+2... (20,21,22....).Decrease the ones that has vaccinated from the ones that are going to be vaccinated.
- Vaccinated people can be infected with the probability of 0.05 in the following iterations.


-----

## Variables for Objects in Scenerio 2
- 20x20=400 cells in total.
- 240 people in total their cells are random.
- Initially 12 people are infected.
- Each infected(12 points) has %95 chance to heal after 30 iterations. Once an infected point is healed, it will not be infected again.Otherwise, they will be dead and decreased from the total population.
- The probability of infection is 0.5 if a non infected and infected coincide.
- After the iteration 20,vaccination starts. In each iteration, 1/(2(tv-19)) of **healthy people** gets vaccinated. (The people that has not vaccinated before,since people can be vaccinated only once.) tv=ts,ts+1,ts+2... (20,21,22....).Decrease the ones that has vaccinated from the ones that are going to be vaccinated.
- Vaccinated people can be infected with the probability of 0.05 in the following iterations.

-------

# Scenario III - Spread Under Isolation and Vaccination

## Conditions for Scenerio 3
- *Combine Scenerio 1 and Scenerio 2*: 
-  Initially it is assumed that %50 of the infected people are isolated until they are getting healed(for M=30 iterations).
- If a non-infected and infected person coincide in a cell, the probability of infection is 0.5.
- !! Isolation means infected person can be found in the neighbour cells where the infection has occured (If person go did not get infected in boundaries or corners, it can be found in 9 cells during its isolation. Otherwise,you have to check corner cells where it got infected. ) The probability of moving is the same for all directions.!!
-  A newly infected person will be isolated with a probability of 0.5.(And stay isolated for 30 iterations). It may break the rule with 0.5 probability and in this case,it continues to move around regularly.
- If an infected point is not isolated,do not try to isolate it for the following iterations.
- The points that cannot be healed after 30 iterations will be dead.(Decrease them from the total population.)
- After the iteration 20,vaccination starts. In each iteration, 1/(2(tv-19)) of **healthy people** gets vaccinated. (The people that has not vaccinated before,since people can be vaccinated only once.) tv=ts,ts+1,ts+2... (20,21,22....).Decrease the ones that has vaccinated from the ones that are going to be vaccinated.
- Vaccinated people can be infected with the probability of 0.05 in the following iterations.
- !!!!**Once an infected point is healed, it will not be infected again.**!!!

-------
# Scenario IV - Spread Under Isolation and Double Vaccination
## Conditions for Scenerio 4
- If an individual is vaccinated once, it has the chance to get vaccinated after tsec=3 iterations(the time between first and second vaccination). The probability of the second vaccination of the healthy people w=0.8
- If the person is vaccinated twice, the probability of infection=0.(they will be considered as fully protected).Until getting the second vaccination, the infection probability stays as r=0.05 just like in Scenerio 2.
- If the person is not vaccinated for the second time after tsec=3 iterations, the probability of infection increases to p=0.5.
- **If an individual gets infected after the first vaccination,she/he will not be vaccinated for the second time.**(counted as fully protected since once an infected point is healed, it will not be infected again)

---
