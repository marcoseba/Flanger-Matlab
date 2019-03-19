function [y] = funzione1(x,ni,M)

% x  -> vett. ingresso
% ni -> fattore d'interpolazione
% M  -> ritardo
% y  -> vett. uscita 

x = [zeros(1,M),x]; %aggiungo M zeri, ovvero ritardo
y= zeros(1,length(x)); %inizializzazione del vettore uscita

y(1) = (1-ni)*x(1); %calcolo primo elemento

for j=2:length(x)
   y(j) = (1-ni)*x(j) + ni*x(j-1); 
end

y(end-M+1:end) = []; %elimino gli ultimi elementi per aggiustare 
                     %la lunghezza del vettore

end

