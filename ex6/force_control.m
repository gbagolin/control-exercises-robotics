set(cstprefs.tbxprefs,'FrequencyUnits','Hz')
s = tf([1 0],1);

J = 0.1; %[kg m^2]
d = 0.01; 
% h = [0.1,1,10,100,1000]; 
h = 1000; 
F = 1/((J/h)*s^2 + (d/h) * s + 1);
% sisotool(F); 
%basic controller where no gain is added
C_pid = (61130*(s+1)^2) / (s*(s + 6.113e4));

%As the environment constant h changes, the gain value necessary
%to get a frequency of 40Hz, gets lower. 
%Particularly, we see that as the environment gets stiffed 
%the controller design for a softer environment gives poor result. 
% sisotool(F); 
% sisotool(F,C_pid); 
%PID form: (K*(s+1)^2) / (s*(s+6e4)), 
%where k depends on the environment, 
% and is one of the following: 
%PID h = 0.1: K = 1.57e7
%PID h = 1: K = 1.5591e6
%PID h = 10: K = 1.7e5
%PID h = 100: K = 1.5e4
%PID h = 1000: K = 1.5e4
%PID h = 1000: K = 1.4e3

%In this case the effect of feed forward is very benefical,
%as it ensures the stability of the system, even in stiff environment. 
%Furthermore, there is no need for the integrator. 
C_ff = (10587 * (s+5.897))/(s+6.243e04); 
%PD + FF h=0.1 : K = 1.2e7
%PD + FF h=1 : K = 1.3e06
%PD + FF h=10 : K = 1.5e05
%PD + FF h=100 : K = 1.5e4
%PD + FF h=1000 : K = 1.6e3
sisotool(F,C_ff) 

