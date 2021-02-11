set(cstprefs.tbxprefs,'FrequencyUnits','Hz')
s = tf([1 0],1)

%PI controller. 
Jm = 0.1; %kg
dm = 0.01 ; % N*s/m

G = 1 / (Jm*s + dm);

sisotool(G)