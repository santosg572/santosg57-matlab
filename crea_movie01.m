% 1. Crear el objeto VideoWriter para un archivo MP4

v = VideoWriter('mi_video.mi_video.mp4', 'MPEG-4');

v.FrameRate = 30; % Velocidad de fotogramas por segundo

open(v);

% 2. Configurar la figura

figure;

x = linspace(0, 2*pi, 100);

% 3. Bucle para generar y capturar los fotogramas
for i = 1:50
    y = sin(x + (i/5)); % Modificar la onda en cada iteración
    plot(x, y, 'LineWidth', 2);
    ylim([-1.5 1.5]);
    grid on;
    
    % Capturar el fotograma actual de la figura
    frame = getframe(gcf);
    writeVideo(v, frame);
end

% 4. Cerrar el archivo de video

close(v);

disp('¡Video MP4 creado con éxito!');

