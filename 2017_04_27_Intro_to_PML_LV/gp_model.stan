functions {
  vector gp_pred_rng(vector[] x_pred,
                     vector y,
                     vector[] x,
                     real alpha,
                     real length_scale,
                     real sigma) {
    vector[size(x_pred)] f_pred;
    int N_pred;
    int N;
    N_pred = size(x_pred);
    N = rows(y);

    {
      matrix[N, N] L_Sigma;
      vector[N] K_div_y;
      matrix[N, N_pred] k_x_x_pred;
      matrix[N, N_pred] v_pred;
      vector[N_pred] f_pred_mu;
      matrix[N_pred, N_pred] cov_f_pred;
      matrix[N_pred, N_pred] nug_pred;
      matrix[N, N] Sigma;
      Sigma = cov_exp_quad(x, alpha, length_scale);
      for (n in 1:N)
        Sigma[n, n] = Sigma[n,n] + square(sigma);
      L_Sigma = cholesky_decompose(Sigma);
      K_div_y = mdivide_left_tri_low(L_Sigma, y);
      K_div_y = mdivide_right_tri_low(K_div_y',L_Sigma)';
      k_x_x_pred = cov_exp_quad(x, x_pred, alpha, length_scale);
      f_pred_mu = (k_x_x_pred' * K_div_y); 
      v_pred = mdivide_left_tri_low(L_Sigma, k_x_x_pred);
      cov_f_pred = cov_exp_quad(x_pred, alpha, length_scale) - v_pred' * v_pred;
      nug_pred = diag_matrix(rep_vector(1e-12,N_pred));

      f_pred = multi_normal_rng(f_pred_mu, cov_f_pred + nug_pred);
    }
    return f_pred;
  }
}
data {
  int<lower=1> N;
  int<lower=1> D;
  int<lower=1> N_pred;
  vector[N] y;
  vector[D] x[N];
  vector[D] x_pred[N_pred];
}
parameters {
  real<lower=1e-12> length_scale;
  real<lower=0> alpha;
  real<lower=1e-12> sigma;
  vector[N] eta; 
}
transformed parameters {
  vector[N] f;
  {
     matrix[N, N] L_cov;
     matrix[N, N] cov;
     cov = cov_exp_quad(x, alpha, length_scale);
     for (n in 1:N)
       cov[n, n] = cov[n, n] + 1e-12;
     L_cov = cholesky_decompose(cov);
     f = L_cov * eta; 
  }
}
model {
  length_scale ~ student_t(4,0,1); # (df, mean, sd)
  alpha ~ normal(0, 1);
  sigma ~ normal(0, 1);
  eta ~ normal(0, 1);
  y ~ normal(f, sigma);
}
generated quantities {
  vector[N_pred] f_pred;
  vector[N_pred] y_pred;

  f_pred = gp_pred_rng(x_pred, y, x, alpha, length_scale, sigma);
  for (n in 1:N_pred)
    y_pred[n] = normal_rng(f_pred[n], sigma);
}
