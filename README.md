# Conversor de medidas
Se pide desarrollar una aplicación que permita convertir de una unidad de medida a otra.

## Modelo de pantalla

* Un texto editable numérico donde ingresar un valor
* Un botón Convertir
* Un label que muestre el valor convertido

## Requerimiento Principal

Convertir de millas a kilómetros.

# Variantes en Arena con Binding

## Simple

Es el que implementa el requerimiento principal. La vista ConversorWindow trabaja con el esquema MVC contra un modelo muy sencillo, que tiene dos propiedades:

* millas 
* kilometros 
* y un método convertir que realiza la acción

## Conversor sincronizado

Esta variante convierte a medida que el usuario va escribiendo el valor de las millas. El modelo debe actualizar la propiedad kilómetros al asignar las millas y viceversa, ya no existe el método convertir.

## Conversor genérico

Extiende la implementación para convertir en diferentes unidades de medida: onzas a gramos, galones a litros, millas a kilómetros, etc.

La vista ConversorGenericoWindow necesita desplegar una serie de opciones, y permite ingresar un valor para luego activar la conversión a la unidad de medida seleccionada. El modelo ConversorGenerico tiene dos propiedades:

* input
* output
* y un objeto Conversion que es el que sabe cómo convertir el input en output.

El combo de la vista se llena con todos los objetos Conversion que quieras.


## Otras tecnologías sin binding

Implementaciones similares de conversores en **SWT** y **Swing** las podrás encontrar en un directorio aparte. El contraste al no trabajar con binding es notable: aumenta la cantidad de líneas, no suele haber modelo y por lo tanto tampoco hay separación entre la parte visual y la lógica de negocio.

