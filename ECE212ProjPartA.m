%% 
%212 Design Project part A
%Kevin Nguyen

C = (0.01e-6);
R = 1569.6;
R_1 = 3139.2;
R_2 = 15696;
R_u = 5000;

K = 5;
B = 1/(R_2*C);
w0 = 1/(R*C);

% H(jw) function
s = tf('s');
H_w = ((K*(s*B)) / (s^2 + s*B + w0^2));

figure; 

bode(H_w);