%% En nombre de ALLAH, empezamos:

% Entender Lugar de las raíces :        https://www.youtube.com/watch?v=C0xE78BAK-4
% Compensadores de atraso de fase 1:    https://www.youtube.com/watch?v=R7Dk49Pw1s0
% Sintonización Manual de los PID's:    https://www.picuino.com/es/control-pid.html
% ERROR en ESTADO ESTACIONARIO:         https://www.youtube.com/watch?v=qhXPb-cJ94c

%% NIA=787246
A=7; B=8; C=7; D=2; E=4; F=6;

%% Caso 1
numGs_1=[A ((A*B)/15)];
denGs_1=[1 C/7];
Gs_1= tf(numGs_1, denGs_1);

numRs_1=[3.1489];
denRs_1=[1 0];
Rs_1=tf(numRs_1, denRs_1);

Xs_1=tf([1],[1 0]);
Es_1=(1/(1+Gs_1*Rs_1))*Xs_1;

% REQUERIMIENTOS
ts_1=0.3; % segundos
SO_1=30; % porcentual
SO_1=0; % Al ser sistema de primer orden no hay sobreoscilación
gi_1=gifor_SO(SO_1);
sigma_1=4/ts_1;
wd_1=gi_1*sigma_1*sqrt(1-(gi_1)^2);
s1_1=-sigma_1
s2_1=-sigma_1

% rlocus(Gs_1);
% hold on
% plot(-0.8, 0.04, "x", -0.8, -0.04, "x")
% hold off

%% Caso 2
numGs_2=[F*E];
denGs_2=[1 E/75 0];a
Gs_2= tf(numGs_2, denGs_2);

numRs_2=[1];
denRs_2=[1 0];
Rs_2=tf(numRs_2, denRs_2);

Xs_2=tf([1],[1 0 0]);
Es_2=(1/(1+Gs_2*Rs_2))*Xs_2;

% REQUERIMIENTOS
ts_2=0.5; % segundos
SO_2=1.5; % porcentual
gi_2=gifor_SO(SO_2);
sigma_2=4/ts_2;
wd_2=gi_2*sigma_2*sqrt(1-(gi_2)^2);
s1=-sigma_2+(wd_2)*i;
s2=-sigma_2-(wd_2)*i;



%% Caso 3
numGs_3=[C*E];
denGs_3=[1 (C/5 + E/6) (C*E)/30];
Gs_3= tf(numGs_3, denGs_3);


%% © NAOUFAL EL RHAZZALI 

