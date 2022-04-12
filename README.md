## Instrucciones
  
  
Ejecutar lineas de codigo en el terminal de `SQL Shell`  
Revisar si utiliza un Sistema de gestión de bases de datos distinto.  
[Documentación Postgresql](https://www.postgresqltutorial.com/)



## ⚠️ Recuerde las Convenciones del lenguaje SQL ⚠️
>      
> INDEX  = nombre_tabla_nombre_columna_index  
> FOREING KEY = nombre_tabla_fk  
> Tablas y columnas: escritas en plural, minusculas y sin ñ, simbolos o tildes.
> 
## Convenciones de subquery
> * Las consultas internas deben estar encapsuladas entre paréntesis.  
> * Una subquery puede tener sólo una columna especificada en SELECT, con la excepción de múltiples columnas definidas en la consulta principal.  
> * El comando ORDER BY no se puede utilizar en una consulta interna. La excepción es que esta instrucción sí puede ser incluida en la consulta principal.  
> * Para obtener un resultado similar a ORDER BY dentro de una consulta interna, se puede implementar el comando GROUP BY.  
> * Aquellas consultas internas que retornen más de una fila sólo pueden ser utilizadas con operadores de múltiples valores como IN.  
> * Las SUBQUERY en FROM deben ir con AS que permitan hacer comparaciones sin error de sintaxis
> * En las consultas internas se ejecuta primero el parentesis y despues la consulta principal