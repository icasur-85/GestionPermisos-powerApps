# Carpeta de fórmulas Power Apps

Esta carpeta contiene las expresiones y fórmulas Power Fx utilizadas en la aplicación
desarrollada con Microsoft Power Apps.

Cada archivo corresponde a una pantalla o funcionalidad concreta de la aplicación y
recoge únicamente las propiedades relevantes (Items, OnSelect, OnVisible, OnSuccess,
etc.), con el objetivo de documentar la lógica implementada sin incluir información
sensible ni dependencias de la plataforma.

## Estructura de los archivos

- **PantallaInicio.txt**  
  Inicialización de variables de contexto y navegación principal.

- **PantallaPersonas.txt**  
  Gestión de personas: listado, búsqueda, selección, alta y baja.

- **PantallaPersonaDetalle.txt**  
  Formulario de alta y edición de personas.

- **PantallaBajaPersona.txt**  
  Proceso de baja de personas y revocación automática de concesiones.

- **PantallaEditarSolicitud.txt**  
  Alta y edición de solicitudes con control de errores y mensajes.

- **PantallaMisSolicitudes.txt**  
  Consulta de solicitudes filtradas por rol de usuario.

- **PantallaSolicitudesPendientes.txt**  
  Listado y selección de solicitudes pendientes de tramitación.

- **PantallaTramitarSolicitud.txt**  
  Aceptación o rechazo de solicitudes y creación de concesiones asociadas.

- **PantallaMenuConcesiones.txt**  
  Menú de navegación para la gestión de concesiones.

- **PantallaRevocarConcesion.txt**  
  Revocación individual de concesiones vigentes con filtros y confirmación.

- **PantallaConcesionesCaducadas.txt**  
  Revocación masiva de concesiones caducadas.

- **PantallaConsultaPersona.txt**  
  Consulta de personas y concesiones asociadas.

- **PantallaMenuListados.txt**  
  Menú de acceso a listados exportables.

- **PantallaListadoPorPersona.txt**  
  Listado de concesiones filtradas por persona.

- **PantallaListadoPorRecurso.txt**  
  Listado de concesiones filtradas por recurso.

- **ExportarExcel.fx**  
  Lógica de exportación de datos a Excel mediante Power Automate.

## Nota
Las fórmulas publicadas reflejan la lógica real de la aplicación en el momento de la
entrega del Trabajo de Fin de Estudios y se incluyen exclusivamente con fines académicos
