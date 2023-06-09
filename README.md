# Tabla de contenidos BI

- [Introducción](#introducción)
- [Primeros pasos](#primeros-pasos)
- [Instalación de Docker Desktop](#Instalación-de-docker-desktop)
- [Instalación SQL Server Linux en Docker Container](#instalación-sql-server-linux-en-docker-container)
- [Restauración base de datos AdventureWorks2019](#restauración-base-de-datos-adventureWorks2019)

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

## Instalación de Docker Desktop

Docker es una plataforma de contenedores que permite a los desarrolladores crear, implementar y ejecutar aplicaciones en cualquier entorno. Docker Desktop es la aplicación de escritorio de Docker para Windows y Mac, que proporciona una experiencia de usuario intuitiva para desarrollar y administrar aplicaciones de contenedores.

Para instalar Docker Desktop, sigue los siguientes pasos:

1. Descarga Docker Desktop desde la página web oficial de Docker. Selecciona la versión adecuada para tu sistema operativo (Windows o Mac) y descarga el instalador.

1. Ejecuta el instalador de Docker Desktop. Se te pedirá que aceptes los términos y condiciones de uso de Docker.

1. En el proceso de instalación, se te pedirá que elijas las opciones de configuración de Docker Desktop. Puedes seleccionar las opciones por defecto o personalizarlas según tus necesidades.

1. Una vez completada la instalación, Docker Desktop se iniciará automáticamente. Puedes comprobar que se ha instalado correctamente abriendo una ventana de terminal y ejecutando el comando docker version.

¡Listo! Ahora tienes Docker Desktop instalado en tu sistema. Puedes empezar a utilizarlo para crear, ejecutar y administrar aplicaciones de contenedores.

## Instalación SQL Server Linux en Docker Container

Para instalar SQL en un contenedor de Docker, necesitarás utilizar la línea de comandos de tu sistema operativo. En Windows, esto se conoce como "Command Prompt" o "cmd", mientras que en MacOS y Linux se llama "Terminal". En adelante, nos referiremos a la línea de comandos como "consola".

Sigue los siguientes pasos para realizar la instalación de SQL en Docker:

1. Abre una consola en tu sistema operativo. En Windows, esto se puede hacer buscando "cmd" en el menú de inicio y abriendo el "Command Prompt". En MacOS, puedes abrir la "Terminal" desde la carpeta "Utilidades" en la carpeta "Aplicaciones".

2. Descarga la imagen e instala SQL Server 2019 en un contenedor de Docker utilizando el siguiente comando:

```bash
docker volume create mssql9
```

```bash
docker run -e "ACCEPT_EULA=Y" -e "SA_PASSWORD=<MyPassword>" -e "MSSQL_PID=Developer" -p 127.0.0.2:1433:1433 -v mssql9:/var/opt/mssql --name sql_c1 -d mcr.microsoft.com/mssql/server:2019-latest
```

Asegúrate de reemplazar <MyPassword> con una contraseña segura para el usuario **SA** de SQL Server.

¡Listo! Ahora tienes un contenedor de SQL Server en Docker que puedes utilizar para crear y administrar bases de datos. Puedes conectarte al servidor SQL utilizando una herramienta de gestión de bases de datos, como SQL Server Management Studio, y conectarte al servidor al host **127.0.0.3** el cual fue configurado en el comando docker anterior.

Aquí un ejemplo de como realizarlo:

<p align="center">
  <img src="https://github.com/mluevano/bi-examples/blob/main/Images/InstalacionSQL/LoginSQL.png" width="auto" alt="Logo">
</p>

## Restauración base de datos AdventureWorks2019

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
  <img src="https://github.com/mluevano/bi-examples/blob/main/Images/InstalacionSQL/Restore_db_1.png" width="auto" alt="Logo">
</p>

3. Busca el archivo *AdventureWorks2019.bak* dando clic sobre la opción "device" y luego en los tres puntos [...]

<p align="center">
  <img src="https://github.com/mluevano/bi-examples/blob/main/Images/InstalacionSQL/Restore_db_2.png" width="auto" alt="Logo">
</p>

4. Una vez realizado esto podrás ver que el estado de carga esta listo "Ready", ahora haz clic en "Ok"

<p align="center">
  <img src="https://github.com/mluevano/bi-examples/blob/main/Images/InstalacionSQL/Restore_db_3.png" width="auto" alt="Logo">
</p>
  
5. Una vez completada la operación tendrás un mensaje de confirmación.
  
<p align="center">
  <img src="https://github.com/mluevano/bi-examples/blob/main/Images/InstalacionSQL/Restore_db_4.png" width="auto" alt="Logo">
</p>

 6. Bien ahora ya puedes explorar la base de datos y hacer consultas SQL.
  
 <p align="center">
  <img src="https://github.com/mluevano/bi-examples/blob/main/Images/InstalacionSQL/Restore_db_5.png" width="auto" alt="Logo">
</p>

 Aquí comienza tu camino al analisis de datos con SQL y Power BI.
