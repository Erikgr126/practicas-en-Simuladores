clear; close all; clc;

%simulacion de f(t) y F(s)
syms t s 

F = ((3*s+4)./(2*s+1))*(1/s);
f = ilaplace(F,s,t);
F = matlabFunction(F);
f = matlabFunction(f);
s = 0:.1:100;
t = 0:.1:100;

figure
subplot(2,1,1);
plot(s,F(s));
axis([0 10 0 3]);
xlabel('$ s $');
ylabel('$ C(s) $');
syms s
title(['$F(s)=', latex(F(s)), '$']);
subplot(2,1,2);
plot(t,f(t));
axis([0 10 0 2])
xlabel('$ t $');
ylabel('$ f(t) $');
syms t
title(['$C(t)=', latex(f(t)), '$'])
grid on

set(findall(gcf, 'Interpreter', 'tex'), 'Interpreter', 'latex');
set(findall(gcf, 'FontSize', 9), 'FontSize', 12);
set(findall(gcf, 'Type', 'line'), 'LineWidth', 2);
set(findall(gcf, 'Type', 'line'), 'MarkerSize',  15);

%guardar  imagenes
% fname = 'D:\School\Ingenieria\6to\TLC';
% saveas(gfc, fullfile(fname, 'TC1_C5_F1'), 'epsc');
