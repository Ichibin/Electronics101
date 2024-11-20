%  ---- values

colores_digitos = struct('negro', 0, 'cafe', 1, 'rojo', 2, 'naranja', 3, ...
                         'amarillo', 4, 'verde', 5, 'azul', 6, 'morado', 7, ...
                         'gris', 8, 'blanco', 9);

colores_multiplicador = struct('negro', 1, 'cafe', 10, 'rojo', 100, 'naranja', 1e3, ...
                               'amarillo', 1e4, 'verde', 1e5, 'azul', 1e6, ...
                               'morado', 1e7, 'gris', 1e8, 'blanco', 1e9, ...
                               'dorado', 0.1, 'plateado', 0.01);

colores_tolerancia = struct('dorado',5,'plateado',10); %in percentages

% ----values



%input query 
num_bandas = input('¿Cuántas bandas tiene la resistencia? (4 o 5): ');

if num_bandas == 4
    fprintf('Los colores disponibles son: \n. negro, cafe, rojo, naranja, amarillo, verde, azul, morado, gris, blanco \n');
    banda1 = input('Color de la primera banda: ', 's');
    fprintf('Los colores disponibles son: \n. negro, cafe, rojo, naranja, amarillo, verde, azul, morado, gris, blanco \n');
    banda2 = input('Color de la segunda banda: ', 's');
    fprintf('Los colores disponibles son: \n. negro, cafe, rojo, naranja, amarillo, verde, azul, morado, gris, blanco,dorado, plateado \n');
    banda3 = input('Color de la tercera banda (multiplicador): ', 's');
    fprintf('Los colores disponibles son: \n dorado, plateado \n');
    banda4 = input('Color de la cuarta banda (tolerancia): ', 's');
    
    %resistor calculation
    valor = (colores_digitos.(banda1) * 10 + colores_digitos.(banda2)) * ...
             colores_multiplicador.(banda3);
    tolerancia = colores_tolerancia.(banda4);
    
elseif num_bandas == 5
    fprintf('Los colores disponibles son: \n. negro, cafe, rojo, naranja, amarillo, verde, azul, morado, gris, blanco \n');
    banda1 = input('Color de la primera banda: ', 's');
    fprintf('Los colores disponibles son: \n. negro, cafe, rojo, naranja, amarillo, verde, azul, morado, gris, blanco \n');
    banda2 = input('Color de la segunda banda: ', 's');
   fprintf('Los colores disponibles son: \n. negro, cafe, rojo, naranja, amarillo, verde, azul, morado, gris, blanco \n');
    banda3 = input('Color de la tercera banda: ', 's');
    fprintf('Los colores disponibles son: \n. negro, cafe, rojo, naranja, amarillo, verde, azul, morado, gris, blanco,dorado, plateado \n');
    banda4 = input('Color de la cuarta banda (multiplicador): ', 's');
    fprintf('Los colores disponibles son: \n dorado, plateado \n');
    banda5 = input('Color de la quinta banda (tolerancia): ', 's');
    
    
    %resistor calculation
    valor = (colores_digitos.(banda1) * 100 + colores_digitos.(banda2) * 10 + ...
             colores_digitos.(banda3)) * colores_multiplicador.(banda4);
    tolerancia = colores_tolerancia.(banda5);
else
    error('El número de bandas debe ser 4 o 5.');
end

%pinter
format short e
fprintf('El valor de la resistencia es: %.2f Ω ± %.2f%%\n', valor, tolerancia);