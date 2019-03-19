%flanger prova

clear all 

[x,Fs] = audioread('Halen.wav');
Tc = 1/Fs;
x(:,2) = []; %da stereo a mono
x = x'; %converto in vettore riga

D0 = floor(0.0055/Tc);    %5.5 ms
D1 = floor(0.0045/Tc);     %4.5ms
Ffl = 0.5;   %Hz 0.5
alpha = -0.2;
%alpha = -0.707;  %variabile tra 1,-1 (-1 max effetto)
beta = 0.707;
gamma = 0.707;

% MODO LINEARE
[x2,x1] = LinearInterAlpha2(x,alpha,Tc,D0,D1,Ffl);
y_lin = beta*x1 + gamma*x2; 

%MODO ALL-PASS
[x2,x1] = AllpassInterAlpha2(x,alpha,Tc,D0,D1,Ffl);
y_all = beta*x1 + gamma*x2; 


%audiowrite('Halen_flanger.wav',y_lin,Fs);
%audiowrite('Halen_flanger_all.wav',y_all,Fs);