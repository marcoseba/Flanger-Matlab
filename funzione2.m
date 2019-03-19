function [ y] = funzione2(x,ni,M )

% x  -> vett. ingresso
% ni -> fattore d'interpolazione
% M  -> ritardo
% y  -> vett. uscita 

x = [zeros(1,M),x]; %aggiungo M zeri, ovvero ritardo
y = zeros(1,length(x)); %inizializzazione del vettore uscita
x1 = zeros(1,length(x)); %inizializzazione del vettore appoggio

x1(1) = x(1); %calcolo primo elemento
y(1) = ni*x1(1); %calcolo primo elemento

for j = 2:length(x) %implementazione eq alle differenze
    
    x1(j) = x(j) - ni*x1(j-1);
    y(j) = ni*x1(j) + x1(j-1);
end

y(end-M+1:end) = []; %elimino gli ultimi elementi per aggiustare 
                     %la lunghezza del vettore
end

