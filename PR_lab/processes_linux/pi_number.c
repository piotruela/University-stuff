#include <stdio.h>
#include <stdlib.h>
#include <time.h>
#include <math.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/wait.h>


int main() 
{ 
    int fd[2];
    double val;
    double tab[10]={0,0,0,0,0,0,0,0,0,0};
    pipe(fd);
    for(int i=0;i<10;i++)  
    { 
        if(fork() == 0) 
        { 
            close(fd[0]);
            double value = (time(NULL) ^ (getpid()<<16));
            srand(value);
            double circle = 0;
	        double square = 0;
	        double pi_number;

	        double circle_r = 1;
		    for (int j = 0; j < 10000000; j++)
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
            printf("%i: %lf\n", i, pi_number);
            write(fd[1], &pi_number, sizeof(pi_number));
            close(fd[1]);
            exit(0); 
        } 
    } 
    for(int i=0;i<10;i++) 
    {
        close(fd[1]);
        read(fd[0], &val, sizeof(val));
        tab[i] = val;
    }     
    wait(0);
    double sum = 0;
    for(int i=0;i<10;i++) 
    {
        sum += tab[i];
    }
    printf("Srednia z 10 wartosci: %lf \n", sum/10.0);
    return 0;
} 
    
