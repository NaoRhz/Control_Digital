#ifndef LOWPASS_H
#define LOWPASS_H

#define N   2 
#define M   2

double controller(double E, double* b, double* a);
double LowPass(double Ek, double Ts, double time, double* aux);

#endif /*   LOWPASS_H   */  