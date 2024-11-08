set.seed(42)

x1 <- rnorm(5,mean=2)
x2 <- rnorm(5,mean=3)

tt <- t.test(x1,x2)

reps <- 1000
p_val_rep <- 0
for(i in 1:reps){
  x1_rep <- rnorm(5)
  x2_rep <- rnorm(5)
  t_stat_rep <- t.test(x1_rep,x2_rep)$statistic
  p_val_rep <- p_val_rep + (abs(t_stat_rep) > abs(tt$statistic))
}

p_val_rep <- p_val_rep/reps

print(paste('p-val:',tt$p.value,'sim p-val:',p_val_rep))