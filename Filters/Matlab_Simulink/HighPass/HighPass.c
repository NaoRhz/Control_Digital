#include "HighPass.h"

double HighPass(double Ek, double Ts, double time, double* aux){    
    
    static int k=0;
    static double Xk=0;

    double b[M]={1, -0.9994};
    double a[N]={0, 0.9937};

    if(time < Ts){
        k=0;
    }
    else if(time >= k*Ts){
        Xk=controller(Ek, b, a);
        k++;
        *aux=k*Ts;
    }
    
    return Xk;
}

double controller(double E, double* b, double* a){
    
    static int init_arrays = 0;
    static double U[N];
    static double E_values[M];

    if(!init_arrays){
        for(int i=0;i<N; i++) U[i]=0;
        for(int i=0;i<M; i++) E_values[i]=0;
        init_arrays = 1;
    }

    E_values[0]=E;

    double sum_Ek, sum_Uk;

    sum_Ek=0;
    sum_Uk=0;

    for(int k=0; k<M; k++)  sum_Ek = sum_Ek + b[k]*E_values[k]; 
    for(int k=0; k<N; k++)  sum_Uk = sum_Uk + a[k]*U[k];

    U[0]=sum_Ek+sum_Uk;

    for(int k=1; k<M; k++)  E_values[k]=E_values[k-1]; 
    for(int k=1; k<N; k++)  U[k]=U[k-1];

    return U[0];
}