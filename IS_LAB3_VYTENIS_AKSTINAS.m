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

%Kaip ir ankstesniuose darbuose, turime palyginti tinklo gauta rezultata,
%su norimu gauti rezultatu. Pagal tai sprendziame ar reikia dar apmokyti
%tinkla.
e1=zeros(1,length(X));
e=0;
e_abs=0;

for i = 1:20
    e1(i)=F(i)-v(i);
    e=e+e1(i);
    e_abs=e_abs+abs(e1(i));
end

%Palyginam gauta rezultata po pirmo ciklo ir tikraji signala
figure(2)
hold on
plot(X,F,'b',X,v,'r'); 
plot(X,F,'b*',X,v,'ro'); 
grid minor;
title('Tikslu ir pradiniu rezultatu palyginimas');xlabel('Iejimo vektoriaus X verte'); ylabel('F(X), v(X)');
hold off




%% Apmokymas
%Po pradinio ciklo aproksimatorius tikriausiai veiks nekaip, del to tinkla
%reikia apmokyti. Nustatomas mokymo zingsnis ir maksimali leistina
%paklaida. 
n=0.05;
error=1;

j=0;
while (j<100000) %Turetu buti "e_abs > error", bet atsibosta laukti, del to padarytas ribotas skaicius iteraciju.
    j=j+1;
    %Atnaujiname svorius 
    for i= 1:20
        w1 = w1 + n*e1(i)*F1(i);
        w2 = w2 + n*e1(i)*F2(i);
        b1 = b1 + n*e1(i);
    end

   %Skaiciuojame suma po atnaujinimo
   for i = 1:20
    v(i)=w1*F1(i)+w2*F2(i)+b1;
   end

  %Analogiskai tikriname klaidas
   e1=zeros(1,length(X));
   e=0;
   e_abs=0;
   
   for i = 1:20
      e1(i)=F(i)-v(i);
      e=e+e1(i);
      e_abs=e_abs+abs(e1(i));
   end
end

%Braizome galutini rezultata
figure(3)
hold on
plot(X,F,'b',X,v,'r'); 
plot(X,F,'b*',X,v,'ro'); 
grid minor;
title('Tikslu ir galutiniu rezultatu palyginimas');xlabel('Iejimo vektoriaus X verte'); ylabel('F(X), v(X)');
hold off
