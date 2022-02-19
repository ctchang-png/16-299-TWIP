m_w = 1; % kg
m_p = 1; % kg
l_p = 1; % m
I_p = 0.1;
I_w = 0.1*I_p;
g = 9.81; % m/s^2
r_w = 0.2; % m

A = [0 1 0 0;...
     0 0 (m_p^2*g*l_p^2)/(I_p*(m_p+m_w)+(m_p*m_w*l_p^2)) 0;...
     0 0 0 1;...
     0 0 (m_p*l_p*g*(m_p+m_w))/(I_p*(m_p+m_w)+(m_p*m_w*l_p^2)) 0];
B = [0; I_w/r_w + (m_p+m_w)*r_w; 0; I_p + m_p*l_p^2];
figure(1)
hold on
for i=-4:4
    mag = 10^i;
    Q = mag.*diag([1, 0.0001, 1, 0.0001]);
    R = mag.*[1];
    [K, S, P] = lqr(A, B, Q, R);
    K
    P
    plot(P, 'o')
end
hold off
