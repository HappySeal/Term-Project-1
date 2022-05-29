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

Scenario I

Infected -  234.4100
Healed -228.4300
Died -11.4500

Scenario II

Infected - 220.4500  
Healed - 215.1900
Died -10.9800

Scenario III

Infected - 1.  216.7700 
Healed -212.5900
Died -11.5700

Scenario IV

Infected - 216.3900
Healed -205.3900
Died -11.4100

vaccinated but infected
assuming 3 iterations
tekli grafikleri appendixe


---
# Part II:Alternative Scenarios
## a.
- Under only the isolation policy is implemented, the effect of isolation probability is examined by changing the original isolation probability. By setting the value to a higher and lower values, total number of infected and dead people through the iterations are graphed according to the simulation (figurea figureb figurec)
- In all three cases ,where the isolation probability is low,moderate and high, all of the population gets infected. However, according to the number of people per iteration data (figure dcsnkvfs) the number of iteration where the peak of infected people occurs and the peak value changes depending on the isolation probability. In figure(0.2 per iteration),where the isolation probability equals 20%, peak occurs earlier, closer to 15th iteration in the simulation. In contrast,in the case of original scenario where the isolation probability equals 50%, peak of infected people occurs approximately at 20th iteration. In the case where isolation probability is equal to 80%, the peak occurs approximately at the same iteration with the 50% probability but the span of the infected people per iteration is larger. Even after the 40th iteration, there are still new people getting infected. The reason behind this situation is due to the less iterations between infected and healthy people. The higher the isolation probability gets, the more people that has not infected yet in the later iterations who can still get infected. 
- The peak values of the infected people in the case of isolation probability equals 20% is higher than other cases because more people gets infected in a short amount of iterations. This situation might lead to some failure in the healthcare system.
- The total number of dead people in all three cases are equal since in all three situations, all of the population gets infected and death probabilities are the same for people in the isolated and non-isolated infected people.

## b.
- Under only the vaccination policy is implemented, the effect of vaccination rate  is examined by changing the original vaccination rate function. 
$$
\\0.2\bigg(\frac{1}{t_v-19}\bigg)\leftarrow0.5\bigg(\frac{1}{t_v-19}\bigg)\rightarrow 0.8\bigg(\frac{1}{t_v-19}\bigg)\
$$
- According to the figure(0.2 vaccination rate overall) where the vaccination rate of the population is lower , the more of the population gets infected and even after the 20th iteration, infection amount keeps growing and eventually all of the population gets infected. However, in the case of higher vaccination rates (0.8 vaccination rate overall) , after the 20th iteration,slope of the total infection curve decreases rapidly. This situation indicates that spread of the virus can be controlled with higher rates of vaccination.
- In all three cases where the vaccination rate is low,moderate and high(figures 0.2 0.5 0.8 per iteration), the pandemic unfolds in two waves. However, peak of the waves are inversly proportional to the vaccination rate. In the case of vaccination rate of 0.2, peak of the second wave almost exceeds 50 people per iteration. In contrast, for coefficient of vaccination rates of 0.5 and 0.8,peak occurs around 40 people per iteration.
- Total number of dead people is affected from the vaccination as well up to a certain treashold. For coefficient of 0.5, number of dead people is approximated as 11.47 in 100 Monte-Carlo simulations. As the vaccination rate goes down to 0.2, number of dead people increased to 12.01. However as the coefficient of the vaccination rate goes up to 0.8, number of dead people is approximately equal to 11.5, which is almost the same as coefficient of vaccination rate 0.5. This means that speed of vaccination prevents deaths up to a certain level. 


## c.
- Under the policy of vaccination and isolation together, keeping the isolation probability at its original value q_s=0.5, the effect of vaccination rate  is examined by changing the original vaccination rate function. 
$$
\\0.2\bigg(\frac{1}{t_v-19}\bigg)\leftarrow0.5\bigg(\frac{1}{t_v-19}\bigg)\rightarrow 0.8\bigg(\frac{1}{t_v-19}\bigg)\
$$
- As can be seen in (figure 0.2 overall), when the vaccination rate is 20%, almost all of the population gets infected around the same time. And this brings the pandemic into a fast conclusion.This many cases around the same time might lead to failure in the healthcare system. In contrast, when the vaccination rate increases to 80% (figure 0.8 overall, some people in the population is not even infected. Also, the pandemic unfolds in a longer time period. In (figure 0.2 overall), it can be seen that starting from the 60th iteration,there is no new cases of infection. But in (figures 0.5 and 0.8 overall), this number reaches to almost 80th iteration. Similar to Alternative for the Scenario II, where the vaccination rate is high,slope of the infection curve decreases comparing to the same scenario with lower vaccination rate.

- According to the (figures 0.2 0.5 0.8 vaccination rate overall),as the vaccination rate becomes higher, the number of dead people decreases. This situation can be seen clearly comparing (figures 0.2 0.5 0.8 vaccination rate overall).  In the case where isolation probability is kept as constant and vaccination rate is decreased to 0.2,(figure 0.2 overall), people died in total on average is more than vaccination rate of 0.8 with the same isolation probability(figure 0.8 overall) . In the case of vaccination probability 0.2, number of dead people is equal to 17 (in figure 0.2 overall) whereas when vaccination probability increases to 0.5, that value decreases to 11(in figure 0.5 overall). Even though this correlation applies until a certain threshold, if the vactination rate keeps increasing under the same isolation probability, total number of dead people does not affected significantly similar to the Alternative Scenario II.(in figure 0.8 overall)

## d.
- Under the policy of vaccination and isolation together, keeping the vaccination rate at its original value according to the function...WRITE HERE THE FUNCTION IN LATEX , the effect of infection probability is examined by changing the original probability q_s=0.5.
- The lower isolation probability under the same vaccination rate affects both total number of infection and total number of vaccination. As the number of interactions between people increases due to the low isolation probability, total number of infection increases in earlier iterations. Because of this, there will be less healthy people to vaccinate when the vaccination starts. This can be seen by comparing the vaccination amounts in (figure 0.2 overall) and (figure 0.8 overall). The total number of infected people in the case where isolation probability equals to 80% is lower than 200. This number increases to 240 when the probability equals 20%.
- Total number of dead people also affected by the changing isolation probabilities under the same vaccination rates. As the isolation probability increases, total number of dead people decreases since there will be less interaction and less chance to get infected in the first place.

## e.
- Under the double vaccination scenario, given the isolation probability in Scenario I (q_S=0.5), the effect of second vaccination rate is examined by changing the original rate w=0.8.
- Even though for different second vaccination rates the total number of infection amount changes, it is independent from the second vaccination rate itself for the first 20 iterations.