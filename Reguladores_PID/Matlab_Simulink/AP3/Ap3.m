%% En nombre de ALLAH, 

%% NIA=787246
A=7; B=8; C=7; D=2; E=4; F=6;

%% Caso 1
numGs_1=[C/B];
denGs_1=[1 C/9 0];
Gs_1= tf(numGs_1, denGs_1);

%% Discretizado
SO_1=15; % 15%
tr_1=2; % 2s
gi_1=gifor_SO(SO_1);
Ts_1=get_samplingTime(tr_1, gi_1);

Gz_1=c2d(Gs_1, Ts_1);
numGz_1=cell2mat(Gz_1.Numerator);
denGz_1=cell2mat(Gz_1.Denominator);

%% Caso 2
numGs_2=[3*C];
denGs_2=[1 5*E 0.1*C];
Gs_2= tf(numGs_2, denGs_2);

%% Discretizado
SO_2=0.00001; % 0%
tr_2=0.5; % 0.5s
gi_2=gifor_SO(SO_2);
Ts_2=get_samplingTime(tr_2, gi_2);

Gz_2=c2d(Gs_2, Ts_2);
numGz_2=cell2mat(Gz_2.Numerator);
denGz_2=cell2mat(Gz_2.Denominator);

%% Caso 3
numGs_3=[5*D];
denGs_3=[1 15*B];
Gs_3= tf(numGs_3, denGs_3);

%% Discretizado
SO_3=0.00001; % 0%
tr_3=2; % 2s
gi_3=gifor_SO(SO_3);
Ts_3=get_samplingTime(tr_3, gi_3);

Gz_3=c2d(Gs_3, Ts_3);
numGz_3=cell2mat(Gz_3.Numerator);
denGz_3=cell2mat(Gz_3.Denominator);

%% Caso 4
numGs_4=[6*D 30*D*B];
denGs_4=[1 25*F+7*E 175*E*F];
Gs_4= tf(numGs_4, denGs_4);

%% Discretizado
SO_4=25; % 25%
tr_4=3; % 3s
gi_4=gifor_SO(SO_4);
Ts_4=get_samplingTime(tr_4, gi_4);

Gz_4=c2d(Gs_4, Ts_4);
numGz_4=cell2mat(Gz_4.Numerator);
denGz_4=cell2mat(Gz_4.Denominator);

%% © NAOUFAL EL RHAZZALI 