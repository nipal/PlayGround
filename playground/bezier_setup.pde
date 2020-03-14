void bezier_setup()
{
    for (int b_i = 0; b_i < n_bezier; b_i++)
  {

      x[b_i][0] = x_orig[b_i % n_cluster];
      y[b_i][0] = y_orig[b_i % n_cluster];
      for (int i = 1; i < n_dot - 1; i++)
      {
          x[b_i][i] = x[b_i][i - 1] + int(30);
          y[b_i][i] = y[b_i][i - 1] + int(20);
      }
      x[b_i][n_dot - 2] = x_dest[b_i % n_cluster];
      y[b_i][n_dot - 2] = y_dest[b_i % n_cluster];
  }
}
