function [ y,x ] = AllpassInterAlpha( x,M,ni,alpha)

% y -> uscita
% x -> ramo retroazione

xr = zeros(1,length(x)); % inizializzaione
y = zeros(1,length(x)); %inizializzazione del vettore uscita
x1 = zeros(1,length(x)); %inizializzazione del vettore appoggio

for i=1:length(x);
    
    % Calcolo vettore ritardo intero xr
    if((i-M(i)) > 0 && (i-M(i)) < length(x)+1)
        xr(i) = x(i-M(i)); 
    else
        xr(i) = 0;
    end
    
    % Algoritmo interpolazione All pass
    if (i == 1)

        x1(1) = xr(1); %calcolo primo elemento
        y(1) = ni(1)*x1(1); %calcolo primo elemento
    else
    
        x1(i) = xr(i) - ni(i)*x1(i-1);
        y(i) = ni(i)*x1(i) + x1(i-1);
    end
    
    x(i) = x(i) - alpha * y(i); %ramo retroazione 
    
end %fine cilco
end %fine funzione

