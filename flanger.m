%flanger prova

clear all 

[x,Fs] = audioread('gtr-jazz.wav');
Tc = 1/Fs;
x(:,2) = []; %da stereo a mono
x = x'; %converto in vettore riga

D0 = floor(0.0055/Tc);    %5.5 ms
D1 = floor(0.0045/Tc);     %4.5ms
Ffl = 0.5;   %Hz 0.5
alpha = -0.707;
beta = 0.707;
gamma = 0.707;

td=1:length(x);
D = D0 + D1*sin(2*pi*Ffl*Tc*td);

%scompongo in parte intera e parte frazionaria
M = zeros(1,length(D));
a = zeros(1,length(D));
for i = 1:length(D)
    M(i) = floor(D(i)); %parte intera di D(n)
    a(i) = D(i) - M(i); %parte frazionaria di D(n)
end

% MODO LINEARE
[x2,x1] = LinearInterAlpha(x,M,a,alpha);
y_lin = beta*x1 + gamma*x2; 


%MODO ALL-PASS
%calcolo del vettore ritardi delta
delta =zeros(1,length(x));
for i = 1:length(x) 
   delta(i) = (1-a(i)) / (1+a(i)); 
end

[x2,x1] = AllpassInterAlpha(x,M,delta,alpha);
y_all = beta*x1 + gamma*x2; 
