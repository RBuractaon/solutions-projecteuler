# Smallest multiple
#
# Problem 5
#
# 2520 is the smallest number that can be divided by each of the numbers from 1 to 10 without any remainder.
#
# What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20?
require(numbers)
# Solution
# All of the integers between 1 through 20 are:
# 1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20
n = seq(1,20)

# We must include all of the prime numbers
# 2,3,5,7,11,13,17,19
isPrime(n)

# The implied integers are the product of primes
# 6,14,15
#
# Our set of integers accounted for is:
# 2,3,5,6,7,11,13,14,15,17,19
#
# In order to get 4 we need an additional 2 factor
# In order to get 8 we need another 2 factor
# In order to get 9 we need another 3 factor
# In order to get 16 we need an additional 2 factor
#
# Thus our set of factors is

X <- 2*3*5*7*11*13*17*19*2*2*3*2

# Answer = 232792560
