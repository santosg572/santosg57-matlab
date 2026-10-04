% 1. Crear datos para una superficie 3D
[X, Y] = meshgrid(-3:0.2:3, -3:0.2:3);
Z = sin(X) .* cos(Y);

% 2. Generar el gráfico 3D
figure;
surf(X, Y, Z);
title('Gráfica de Superficie 3D');
xlabel('Eje X');
ylabel('Eje Y');
zlabel('Eje Z');
colorbar;

% 3. Guardar la gráfica en un archivo (por ejemplo, PNG o FIG)
saveas(gcf, 'grafica_3d.png'); % Guarda como imagen
% saveas(gcf, 'grafica_3d.fig'); % Guarda como archivo de figura de MATLAB
