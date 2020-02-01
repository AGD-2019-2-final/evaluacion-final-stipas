-- Pregunta
-- ===========================================================================
-- 
-- Para responder la pregunta use el archivo `data.csv`.
-- 
-- Genere una relación con el apellido y su longitud. Ordene por longitud y 
-- por apellido. Obtenga la siguiente salida.
-- 
--   Hamilton,8
--   Garrett,7
--   Holcomb,7
--   Coffey,6
--   Conway,6
-- 
-- Escriba el resultado a la carpeta `output` del directorio actual.
-- 
fs -rm -f -r output;

--
-- >>> Escriba su respuesta a partir de este punto <<<
--

--Punto 10
u = LOAD 'data.csv' USING PigStorage(',')
    AS (f1:INT, f2:CHARARRAY, f3:CHARARRAY, f4:DATETIME, f5:CHARARRAY, f6:INT);
y = GROUP u BY $2;
z = FOREACH y GENERATE group, SIZE($0);
z2 = ORDER z BY  $1 DESC, $0;
w = STREAM z2 THROUGH  `head -n 5 `;
STORE w INTO './output' using PigStorage('\t');