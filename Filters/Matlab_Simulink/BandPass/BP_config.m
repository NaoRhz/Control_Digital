%% INPUT SIGNAL
amplitude_input=1; % Volt
offset_input=0; % Volt 
f_input=10000; % Hz (5 veces la fc_H)
w_input=2*pi*f_input; % rad/s

%% CONTINUOUS BAND PASS FILTER
fc_L=130;
fc_H=30;

% Angular frecuency (rad/s)
wc_L=2*pi*fc_L;           
wc_H=2*pi*fc_H; 

% Transfer function (Tf) in the Laplace domain
numGs=[wc_L (wc_H*wc_L)/10];
denGs=[1 (10*wc_H+10*wc_L)/10 (10*wc_H*wc_L)/10];

Gs=tf(numGs, denGs); 

bode(Gs);
step(Gs);

%% DISCRETE BAND PASS FILTER (DIGITAL)
f_sample=10*fc_L;     % Sample frecuency (Hz)
Ts=1/f_sample;       % Sample rate (seconds = s) 

% Tf in Z domain
Gz=c2d(Gs, Ts);

numGz=cell2mat(Gz.Numerator);
if (numGz(1)==0)
    numGz = numGz(2:end);
end
denGz=cell2mat(Gz.Denominator);

len_numGz=length(numGz);
len_denGz=length(denGz);

bode(Gz);
step(Gz);

%% Simulation
Tsim=0.001*Ts;