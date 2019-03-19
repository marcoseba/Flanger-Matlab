% punto 3
clear all 
close all

M = 8; %ritardo (numero intero)


figure;
for k=0.001 : 0.1 : 1.2
    
b1 = [zeros(1,M),(1-k),k]; %calcolo vett coeff Numeratore f.d.t.
[h1,w1]  = freqz(b1,1);  %modulo (h1 = num complesso)
[phi,w2] = phasez(b1,1); %fase

%disegno grafico
subplot(2,1,1);
plot(w1/pi,20*log10(abs(h1)));grid on;hold on
title({'linear interpolator';'modulo (db)'})
subplot(2,1,2);
plot(w2/pi,radtodeg(phi));grid on;hold on
title('fase (deg)')


end

figure;
for k=0.001 : 0.1 : 1.2

b2 = [zeros(1,M),k,1]; %calcolo vett. coeff numeratore 
a2 = [1,k];      %calcolo vett. coeff denominatore

[h1,w1]  = freqz(b2,a2);  %modulo (h1 = num complesso)
[phi,w2] = phasez(b2,a2); %fase

%disegno grafico
subplot(2,1,1);
plot(w1/pi,20*log10(abs(h1)));grid on;hold on
title({'all pass interpolator';'modulo (db)'})
subplot(2,1,2);
plot(w2/pi,radtodeg(phi));grid on;hold on
title('fase (deg)')


end

