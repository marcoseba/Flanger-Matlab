% prova funzione 2 
% confronto tra funzione implementata da me e filtro matlab
clear all
close all

% prova segnale sinusoidale
 Fc = 8000;
 Tc = 1/Fc;
 N = 100;
 tx = 0:Tc:(N-1)*Tc;
 f = 100;
 x = cos(2*pi*f*tx);
%  plot(tx,x);

M = 2; %ritardo (numero intero)
k = 0.4;
b = [zeros(1,M),k,1];
a = [1,k];
y1 = filter(b,a,x);
y2 = funzione2(x,k,M);

diff = y2-y1;
err = sum(diff)/length(diff); %ok le due implemetazioni sono equivalenti



