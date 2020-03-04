int n_bezier = 196;
int n_dot = 20;
float[][] x = new float[n_bezier][n_dot];
float[][] y = new float[n_bezier][n_dot];
float[] x_orig = new float[12];
float[] y_orig = new float[12];
float[] x_dest = new float[12];
float[] y_dest = new float[12];

float noise = 0;
//float[] perlin_lt = 
void setup()
{
  
  background(0);
  noFill();
  size(768, 768);
  for (int b_i = 0; b_i < n_bezier; b_i++)
  {
      x[b_i][0] = 8 + 50 * (b_i % sqrt(n_bezier));
      y[b_i][0] = 8 + 50 * int((b_i / (sqrt(n_bezier))));
      for (int i = 1; i < n_dot - 1; i++)
      {
          x[b_i][i] = x[b_i][i - 1] + int(random (10));
          y[b_i][i] = y[b_i][i - 1] + int(random (10));
      }
      x[b_i][n_dot - 2] = x[b_i][0] + 100;
      y[b_i][n_dot - 2] = y[b_i][0] + 100;
  }
}

void draw()
{
     //print(noise(noise) + "\n");
      background(0);
      stroke(255,0,255);
      
      for (int b_i = 0; b_i < n_bezier; b_i++)
      {
              for (int i = 0; i < n_dot - 2; i+=3)
              {
                stroke((x[b_i][i])/noise,noise * (y[b_i][i])/3, noise - (x[b_i][i+ 1])/3);
                bezier(x[b_i][i], y[b_i][i], x[b_i][i+ 1], y[b_i][i + 1],  x[b_i][i + 2], y[b_i][i + 2],  x[b_i][i + 3], y[b_i][i + 3]);
                for (int j = 0; j < 3; j+=1)
                {
                  for (int k = 0; k < 3; k += 1)
                  {
                    //stroke(255 - (x[b_i][i] + j)/3,(y[b_i][i] + k)/3, (x[b_i][i+ 1] + j)/3);
                    //bezier(x[b_i][i] + j, y[b_i][i] + k, x[b_i][i+ 1] + j, y[b_i][i + 1] + k,  x[b_i][i + 2] + j, y[b_i][i + 2] + k,  x[b_i][i + 3] + j, y[b_i][i + 3] + k);
                    //stroke((y[b_i][i + 1] + k)/3,  (x[b_i][i + 2] - j)/3, 255- (y[b_i][i + 2] + k)/3);
                    //bezier(x[b_i][i] - j, y[b_i][i] + k, x[b_i][i+ 1] - j, y[b_i][i + 1] + k,  x[b_i][i + 2] - j, y[b_i][i + 2] + k,  x[b_i][i + 3] - j, y[b_i][i + 3] + k);
                    //stroke(k * j * 10,k*(j+k) * 10,k*j / (j + 1) + k * 10);
                    //bezier(x[b_i][i] + j, y[b_i][i] - k, x[b_i][i+ 1] + j, y[b_i][i + 1] - k,  x[b_i][i + 2] + j, y[b_i][i + 2] - k,  x[b_i][i + 3] + j, y[b_i][i + 3] - k);
                    //stroke((x[b_i][i + 2] - j)/3, 255- (y[b_i][i + 2] - k)/3,  (x[b_i][i + 3] - j)/3);
                    //bezier(x[b_i][i] - j, y[b_i][i] - k, x[b_i][i+ 1] - j, y[b_i][i + 1] - k,  x[b_i][i + 2] - j, y[b_i][i + 2] - k,  x[b_i][i + 3] - j, y[b_i][i + 3] - k);
                  }
                }
              }
              for (int i = 1; i<n_dot - 2; i++)
              {
                  x[b_i][i] = noise(noise + i * 1000 + b_i * 1000) * 100 - 00 + x[b_i][0];
                  y[b_i][i] = noise(noise + 1000 + i * 1000 + b_i * 1000) * 100 - 00 + y[b_i][0];
                  //x[b_i][i] += random(5) - 2;
                  //y[b_i][i] += random(5) - 2;
              }
              for (int i = 4; i < n_dot - 1; i+= 3)
              {
                x[b_i][i] = x[b_i][i - 1] + x[b_i][i - 1] - x[b_i][i - 2];
                y[b_i][i] = y[b_i][i - 1] + y[b_i][i - 1] - y[b_i][i - 2];
              }
      }
       noise += 0.02;
       if (noise > 1)
         noise = 0;
}
