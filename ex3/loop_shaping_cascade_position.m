set(cstprefs.tbxprefs,'FrequencyUnits','Hz')
s = tf([1 0],1)

Jm = 0.1; %kg
dm = 0.01 ; % N*s/m


Cv = (40*(s+7))/s;
G1 = 1 / (Jm*s + dm);
Gp = ((Cv*G1) / ((1+ G1*Cv)))*1/s;
Gp=minreal(Gp);

sisotool(Gp)
%To control the position only a proportional gain
%would be necessary, however a PI controller has been 
%used to reject the little disturbance present on the system. 
