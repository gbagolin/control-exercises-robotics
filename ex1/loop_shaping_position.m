set(cstprefs.tbxprefs,'FrequencyUnits','Hz')
s = tf([1 0],1)


%PID controller implemented. 
Jm = 0.1; %kg
dm = 0.01 ; % N*s/m

G = 1 / (Jm*s^2 + dm*s);

sisotool(G)
