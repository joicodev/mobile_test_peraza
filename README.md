# Evsy's Challenge

El objetivo del proyecto es consumir un endpoint proporcionado por Evsy, que devuelve información sobre el estado de los cargadores eléctricos. La respuesta del endpoint `api/status/statistics/` consiste en 24 registros que representan el estado del cargador para cada hora del día en una escala de 0 a 100. Existen cinco estados diferentes: disponible, ocupado, fuera de servicio, reservado y desconocido. El objetivo es filtrar los registros por días de la semana, por cada hora del día y mostrar la información de los cargadores eléctricos en un formato legible y comprensible, agregando los valores de cada estado y mostrando un gráfico de barras en porcentaje de 0 a 100 para cada día de la semana. El procesamiento de los datos se realiza en la capa de `application` y se muestran en la capa `presentation` mediante un gráfico de barras.

![image](https://user-images.githubusercontent.com/31873662/222486488-e7617aa3-f3e0-4b36-b044-96f815a06417.png)


## _Estructura del proyecto_

La capa `domain` contiene las entidades y los repositorios abstractos que definen la lógica de negocio de la aplicación.

La capa `infrastructure` contiene los repositorios concretos que implementan los repositorios abstractos definidos en la capa domain. Estos repositorios concretos se comunican con las APIs externas.

La capa `presentation` contiene los elementos de la interfaz de usuario, como widgets y páginas, así como los proveedores de estado que se encargan de administrar y proporcionar el estado a los widgets. Esta capa también puede contener otros objetos y utilidades que son específicos de la interfaz de usuario, como animaciones, transiciones y estilos.

La capa `application` Se utiliza para manejar la lógica de la aplicación y actúa como intermediario entre las capas de presentación e infraestructura, a través de los providers se manejan eventos de la capa de presentación y se exponen estados que reflejan la información actual del sistema. 

![](https://user-images.githubusercontent.com/31873662/222475823-9a336f2e-0cff-4ff2-a8c6-590535cc14b1.png)

## _Uso de Clean Architecture_

En la arquitectura de esta aplicación, la capa `application` es responsable de manejar los eventos de la capa `presentation` y exponer el estado de las entidades. La clase `ChargerStatusNotifier` es un ejemplo de cómo se utiliza esta capa para manejar el estado de la entidad `ChargerStatusEntity`, que se encuentra en la carpeta `entities` de la capa `domain`.

Dentro de `ChargerStatusNotifier`, la función `getStatistics` es llamada desde la capa de `presentation` a través del provider `chargerNotifierProvider` y hace uso de la capa de `infrastructure` a través de la interfaz `IChargerStatusRepository` definida en la carpeta repositories de la capa `domain` para obtener los datos necesarios para actualizar el estado. Una vez que el estado ha sido actualizado, se notifica a la capa de `presentation` a través del cambio de estado.

## _Principales tecnologías usadas_

- `Flutter`: Framework de desarrollo de aplicaciones móviles multiplataforma de código abierto desarrollado por Google.
- `Dart`: Lenguaje de programación orientado a objetos y fuertemente tipado que se utiliza para desarrollar aplicaciones con Flutter.
- `Riverpod`: Paquete de gestión de estado de Flutter que proporciona una forma sencilla de proporcionar y consumir instancias de objetos a través de toda la aplicación.
- `Dio`: Paquete de Flutter que proporciona una forma sencilla y cómoda de realizar solicitudes HTTP a un servidor.
- `Freezed`: Paquete de Flutter que ayuda a generar código más seguro y eficiente para la manipulación de datos inmutables, como entidades y estados.
- `mrx_charts`: Paquete de gráficos para Flutter que permite crear gráficos personalizados de forma sencilla. Ofrece una variedad de tipos de gráficos, como barras, líneas, pastel y donas, así como opciones de personalización para colores, etiquetas, leyendas y más. Es una biblioteca gratuita y de código abierto que se puede integrar fácilmente en proyectos de Flutter para visualizar datos de forma clara y efectiva.
- `Lottie`: Lottie es una biblioteca móvil para Android e iOS que analiza las animaciones de Adobe After Effects exportadas como JSON con Bodymovin y las renderiza nativamente en dispositivos móviles.
