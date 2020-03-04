int n_bezier = 4;
int n_dot = 8;
//float[][] x = new float[n_bezier][n_dot];
//float[][] y = new float[n_bezier][n_dot];

float[]  x  = new float[n_dot];
float[]  y  = new float[n_dot];
float noise = 0;
void setup()
{
  background(0);
  noFill();
  size(800, 800);
  //for (int b_i = 0; b_i < n_bezier; b_i++)
  //{
      x[0] = int(450);
      y[0] = int(450);
      for (int i = 1; i < n_dot - 1; i++)
      {
          x[i] = x[i - 1] + int(random (10));
          y[i] = y[i - 1] + int(random (10));
      }
      x[n_dot - 2] = 550;
      y[n_dot - 2] = 550;
  //}
}

void draw()
{
     //print(noise(noise) + "\n");
      background(0);
        stroke(255,0,255);
    
      for (int i = 0; i < n_dot - 2; i+=3)
      {
        bezier(x[i], y[i], x[i+ 1], y[i + 1],  x[i + 2], y[i + 2],  x[i + 3], y[i + 3]);
        for (int j = 0; j < 3; j+=1)
        {
          for (int k = 0; k < 3; k += 1)
          {
            stroke(k*j / (j + 1) + k * 10,k * j * 10,k*(j+k) * 10);
            bezier(x[i] + j, y[i] + k, x[i+ 1] + j, y[i + 1] + k,  x[i + 2] + j, y[i + 2] + k,  x[i + 3] + j, y[i + 3] + k);
            stroke(k*(j+k) * 10,k*j / (j + 1) + k * 10,k * j * 10);
            bezier(x[i] - j, y[i] + k, x[i+ 1] - j, y[i + 1] + k,  x[i + 2] - j, y[i + 2] + k,  x[i + 3] - j, y[i + 3] + k);
            stroke(k * j * 10,k*(j+k) * 10,k*j / (j + 1) + k * 10);
            bezier(x[i] + j, y[i] - k, x[i+ 1] + j, y[i + 1] - k,  x[i + 2] + j, y[i + 2] - k,  x[i + 3] + j, y[i + 3] - k);
            stroke(j*(j+k) * 10,k*j / (j + 1) + k * 10,k * j * 10);
            bezier(x[i] - j, y[i] - k, x[i+ 1] - j, y[i + 1] - k,  x[i + 2] - j, y[i + 2] - k,  x[i + 3] - j, y[i + 3] - k);
          }
        }


      }
      for (int i = 1; i<n_dot - 2; i++)
      {
       
          x[i] = noise(noise + i * 1000) * 200 - 100 + 500;
          y[i] = noise(noise + 1000 + i * 1000) * 200 - 100 + 500;
          
      }
      //print(y[1] + "\n");
      for (int i = 4; i < n_dot - 1; i+= 3)
      {
        x[i] = x[i - 1] + x[i - 1] - x[i - 2];
        y[i] = y[i - 1] + y[i - 1] - y[i - 2];
      }
      
      //x[7] = x[6] + x[6] - x[5];
      //  y[7] = y[6] + y[6] - y[5];
       noise += 0.008;
}
