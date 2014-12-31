# Largest prime factor
#
# Problem 3
#
# The prime factors of 13195 are 5, 7, 13 and 29.
#
# What is the largest prime factor of the number 600851475143 ?

# Solution using the square forms factorization method
# http://en.wikipedia.org/wiki/Shanks%27_square_forms_factorization

require(numbers)
gcd <- function(x,y) {
  r <- x%%y
  return(ifelse(r, gcd(y, r), y))
}

squareFormsFactors <- function(N,k) {
  # Part 1
  iter <- 0
  kNsqrt <- floor(sqrt(k*N))
  P0 <- kNsqrt
  Q0 <- 1
  Q1 <- k*N - kNsqrt*P0
  while (sqrt(Q1)!=floor(sqrt(Q1))) {
    iter <- iter + 1
    b <- floor((kNsqrt+P0)/Q1)
    P1 <- b * Q1 - P0
    Q2 <- Q0 + b*(P0-P1)
    P0 <- P1
    Q0 <- Q1
    Q1 <- Q2
    #print(sprintf('Iter:%d, P%d=%d, Q%d=%d, Q%d=%d',iter,iter,P0,iter,Q0,iter+1,Q1))
  }
  # Part 2
  #print(sprintf('Iter:%d, P%d=%d, Q%d=%d, Q%d=%d',iter,iter,P0,iter,Q0,iter+1,Q1))
  print(sprintf('Found perfect square Q_%d = %d',iter,Q1))
  b0 <- floor((kNsqrt-P0)/sqrt(Q1))
  P0 <- b0*sqrt(Q1)+P0
  Q0 <- sqrt(Q1)
  Q1 <- ((k*N)-(P0*P0))/Q0

  iter <- 0
  #print(sprintf('Iter:%d   P0=%d, Q0=%d, Q1=%d',iter,P0,Q0,Q1))
  b1 <- floor((kNsqrt+P0)/Q1)
  P1 <- b1*Q1-P0
  while (P1!=P0) {
    iter <- iter + 1
    Q2 <- Q0 + b1*(P0-P1)
    #print(sprintf('Iter:%d   P%d=%d, Q%d=%d, Q%d=%d',iter,iter,P1,iter,Q1,iter+1,Q2))
    b2 <- floor((kNsqrt+P1)/Q2)
    P2 <- b2*Q2-P1
    P0 <- P1
    P1 <- P2
    b1 <- b2
    Q0 <- Q1
    Q1 <- Q2
  }
  #print(sprintf('Iter:%d   P%d=%d, Q%d=%d, Q%d=%d',iter,iter,P1,iter,Q1,iter+1,Q2))
  print(sprintf('Found P%d=P%d <- %d',iter-1,iter,P1))
  f <- gcd(N,P1)
  return(f)
}

sumFromFactors(600851475143,9)
