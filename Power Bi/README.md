# Ejemplos Power BI

- [Introducción](#introducción)
- [Primeros pasos](#primeros-pasos)
- [Instalación de Docker Desktop](#Instalación-de-docker-desktop)

## Introducción

Bienvenido/a al repositorio de ejemplo para el uso de SQL y BI. Este repositorio tiene como objetivo proporcionar ejemplos prácticos y guías útiles para aquellos que estén interesados en aprender sobre SQL y BI.

### ¿Power BI
SQL (Structured Query Language) es un lenguaje de programación utilizado para administrar y manipular bases de datos relacionales. Se utiliza para realizar diversas tareas, como la creación de bases de datos, la inserción de datos en ellas, la modificación de datos existentes y la eliminación de datos. SQL es un lenguaje muy popular entre los desarrolladores y analistas de datos debido a su facilidad de uso y su capacidad para manejar grandes conjuntos de datos.

### ¿Qué es BI?
BI (Business Intelligence) es un conjunto de tecnologías y herramientas que se utilizan para analizar y presentar datos empresariales. BI se utiliza para ayudar a las empresas a tomar decisiones informadas, basadas en datos, sobre su rendimiento y estrategias. BI incluye herramientas para la visualización de datos, la elaboración de informes, el análisis de datos y la minería de datos.

En este repositorio, encontrarás ejemplos prácticos de cómo utilizar SQL y BI juntos para analizar y visualizar datos empresariales. También encontrarás guías útiles sobre cómo crear bases de datos, escribir consultas SQL y utilizar herramientas de BI populares como Tableau y Power BI.

¡Esperamos que encuentres este repositorio útil y que te ayude a aprender más sobre SQL y BI!

## Primeros pasos

Es necesario cargar una base de datos de muestra como AdventureWorks de SQL Server para realizar ejercicios, puedes hacerlo en el siguiente enlace:

[Descarga .bak de AdventureWorks 2019](https://github.com/Microsoft/sql-server-samples/releases/download/adventureworks/AdventureWorks2019.bak)

o ve directamente a la página oficial de **SQL Docs Microsoft** y descarga la version de backup 2019.

[SQL Docs Microsoft](https://learn.microsoft.com/en-us/sql/samples/adventureworks-install-configure?view=sql-server-ver16&tabs=ssms)

Guarda este archivo en una como **"C:\\AdventureWorks2019.bak"** ya que más tarde usaremos esta ruta para copiar el archivo backup (.bak) a la ruta primaria del contenedor Docker.
