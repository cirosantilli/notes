#!/usr/bin/env gnuplot

set terminal wxt size 1024,768
set logscale x
set logscale y

# Not very visible since the special point is plotted before others and gets hidden.
#set palette model RGB defined (0 'green', 1 'red')
#plot 'data' using 2:3:($1 == 895245 ? 0 : 1) palette lw 3

# Plot the special point at the end.
plot 'data' using 2:3 lw 3 lc rgb 'green',\
     'data' using 2:($1 == 895245 ? $3 : NaN) lw 3 lc rgb 'red'
