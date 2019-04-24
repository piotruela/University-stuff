// ConsoleApplication1.cpp : Defines the entry point for the console application.
//
#include "stdafx.h"
#include <iostream>
#include <math.h>
#include <time.h>
#include <Windows.h>



double fRand(double fMin, double fMax)
{
	double f = (double)rand() / RAND_MAX;
	return fMin + f * (fMax - fMin);
}

int losujX1(double randNumber)
{
	if (randNumber < 0.3)
		return 1;
	if (randNumber < 0.5)
		return 2;
	if (randNumber < 0.7)
		return 3;
	else
		return 4;
}
int losujX2(int x1, double randNumber) {
	if (x1 == 1) {
		if (randNumber < 0.2 / 0.3)
			return 2;
		else
			return 4;
	}
	else if ((x1 == 2) || (x1 == 4))
		return 1;
	else
		return 4;
}

int main()
{
	int rozklad[4][4];
	for (int i = 0; i < 4; i++)
		for (int j = 0; j < 4; j++)
			rozklad[i][j] = 0;
	srand(time(NULL));
	for (int i = 0; i < 100000; i++) {
		int x1 = losujX1((double)rand() / RAND_MAX);
		int x2 = losujX2(x1, (double)rand() / RAND_MAX);
		rozklad[x1 - 1][x2 - 1]++;
	}
	for (int i = 0; i < 4; i++) {
		for (int j = 0; j < 4; j++)
			printf("%i ", rozklad[i][j]);
		printf("\n");
	}
	return 0;
}

