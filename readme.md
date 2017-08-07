# [WESTEROS][repo]

**Práctica de Fundamentos iOS - V Edición**

Se ha realizado la parte obligatoria y la parte de genéricos.

Nota: los controladores en plural son genéricos, y el controlador en singular una vista controladora personalizada.

----------

## Navegación
Se respeta la navegación propuesta en el ejercicio, y se detalla a continuación el comportamiento y la forma de acceder a los controladores que no forman parte de las pestañas iniciales:
  - Inicialmente se carga un tabBarController con 2 pestañas: 'Houses' y 'Seasons'
  - Cada controlador genérico se ha envuelto en un navController: 'House' y 'Season'
  - Los genéricos dan acceso a los controladores personalizados de cada clase.
  - En los controladores personalizados se habilita un botón para navegar a otros controladores genéricos: 'Members' y 'Episodes'
  - Y repetimos la operación. Desde el controlador genérico se navega al controlador personalizado: 'Person' y 'Episode'

## Ejercicio - Genéricos
Se han implementado 4 genéricos:
  - 'Episodes' --> 'Episode' (personalizado)
  - 'Houses' --> 'House' (personalizado)
  - 'Members' --> 'Person' (personalizado)
  - 'Seasons' --> 'Season' (personalizado)

Los tableViewController genéricos muestran todos los datos del repositorio que pertenecen a esa clase. Al seleccionar un dato se carga la vista personalizada.
>**Nota**: en el proyecto se pueden consultar los tableViewController que se han sustituido por genéricos. Se mantienen pero no se utilizan tanto HousesViewController y MembersViewController. Los tableViewController de 'Seasons' y 'Episodes' se han construido directamente con genéricos.

## Ejercicio - Obligatorio
Se crean los datos necesarios en el repositorio para realizar la práctica.

1. Se implementan los protocolos y tests indicados:
a. CustomStringConvertible
b. Equatable
c. Hashable
d. Comparable
2. La propiedad calculada del repositorio devuelve todas las temporadas y todos los episodios sin limitación alguna.
3. Se crea el filtro personnalizado 'seasons(filteredBy:)'
4. Se crea el genérico para temporadas, y se enlaza con el controlador personalizado.
5. Idem para 'Episodes' por genérico y 'EpisodeViewController' personalizado
6. La navegación se muestra en el primer punto para entender el flujo de la aplicación

## Otros
1. En el WikiVC hay un 'ActivityController' que se muestra mientras carga la página web. Se implementa lo mismo con una imagen, que irá cargando los distintos frames de un sprite consiguiendo el mismo efecto.
2. Al cargar la página desaparece la imagen cargada en el punto anterior y se destruye para no ocupar memoria. Descargamos de memoria el conjunto de imágenes y probamos el concepto de ARC.


  [repo]: https://github.com/TheHandyOwl/Westeros
