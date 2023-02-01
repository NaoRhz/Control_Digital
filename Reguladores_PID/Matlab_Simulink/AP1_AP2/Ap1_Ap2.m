%% En nombre de ALLAH, 

%% NIA=787246
A=7; B=8; C=7; D=2; E=4; F=6;

%% Caso 1
I=3.1276;
numGs_1=[A ((A*B)/15)];
denGs_1=[1 C/7];
Gs_1= tf(numGs_1, denGs_1);

numRs_1=[I];
denRs_1=[1 0];
Rs_1=tf(numRs_1, denRs_1);

Xs_1=tf([1],[1 0]);
Es_1=(1/(1+Gs_1*Rs_1))*Xs_1;

FT_BA_1=Rs_1*Gs_1;
FT_BC_1=feedback(FT_BA_1, 1); 

step(FT_BC_1);

syms s
Es_1_s=getSymb_Gs(Es_1);
ess_1=vpa(limit(s*Es_1_s, s, 0), 4);

%% Discretizado
Ts_1=0.045;

Gz_1=c2d(Gs_1, Ts_1);
numGz_1=cell2mat(Gz_1.Numerator);
denGz_1=cell2mat(Gz_1.Denominator);

Rz_1=c2d(Rs_1, Ts_1);
numRz_1=cell2mat(Rz_1.Numerator);
denRz_1=cell2mat(Rz_1.Denominator);

FTz_BA_1=Rz_1*Gz_1;
FTz_BC_1=feedback(FTz_BA_1, 1); 

%% Caso 2
numGs_2=[F*E];
denGs_2=[1 E/75 0];
Gs_2= tf(numGs_2, denGs_2);

% PID
P_2=0.03438;
I_2=0.001124;
D_2=0.2335;
N_2=640.7782;

% Controller
numRs_2=[P_2+D_2*N_2 I_2+N_2*P_2 N_2*I_2];
denRs_2=[1 N_2 0];
Rs_2=tf(numRs_2, denRs_2);

FT_BA_2=Rs_2*Gs_2;
FT_BC_2=feedback(FT_BA_2, 1); 

step(FT_BC_2);

Xs_2=tf([1],[1 0 0]);
Es_2=(1/(1+Gs_2*Rs_2))*Xs_2;

syms s
Es_2_s=getSymb_Gs(Es_2);
ess_2=vpa(limit(s*Es_2_s, s, 0), 4);

%% Discretizado
Ts_2=0.01105;

Gz_2=c2d(Gs_2, Ts_2);
numGz_2=cell2mat(Gz_2.Numerator);
denGz_2=cell2mat(Gz_2.Denominator);

Rz_2=c2d(Rs_2, Ts_2);
numRz_2=cell2mat(Rz_2.Numerator);
denRz_2=cell2mat(Rz_2.Denominator);

FTz_BA_2=Rz_2*Gz_2;
FTz_BC_2=feedback(FTz_BA_2, 1); 

Xz_2=tf([Ts_2 0],[1 -2 1], Ts_2);
Ez_2=(1/(1+Gz_2*Rz_2))*Xz_2;

syms z
Ez_2_z=getSymb_Gz(Ez_2);
ezz_2=vpa(limit(((z-1)/z)*Ez_2_z, z, 1), 4);

%% Caso 3
numGs_3=[C*E];
denGs_3=[1 (C/5 + E/6) (C*E)/30];
Gs_3= tf(numGs_3, denGs_3);

% PID
P_3=1.00072465125397;
I_3=0.40011192003804;
D_3=0.515379643740182;
N_3=1650.29310619726;

% Controller
numRs_3=[P_3+D_3*N_3 I_3+N_3*P_3 N_3*I_3];
denRs_3=[1 N_3 0];
Rs_3=tf(numRs_3, denRs_3);

FT_BA_3=Rs_3*Gs_3;
FT_BC_3=feedback(FT_BA_3, 1); 

step(FT_BC_3);

Xs_3=tf([1],[1 0]);
Es_3=(1/(1+Gs_3*Rs_3))*Xs_3;

%% Discretizado
Ts_3=0.00429;

Gz_3=c2d(Gs_3, Ts_3);
numGz_3=cell2mat(Gz_3.Numerator);
denGz_3=cell2mat(Gz_3.Denominator);

Rz_3=c2d(Rs_3, Ts_3);
numRz_3=cell2mat(Rz_3.Numerator);
denRz_3=cell2mat(Rz_3.Denominator);

FTz_BA_3=Rz_3*Gz_3;
FTz_BC_3=feedback(FTz_BA_3, 1);

%% © NAOUFAL EL RHAZZALI 