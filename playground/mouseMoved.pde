void        mouseDragged()
{
    //if (mousePressed == true)
    //{
    println("lol");
        for (int i = 0; i < 12; i++)
        {
            if (pmouseX > x_orig[i] && pmouseX < x_dest[i]
                && pmouseY > y_orig[i] && pmouseY < y_dest[i])
                {
                    x_orig[i] += mouseX - pmouseX;
                    y_orig[i] += mouseY - pmouseY;
                    x_dest[i] += mouseX - pmouseX;
                    y_dest[i] += mouseY - pmouseY;
                    for (int b_i = 0; b_i < n_bezier; b_i++)
                    {
                        if (b_i % 12 == i)
                            for (int j = 0; j < n_dot; j++)
                            {
                                x[b_i][j] += mouseX - pmouseX;
                                y[b_i][j] += mouseY - pmouseY;
                                
                            }
                    }
                    break;
                }
        }
    //}
}
