# Libraries 


library(ggplot2)

#### PRACTICA 1
# PUNTO 3
# Build a simulation of a distribution with a knowed expected value that: 
# Given a random variable Y with a expected value \mu, consider the function g(x) = E((Y - x)^2)
# Show that the function g reaches its minimum value when  x = \mu and it's minimum is  V(Y)

# Y follows a Bernoulli distribution with parameters p = 0.5 ( which is a binomial distribution with n = 1) 

punto3 <- function(x, proba){
  # ------ Function proba3 -------
  # Objetive: 
  #   It replicates an empirical E((Y - x)^2) by
  #   generating 100 times a random sample of a Bernouille distribution,
  #   substracting a given observation, taking the squared of that and applying the mean. 
  # 
  # Inputs of the function:
  #   x: numeric vector
  #     a sequence of values (x)
  #   proba: float
  #     a decimal number  between 0 and 1, a probability.
  # Return:
  #   g: numeric vector
  #     a numeric vector with the mathematical expectation of each value in de given x.
  #     It's the result of g(x) for each x

    
    g <- c()
    for(i in 1:length(x)){
    g[i] <- mean(replicate(100, ((rbinom(1, 1, proba) - x[i])^2)))
    }
    return(g)
  }
 
# Dataframe based on the function punto3. x is a numeric vector with a sequence from 0 to 1 by 0.001.
df <- data.frame(xvalue = seq(0, 1, 0.001), gvalues = punto3(seq(0, 1, 0.001), 0.5))

# Plot
ggplot(df, aes(x = xvalue, y = gvalues)) + geom_line(colour = "plum")+ geom_vline(aes(xintercept = 0.5), color = "plum", linetype = "dashed", size = 1)+
labs(x = "valores de x", y = "Valores de g", title = "Simulación con Y ~ bernoulli(0.5)") + 
theme_classic()




# Variance 
var(replicate(100, rbinom(1, 1, 0.5)))

min(df$gvalues)




# EJERCICIO 4: The St. Petersburg paradox 
# A person flips a fair coin, independently, until heads appear for the first time.
# If heads appears on the n-th toss, the person wins 2n pesos.
# Let X be the person's winnings. This problem is known as the St. Petersburg paradox.
# Simulate to show that the expected profit is infinit.
n <- 1050
Esperanza <- c()
for (i in 0:n){
Esperanza[i] <- dgeom(i, 0.5) * (2^i)
print(Esperanza[i])
}

View(Esperanza)

sum(Esperanza, na.rm=TRUE)


# EJERCICIO 6 : Xn ~ N(0,1) for all n=1,2,..
# \overline{x}= sum(X)/n
# Plot \overline{n} as function of n, from 1 to 1000. 


average_dist_sample <- function(distribution, n){
# Objetive: 
#   It generates a random sample of n size that follows a given distribution 
# Inputs of the function:
#   distribution: string
#     Name of the distribution. Values allowed {"normal", "cauchy"}
#   n: a vector of int
#     a vector of int that indicates the size of a sample 
# Return:
#   media: numeric vector
#     a numeric vector with the averages of samples of size from 1 to n.
  average_sample <- c()
  for (i in n){
    if (distribution == "normal") {
      distr = rnorm(i, mean = 0, sd = 1)  
    }else {
      distr = rcauchy(i)
    }
    
    average_sample[i] <- mean(distr)
    
  }
  return(average_sample)
}

# vector of samples size
numero <-1:1000
# plot normal
plot(numero, average_dist_sample("normal", numero), main = "Evolution of the average of a normal distribution 0, 1, in function of n", col ="indianred",xlab = "n", ylab = "average")
cat("More dispersion is observed when the sample size n is smaller, and then it becomes more accurate and centers around the true mean of 0 as n increases.")

# plot cauchy
plot(numero, average_dist_sample("cauchy", numero), main = "Evolution of the average of X with a Cauchy distribution, as a function of n", col = "indianred", xlab = "n", ylab = "average")
cat("It is observed that as the sample size increases, it does not converge.")

# We iterate the simulation and it's graph several times  


