clc
clear all
T_D = input ('masukkan nilai temperatur Debye = ')                  
N_A = 6.022e23;      %Bilangan Avogadro 
N = N_A;             % Jumlah Osilator 
k_b = 1.38e-23;     % Konstanta Boltzmann 
h_bar = 6.626e-34/2/pi;  %Konstanta Planck terreduksi    
R = N_A*k_b;         % Konstanta gas = 8,314 J / mol / K.  
dT = 0.2;             % Interval Temperatur 
Tv = dT:dT:800;      % Array Temperatur.   
% Calculate Debye model: 
Cv =@(x) x.^4.*exp(x)./(exp(x)-1).^2;  
Omega_D = k_b * T_D / h_bar; 
C_Debye = zeros(size(Tv)); 
for j = 1:length(Tv)     
    T = Tv(j);     
    x_D = h_bar*Omega_D/k_b/T;         
    C_Debye(j) = 9*N*k_b*(T/T_D).^3*integral(Cv, 0, x_D); 
end     
%plot grafik
figure(1) 
clf 
set(gca, 'fontsize', 12) 
 % Plot sebagai fungsi T     
    p1=plot(Tv, C_Debye, 'b');           
    axis([0 max(Tv) 0 30])     
    xlabel('T (K)') 
 
legend([p1], 'Debye', ...    
     'location', 'best') 
title('Heat capacity') 
ylabel('C_V (J mol^{-1} K^{-1})')



