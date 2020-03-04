float[]  x  = new float[11];
float[]  y  = new float[11];
float noise = 0;
void setup()
{
  background(0);
  noFill();
  size(800, 800);
  x[0] = int(200);
  y[0] = int(200);
  for (int i = 1; i < 3; i++)
  {
    x[i] = x[i - 1] - 30 + int(random (120));
    y[i] = y[i - 1] - 30 + int(random (120));
  }
  x[3] = x[2] + x[2] - x[1];
  y[3] = y[2] + y[2] - y[1];
    for (int i = 4; i < 7; i++)
  {
    x[i] = x[i - 1] - 30 + int(random (120));
    y[i] = y[i - 1] - 30 + int(random (120));
  }
  x[7] = x[6] + x[6] - x[5];
    y[7] = y[6] + y[6] - y[5];
       for (int i = 8; i < 10; i++)
  {
    x[i] = x[i - 1] - 30 + int(random (120));
    y[i] = y[i - 1] - 30 + int(random (120));
  }
  x[10] = 600;
  y[10] = 600;
}

void draw()
{
     //print(noise(noise) + "\n");
      background(0);
        stroke(255,0,255);
    
      for (int i = 0; i < 9; i+=3)
      {
        bezier(x[i], y[i], x[i+ 1], y[i + 1],  x[i + 2], y[i + 2],  x[i + 3], y[i + 3]);
        for (int j = 0; j < 9; j+=1)
        {
          for (int k = 0; k < 9; k += 1)
          {
            stroke(k*j / (j + 1) + k,k * j,k*(j+k));
            bezier(x[i] + j, y[i] + k, x[i+ 1] + j, y[i + 1] + k,  x[i + 2] + j, y[i + 2] + k,  x[i + 3] + j, y[i + 3] + k);
            bezier(x[i] - j, y[i] + k, x[i+ 1] - j, y[i + 1] + k,  x[i + 2] - j, y[i + 2] + k,  x[i + 3] - j, y[i + 3] + k);
            bezier(x[i] + j, y[i] - k, x[i+ 1] + j, y[i + 1] - k,  x[i + 2] + j, y[i + 2] - k,  x[i + 3] + j, y[i + 3] - k);
            bezier(x[i] - j, y[i] - k, x[i+ 1] - j, y[i + 1] - k,  x[i + 2] - j, y[i + 2] - k,  x[i + 3] - j, y[i + 3] - k);
          }
        }


      }
      for (int i = 1; i<9; i++)
      {
       
          x[i] = noise(noise + i * 1000) * 600 + 200;
          y[i] = noise(noise + 1000 + i * 1000) * 600 + 200;
          
      }
      //print(y[1] + "\n");
      x[4] = x[3] + x[3] - x[2];
      y[4] = y[3] + y[3] - y[2];
      
      x[7] = x[6] + x[6] - x[5];
        y[7] = y[6] + y[6] - y[5];
       noise += 0.002;
}
