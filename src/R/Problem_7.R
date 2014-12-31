# 10001st prime
#
# Problem 7
#
# By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see that the 6th prime is 13.
#
# What is the 10 001st prime number?

# Solution uses the Sieve of Eratosthenes (http://en.wikipedia.org/wiki/Sieve_of_Eratosthenes)

primest <- function(n){
  p <- 2:n
  i <- 1
  while (p[i] <= sqrt(n)) {
    p <-  p[(p %% p[i] != 0 | p==p[i])]
    i <- i+1
  }
  p
}
P = primest(104750)
length(P)
answer <- P[10001] #104743
