# Flujos de Power Automate

Esta carpeta contiene la documentación de los flujos desarrollados en Power Automate
como parte del Trabajo de Fin de Estudios del Grado en Ingeniería Informática de UNIR.

Los flujos implementan parte de la lógica de negocio de la solución, automatizando
procesos clave relacionados con la gestión de solicitudes, concesiones y notificaciones
en el entorno Microsoft 365.

## Flujos implementados

### ExportarPermisosExcel
- Tipo: Instantáneo (invocado desde Power Apps).
- Función: Generación de un fichero Excel Online a partir de los datos enviados
  desde la aplicación y devolución de la URL del archivo generado.

### Comprobar concesiones caducadas
- Tipo: Programado.
- Función: Revisión periódica del estado de las concesiones para detectar aquellas
  que han alcanzado su fecha de finalización y actualizar su estado en el sistema.

### Notificación nueva solicitud de permiso
- Tipo: Automatizado.
- Función: Envío de notificaciones automáticas cuando se registra una nueva solicitud
  de permiso en el sistema.

### Notificación resultado solicitud permiso
- Tipo: Automatizado.
- Función: Envío de notificaciones al usuario informando del resultado de la tramitación
  de su solicitud (aceptada o rechazada).

## Documentación adicional
- `FlujoExportacion.md`: descripción detallada del flujo de exportación a Excel.
- `Expresiones.txt`: expresiones relevantes utilizadas en los flujos.

## Nota
La documentación incluida refleja la lógica real implementada en los flujos en el
momento de la entrega del Trabajo de Fin de Estudios y no contiene información sensible
ni credenciales.

