# Lenguaje M en Power BI

Este README proporciona una introducción al lenguaje M en Power BI, incluyendo tipos de datos, sintaxis y ejemplos.

## Índice
1. [Tipos de Datos](#tipos-de-datos)
    - [Tipos de Datos Primitivos](#tipos-de-datos-primitivos)
    - [Tipos de Datos Estructurados](#tipos-de-datos-estructurados)
2. [Sintaxis](#sintaxis)
    - [Expresiones](#expresiones)
    - [Funciones](#funciones)
3. [Ejemplos](#ejemplos)
    - [Tipos de Datos Primitivos](#ejemplos-de-tipos-de-datos-primitivos)
    - [Tipos de Datos Estructurados](#ejemplos-de-tipos-de-datos-estructurados)
4. [Operadores](#operadores)
    - [Operadores Aritméticos](#operadores-aritméticos)
    - [Operadores Lógicos](#operadores-lógicos)
5. [Operaciones con Texto](#operaciones-con-texto)
    - [Concatenación de Texto](#concatenación-de-texto)
    - [Extracción de Subcadena](#extracción-de-subcadena)
    - [Conversión de Texto a Número](#conversión-de-texto-a-número)
    - [Conversión de Número a Texto](#conversión-de-número-a-texto)
    - [Conversión de Texto a Fecha/Hora](#conversión-de-texto-a-fecha/hora)
    - [Conversión de Fecha/Hora a Texto](#conversión-de-fecha/hora-a-texto)
6. [Operaciones con Fechas](#operaciones-con-fechas)
    - [Suma o Resta de Fechas](#suma-o-resta-de-fechas)
    - [Extraer Parte de una Fecha](#extraer-parte-de-una-fecha)
7. [Operaciones con Listas](#operaciones-con-listas)
    - [Concatenación de Listas](#concatenación-de-listas)
    - [Extracción de Elementos de una Lista](#extracción-de-elementos-de-una-lista)
    - [Funciones de Listas](#funciones-de-listas)
    - [Función Transform](#función-transform)
    - [Agrupación de Elementos de una Lista](#agrupación-de-elementos-de-una-lista)
8. [Operaciones con Decimales](#operaciones-con-decimales)
    - [Redondeo de Decimales](#redondeo-de-decimales)
    

## Tipos de Datos
En Power BI, el lenguaje M admite varios tipos de datos, que se pueden clasificar en dos categorías principales: primitivos y estructurados.

### Tipos de Datos Primitivos
1. **Número (number)**: Representa valores numéricos, ya sean enteros o decimales.
2. **Texto (text)**: Representa cadenas de caracteres.
3. **Fecha/Hora (datetime)**: Representa fechas y horas.
4. **Lógico (logical)**: Representa valores booleanos (verdadero o falso).

### Tipos de Datos Estructurados
1. **Tabla (table)**: Representa una colección de filas y columnas de datos.
2. **Registro (record)**: Representa una estructura de datos con campos nombrados.
3. **Lista (list)**: Representa una secuencia de valores de cualquier tipo.

## Sintaxis
La sintaxis en lenguaje M sigue una estructura lógica y coherente. Incluye expresiones y funciones.

### Expresiones
- Las expresiones son fórmulas que representan cálculos o manipulación de datos.
- Pueden utilizar operadores y funciones para realizar acciones específicas.

### Funciones
- Las funciones son bloques de código predefinidos que realizan tareas específicas.
- Pueden tomar argumentos y devolver resultados.

## Ejemplos
A continuación, se presentan ejemplos de tipos de datos y cómo se utilizan en lenguaje M.

### Ejemplos de Tipos de Datos Primitivos

```m
let
    numero = 42,
    texto = "Hola, Mundo",
    fecha = #2023-09-19,
    logico = true
in
    {numero, texto, fecha, logico}
```

### Ejemplos de Tipos de Datos Estructurados

```m
let
    tabla = Table.FromRecords({[Nombre="Juan", Edad=30], [Nombre="María", Edad=25]}),
    registro = [Nombre="Carlos", Edad=35],
    lista = {1, 2, 3, 4, 5}
in
    {tabla, registro, lista}
```

### Operadores

En lenguaje M, se utilizan varios tipos de operadores para realizar operaciones en los datos.

### Operadores Aritméticos

+ (Suma)
- (Resta)
* (Multiplicación)
/ (División)

### Operadores Lógicos

and (AND lógico)
or (OR lógico)
not (NOT lógico)

## Operaciones con Texto:

#### Concatenación de Texto:

Para combinar dos o más cadenas de texto, puedes utilizar el operador & o la función Text.Combine.

Ejemplo:
```m
let
    texto1 = "Hola",
    texto2 = "Mundo",
    resultado = texto1 & " " & texto2
in
    resultado
```
#### Extracción de Subcadena:

Puedes utilizar la función Text.Range para extraer una parte específica de una cadena de texto.

Ejemplo:
```m
let
    texto = "Ejemplo de texto",
    subcadena = Text.Range(texto, 9, 5) // Extrae "texto"
in
    subcadena
```

#### Conversión de Texto a Número:

Puedes utilizar la función Number.FromText para convertir una cadena de texto a un valor numérico.

Ejemplo:
```m
let
    texto = "42",
    numero = Number.FromText(texto)
in
    numero
```

#### Conversión de Número a Texto:

Puedes utilizar la función Text.From para convertir un valor numérico a una cadena de texto.

Ejemplo:
```m
let
    numero = 42,
    texto = Text.From(numero)
in
    texto
```

#### Conversión de Texto a Fecha/Hora:

Puedes utilizar la función DateTime.FromText para convertir una cadena de texto a un valor de fecha/hora.

Ejemplo:
```m
let
    texto = "2023-09-19",
    fecha = DateTime.FromText(texto)
in
    fecha
```

#### Conversión de Fecha/Hora a Texto:

Puedes utilizar la función Text.From para convertir un valor de fecha/hora a una cadena de texto.

Ejemplo:
```m
let
    fecha = #2023-09-19,
    texto = Text.From(fecha)
in
    texto
```

## Operaciones con Fechas:
Suma o Resta de Fechas:

Para realizar operaciones de suma o resta de días, meses o años a una fecha, puedes utilizar las funciones Date.AddDays, Date.AddMonths y Date.AddYears.
Ejemplo:

```m
let
    fecha = #2023-09-19,
    fechaSuma = Date.AddDays(fecha, 7) // Suma 7 días a la fecha
in
    fechaSuma
```

Extraer Parte de una Fecha:

Puedes utilizar las funciones Date.Day, Date.Month y Date.Year para extraer el día, mes o año de una fecha.

Ejemplo:
```m
let
    fecha = #2023-09-19,
    dia = Date.Day(fecha),
    mes = Date.Month(fecha),
    año = Date.Year(fecha)
in
    {dia, mes, año}
```

## Operaciones con Listas:

#### Concatenación de Listas:

Para combinar dos o más listas, puedes utilizar el operador & o la función List.Combine.

Ejemplo:
```m
let
    lista1 = {1, 2, 3},
    lista2 = {4, 5, 6},
    resultado = lista1 & lista2
in
    resultado
```

#### Extracción de Elementos de una Lista:

Puedes utilizar la función List.Range para extraer una parte específica de una lista.

Ejemplo:
```m
let
    lista = {1, 2, 3, 4, 5},
    sublista = List.Range(lista, 2, 3) // Extrae {2, 3, 4}
in
    sublista
```

#### Funciones de Listas:

Puedes utilizar las funciones List.Count, List.Sum, List.Average, List.Min y List.Max para obtener el número de elementos, la suma, el promedio, el valor mínimo y el valor máximo de una lista.

Ejemplo:
```m
let
    lista = {1, 2, 3, 4, 5},
    numeroElementos = List.Count(lista),
    suma = List.Sum(lista),
    promedio = List.Average(lista),
    minimo = List.Min(lista),
    maximo = List.Max(lista)
in
    {numeroElementos, suma, promedio, minimo, maximo}
```

#### Función Transform:

Puedes utilizar la función List.Transform para aplicar una función a cada elemento de una lista.

Ejemplo:
```m
let
    lista = {1, 2, 3, 4, 5},
    listaTransformada = List.Transform(lista, each _ * 2) // Multiplica cada elemento por 2
in
    listaTransformada
```

#### Agrupación de Elementos de una Lista:

Puedes utilizar la función List.GroupBy para agrupar los elementos de una lista.

Ejemplo:
```m
let
    lista = {1, 2, 3, 4, 5},
    listaAgrupada = List.GroupBy(lista, each _ > 3, {{"Menores", each _ <= 3}, {"Mayores", each _ > 3}})
in
    listaAgrupada
```

## Operaciones con Decimales

#### Redondeo de Decimales:

Para redondear un valor decimal, puedes utilizar las funciones Number.Round, Number.RoundDown y Number.RoundUp.

Ejemplo:
```m
let
    numero = 42.5,
    redondeo = Number.Round(numero) // Redondea a 43
    redondeoAbajo = Number.RoundDown(numero) // Redondea a 42
    redondeoArriba = Number.RoundUp(numero) // Redondea a 43
in
    {redondeo, redondeoAbajo, redondeoArriba}
```


