function [ y ] = AllpassInter(x,M,ni )

% x  -> vett. ingresso
% ni -> vettore fattore d'interpolazione deve avere stessa lunghezza di x
% M  -> vettore ritardo deve avere stessa lunghezza di x
% y  -> vett. uscita 

%% FARE UN CONTROLLO SULLA LUNGHEZZA VETTORI &&

xr = zeros(1,length(x)); % inizializzaione

% calcolo vettore ritardo intero xr
for i=1:length(x);
    
    if((i-M(i)) > 0 && (i-M(i)) < length(x)+1)
        xr(i) = x(i-M(i));
    end
end


y = zeros(1,length(x)); %inizializzazione del vettore uscita
x1 = zeros(1,length(x)); %inizializzazione del vettore appoggio

% algoritmo interpolazione All pass

x1(1) = xr(1); %calcolo primo elemento
y(1) = ni(1)*x1(1); %calcolo primo elemento

for j = 2:length(x) %implementazione eq alle differenze
    
    x1(j) = xr(j) - ni(j)*x1(j-1);
    y(j) = ni(j)*x1(j) + x1(j-1);
end

end

