#!/usr/bin/env gnuplot

set terminal wxt size 1024,768
set logscale x
set logscale y

set pm3d map

# Not very visible since the special point is plotted before others and gets hidden.
#set palette model RGB defined (0 'green', 1 'red')
#plot 'data' using 2:3:($1 == 895245 ? 0 : 1) palette lw 3

# Plot the special point at the end.
splot 'data'
