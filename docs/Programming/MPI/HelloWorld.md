### Hello World
* C
```c
#include <stdio.h>
#include <mpi.h>

main(int argc, char **argv)
{
   int node;
   char hostname[256];
   
   MPI_Init(&argc,&argv);
   MPI_Comm_rank(MPI_COMM_WORLD, &node);

   gethostname(hostname,255);
   printf("Hello World from process %d on %s\n",node, hostname);
            
   MPI_Finalize();
   
   return 0;
}
```
* RUN
```bash
#!/bin/bash
#$ -l mem=1G
#$ -l h_rt=0:15:00
#$ -pe mpi-fill 8
#$ -cwd

echo -n "Start at $(date +%Y-%m-%d-%H-%M-%S)"
mpirun ./helloworld
echo -n "Finish at $(date +%Y-%m-%d-%H-%M-%S)"
```
