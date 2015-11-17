#!/usr/bin/env Rscript

A = read.table('data')[,2:3]
cor(A, method='pearson')
