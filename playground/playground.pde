import themidibus.*;

// midi shit
MidiBus bus;

int[][] launchpad = {{0, 0, 0, 0, 0, 0, 0, 0},
                      {0, 0, 0, 0, 0, 0, 0, 0},
                      {0, 0, 0, 0, 0, 0, 0, 0},
                      {0, 0, 0, 0, 0, 0, 0, 0},
                      {0, 0, 0, 0, 0, 0, 0, 0},
                      {0, 0, 0, 0, 0, 0, 0, 0},
                      {0, 0, 0, 0, 0, 0, 0, 0},
                      {0, 0, 0, 0, 0, 0, 0, 0}};

// Bezier shit bro
int n_bezier = 24;
int n_dot = 8;
float[][] x = new float[n_bezier][n_dot];
float[][] y = new float[n_bezier][n_dot];
float[] x_orig = {102, 246, 390, 486, 318, 54, 54, 150, 438, 534, 630, 654};
float[] y_orig = {48, 48, 24, 48, 192, 312, 384, 360, 384, 336, 288, 360};
float[] x_dest = {x_orig[0] + 60,x_orig[1] + 60,x_orig[2] + 60,x_orig[3] + 60,x_orig[4] + 60,x_orig[5] + 60,
                  x_orig[6] + 60,x_orig[7] + 60,x_orig[8] + 60,x_orig[9] + 60,x_orig[10] + 60,x_orig[11] + 60};
float[] y_dest = {y_orig[0] + 20, y_orig[1] + 20, y_orig[2] + 20, y_orig[3] + 20, y_orig[4] + 20, y_orig[5] + 20,
                  y_orig[6] + 20, y_orig[7] + 20, y_orig[8] + 20, y_orig[9] + 20, y_orig[10] + 20, y_orig[11] + 20};

// noise and color shit
float noise = 0;
int  cr = 0;
int  cg = 85;
int  cb = 170;
int cr_s = 1;
int cg_s = 1;
int cb_s = 1;
//float[] perlin_lt =

void setup()
{
  
  background(0);
  noFill();
  size(768, 432);
  bezier_setup();
  bus.list();
  bus = new MidiBus(this, 1, 0);
}



