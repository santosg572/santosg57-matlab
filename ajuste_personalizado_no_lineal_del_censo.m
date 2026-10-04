Ajuste personalizado no lineal del censo
R2025b
Este ejemplo muestra cómo ajustar una ecuación personalizada a datos del censo, especificando límites, coeficientes y un parámetro dependiente del problema.

Cargue y represente los datos de census.mat:

load census
plot(cdate,pop,'o')
hold on
Figure contains an axes object. The axes contains a line object which displays its values using only markers.

Cree una estructura de opciones de ajuste y un objeto fittype para el modelo personalizado no lineal y = a(x-b)n, donde a y b son coeficientes y n es un parámetro dependiente del problema. Para obtener más información sobre los parámetros dependientes de problemas, consulte la página de la función fittype.

s = fitoptions('Method','NonlinearLeastSquares',...
               'Lower',[0,0],...
               'Upper',[Inf,max(cdate)],...
               'Startpoint',[1 1]);
f = fittype('a*(x-b)^n','problem','n','options',s);
Ajuste los datos con las opciones de ajuste y un valor de n = 2:

[c2,gof2] = fit(cdate,pop,f,'problem',2)
c2 = 
     General model:
     c2(x) = a*(x-b)^n
     Coefficients (with 95% confidence bounds):
       a =    0.006092  (0.005743, 0.006441)
       b =        1789  (1784, 1793)
     Problem parameters:
       n =           2
gof2 = struct with fields:
           sse: 246.1543
       rsquare: 0.9980
           dfe: 19
    adjrsquare: 0.9979
          rmse: 3.5994

Ajuste los datos con las opciones de ajuste y un valor de n = 3:

[c3,gof3] = fit(cdate,pop,f,'problem',3)
c3 = 
     General model:
     c3(x) = a*(x-b)^n
     Coefficients (with 95% confidence bounds):
       a =   1.359e-05  (1.245e-05, 1.474e-05)
       b =        1725  (1718, 1731)
     Problem parameters:
       n =           3
gof3 = struct with fields:
           sse: 232.0058
       rsquare: 0.9981
           dfe: 19
    adjrsquare: 0.9980
          rmse: 3.4944

Represente los resultados del ajuste y los datos:

plot(c2,'m')
plot(c3,'c')
legend('data','fit with n=2','fit with n=3')
Figure contains an axes object. The axes object with xlabel x, ylabel y contains 3 objects of type line. One or more of the lines displays its values using only markers These objects represent data, fit with n=2, fit with n=3.