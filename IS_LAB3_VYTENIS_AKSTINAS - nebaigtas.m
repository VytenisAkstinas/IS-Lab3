clear all; close all; clc;
X=linspace(0,1,20); %20 skaitmenu iejimo vektorius
F=(1+0.6*sin(2*pi*X/0.7)+0.3*sin(2*pi*X))/2;
%Funkcija kurios elgesi imituos neuronu tinklas

figure(1)
plot(X,F,'b',X,F,'*'); %Rezultato, kurio tikimasi, grafikas
grid minor;
title('Tikrosios funkcijos grafikas');xlabel('Iejimo vektoriaus X verte'); ylabel('F(X)');

%% Pradinis ciklas
%Pradedame sukurdami pradines/atsitiktines reiksmes 
%spinduliams, centrams bei svoriams
c1=randn(1);
c2=randn(1);
r1=randn(1);
r2=randn(1);
w1 = randn(1);
w2 = randn(1);
b1 = randn(1);

%Tuscios svoriu matricos
F1=zeros(1,20);
F2=zeros(1,20);

%Suskaiciuojamos duotosios gauso funkcijos 
for i = 1:20
    F1(i)=exp(-((X(i)-c1)^2)/(2*r1^2));
    F2(i)=exp(-((X(i)-c2)^2)/(2*r2^2));
end

%Suskaiciuojame pasverta suma
for i = 1:20
    v(i)=w1*F1(i)+w2*F2(i)+b1;
end
