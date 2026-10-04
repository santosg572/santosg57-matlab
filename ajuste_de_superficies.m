Ajuste de superficies con ecuaciones personalizadas a datos biofarmacéuticos
R2025b
Este ejemplo muestra cómo usar Curve Fitting Toolbox™ para ajustar superficies de respuesta a algunos datos de anestesia y analizar los efectos de la interacción farmacológica. Los modelos de superficie de respuesta ofrecen un buen método para comprender el comportamiento de la interacción farmacológica de combinaciones de medicamentos.

Estos datos se basan en los resultados de este estudio: Kern SE, Xie G, White JL, Egan TD. Opioid-hypnotic synergy: A response surface analysis of propofol-remifentanil pharmacodynamic interaction in volunteers. Anesthesiology 2004; 100: 1373-81.

La anestesia suele consistir en un proceso con al menos dos fármacos, que consta de un opioide y un hipnótico sedante. Este ejemplo utiliza propofol y remifentanilo como prototipos de clase de fármacos. Su interacción se mide con cuatro medidas distintas de respuesta analgésica y sedante a la combinación de fármacos. Algometría, tetania, sedación y laringoscopia comprenden las cuatro medidas de los resultados sustitutivos de los fármacos en varias combinaciones de concentraciones de propofol y remifentanilo.

El siguiente código, que utiliza métodos de Curve Fitting Toolbox, reproduce la generación interactiva de la superficie con la herramienta Curve Fitting Tool descrita en Surface Fitting to Biopharmaceutical Data.

Cargar datos
Cargue los datos del archivo.

data = importdata( 'OpioidHypnoticSynergy.txt' );
Propofol      = data.data(:,1);
Remifentanil  = data.data(:,2);
Algometry     = data.data(:,3);
Tetany        = data.data(:,4);
Sedation      = data.data(:,5);
Laryingoscopy = data.data(:,6);
Crear el tipo de ajuste del modelo
Puede utilizar la función fittype para definir el modelo del estudio, donde CA y CB son las concentraciones de los fármacos, y IC50A, IC50B, alpha y n son los coeficientes que se van a estimar. Cree el tipo de ajuste del modelo.

ft = fittype( 'Emax*( CA/IC50A + CB/IC50B + alpha*( CA/IC50A ) * ( CB/IC50B ) )^n /(( CA/IC50A + CB/IC50B + alpha*( CA/IC50A ) * ( CB/IC50B ) )^n  + 1 )', ...
    'independent', {'CA', 'CB'}, 'dependent', 'z', 'problem', 'Emax' )
ft = 
     General model:
     ft(IC50A,IC50B,alpha,n,Emax,CA,CB) = Emax*( CA/IC50A + CB/IC50B + alpha*( 
                    CA/IC50A ) * ( CB/IC50B ) )^n /(( CA/IC50A + CB/IC50B 
                    + alpha*( CA/IC50A ) * ( CB/IC50B ) )^n  + 1 )
Asuma que Emax = 1 porque la salida del efecto es normalizada.

Emax = 1;
Configurar opciones de ajuste
Configure opciones de ajuste para ajuste robusto, límites y puntos de partida.

opts = fitoptions( ft );
opts.Lower = [0, 0, -5, -0];
opts.Robust = 'LAR';
opts.StartPoint = [0.0089, 0.706, 1.0, 0.746];
Ajustar y representar una superficie para algometría
[f, gof] = fit( [Propofol, Remifentanil], Algometry, ft,...
    opts, 'problem', Emax )
Success, but fitting stopped because change in residuals less than tolerance (TolFun).
f = 
     General model:
     f(CA,CB) = Emax*( CA/IC50A + CB/IC50B + alpha*( CA/IC50A ) * ( CB/IC50B 
                    ) )^n /(( CA/IC50A + CB/IC50B + alpha*( CA/IC50A ) 
                    * ( CB/IC50B ) )^n  + 1 )
     Coefficients (with 95% confidence bounds):
       IC50A =       4.148  (4.123, 4.174)
       IC50B =       9.044  (8.971, 9.118)
       alpha =       8.501  (8.316, 8.687)
       n =       8.289  (8.132, 8.447)
     Problem parameters:
       Emax =           1
