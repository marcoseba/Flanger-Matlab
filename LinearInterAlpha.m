function [ y,x ] = LinearInterAlpha( x,M,ni,alpha )

% y -> uscita
% x -> ramo retroazione

xr = zeros(1,length(x)); % inizializzaione
y= zeros(1,length(x)); %inizializzazione del vettore uscita


for i=1:length(x);
    
    if((i-M(i)) > 0 && (i-M(i)) < length(x)+1)
        xr(i) = x(i-M(i)); % calcolo vettore ritardo intero xr
    else
        xr(i) = 0;
    end

    %algoritmo interpolazione lineare
    if (i == 1)
        y(1) = (1-ni(1))*xr(1); %calcolo primo elemento
    else
        y(i) = (1-ni(i))*xr(i) + ni(i)*xr(i-1); 
    end

    x(i) = x(i) - alpha * y(i); %ramo retroazione 

end %fine ciclo

end %fine funzione