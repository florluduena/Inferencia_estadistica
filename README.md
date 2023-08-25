# Statistical inference

1. Build a simulation  of a distribution with a knowed expected value that: 
Given a random variable Y with a expected value &mu;, consider the function $g(x) = E((Y - x)^2)$
Simulate and plot a function g reaches its minimum value when  x = &mu; and it's minimum is  V(Y).


2. A person flips a fair coin, independently, until heads appear for the first time.
 If heads appears on the n-th toss, the person wins $2^n$ pesos.
 Let X be the person's winnings. This problem is known as the St. Petersburg paradox.
 Simulate to show that the expected profit is infinit.

3. $Xn ~ N(0,1) \forall n = 1,2, \ldots$  
    \$\bar{X}_n\$ =   sum(X)/n 
    Plot  \$\bar{X}_n\$  as function of n, from 1 to 1000.

4.  Let $X_1, \ldots , X_n ∼ Unif(0, 1)$ .
   Plot density $f_x$.
   Calculate $E(X_n)$ and $V(X_n)$. Graph both quantities as functions of n.
   Simulate the distribution of $X_n$ with R for $n = 1, 5, 25, 100$. 
 Verify that the simulated values of $E(X_n)$ and $V(X_n)$ are consistent with the theoretical values found in the previous section. 
 What happens to the (sample) distribution of $X_n$ as n increases?

5.  A deck of n cards labeled from 1 to n is shuffled. 
 If the position of a card after shuffling matches the card's label,
 we say there's a coincidence.
 Let $X$ be the total number of coincidences 

6. Plot the calculated likelihoods of a Poisson distribution for samples generated with R and verify that the obtained estimator effectively maximizes them.

