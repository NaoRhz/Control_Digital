#ifndef BANDPASS_H
#define BANDPASS_H

#define N   3 
#define M   3

double controller(double Ek, double* b, double* a);
double BandPass(double Ek, double Ts, double time, double* aux);

#endif /*   LOWPASS_H   */  