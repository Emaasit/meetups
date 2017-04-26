data {
  int<lower = 1> D;      // dim of dataset
  int<lower=1> N;       // sample size of training set
  matrix[N, D] x;      // obs of training set
  vector[N] y;         // response of training set

  int<lower=1> N_pred;       // sample size of test set
  matrix[N_pred, D] x_pred;     // obs of test set
}
parameters {
  real intercept;
  vector[D] slope;
  real<lower=0> sigma;
}
model {
  intercept ~ normal(0, 10);     // prior on eta
  slope ~ normal(0, 10);     // prior
  sigma ~ cauchy(0, 10);   // prior

  y ~ normal(x * slope + intercept, sigma);
}
generated quantities {
  vector[N_pred] y_pred;
  for (n in 1:N_pred)
    y_pred[n] = normal_rng(x_pred[n] * slope + intercept, sigma);
}
