%flanger prova

clear all 
close all

[x,Fs] = audioread('esempio16kHz.wav');
Tc = 1/Fs;
x(:,2) = []; %da stereo a mono
x = x'; %converto in vettore riga

D0 = 88; %5.5 ms
D1 = 72; %4.5ms
Ffl = 0.5; %Hz
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

[x2,x1] = LinearInerAlpha(x,M,a,alpha);
y = beta*x1 + gamma*x2;