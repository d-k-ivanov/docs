### Dealing with: libGL.so,libGLU.so,libX11.so not found 
```
# If you face this warnings:
# >>> WARNING - libGL.so not found, refer to CUDA Getting Started Guide for how to find and install them. <<<
# >>> WARNING - libGLU.so not found, refer to CUDA Getting Started Guide for how to find and install them. <<<
# >>> WARNING - libX11.so not found, refer to CUDA Getting Started Guide for how to find and install them. <<<
# You sould pass apropriate lib path to GLPATH environment variable

GLPATH=/usr/lib make
GLPATH=/usr/lib32 make
GLPATH=/usr/lib64 make
```