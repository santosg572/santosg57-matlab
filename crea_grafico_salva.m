% 1. Crear datos de ejemplo
x = linspace(0, 10, 100);
y = sin(x);

% 2. Crear el gráfico
figure; % Abre una nueva ventana de gráficos
plot(x, y, 'LineWidth', 2, 'Color', 'b');
title('Gráfico de Ejemplo');
xlabel('Eje X');
ylabel('Eje Y');
grid on; % Añade cuadrícula

% 3. Guardar el gráfico
% Guarda como imagen PNG de alta resolución
saveas(gcf, 'mi_grafico.png'); 

% Opcional: Guardar en formato PDF o JPG
% saveas(gcf, 'mi_grafico.pdf');


