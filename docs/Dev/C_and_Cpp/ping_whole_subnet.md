Returning rand() % N does not uniformly give a number in the range [0, N) unless N divides the length of the interval into which rand() returns (i.e. is a power of 2). Furthermore, one has no idea whether the moduli of rand() are independent: it's possible that they go 0, 1, 2, ..., which is uniform but not very random. The only assumption it seems reasonable to make is that rand() puts out a Poisson distribution: any two nonoverlapping subintervals of the same size are equally likely and independent. For a finite set of values, this implies a uniform distribution and also ensures that the values of rand() are nicely scattered.

This means that the only correct way of changing the range of rand() is to divide it into boxes; for example, if RAND_MAX == 11 and you want a range of 1..6, you should assign {0,1} to 1, {2,3} to 2, and so on. These are disjoint, equally-sized intervals and thus are uniformly and independently distributed.

The suggestion to use floating-point division is mathematically plausible but suffers from rounding issues in principle. Perhaps double is high-enough precision to make it work; perhaps not. I don't know and I don't want to have to figure it out; in any case, the answer is system-dependent.

The correct way is to use integer arithmetic. That is, you want something like the following:
```C
#include <stdlib.h> // For random(), RAND_MAX

// Assumes 0 <= max <= RAND_MAX
// Returns in the closed interval [0, max]
long random_at_most(long max) {
  unsigned long
    // max <= RAND_MAX < ULONG_MAX, so this is okay.
    num_bins = (unsigned long) max + 1,
    num_rand = (unsigned long) RAND_MAX + 1,
    bin_size = num_rand / num_bins,
    defect   = num_rand % num_bins;

  long x;
  do {
   x = random();
  }
  // This is carefully written not to overflow
  while (num_rand - defect <= (unsigned long)x);

  // Truncated division is intentional
  return x/bin_size;
}
```

The loop is necessary to get a perfectly uniform distribution. For example, if you are given random numbers from 0 to 2 and you want only ones from 0 to 1, you just keep pulling until you don't get a 2; it's not hard to check that this gives 0 or 1 with equal probability. This method is also described in the link that nos gave in their answer, though coded differently. I'm using random() rather than rand() as it has a better distribution (as noted by the man page for rand()).

If you want to get random values outside the default range [0, RAND_MAX], then you have to do something tricky. Perhaps the most expedient is to define a function random_extended() that pulls n bits (using random_at_most()) and returns in [0, 2**n), and then apply random_at_most() with random_extended() in place of random() (and 2**n - 1 in place of RAND_MAX) to pull a random value less than 2**n, assuming you have a numerical type that can hold such a value. Finally, of course, you can get values in [min, max] using min + random_at_most(max - min), including negative values.
