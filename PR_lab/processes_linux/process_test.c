#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <math.h>
#include <unistd.h>

int main()
{
    int fd[2];
    double val;
    double tab[10]={0,0,0,0,0,0,0,0,0,0};
    double sum = 0;
    // create pipe descriptors
    pipe(fd);


    for (int i=0;i<10;i++)
    {
        // fork() returns 0 for child process, child-pid for parent process.
        if (fork() != 0)
        {
            close(fd[0]);
            srand(getpid()+i);
            double circle = 0;
	        double square = 0;
	        double pi_number;

	        double circle_r = 1;
		    for (int i = 0; i < 100000; i++)
		    {
                double a = (double)rand()/ RAND_MAX*1.0;
                a *= a;
                double b = (double)rand()/ RAND_MAX*1.0;
                b *= b;
			    if (a + b <= circle_r)
				    circle++;
			    square++;
		    }
		    pi_number = (circle / square) * 4;

            write(fd[1], &pi_number, sizeof(pi_number));

            close(fd[1]);
            break;
        }
        else
        {   

            close(fd[1]);
            
            // now read the data (will block)
            read(fd[0], &val, sizeof(val));
            tab[i] = val;
            if(i == 9)
            {
                for(int k = 0; k<10;k++)
                {
                    sum += tab[k];
                }
                printf("%lf %lf", sum, sum/10.0);
            }
		   
	    // close the read-descriptor
            close(fd[0]);
        }
    }
    return 0;
}
