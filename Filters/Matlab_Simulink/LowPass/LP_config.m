%% INPUT SIGNAL
amplitude_input=1;      % Volt
offset_input=2.5;       % Volt
f_input=630;           % Hz
w_input=2*pi*f_input;   % rad/s

%% Continous LOW PASS FILTER
Fc_Limit_Arduino = 150; % Hz
A=7; B=8; C=7; D=2; E=4; F=6;
f_cutoff = (1*C+1*D)*1*A*10; % Cuttoff frecuency (Hz)
if f_cutoff > Fc_Limit_Arduino
    f_cutoff=f_cutoff/10;
end

wc=2*pi*f_cutoff;       % Angular frecuency (rad/s)
numGs=[wc];
denGs=[1 wc];
Gs=tf(numGs, denGs);        % Transfer function (Tf) in the Laplace domain
bode(Gs);
step(Gs);

%% DIGITAL LOW PASS FILTER
f_sample=10*f_cutoff;   % Sample frecuency (Hz)
Ts=1/f_sample;          % Sample rate (seconds = s) 
Gz=c2d(Gs, Ts);

numGz=cell2mat(Gz.Numerator);
denGz=cell2mat(Gz.Denominator);

bode(Gz);
step(Gz);

%% Simulation
Tsim=0.01*Ts;