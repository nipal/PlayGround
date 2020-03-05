void rawMidi(byte[] data) { // You can also use rawMidi(byte[] data, String bus_name)
  int x, y, status, chan, value;
  
  if (data.length == 3){
      status = data[0];
      chan = data[1];
      value = data[2];
      
      if (13 <= chan && chan <= 20){
        y = 0;
        x = chan - 13;
      } else if (29 <= chan && chan <= 36){
        y = 1;
        x = chan - 29;
      } else if (49 <= chan && chan <= 56){
        y = 2;
        x = chan - 49;
      } else if (77 <= chan && chan <= 84){
        y = 3;
        x = chan - 77;
      } else if (41 <= chan && chan <= 44){
        y = 4;
        x = chan - 41;
      } else if (57 <= chan && chan <= 60){
        y = 4;
        x = chan - 57 + 4;
      } else if (73 <= chan && chan <= 76){
        y = 5;
        x = chan - 73;
      } else if (89 <= chan && chan <= 92){
        y = 5;
        x = chan - 89 + 4;
      } else{
        y = 0;
        x = 0;
      }
      launchpad[x][y] = value;
      //println("chan[", x, "]: ", get_freq(x), " ", get_amp(x));
      //println("launchpad[", x, "][", y, "]:", value);
  }

}
