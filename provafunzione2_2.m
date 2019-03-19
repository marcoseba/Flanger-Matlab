%prova funzione2 usata come interpolatore
%settare il parametro delta oppure direttamente k

clear all
close all

delta = 0.4; 
k = (1-delta) / (1+delta);

x = [1,2,3,4,5,6,7,8,9,10,10,9,8,7,6,5,4,3,2,1]; %segnale triangolare
tx = 0:2:2*(length(x)-1);
figure;stem(tx,x);

y = funzione1(x,k,0);

y(:,1) = []; %cancellazione primo elemento 

ty = 1:2:2*length(y);

hold on;stem(ty,y);