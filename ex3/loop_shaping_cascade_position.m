set(cstprefs.tbxprefs,'FrequencyUnits','Hz')
s = tf([1 0],1)

Jm = 0.1; %kg
dm = 0.01 ; % N*s/m

Cv = (12.714*(s+6.114))/s;
G1 = 1 / (Jm*s + dm);
Gp = (Cv*G1) / ((1+ G1*Cv)*s);
Gp=minreal(Gp);

sisotool(Gp)