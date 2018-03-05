### C
```c
#include <stdio.h>
 
int ackermann(int m, int n)
{
   if (!m) return n + 1;
   if (!n) return ackermann(m - 1, 1);
   return ackermann(m - 1, ackermann(m, n - 1));
}
 
int main()
{
   int m, n;
   for (m = 0; m <= 4; m++)
      for (n = 0; n < 6 - m; n++)
         printf("A(%d, %d) = %d\n", m, n, ackermann(m, n));

   return 0;
}
```

### C++
```c++
#include <iostream>
 
unsigned int ackermann(unsigned int m, unsigned int n) {
  if (m == 0) {
    return n + 1;
  }
  if (n == 0) {
    return ackermann(m - 1, 1);
  }
  return ackermann(m - 1, ackermann(m, n - 1));
}
 
int main() {
  for (unsigned int m = 0; m < 4; ++m) {
    for (unsigned int n = 0; n < 30; ++n) {
      std::cout << "A(" << m << ", " << n << ") = " << ackermann(m, n) << "\n";
    }
  }
}
```
