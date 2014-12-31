# Largest palindrome product
#
# Problem 4
#
# A palindromic number reads the same both ways. The largest palindrome made from the product of two 2-digit numbers is
# 9009 = 91 × 99.
#
# Find the largest palindrome made from the product of two 3-digit numbers.
require('Kmisc')  # contains function str_rev

P <- vector()
for (x in seq(999,100,-1)) {
  for (y in seq(999,100,-1)) {
    z <- x * y
    Zstr <- as.character(z)
    if (Zstr == str_rev(Zstr)) {
      P <- append(P,z)
    }
  }
}
answer <- max(P)
