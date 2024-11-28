% Parámetros ajustables
lambda = 1;  % Amortiguamiento
omega = 3;   % Frecuencia natural
lambda_squared = lambda^2;
omega_squared = omega^2;

% Condiciones iniciales
theta0 = 0.1;  % Ángulo inicial (en radianes)
v0 = 0;        % Velocidad angular inicial

% Tiempo de simulación
t_span = [0 10]; % Intervalo de tiempo [0, 10] segundos

% Sistema de ecuaciones diferenciales
pendulo = @(t, y) [y(2); -2*lambda*y(2) - omega^2*sin(y(1))];

% Resolver la ecuación diferencial
[t, y] = ode45(pendulo, t_span, [theta0 v0]);

% Graficar resultados
figure;
plot(t, y(:,1), 'b', 'LineWidth', 1.5);
title('Movimiento del péndulo amortiguado');
xlabel('Tiempo (s)');
ylabel('Ángulo (rad)');
grid on;

% Identificar el caso (sobreamortiguamiento o subamortiguamiento)
if lambda_squared > omega_squared
    disp('Caso: Sobreamortiguamiento (\lambda^2 > \omega^2)');
else
    disp('Caso: Subamortiguamiento (\lambda^2 < \omega^2)');
end