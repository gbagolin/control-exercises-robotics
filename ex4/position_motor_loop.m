set(cstprefs.tbxprefs,'FrequencyUnits','Hz')
s = tf([1 0],1);

%The position of this motor has been controlled only by adding a gain.
%Therefore a P controller has been used. The position on this motor is easy
%to control as the electrical pole is in high frequency so it does not have
%much influence on the system, specifically on the torque. A high frequency
%electrial pole acts as if there was a current loop control, delivering perfect
%torque. 

% %faulhaber 2237-24crx with ratio 103:1
% r = 103;
% Kt = 31*1e-3*r; 
% Im = 3.0000e-07*r^2;
% Fm = 0.01; 
% Kv = 1/(2*pi*301/60)*r;
% Ra = 15.7;
% La = 590e-6;

%Instead, the position loop on this robot is more complex,
%as there is the electrical pole which acts badly on the system. 
%The control action that has been adopted is a PID controller, therefore
%adding two zeros, and one integrator to reject the disturbance. Another
%pole in high frequency has been added for realization purposes. 
%Zeros has been added to increase the phase and not fall under unstable
%behaviours. The integrator has been add to reject the disturbance. 

% maxon EC90 with ratio 1:1
r = 1;
Kt = 0.0705*r; 
Im = 0.0003*r^2;
Fm = 0.00001*r^2; 
Kv = 1/(2*pi*135/60)*r;
Ra = 0.343;
La = 0.000264;

fw_path = (Kt / (Ra + La*s)) * (1/Im*s +Fm);
bw_path = Kv;

Gv = feedback(fw_path, bw_path); 
Gv = minreal(Gv)

Cv = 54.496 / s; 

Gp = feedback(Gv * Cv, Kt) * (1/s); 
Gp = minreal(Gp)

sisotool(Gp)