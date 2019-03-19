% prova funzione time variant delay

clear all 
close all

[x,Fs] = audioread('esempio16kHz.wav');
Tc = 1/Fs;
x(:,2) = []; %da stereo a mono
x = x'; %converto in vettore riga

fl = 0.5; %Hz
td=1:length(x);
A = 300;
%M =floor( A*sin(2*pi*fl*Tc*td)); %prendo solo parte intera 


D =( A*sin(2*pi*fl*Tc*td));

%scompongo in parte intera e parte frazionaria
M = zeros(1,length(D));
a = zeros(1,length(D));
for i = 1:length(D)
    M(i) = floor(D(i)); %parte intera
    a(i) = D(i) - M(i); %parte frazionaria
end



y1 = LinearInter(x,M,a);

%calcolo del vettore ritardi delta
delta =zeros(1,length(x));
for i = 1:length(x) 
   delta(i) = (1-a(i)) / (1+a(i)); 
end

y2 = AllpassInter(x,M,delta);


y = TVFDL(x,320,300,0.5,Tc,1);

y4 = LinearInerAlpha(x,M,a,0);