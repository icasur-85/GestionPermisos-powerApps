# Flujo ExportarPermisosExcel

## Tipo de flujo
Instantáneo (invocado desde Power Apps)

## Objetivo
Generar un fichero Excel Online a partir de los datos enviados desde Power Apps
y devolver la URL del archivo generado para su apertura automática.

## Origen
El flujo se ejecuta desde la aplicación Power Apps mediante la llamada:
ExportarPermisosExcel.Run(...)

## Entrada
- Colección de registros en formato JSON enviada desde Power Apps.
- Cada registro contiene información de persona, recurso, tipo de permiso y fechas.

## Lógica del flujo
1. Recepción de datos desde Power Apps (trigger Power Apps V2).
2. Parseo del contenido JSON recibido.
3. Validación de existencia de registros.
4. Creación de un archivo Excel mediante Excel Online (Business).
5. Inserción de filas en la tabla Excel utilizando un bucle.
6. Construcción de la respuesta con la URL del archivo generado.

## Salida
- URL del fichero Excel creado (`fileurl`), devuelta a Power Apps.
- La aplicación abre automáticamente el archivo mediante la función Launch().

## Observaciones
El flujo no gestiona datos sensibles y se utiliza exclusivamente con fines
académicos dentro del Trabajo de Fin de Estudios.

