% ---------------------------------------
% SpaceX.mlx
% ---------------------------------------

% clc para limpiar datos del intérprete
clear all; clc 

% Lectura de datos
datos = xlsread('SpaceX.xlsx');

% t(s); h(km); h(m); v(km/hr); v(m/seg)
figure(1) % Abre una ventana para la gráfica
plot(datos(:,1), datos(:,3), '.b') 

title('Despegue SpaceX: h vs. t')
xlabel(' t(seg) ')
ylabel(' h(m) ')


% Velocidad vs. Tiempo
figure(2)
plot(datos(:,1), datos(:,5), '.r') 

title('Despegue SpaceX: v vs. t')
xlabel(' t(seg) ')
ylabel(' v(m/seg) ')




% Ajuste recta t ≥ 16 seg y t ≤ 40 seg 
t1 = datos(1:25, 1);
v1 = datos(1:25, 5);
coefR = polyfit(t1, v1, 1); % y = ax + b

% ax + b
vR = @(t) coefR(1).*t + coefR(2); 

fprintf('Aceleración de t 16-40 seg: %2.2f m/seg^2 \n', coefR(1));
fprintf('Aceleración de t 16-40 seg: %2.2 g \n', coefR(1)./9.81);


% Ajuste parábola
t2 = datos(35:135, 1);
v2 = datos(35:135, 5);
coefP =polyfit(t2, v2, 2);

% y = ax^2 + bx + c
vP = @(t) coefP(1).*t^2 + coefP(2).*t + coefP(3); % Velocidad 
aP = @(t) 2.*coefP(1).*t + coefP(2); % Aceleración

aP(150)

fprintf('Aceleración en t = 150 seg: %2.2f m/seg^2 \n', aP(150));
fprintf('Aceleración en t = 150 seg: %2.2f g \n', aP(150)/9.81);