gof = struct with fields:
           sse: 0.0842
       rsquare: 0.9991
           dfe: 393
    adjrsquare: 0.9991
          rmse: 0.0146

plot( f, [Propofol, Remifentanil], Algometry );
Figure contains an axes object. The axes object contains 2 objects of type line, surface. One or more of the lines displays its values using only markers

Ajustar una superficie para tetania
Reutilice el mismo valor fittype para crear una superficie de respuesta para tetania.

[f, gof] = fit( [Propofol, Remifentanil], Tetany, ft, opts, 'problem', Emax )
f = 
     General model:
     f(CA,CB) = Emax*( CA/IC50A + CB/IC50B + alpha*( CA/IC50A ) * ( CB/IC50B 
                    ) )^n /(( CA/IC50A + CB/IC50B + alpha*( CA/IC50A ) 
                    * ( CB/IC50B ) )^n  + 1 )
     Coefficients (with 95% confidence bounds):
       IC50A =       4.544  (4.522, 4.567)
       IC50B =       21.22  (21.04, 21.4)
       alpha =       14.94  (14.67, 15.21)
       n =       6.132  (6.055, 6.209)
     Problem parameters:
       Emax =           1
gof = struct with fields:
           sse: 0.0537
       rsquare: 0.9993
           dfe: 393
    adjrsquare: 0.9993
          rmse: 0.0117

plot( f, [Propofol, Remifentanil], Tetany );
Figure contains an axes object. The axes object contains 2 objects of type line, surface. One or more of the lines displays its values using only markers

Ajustar una superficie para sedación
[f, gof] = fit( [Propofol, Remifentanil], Sedation, ft, opts, 'problem', Emax )
f = 
     General model:
     f(CA,CB) = Emax*( CA/IC50A + CB/IC50B + alpha*( CA/IC50A ) * ( CB/IC50B 
                    ) )^n /(( CA/IC50A + CB/IC50B + alpha*( CA/IC50A ) 
                    * ( CB/IC50B ) )^n  + 1 )
     Coefficients (with 95% confidence bounds):
       IC50A =       1.843  (1.838, 1.847)
       IC50B =        13.7  (13.67, 13.74)
       alpha =       1.986  (1.957, 2.015)
       n =       44.27  (42.56, 45.98)
     Problem parameters:
       Emax =           1
gof = struct with fields:
           sse: 0.0574
       rsquare: 0.9994
           dfe: 393
    adjrsquare: 0.9994
          rmse: 0.0121

plot( f, [Propofol, Remifentanil], Sedation );
Figure contains an axes object. The axes object contains 2 objects of type line, surface. One or more of the lines displays its values using only markers

Ajustar una superficie para laringoscopia
[f, gof] = fit( [Propofol, Remifentanil], Laryingoscopy, ft, opts, 'problem', Emax )
f = 
     General model:
     f(CA,CB) = Emax*( CA/IC50A + CB/IC50B + alpha*( CA/IC50A ) * ( CB/IC50B 
                    ) )^n /(( CA/IC50A + CB/IC50B + alpha*( CA/IC50A ) 
                    * ( CB/IC50B ) )^n  + 1 )
     Coefficients (with 95% confidence bounds):
       IC50A =       5.192  (5.177, 5.207)
       IC50B =       37.77  (37.58, 37.97)
       alpha =       19.67  (19.48, 19.86)
       n =          37  (35.12, 38.87)
     Problem parameters:
       Emax =           1
gof = struct with fields:
           sse: 0.1555
       rsquare: 0.9982
           dfe: 393
    adjrsquare: 0.9982
          rmse: 0.0199

plot( f, [Propofol, Remifentanil], Laryingoscopy );
Figure contains an axes object. The axes object contains 2 objects of type line, surface. One or more of the lines displays its values using only markers


¿Qué tan útil fue esta traducción?
