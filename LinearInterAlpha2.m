function [ y,x ] = LinearInterAlpha2( x,alpha,Tc,D0,D1,Ffl)

% y -> uscita
% x -> ramo retroazione
% Tc -> tempo campionameto segnale
% D0 -> ritardo espresso in campioni
% D1 -> ritardo espresso in campioni



xr = zeros(1,length(x)); % inizializzaione
y = zeros(1,length(x)); %inizializzazione del vettore uscita


for i=1:length(x);
    
    D = D0 + D1*sin(2*pi*Ffl*Tc*i);
    M = floor(D); %parte intera di D(n)
    ni = D - M; %parte frazionaria di D(n)
    
    if((i-M) > 0 && (i-M) < length(x)+1)
        xr(i) = x(i-M); % calcolo vettore ritardo intero xr
    else
        xr(i) = 0;
    end

    %algoritmo interpolazione lineare
    if (i == 1)
        y(1) = (1-ni)*xr(1); %calcolo primo elemento
    else
        y(i) = (1-ni)*xr(i) + ni*xr(i-1); %passi successivi
    end

     x(i) = x(i) - alpha * y(i); %ramo retroazione 

end %fine ciclo

end %fine funzione