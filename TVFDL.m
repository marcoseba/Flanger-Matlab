function [ y ] = TVFDL( x,D0,D1,Ffl,Tc,mode )

% x    -> vettore ingresso
% D0   -> valore nominale del ritardo espresso in numero di campioni
% D1   -> valore ritardo frazionario espresso in numero di campioni
% Ffl  -> freq. variazione del ritardo
% Tc   -> tempo di campionamento del segnale ingresso
% mode -> 0-linar , 1-all pass
% y    -> vettore uscita

td=1:length(x);
D = D0 + D1*sin(2*pi*Ffl*Tc*td);

%scompongo in parte intera e parte frazionaria
M = zeros(1,length(D));
a = zeros(1,length(D));
for i = 1:length(D)
    M(i) = floor(D(i)); %parte intera di D(n)
    a(i) = D(i) - M(i); %parte frazionaria di D(n)
end

if(mode == 0) %Interpolazione Lineare
    
    y = LinearInter(x,M,a);    

else %Interpolazione All pass
   
    %calcolo del vettore ritardi delta
    delta =zeros(1,length(x));
    for i = 1:length(x) 
       delta(i) = (1-a(i)) / (1+a(i)); 
    end
    
    y = AllpassInter(x,M,delta);
end

end

