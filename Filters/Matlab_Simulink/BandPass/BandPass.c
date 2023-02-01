#include "BandPass.h"

double BandPass(double Ek, double Ts, double time, double* aux){
    
    static int k=0;
    static double Xk=0;

    double b[M]={0.0, 0.6118, -0.56240};
    double a[N]={0.0, 0.5275, -0.02093};

    if(time < Ts){
        k=0;
    }
    else if(time >= k*Ts){
        Xk=controller(Ek, b, a);
        k=k+1;
        *aux=k*Ts;
    }
    return Xk;
}

double controller(double E, double* b, double* a){
    
    static int init_arrays = 0;
    static float U[N];
    static float E_values[M];

    if(!init_arrays){
        for(int i=0;i<N; i++) U[i]=0;
        for(int i=0;i<M; i++) E_values[i]=0;
        init_arrays = 1;
    }

    E_values[0]=E;

    float sum_Ek, sum_Uk;

    sum_Ek=0;
    sum_Uk=0;

    for(int k=0; k<M; k++)  sum_Ek = sum_Ek + b[k]*E_values[k]; 
    for(int k=0; k<N; k++)  sum_Uk = sum_Uk + a[k]*U[k];

    U[0]=sum_Ek+sum_Uk;

    for(int k=(M-1); k>0; k--)  E_values[k]=E_values[k-1]; 
    for(int k=(N-1); k>0; k--)  U[k]=U[k-1];
   
    return U[0];
}