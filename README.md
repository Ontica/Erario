# Erario

El Sistema Erario fue construido a la medida de las necesidades del [Centro de Estudios de las Finanzas Públicas (CEFP)](http://www.cefp.gob.mx/new/index.html) de la Cámara de Diputados, en México en el año 2005.

Se trata de un sistema de información web, que permite analizar en forma simple y ágil, el Proyecto de Presupuesto de Egresos de la Federación lo cual le permite a los legisladores tomar mejores decisiones en tiempos considerablemente menores.

El Proyecto de Presupuesto se puede comparar con los presupuestos aprobados en ejercicios anteriores (hasta 10 años hacia atrás), y la información presupuestal se puede detallar y agrupar por partida, programa, objeto del gasto y entidad gubernamental.

Al ser una solución web, el Sistema Erario puede escalarse a un sistema de consulta y análisis de información abierto a la ciudadanía, con el fin de transparentar la información y promover el presupuesto participativo.

## Tecnología

Este repositorio contiene el código de dicho sistema.

El proyecto fue desarrollado en C# 1.2, con .NET Framework 1.1, ASP y JavaScript 5.0, y puede utilizar cualquier base de datos compatible con OLE DB. El sistema puede compilarse utilizando Visual Studio 2005 y posiblemente también en versiones posteriores.

Al igual que el resto de nuestras soluciones, este sistema está basado en [Empiria Framework](https://github.com/Ontica/Empiria.Core), lo cual nos permitió construirlo en apenas tres semanas, con todo y la carga de información de cuatro años, y a un costo para la sociedad casi insignificante.

## Contenido

1. **Backend**  
   Contiene el código C# con los componentes reutilizables del Sistema Erario.

2. **Web site**  
   Aplicación web basada en HTML para acceder, consultar y analizar la información presupuestal propuesta para el año en curso, y compararla con la aprobada en ejercicios anteriores.

2. **Binaries**  
   Los archivos DLL del código C# en su última versión. Se incluyen en el repositorio en virtud de que puede ser complicado 
   regenerar las DLLs por la antigüedad de las herramientas con las que fue desarrollado.

## Licencia

Este sistema se distribuye bajo la licencia [GNU AFFERO GENERAL PUBLIC LICENSE](https://github.com/Ontica/Erario/blob/master/LICENSE.txt).

En Óntica siempre entregamos soluciones y sistemas de información de código abierto. Consideramos que esta práctica debería ser inexcusable cuando se trata de sistemas de utilidad pública, como es el caso de los sistemas para gobierno.

# Versión

Esta versión del código es la más actualizada, y es la que corresponde a la que se entregó oficialmente al CEFP en el año 2005.

# Copyright

Copyright © 2005. La Vía Óntica S.C. y colaboradores.
