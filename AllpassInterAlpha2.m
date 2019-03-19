function [ y,x  ] = AllpassInterAlpha2( x,alpha,Tc,D0,D1,Ffl)

% y -> uscita
% x -> ramo retroazione
% Tc -> tempo campionameto segnale
% D0 -> ritardo espresso in campioni
% D1 -> ritardo espresso in campioni

xr = zeros(1,length(x)); % inizializzaione
y = zeros(1,length(x)); %inizializzazione del vettore uscita
x1 = zeros(1,length(x)); %inizializzazione del vettore appoggio



for i=1:length(x);
    
    D = D0 + D1*sin(2*pi*Ffl*Tc*i);
    M = floor(D); %parte intera di D(n)
    ni = D - M; %parte frazionaria di D(n)
    delta = (1-ni) / (1+ni); 
    
    if((i-M) > 0 && (i-M) < length(x)+1)
        xr(i) = x(i-M); % calcolo vettore ritardo intero xr
    else
        xr(i) = 0;
    end

    
    % Algoritmo interpolazione All pass
    if (i == 1)

        x1(1) = xr(1); %calcolo primo elemento
        y(1) = delta*x1(1); %calcolo primo elemento
    else
    
        x1(i) = xr(i) - delta*x1(i-1);
        y(i) = delta*x1(i) + x1(i-1);
    end
    
    x(i) = x(i) - alpha * y(i); %ramo retroazione 

end %fine ciclo

end %fine funzione



