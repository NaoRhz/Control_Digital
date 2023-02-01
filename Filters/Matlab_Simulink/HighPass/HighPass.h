#ifndef HIGHPASS_H
#define HIGHPASS_H

#define N   2 
#define M   2

double controller(double E, double* b, double* a);
double HighPass(double Ek, double Ts, double time, double* aux);

#endif /*   HIGHPASS_H   */  