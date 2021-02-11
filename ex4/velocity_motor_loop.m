set(cstprefs.tbxprefs,'FrequencyUnits','Hz')
s = tf([1 0],1);

%The velocity of this motor is easy to control. Adding an integrator to
%make the phase starts from -90° is the solution. A further proportional
%gain has been used to make the system go faster. The disturbance is
%rejected thanks to the use of the integrator. 
%faulhaber 2237-24crx with ratio 103:1
r = 103;
Kt = 31*1e-3*r; 
Im = 3.0000e-07*r^2;
Fm = 0.01; 
Kv = 1/(2*pi*301/60)*r;
Ra = 15.7;
La = 590e-6;

%The velocity of this motor has been controlled like the Faulhaber. 
% maxon EC90 with ratio 1:1
% r = 1;
% Kt = 0.0705*r; 
% Im = 0.0003*r^2;
% Fm = 0.00001*r^2; 
% Kv = 1/(2*pi*135/60)*r;
% Ra = 0.343;
% La = 0.000264;

fw_path = (Kt / (Ra + La*s)) * (1/Im*s +Fm);
bw_path = Kv;

G = feedback(fw_path, bw_path); 

G = minreal(G)

sisotool(G)