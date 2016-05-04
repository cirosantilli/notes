# GPU

## External GPU

Powerful desktop GPU connected to a laptop externally.

<https://www.youtube.com/watch?v=bP_8EYQ-2RA>

## ISA

## Instruction set

AMD yes kind of, NVIDIA only higher levels:

- <http://stackoverflow.com/questions/1697842/do-graphic-cards-have-instruction-sets-of-their-own>
- <http://stackoverflow.com/questions/20341502/what-instruction-set-does-the-nvidia-geforce-6xx-series-use>
- <http://stackoverflow.com/questions/3677220/is-it-possible-to-put-assembly-instructions-into-cuda-code/7072079#7072079>
- <http://stackoverflow.com/questions/4660974/how-to-create-or-manipulate-gpu-assembler>
- <http://superuser.com/questions/668019/how-do-device-driver-instructions-program-the-gpu>
- <http://stackoverflow.com/questions/9798258/what-is-sass-short-for?lq=1>
- <http://stackoverflow.com/questions/9798258/what-is-sass-short-for>

In most cases: vendors implement public APIs like OpenGL, CUDA, OpenCL, etc. as closed source, and give you a driver blob that talks to the GPU.

### SPIR

Standardized intermediate language (bytecode) by Khronos for both graphics and compute.

OpenCL and shaders can compile to it.

<https://www.khronos.org/spir>. Has LLVM implementation.

<https://streamcomputing.eu/blog/2013-12-27/opencl-spir-by-example/>

Has 2 profiles, graphics and compute

Vulkan compute shaders support it. AMD and NVIDIA are likely to support Vulkan well. Result: we can compile OpenCL and CUDA to SPIR-V, and run it on either NVIDIA or AMD.

But there are 2 profiles: graphics and compute, and Vulkan only requires the graphics profile.

Also made allow obfuscating kernel code.

OpenCL and Vulkan can interact with it.

### ARB assembly

https://en.wikipedia.org/wiki/ARB_assembly_language

### AMD-IL

TODO

### PTX

TODO NVIDIA? Also virtual, i.e., gets compiled

#### SASS

TODO http://stackoverflow.com/questions/9798258/what-is-sass-short-for

## Shading language

## GPGPU

Before GPGPUs, came shading languages, which are compiled C-like languages which do arbitrary shading algorithms.

### PhysX

<https://en.wikipedia.org/wiki/PhysX>

## AMD

Top consoles use it instead of NVIDIA, it seems that they license IP:

- <https://en.wikipedia.org/wiki/PlayStation_4> semi custom AMD
- <https://en.wikipedia.org/wiki/Xbox_One>

### GPUOpen

<https://en.wikipedia.org/wiki/GPUOpen>

<https://en.wikipedia.org/wiki/GPUOpen#AMD_Boltzmann_Initiative>

<http://gpuocelot.gatech.edu/>

Presentation video: <https://www.youtube.com/watch?v=Y0oBFeFUG4w>

## Conferences