par(mfrow = c(2, 2))
for (i in 1:4){
  plot(numero, average_dist_sample("cauchy", numero), xlab = "n", ylab = "Average", ylim = c(-200,200), col = 'indianred')
  }
cat("After many iteration we can observed that every graph is different")
cat("This is in line with the Cauchy distribution and its heavy tails. Extreme values are more frequent in this distribution, and they can heavily impact the mean due to the sensitivity to these extreme values.")

### EJERCICIO 7: 
# Let X1, . . . , Xn ∼ Unif(0, 1).
# Plot density fx.
par(mfrow = c(1, 1))
plot(density(runif(1000, 0, 1)), type = "l", main = "Density of uniform distribution 0,1")

# Calculate E(Xn) and V(Xn). Graph both quantities as functions of n.
ev <- function(n){
  # Objetive of the function:
  #   Calculate an empirical Expected value and Variance of n size of an uniform distribution . And plot it. 
  # Input:
  #   n: int 
  #     The size of the sample
  # Return:
  #   plot
  
  esperanza <- c()
  varianza <- c()
  for (i in 1:n){
    a<-replicate(i, runif(1, 0, 1))
    esperanza[i] <- mean(replicate(i, a))
    varianza[i] <- var(a)
    }
    
par(mfrow = c(1, 2))
plot(1:n, esperanza, main = "Statistical expectation as a function of n",col = "indianred",ylim = c(-1, 2))
plot(1:n, varianza, main = "variance as a function of n", col =  "indianred", ylim = c(0, 1))
    
  }
ev(100)

# Simulate the distribution of Xn with R for n = 1, 5, 25, 100. 
# Verify that the simulated values of E(Xn) and V(Xn) are consistent with the theoretical values found in the previous section. 
# What happens to the (sample) distribution of Xn as n increases?"

eyv <- function(n){
  # Objetive of the function: 
  #   Calculate mean and variance for an uniform distribution 
  # Inputs:   
  #   n: list of integers 
  
  num <- n 
  esperanza <- c()
  varianza <- c()
  media <- c()
  fila <- 1
  for (i in n){
    media[fila] <- mean(replicate(i, runif(1, 0, 1)))
    esperanza[fila] <- mean(replicate(100, mean(replicate(i, runif(1, 0, 1)))))
    varianza[fila] <- var(replicate(100, mean(replicate(i, runif(1, 0, 1)))))
    fila<- fila+1
    }
  cat("The mean with n ", num, ", is", media, ". \n The expected value with ", num, ", is", esperanza, ". \n The variance for ", num, ", is", varianza, ".")
  }
eyv(c(1, 5, 25, 100))


###### EJERCICIO 8:
# A deck of n cards labeled from 1 to n is shuffled. 
# If the position of a card after shuffling matches the card's label,
# we say there's a coincidence.
# Let X be the total number of coincidences 

coincidencias <- function(cant_cartas){
  # Objetive of the function: 
  #   Replicate 1000 times the process of shuffling n cards and check if the label of the card matches it's position. 
  # Input:
  #   n: int
  #     Quantity of cards
  # Return:
  #   a: list 
  #     list of cards resulting of every iteration
  n <- cant_cartas
  a <- mean(replicate(1000, { df <- cbind(sample(1:n), 1:n)
        any(df[, 1] == df[, 2]) 
        print(df)
        }))
  return(a)
  }





  mu <- 10
  sigma <- 2

  n <- 1e2

  muestra <- rnorm(n=n, mean=mu, sd=sigma)

  f <- function(x, y){
    prod(dnorm(muestra, mean=x, sd=y))
  }

  f <- Vectorize(f)

  x <- seq(mu-sigma,mu+sigma,length=20)
  y <- seq(1,3,length=20)

  z <- outer(x, y, f)

  persp(x, y, z, col="pink")


  f <- function(x){
    p <- x[1]
    lambda <- x[2]
    - ( 6*log(p + (1-p)*exp(-lambda)) + 4*(log(1-p) - lambda) + 50*log(lambda) )
  }

  mv <- optim(c(0.5,10), f)$par
  mv
