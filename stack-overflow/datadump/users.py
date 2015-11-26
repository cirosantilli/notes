#!/usr/bin/env python

import scipy as sp
import scipy.stats as st

x = sp.loadtxt('data', usecols=(1,2))
print st.pearsonr(x[:,0], x[:,1])
