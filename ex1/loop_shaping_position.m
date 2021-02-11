set(cstprefs.tbxprefs,'FrequencyUnits','Hz')
s = tf([1 0],1)


%PID controller implemented. 
Jm = 0.1; %kg
dm = 0.01 ; % N*s/m

G = 1 / (Jm*s^2 + dm*s);

sisotool(G)


%aggiungiamo uno zero un decade prima di del polo dato che uno zero ha un
%vantaggio di fase che inizia un decade prima, posizioniamolo quindi a
%10^0, il risultato ottenuto per la step response va bene

%la scelta migliore però è quella di posizionare lo zero prima del polo,
%così si evita di avere una dinamica lenta nella step response

%ora controlliamo gli errori,
%n2y ha una buona step response, du2y che sarebbe la forza di gravità ad
%esempio invece viene ampliata dal nostro sitema ora come ora, perchè è
%presente questo comportamento? Perchè abbiamo bisogno di un integrator
%ora però abbiamo di nuovo il problema delle oscillazioni dato che ha una
%fase negatiuva di 90, allora va aggiunto un altro zero vicino all'altro

%però è lenta com,e scesa, allora i due zeri vanno sposti e messi entrambi
%in 10^0, in questo modo abbiamo una step response con una dinamica lenta,
%però la step response dell'errore va bene

%abbiamo due zeri e un polo però nel controllore, allor amettiamo un polo
%nelle alte frequenze così che sia realizzabile