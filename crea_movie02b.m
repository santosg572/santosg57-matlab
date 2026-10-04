time = 100;
del1 = .1;
t0 = 0;

x = linspace(0, 6*pi);
y = sin(x);

for t = 1:time
   figure('Position', [100, 100, 1000, 600]);
   plot(x(t), y(t), '-ro', ...
    "MarkerSize", 12, ...          % Tamaño del círculo
    "MarkerEdgeColor", "blue", ... % Color del borde
    "MarkerFaceColor", "blue")     % Color de relleno 

   ylim([-3,3]);
   xlim([0, 6*pi]); 
   F(t) = getframe;  
end

writerObj = VideoWriter('test3.avi');
open(writerObj);
writeVideo(writerObj, F)
close(writerObj);


