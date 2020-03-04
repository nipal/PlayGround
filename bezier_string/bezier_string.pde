int[]  x  = new int[11];
int[]  y  = new int[11];

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
       for (int i = 8; i < 11; i++)
  {
    x[i] = x[i - 1] - 30 + int(random (120));
    y[i] = y[i - 1] - 30 + int(random (120));
  }
}

void draw()
{
  background(0);
    stroke(255,0,255);

  for (int i = 0; i < 7; i+=3)
  {
    bezier(x[i], y[i], x[i+ 1], y[i + 1],  x[i + 2], y[i + 2],  x[i + 3], y[i + 3]);
  }
  for (int i = 0; i<11; i++)
  {
  x[i] += random(5) - 2;
  y[i] += random(5) - 2;
  }
  
  x[4] = x[3] + x[3] - x[2];
  y[4] = y[3] + y[3] - y[2];
  
  x[7] = x[6] + x[6] - x[5];
    y[7] = y[6] + y[6] - y[5];
}
