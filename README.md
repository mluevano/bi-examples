# Tabla de contenidos BI

- [Introducción](#introducción)
- [Primeros pasos](#primeros-pasos)
- [Ejemplos de Consulta](#sección-dos)
- [Conclusiones](#conclusiones)

## Introducción

Bienvenido/a al repositorio de ejemplo para el uso de SQL y BI. Este repositorio tiene como objetivo proporcionar ejemplos prácticos y guías útiles para aquellos que estén interesados en aprender sobre SQL y BI.

### ¿Qué es SQL?
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

### 1.- Instalación de Docker Desktop

Docker es una plataforma de contenedores que permite a los desarrolladores crear, implementar y ejecutar aplicaciones en cualquier entorno. Docker Desktop es la aplicación de escritorio de Docker para Windows y Mac, que proporciona una experiencia de usuario intuitiva para desarrollar y administrar aplicaciones de contenedores.

Para instalar Docker Desktop, sigue los siguientes pasos:

1. Descarga Docker Desktop desde la página web oficial de Docker. Selecciona la versión adecuada para tu sistema operativo (Windows o Mac) y descarga el instalador.

2. Ejecuta el instalador de Docker Desktop. Se te pedirá que aceptes los términos y condiciones de uso de Docker.

3. En el proceso de instalación, se te pedirá que elijas las opciones de configuración de Docker Desktop. Puedes seleccionar las opciones por defecto o personalizarlas según tus necesidades.

4. Una vez completada la instalación, Docker Desktop se iniciará automáticamente. Puedes comprobar que se ha instalado correctamente abriendo una ventana de terminal y ejecutando el comando docker version.

¡Listo! Ahora tienes Docker Desktop instalado en tu sistema. Puedes empezar a utilizarlo para crear, ejecutar y administrar aplicaciones de contenedores.

### 2.- Instalación SQL Server con Linux en Docker Container

Para instalar SQL en un contenedor de Docker, necesitarás utilizar la línea de comandos de tu sistema operativo. En Windows, esto se conoce como "Command Prompt" o "cmd", mientras que en MacOS y Linux se llama "Terminal". En adelante, nos referiremos a la línea de comandos como "consola".

Sigue los siguientes pasos para realizar la instalación de SQL en Docker:

1. Abre una consola en tu sistema operativo. En Windows, esto se puede hacer buscando "cmd" en el menú de inicio y abriendo el "Command Prompt". En MacOS, puedes abrir la "Terminal" desde la carpeta "Utilidades" en la carpeta "Aplicaciones".

2. Descarga la imagen e instala SQL Server 2019 en un contenedor de Docker utilizando el siguiente comando:

```bash
docker run --name local-redis -d -p 127.0.0.3:6379:6379 -v redis-data:/data redis redis-server --requirepass <MyPassword> --bind 0.0.0.0 --save 60 1 --loglevel warning --maxclients 100
```

Asegúrate de reemplazar <MyPassword> con una contraseña segura para el usuario **SA** de SQL Server.

¡Listo! Ahora tienes un contenedor de SQL Server en Docker que puedes utilizar para crear y administrar bases de datos. Puedes conectarte al servidor SQL utilizando una herramienta de gestión de bases de datos, como SQL Server Management Studio, y conectarte al servidor al host **127.0.0.3** el cual fue configurado en el comando docker anterior.

Aquí un ejemplo de como realizarlo:

<p align="center">
  <img src="https://github.com/mluevano/bi-examples/blob/main/LoginSQL.png" width="auto" alt="Logo">
</p>

### 3.- Restauración de la base de datos AdventureWorks2019

Para restaurar el backup SQL AdventureWorks2019 en la nueva instancia de SQL dentro de nuestro contenedor Docker, necesitarás utilizar la línea de comandos de tu sistema operativo para copiar el archivo ***AdventureWorks2019.bak***.

Sigue los siguientes pasos para realizar la instalación de SQL en Docker:

1. Abre una consola en tu sistema operativo cmd

2. Copia el archivo AdventureWorks2019.bak a la carpeta raíz del contenedor docker con el siguiente comando:

```bash
docker cp C:\AdventureWorks2019.bak sql_c1:/
```

Una vez realizado esto podrás visualizarlo dentro del contenedor docker y continuar con la restauración.

Ahora selecciona la siguiente opción dentro de SQL Management Studio para restaurar la base de datos:

1. Despliega la carpeta Databases dando clic en la cruz [+]
2. Click derecho sobre la carpeta Databases y elige la opción *Restore Database* 

<p align="center">
  <img src="https://github.com/mluevano/bi-examples/blob/main/Restore_db_1.png" width="auto" alt="Logo">
</p>

3. Busca el archivo *AdventureWorks2019.bak* dando clic

