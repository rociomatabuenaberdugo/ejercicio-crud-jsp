# CRUD con JSP y BBDD ("Mundo cartas")

  Ejercicio que se basará en la creación de una aplicación tipo CRUD (alta, listado, modificación y borrado) sobre la información almacenada en una base de datos MySQL.

# Temática de la Practica

  Para este ejercicio, la temática sera la gestión de usuarios y las cartas coleccionables que tengan éstos.

# Diseño de la Base de Datos

  En éste ejercicio hay tres tablas principales:

  * <b>Familia cartas.</b> Ésta tabla guarda las distintas tipos de colecciones a las cuales puede pertenecer las cartas de los usuarios.

  * <b>Cartas.</b> Ésta tabla recopila las cartas introducidas por el usuario, es decir, las cartas que tiene el usuario.
  
  * <b>Usuario.</b> Ésta tabla recopila las información básica de los distintos usuarios.  
  
  Después, una cuarta tabla aparece (<b>cartasusuario</b>) debido a que la relación de Cartas a Usuario es un muchos a muchos.

<img src=./Imágenes/Relaciones.JPG>