void draw()
{
     //print(noise(noise) + "\n");
      background(0);
      stroke(255,0,255);
        //fill(random(255),random(255),random(255));

      for (int b_i = 0; b_i < n_bezier; b_i++)
      {
              for (int i = 0; i < n_dot; i++)
              {
                rect(x[b_i][i], y[b_i][i],3, 3);
              }
              for (int i = 0; i < n_dot - 2; i+=3)
              {
                stroke((width - x[b_i][i] + y[b_i][i])*cr/width,cg * (y[b_i][i])/height, cb * (x[b_i][i+ 1])/width);
                stroke((width - x[b_i][i] + y[b_i][i])*cr/width + launchpad[0][0],cg * (y[b_i][i])/height + launchpad[0][1], cb * (x[b_i][i+ 1])/width + launchpad[0][2]);
                bezier(x[b_i][i], y[b_i][i], x[b_i][i+ 1], y[b_i][i + 1],  x[b_i][i + 2], y[b_i][i + 2],  x[b_i][i + 3], y[b_i][i + 3]);
                for (int j = 0; j < 2; j+=1)
                {
                  for (int k = 0; k < 2; k += 1)
                  {
                    stroke((width - x[b_i][i] + y[b_i][i])*cr/width + launchpad[0][0],cg * (y[b_i][i])/height + launchpad[0][1], cb * (x[b_i][i+ 1])/width + launchpad[0][2]);
                    bezier(x[b_i][i] + j, y[b_i][i] + k, x[b_i][i+ 1] + j, y[b_i][i + 1] + k,  x[b_i][i + 2] + j, y[b_i][i + 2] + k,  x[b_i][i + 3] + j, y[b_i][i + 3] + k);
                    stroke((y[b_i][i + 1] + k)/3,  (x[b_i][i + 2] - j)/3, 255- (y[b_i][i + 2] + k)/3);
                    bezier(x[b_i][i] - j, y[b_i][i] + k, x[b_i][i+ 1] - j, y[b_i][i + 1] + k,  x[b_i][i + 2] - j, y[b_i][i + 2] + k,  x[b_i][i + 3] - j, y[b_i][i + 3] + k);
                    stroke(k * j * 10,k*(j+k) * 10,k*j / (j + 1) + k * 10);
                    bezier(x[b_i][i] + j, y[b_i][i] - k, x[b_i][i+ 1] + j, y[b_i][i + 1] - k,  x[b_i][i + 2] + j, y[b_i][i + 2] - k,  x[b_i][i + 3] + j, y[b_i][i + 3] - k);
                    stroke((x[b_i][i + 2] - j)/3, 255- (y[b_i][i + 2] - k)/3,  (x[b_i][i + 3] - j)/3);
                    bezier(x[b_i][i] - j, y[b_i][i] - k, x[b_i][i+ 1] - j, y[b_i][i + 1] - k,  x[b_i][i + 2] - j, y[b_i][i + 2] - k,  x[b_i][i + 3] - j, y[b_i][i + 3] - k);
                  }
                }
              }
              for (int i = 1; i<n_dot - 2; i++)
              {
                  //x[b_i][i] = noise(noise + i * 1000 + b_i * 10000) * 100 - 00 + x[b_i][0];
                  //y[b_i][i] = noise(noise + 1000 + i * 1000 + b_i * 10000) * 100 - 00 + y[b_i][0];
                  if (b_i % 12 == 0 || b_i % 12 == 1)
                  {
                      x[b_i][i] = noise(noise + i * 1000 + b_i * 10000) * (200 * launchpad[1][3] / 128) - (100 * launchpad[1][3] / 128) + x[b_i][0];
                      y[b_i][i] = noise(noise + 1000 + i * 1000 + b_i * 10000)* (200 * launchpad[1][3] / 128) - (100 * launchpad[1][3] / 128) + y[b_i][0];
                      x[b_i][i] += random(launchpad[0][3] / 2 * 2 + 1) - launchpad[0][3] / 2;
                      y[b_i][i] += random(launchpad[0][3] / 2 * 2 + 1) - launchpad[0][3] / 2;
                  }
                  if (b_i % 12 == 2 || b_i % 12 == 3)
                  {
                      x[b_i][i] = noise(noise + i * 1000 + b_i * 10000) * (200 * launchpad[3][3] / 128) - (100 * launchpad[3][3] / 128) + x[b_i][0];
                      y[b_i][i] = noise(noise + 1000 + i * 1000 + b_i * 10000) * (200 * launchpad[3][3] / 128) - (100 * launchpad[3][3] / 128) + y[b_i][0];
                      x[b_i][i] += random(launchpad[2][3] / 2 * 2 + 1) - launchpad[2][3] / 2;
                      y[b_i][i] += random(launchpad[2][3] / 2 * 2 + 1) - launchpad[2][3] / 2;
                  }
                  if (b_i % 12 == 5 || b_i % 12 == 6 || b_i % 12 == 7)
                  {
                      x[b_i][i] = noise(noise + i * 1000 + b_i * 10000) * (200 * launchpad[5][3] / 128) - (100 * launchpad[5][3] / 128) + x[b_i][0];
                      y[b_i][i] = noise(noise + 1000 + i * 1000 + b_i * 10000)  * (200 * launchpad[5][3] / 128) - (100 * launchpad[5][3] / 128)  + y[b_i][0];
                      x[b_i][i] += random(launchpad[4][3] / 2 * 2 + 1) - launchpad[4][3] / 2;
                      y[b_i][i] += random(launchpad[4][3] / 2 * 2 + 1) - launchpad[4][3] / 2;
                  }
                  if (b_i % 12 == 8 || b_i % 12 == 9 || b_i % 12 == 10 || b_i % 12 == 11)
                  {
                      x[b_i][i] = noise(noise + i * 1000 + b_i * 10000)  * (200 * launchpad[7][3] / 128) - (100 * launchpad[7][3] / 128) + x[b_i][0];
                      y[b_i][i] = noise(noise + 1000 + i * 1000 + b_i * 10000)  * (200 * launchpad[7][3] / 128) - (100 * launchpad[7][3] / 128) + y[b_i][0];
                      x[b_i][i] += random(launchpad[6][3] / 2 * 2 + 1) - launchpad[6][3] / 2;
                      y[b_i][i] += random(launchpad[6][3] / 2 * 2 + 1) - launchpad[6][3] / 2;
                  }
                  if (b_i % 12 == 4)
                  {
                      x[b_i][i] = noise(noise + i * 1000 + b_i * 10000) * (36) + x[b_i][0];
                      y[b_i][i] = noise(noise + 1000 + i * 1000 + b_i * 10000) * (36) + y[b_i][0];
                  }
                  //x[b_i][i] = noise(noise + i * 1000 + b_i * 1000) * 768;
                  //y[b_i][i] = noise(noise + 1000 + i * 1000 + b_i * 1000) * 768;
              }
              for (int i = 4; i < n_dot - 1; i+= 3)
              {
                x[b_i][i] = x[b_i][i - 1] + x[b_i][i - 1] - x[b_i][i - 2];
                y[b_i][i] = y[b_i][i - 1] + y[b_i][i - 1] - y[b_i][i - 2];
              }
      }
       noise += 0.02;
       cr += cr_s;
       cr_s = cr > 255 || cr < 0 ? -cr_s : cr_s;
       cg += cg_s;
       cg_s = cg > 255 || cg < 0 ? -cg_s : cg_s;
       cb += cb_s;
       cb_s = cb > 255 || cb < 0 ? -cb_s : cb_s;
}
