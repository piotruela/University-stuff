// ConsoleApplication1.cpp : Defines the entry point for the console application.
//
#include "stdafx.h"
#include <iostream>
#include <math.h>


int main()
{
	int rozklad[] = { 0,0,0,0,0,0,0,0,0,0 };
	int a = 69069;
	int c = 1;
	int X = 15;
	long long int M = pow(2, 31);
	long long  int number = X;
	long long int index = floor(number * 10 / M);
	rozklad[index]++;
	for (int i = 0; i < 100000; i++)
	{
		number = (a*number + c) % M;
		index = floor(number * 10 / M);
		//std::cout << number * 10 / M << std::endl;
		rozklad[index]++;
	}
	for (int i = 0; i < 10; i++)
	{
		std::cout << rozklad[i]<<std::endl;
	}
	/*
	int p = 7;
	int q = 3;
	int number[31];
	int rozklad2[] = { 0,0,0,0,0,0,0,0,0,0 };
	long long int M2 = pow(2, 31);
	long long int generatedNumber = 0;
	number[0] = 1;
	number[1] = 0;
	number[2] = 1;
	number[3] = 0;
	number[4] = 0;
	number[5] = 0;
	number[6] = 1;
	for (int i = 7; i < 31; i++)
	{
		number[i] = (number[i - p] + number[i - q]) % 2;
	}
	for (int j = 0; j < 100000; j++)
	{
		int multi = 1;
		/*for (int i = 0; i < 31; i++)
		{
			std::cout << number[i];// << std::endl;
		}
		//std::cout << std::endl;
		generatedNumber = 0;
		for (int i = 0; i < 31; i++) //zamiana liczby z binarnej na 10-ną
		{
			generatedNumber += number[i] * multi;// << std::endl;
			multi += multi;
		}
		int index = floor(generatedNumber * 10 / M2);
		rozklad2[index]++;
		for (int i = 0; i < 30; i++)
		{
			number[i] = number[i + 1];
		}
		number[30] = (number[23] + number[27]) % 2;
	}
	for (int i = 0; i < 10; i++)
	{
		std::cout << rozklad2[i] << std::endl;
	}
	//std::cout << generatedNumber;*/
	return 0;
}

