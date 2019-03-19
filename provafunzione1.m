%esame vitali
clear all
close all

k = 0.5;
b = [(1-k),k];

% prova segnale sinusoidale
%  Fc = 8000;
%  Tc = 1/Fc;
%  N = 100;
%  tx = 0:Tc:(N-1)*Tc;
%  f = 100;
%  x = cos(2*pi*f*tx);
%  plot(tx,x);

x = [1,2,3,4,5,6,7,8,9,10,9,8,7,6,5,4,3,2,1]; %segnale triangolare
% tx = 0:2:2*(length(x)-1);
% figure;stem(tx,x);
figure; stem(x); hold on

y_i = funzione1(x,k,2);
stem(y_i,'ro');

% y2 = filter(b,1,x);
% diff = y2 - y_i; %diff = 0 -> implementazione corretta
% 
% y_i(:,1) = []; %cancellazione primo elemento 
% 
% ty_i = 1:2:2*length(y_i);
% 
% hold on;stem(ty_i,y_i);





