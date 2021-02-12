set(cstprefs.tbxprefs,'FrequencyUnits','Hz')
s = tf([1 0],1)

%PI controller. 
Jm = 0.1; %kg
dm = 0.01 ; % N*s/m

G = 1 / (Jm*s + dm);
sisotool(G)
%Velocity controller designed as a PI. 
%Integral used to reject the disturbance, 
%and the proportional gain used to increase the frequency, 
%plus a zero to increase the phase margin. 