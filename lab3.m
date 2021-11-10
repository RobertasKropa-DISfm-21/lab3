clc;
clear all;
close all;

%% 1 duomenu paruosimas
x=[0.1:1/22:1];
d=(1 + 0.6*sin(2*pi*x/0.7) + 0.3*sin(2*pi*x))./2;

plot(x, d, 'b*'), grid on
%% 2 parenkami koeficientai
c1=0.19;
r1=0.15;
c2=0.9;
r2=0.15;

%% 3 atsitiktiniai koeficientai
    w1=randn(1);
    w2=randn(1);
    b=randn(1);
    
    n=0.1;
    
for a = 1:100
    for i=1:20
    Fi1=exp(-(x(i)-c1)^2/(2*r1^2));
    Fi2=exp(-(x(i)-c2)^2/(2*r2^2));

%% 4 tinklo atsakas
    y=Fi1*w1 + Fi2*w2 + b;
%% 5 klaidos skaiciavimas
    e=d(i)-y;
%% 6 svoriu atnaujinimas
    w1=w1+n*e*Fi1;
    w2=w2+n*e*Fi2;
    b=b+n*e;
    
    end
end

%%tikrinimas
xTest=[0.1:1/44:1];

for i=1:length(xTest)
    
    Fi1_2=exp(-(xTest(i)-c1)^2/(2*r1^2));
    Fi2_2=exp(-(xTest(i)-c2)^2/(2*r2^2));
    
    yTest(i)=Fi1_2*w1 + Fi2_2*w2 + b;
    
    
end
hold on
plot(xTest, yTest, '.r');

%c su kmeans, o r su std








