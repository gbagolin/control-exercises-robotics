set(cstprefs.tbxprefs,'FrequencyUnits','Hz')
s = tf([1 0],1);

% %faulhaber 2237-24crx with ratio 103:1
% r = 103;
% Kt = 31*1e-3*r; 
% Im = 3.0000e-07*r^2;
% Fm = 0.01; 
% Kv = 1/(2*pi*301/60)*r;
% Ra = 15.7;
% La = 590e-6;

%maxon EC90 with ratio 1:1
r = 1;
Kt = 0.0705*r; 
Im = 0.0003*r^2;
Fm = 0.00001*r^2; 
Kv = 1/(2*pi*135/60)*r;
Ra = 0.343;
La = 0.000264;

El = 1 / (s*La + Ra);
Me =  1 / (s*Im + Fm);

% Gi = feedback(El,Kt^2*Me)
Gi = El / (1 + Kt^2*Me*El);
Gi = minreal(Gi)
%Current controled with a PI controller.
Ci = (34 * (s+1311)) / s
Wi = (Ci*Gi) / (1 + Ci*Gi)

Gv = Wi * Kt * Me
Gv = minreal(Gv)
% sisotool(Gv)

% Velocity controlled with a PI controller. 
Cv = (2.7988 * (s+6.152)) / s
Wv = ((Cv*Gv) / (1 + Cv*Gv))*1/s
Wv = minreal(Wv)
%position controlled with a proportional gain P.  
sisotool(Wv)
Cp = 134.05


