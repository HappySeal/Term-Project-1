
```
\documentclass{article}
\usepackage[utf8]{inputenc}
\usepackage[absolute,overlay]{textpos}
\usepackage{graphicx}
\usepackage{caption}
\usepackage{subfig}
\usepackage[a4paper, margin={1.91cm, 2.54cm}]{geometry}

\begin{document}


\begin{textblock*}{5cm}(14.5cm,1cm) % {block width} (coords) 
    \begin{flushright}
    \normalsize Cafer SELLİ 2444974\\\normalsize Zeynep Beril ŞAHİN 2587848    
    \end{flushright}
\end{textblock*}

\begin{center}
\huge IE206-Term Project I\\\Large Spring 2022
\end{center}


\tableofcontents


\addcontentsline{toc}{section}{Introduction}
\section*{Introduction}

\; \; Due to the pandemic humanity learned that it was not even prepared for any kind of disasters nature could release upon us. Predicting and simulating an upcoming disaster, could be great game changer for the favor of humankind. Especially disasters such as pandemics and epidemics looks like a completely random system in the first glance, but on a virtual environment, behaviour of it could be observed with high precision.

This project is a pandemic simulation for a grid based environment.By moving the main elements, people in the population, with a random-walk principle based on uniform distribution, our simulation embraces everyday movements of the people that can not be predicted beforehand. Also by adjusting different parameters that could be a solution to the epidemic such as vaccination or isolation, predicting the behaviour of the virus could be possible.

Predicting the behaviour of the virus enables decision makers to develop and implement more efficient pandemic policies, which may be crucial for the well-being of the population during pandemic. The aim of this project is to create environments for implementing different policies, and comparing them in terms of results on the population.

\addcontentsline{toc}{section}{PART I : Interpretation of Graphs}
\section*{PART I : Interpretation of Graphs}

\begin{figure}[h]
    \centering
    \subfloat[\centering Scenario I]{{\includegraphics[width=6cm]{images/ScenarioI_overall.png} }}%
    \qquad
    \subfloat[\centering Scenario II]{{\includegraphics[width=6cm]{images/ScenarioII_overall.png} }}%
    \qquad
    \subfloat[\centering Scenario III]{{\includegraphics[width=6cm]{images/ScenarioIII_overall.png} }}%
    \qquad
    \subfloat[\centering Scenario IV]{{\includegraphics[width=6cm]{images/ScenarioIV_overall.png} }}%
    \caption{Total number of each people trough iterations}%
    \label{fig:totalAll}%
\end{figure}

In the Scenario I (Figure \ref{fig:totalAll}.a), almost all of the population (240 people) got infected by the virus. Even if there are quarantine restrictions, spread of the virus still not under control. In less than 30 iteration, all of the population is infected by the virus. So quarantine restrictions by itself is not enough for such case. On the other hand, however, in the Scenario II (Figure \ref{fig:totalAll}.b), some of the population is not even infected by the virus. At the end of 120 iteration approximately 30 people out off 240 (Obtained by running Monte-Carlo simulation 100 times) is not even get infected by the virus. 

Compared with the Scenario I, effect of vaccination is more significant than the quarantine. Even if movement of a infected person could be restricted, there is still a probability of them roaming around and infecting others. With this two graph, in order to reduce the \textbf{total} number of infected people, we can use vaccination policy rather than isolation policy.

\begin{figure}[h]
    \centering
    \subfloat[\centering Scenario I]{{\includegraphics[width=8cm]{images/ScenarioI_PerIteration.png} }}%
    \qquad
    \subfloat[\centering Scenario II]{{\includegraphics[width=8cm]{images/ScenarioII_PerIteration.png} }}%
    \caption{Number of people in each iteration for Scenario I \& II}
    \label{fig:perIter1&2}%
\end{figure}

However, by examining the per iteration data of Scenario I and II, difference between each policy can be seen clearly. For the Scenarios I and II, in the Figure \ref{fig:perIter1&2}, there is a single spike that emerges at iteration 15 on the Scenario I with a peak of 15 person per iteration, but in Scenario II there is two different spikes with peak of each is greater than 40 person per iteration. 

This spikes can also be observed in the death rates per iteration. Total number of deceased people in Scenario I and Scenario II is similar to each other, but in scenario 1 this number is mostly emerged in a single wave. Where in scenario II it is spread across two waves. Number of healed people per iteration is follows a similar sequence in both scenarios.

In the Scenario I pandemic is spread across a wider iteration-period and reached an end in a single wave. With such a wide ranged event, failure of healthcare system might be averted, but drawback of this scenario is all of the population is still getting infected. This situation is prevented in Scenario II with vaccination. However, due to the huge spikes, healthcare systems might fail due to the this high increase in the number of infected people per iteration. 

\begin{figure}[h]
    \centering
    \subfloat[\centering Scenario III]{{\includegraphics[width=8cm]{images/ScenarioIII_PerIteration.png} }}%
    \qquad
    \subfloat[\centering Scenario IV]{{\includegraphics[width=8cm]{images/ScenarioIV_PerIteration.png} }}%
    \caption{Number of people in each iteration for Scenario III \& IV}
    \label{fig:perIter3&4}%
\end{figure}

Scenario III, solves both of the problems in Scenario I and Scenario II by combining aspects of both. Using both vaccination and quarantine policy, peak point of the total number of infected people, in Figure \ref{fig:totalAll}.c, lowered almost to the 200 people. That means approximately 17\% of the population is not even infected by virus. Also in the Figure \ref{fig:perIter3&4}.a, peak of infected per iteration is decreased to the 15 person per iteration. This is a huge relief for healthcare system in our simulation.

Since both quarantine and vaccination is used, number of total vaccinated people is increased by approximately 10 people. Similar relation holds for the vaccinated per iteration too. The number of people died but vaccinated per iteration almost sits at 0 level. Because someone with vaccination have only 5\% chance of getting the virus. In addition to that dying from it also 5\%, so overall chance of a vaccinated people dying from virus is 0.25\%. This is why died but vaccinated per iteration level is staying at 0.

Scenario IV adds another dimension to the simulation with the double vaccination policy. With double vaccination policy, each individual have a 80\% probability of having the second dose of vaccination. Assuming that if they are not vaccinated for the second time after exactly 3 iteration, their protection against the virus wares out (i.e. their probability of getting infected will be equal to 50\% rather than 5\%). Also they will be not eligible for the second dose. Due to this, total number of infected people in the population is still equal to the value at Scenario III. 

However, due to the wear out of vaccination, some of the people got infected after they are vaccinated and this lead to infection of more people overall. Peak values of the infected number of people per iteration is lower than Scenario III; but this difference can only be observed on average.

Biggest impact of double vaccination policy is decreasing the total death rate of the pandemic. Since any double vaccinated person is completely immune to the virus, this lead to decreasing the death chance of a individual to 0 without any consequences. In the Figure \ref{fig:totalAll}.d dramatic drop in the total death is clearly seen. Same effect is also visible on the death per iteration rate. In the Figure \ref{fig:perIter3&4}.b, died per iteration rate is less frequent and have smaller peak values due to the double vaccination.

Another impact of double vaccination is decreasing the infected but vaccinated amount. This result actually have two causes. The first one is that, for the people that do not want to take the second dose are excluded from the vaccinated list. The second reasons is that, individuals that took the second dose are completely immune to the virus.

\addcontentsline{toc}{section}{PART II : Alternative Scenarios}
\section*{PART II : Alternative Scenarios}

\addcontentsline{toc}{subsection}{Isolation Probability ( Scenario I )}
\subsection*{Isolation Probability ( Scenario I )}

\; \; Under only the isolation policy is implemented, the effect of isolation probability is examined by changing the original isolation probability. By setting the value to a higher and lower values, total number of infected and dead people through the iterations are graphed according to the simulation (Figure \ref{fig:AlterQSSC1})
\begin{figure}[h]
    \centering
    \subfloat[\centering Isolation Probability ($q_s$) = 0.2]{{\includegraphics[width=5cm]{images/AlternativeScenarios/ScenarioI_IsolationProbability0.2_overall.png} }}%
    \qquad
    \subfloat[\centering Isolation Probability ($q_s$) = 0.5]{{\includegraphics[width=5cm]{images/AlternativeScenarios/ScenarioI_IsolationProbability0.5_overall.png} }}%
    \qquad
    \subfloat[\centering Isolation Probability ($q_s$) = 0.8]{{\includegraphics[width=5cm]{images/AlternativeScenarios/ScenarioI_IsolationProabability0.8_overall.png} }}%
    \caption{Total number of people in each iteration for different isolation probabilities}
    \label{fig:AlterQSSC1}%
\end{figure}

In all three cases ,where the isolation probability is low,moderate and high, all of the population gets infected. However, according to the number of people per iteration data (Figure \ref{fig:AlterQSSC1PerIter}) the number of iteration where the peak of infected people occurs and the peak value changes depending on the isolation probability. In Figure \ref{fig:AlterQSSC1PerIter}.a ,where the isolation probability equals 20\%, peak occurs earlier, closer to 15$^{\textrm{th}}$ iteration in the simulation. In contrast,in the case of original scenario where the isolation probability equals 50\%, peak of infected people occurs approximately at 20$^{\textrm{th}}$ iteration. In the case where isolation probability is equal to 80\%, the peak occurs approximately at the same iteration with the 50\% probability but the span of the infected people per iteration is larger. Even after the 40$^{\textrm{th}}$ iteration, there are still new people getting infected. The reason behind this situation is due to the less iterations between infected and healthy people. The higher the isolation probability gets, the more people that has not infected yet in the later iterations who can still get infected. 

The peak values of the infected people in the case of isolation probability equals 20\% is higher than other cases because more people gets infected in a short amount of iterations. This situation might lead to some failure in the healthcare system.

The total number of dead people in all three cases are equal since in all three situations, all of the population gets infected and death probabilities are the same for people in the isolated and non-isolated infected people.

\begin{figure}[h]
    \centering
    \subfloat[\centering Isolation Probability ($q_s$) = 0.2]{{\includegraphics[width=5cm]{images/AlternativeScenarios/ScenarioI_IsolationProbability0.2_PerIteration.png} }}%
    \qquad
    \subfloat[\centering Isolation Probability ($q_s$) = 0.5]{{\includegraphics[width=5cm]{images/AlternativeScenarios/ScenarioI_IsolationProbsbility0.5_PerIteration.png} }}%
    \qquad
    \subfloat[\centering Isolation Probability ($q_s$) = 0.8]{{\includegraphics[width=5cm]{images/AlternativeScenarios/ScenarioI_IsolationProbability0.8_PerIteration.png} }}%
    \caption{Number of people in each iteration for different isolation probabilities}
    \label{fig:AlterQSSC1PerIter}%
\end{figure}



\addcontentsline{toc}{subsection}{Vaccination Rate ( Scenario II )}
\subsection*{Vaccination Rate ( Scenario II )}

\; \; Under only the vaccination policy is implemented, the effect of vaccination rate  is examined by changing the original vaccination rate function. 
$$
\\0.2\bigg(\frac{1}{t_v-19}\bigg)\leftarrow0.5\bigg(\frac{1}{t_v-19}\bigg)\rightarrow 0.8\bigg(\frac{1}{t_v-19}\bigg)\
$$

\begin{figure}[h]
    \centering
    \subfloat[\centering Vaccination Rate ($\Delta_3(t=20) = 0.2$)]{{\includegraphics[width=5cm]{images/AlternativeScenarios/ScenarioII_VaccinationRate0.2_overall.png} }}%
    \qquad
    \subfloat[\centering Vaccination Rate ($\Delta_3(t=20) = 0.5$)]{{\includegraphics[width=5cm]{images/AlternativeScenarios/ScenarioII_VaccinationRate0.5_overall.png} }}%
    \qquad
    \subfloat[\centering Vaccination Rate ($\Delta_3(t=20) = 0.8$)]{{\includegraphics[width=5cm]{images/AlternativeScenarios/ScenarioII_VaccinationRate0.8_overall.png} }}%
    \caption{Total number of people in each iteration for different vaccination rate}
    \label{fig:AlterDelta3SC2all}%
\end{figure}
\begin{figure}
    \centering
    \subfloat[\centering Vaccination Rate ($\Delta_3(t=20) = 0.2$)]{{\includegraphics[width=5cm]{images/AlternativeScenarios/ScenarioII_VaccinationRate0.2_PerIteration.png} }}%
    \qquad
    \subfloat[\centering Vaccination Rate ($\Delta_3(t=20) = 0.5$)]{{\includegraphics[width=5cm]{images/AlternativeScenarios/ScenarioII_VaccinationRate0.5_PerIteration.png} }}%
    \qquad
    \subfloat[\centering Vaccination Rate ($\Delta_3(t=20) = 0.8$)]{{\includegraphics[width=5cm]{images/AlternativeScenarios/ScenarioII_VaccinationRate0.8_PerIteration.png} }}%
    \caption{Total number of people in each iteration for different vaccination rate}
    \label{fig:AlterDelta3SC2perIter}%
\end{figure}


According to the Figure \ref{fig:AlterDelta3SC2all}.a, where the vaccination rate of the population is lower, the more of the population gets infected and even after the 20$^{\textrm{th}}$ iteration, infection amount keeps growing and eventually all of the population gets infected. However, in the case of higher vaccination rates (Figure \ref{fig:AlterDelta3SC2all}.c) , after the 20$^{\textrm{th}}$ iteration,slope of the total infection curve decreases rapidly. This situation indicates that spread of the virus can be controlled with higher rates of vaccination.

In all three cases where the vaccination rate is low,moderate and high (Figure \ref{fig:AlterDelta3SC2perIter}), the pandemic unfolds in two waves. However, peak of the waves are inversely proportional to the vaccination rate. In the case of vaccination rate of 0.2, peak of the second wave almost exceeds 50 people per iteration. In contrast, for coefficient of vaccination rates of 0.5 and 0.8,peak occurs around 40 people per iteration.

Total number of dead people is affected from the vaccination as well up to a certain threshold. For coefficient of 0.5, number of dead people is approximated as 11.47 in 100 Monte-Carlo simulation. As the vaccination rate goes down to 0.2, number of dead people increased to 12.01. However as the vaccination rate goes up to 0.8, number of dead people is approximately equal to 11.5, which is almost the same as vaccination rate 0.5. This means that speed of vaccination prevents deaths up to a certain level. 

\addcontentsline{toc}{subsection}{Vaccination Rate ( Scenario III )}
\subsection*{Vaccination Rate ( Scenario III )}
\; \; Under the policy of vaccination and isolation together, keeping the isolation probability at its original value $q_s=0.5$, the effect of vaccination rate  is examined by changing the original vaccination rate function. 
$$
\\0.2\bigg(\frac{1}{t_v-19}\bigg)\leftarrow0.5\bigg(\frac{1}{t_v-19}\bigg)\rightarrow 0.8\bigg(\frac{1}{t_v-19}\bigg)\
$$

\begin{figure}[h]
    \centering
    \subfloat[\centering Vaccination Rate ($\Delta_3(t=20) = 0.2$)]{{\includegraphics[width=5cm]{images/AlternativeScenarios/ScenarioIII_VaccinatedRate0.2_IsolationProbabilityConstant_overall.png} }}%
    \qquad
    \subfloat[\centering Vaccination Rate ($\Delta_3(t=20) = 0.5$)]{{\includegraphics[width=5cm]{images/AlternativeScenarios/ScenarioIII_Isolation0.5Vaccination0.5_overall.png} }}%
    \qquad
    \subfloat[\centering Vaccination Rate ($\Delta_3(t=20) = 0.8$)]{{\includegraphics[width=5cm]{images/AlternativeScenarios/ScenarioIII_VaccinatedRate0.8_IsolationProbabilityConstant_overall.png} }}%
    \caption{Total number of people in each iteration for different vaccination rate}
    \label{fig:AlterDelta3SC3all}%
\end{figure}

As can be seen in Figure \ref{fig:AlterDelta3SC3all}.a, when the vaccination rate is 20\%, almost all of the population gets infected around the same time. And this brings the pandemic into a fast conclusion.This many cases around the same time might lead to failure in the healthcare system. In contrast, when the vaccination rate increases to 80\% (Figure \ref{fig:AlterDelta3SC3all}.c), some people in the population is not even infected. Also, the pandemic unfolds in a longer time period. In Figure \ref{fig:AlterDelta3SC3all}.a, it can be seen that starting from the 60$^{\textrm{th}}$ iteration,there is no new cases of infection. But in Figure \ref{fig:AlterDelta3SC3all}.b and Figure \ref{fig:AlterDelta3SC3all}.c, this number reaches to almost 80$^{\textrm{th}}$ iteration. Similar to Alternative for the Scenario II, where the vaccination rate is high,slope of the infection curve decreases comparing to the same scenario with lower vaccination rate.

According to the Figure \ref{fig:AlterDelta3SC3all}, as the vaccination rate becomes higher, the number of dead people decreases. This situation can be seen clearly comparing each graph in Figure \ref{fig:AlterDelta3SC3all}.  In the case where isolation probability is kept as constant and vaccination rate is decreased to 20\%, (Figure \ref{fig:AlterDelta3SC3all}.a), people died in total on average is more than vaccination rate of 0.8 with the same isolation probability (Figure \ref{fig:AlterDelta3SC3all}.c) . In the case of vaccination probability 20\%, number of dead people is equal to 17 (Figure \ref{fig:AlterDelta3SC3all}.a) whereas when vaccination probability increases to 50\%, that value decreases to 11(Figure \ref{fig:AlterDelta3SC3all}.b). Even though this correlation applies until a certain threshold, if the vaccination  rate keeps increasing under the same isolation probability, total number of dead people does not affected significantly similar to the Alternative Scenario II (Figure \ref{fig:AlterDelta3SC3all}.c).

\addcontentsline{toc}{subsection}{Isolation Rate ( Scenario III )}
\subsection*{Isolation Rate ( Scenario III )}

\; \; Under the policy of vaccination and isolation together, keeping the vaccination rate at its original value according to the function $\frac{1}{2*(t_v-19)}$ , the effect of infection probability is examined by changing the original probability $q_s=0.5$.

\begin{figure}[h]
    \centering
    \subfloat[\centering Vaccination Rate ($q_s = 0.2$)]{{\includegraphics[width=5cm]{images/AlternativeScenarios/ScenarioIII_IsolationProbability0.2_VaccinatedRateConstant_overall.png} }}%
    \qquad
    \subfloat[\centering Vaccination Rate ($q_s = 0.5$)]{{\includegraphics[width=5cm]{images/AlternativeScenarios/ScenarioIII_Isolation0.5Vaccination0.5_overall.png} }}%
    \qquad
    \subfloat[\centering Vaccination Rate ($q_s = 0.8$)]{{\includegraphics[width=5cm]{images/AlternativeScenarios/ScenarioIII_IsolationProbability0.8_VaccinatedRateConstant_overall.png} }}%
    \caption{Total number of people in each iteration for different vaccination rate}
    \label{fig:AlterQsSC3all}%
\end{figure}

The lower isolation probability under the same vaccination rate affects both total number of infection and total number of vaccination. As the number of interactions between people increases due to the low isolation probability, total number of infection increases in earlier iterations. Because of this, there will be less healthy people to vaccinate when the vaccination starts. This can be seen by comparing the vaccination amounts in (Figure \ref{fig:AlterQsSC3all}.a) and (Figure \ref{fig:AlterQsSC3all}.c). The total number of infected people in the case where isolation probability equals to 80\% is lower than 200. This number increases to 240 when the probability equals 20\%.

Total number of dead people also affected by the changing isolation probabilities under the same vaccination rates. As the isolation probability increases, total number of dead people decreases since there will be less interaction and less chance to get infected in the first place.

\addcontentsline{toc}{subsection}{Second Vaccination Rate ( Scenario IV )}
\subsection*{Second Vaccination Rate ( Scenario IV )}
\; \; Under the double vaccination scenario, given the isolation probability in Scenario I ($q_S=0.5$), the effect of second vaccination rate is examined by changing the original rate $w=0.8$.

\begin{figure}[h]
    \centering
    \subfloat[\centering Vaccination Rate ($w = 0.2$)]{{\includegraphics[width=5cm]{images/AlternativeScenarios/ScenarioIV_SecondVaccinationProbability0.2_overall.png} }}%
    \qquad
    \subfloat[\centering Vaccination Rate ($w = 0.5$)]{{\includegraphics[width=5cm]{images/AlternativeScenarios/ScenarioIV_SecondVaccinationProbability0.5_overall.png} }}%
    \qquad
    \subfloat[\centering Vaccination Rate ($w = 0.8$)]{{\includegraphics[width=5cm]{images/AlternativeScenarios/ScenarioIV_SecondVaccinationRate0.8_overall.png} }}%
    \caption{Total number of people in each iteration for different second dose vaccination rate}
    \label{fig:AlterSC4}%
\end{figure}

By looking at the Figure \ref{fig:AlterSC4}, infection rates seems like dependent on the second dose vaccination rate. However, since vaccination and double vaccination starts after 20$^{\textrm{th}}$ iteration, until iteration 20 the total number of infected people is solely dependent on random movement of individuals. After the 20$^{\textrm{th}}$ iteration, as the vaccination and second vaccination starts, in the case of lower second vaccination rates (Figure \ref{fig:AlterSC4}.a), more of the population gets infected comparing to the higher second vaccination rates (Figure \ref{fig:AlterSC4}.c).

Total number of dead people is also affected by changing the second vaccination rates under same isolation probability as in Scenario I. According to (Figure \ref{fig:AlterSC4}.a), number of total dead people is higher when second vaccination rate is decreased to 20\%,comparing to the case where second vaccination rate is 80\%.(Figure \ref{fig:AlterSC4}.c). This correlation can be guaranteed also by checking the  second vaccination rate of 50\% under the same isolation probability(Figure \ref{fig:AlterSC4}.b). Total number of dead people takes place in the middle of lower and higher second vaccination rates(20\% and 80\% respectively). This means that higher rates of second vaccination prevents deaths if isolation policy is implemented at the same time.

\addcontentsline{toc}{section}{Conclusion}
\section*{Conclusion}


\addcontentsline{toc}{section}{Appendix}
\section*{Appendix}


\end{document}
```