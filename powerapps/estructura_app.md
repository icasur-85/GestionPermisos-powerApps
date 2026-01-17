# Estructura de la aplicación (Power Apps)

## 1. Objetivo
La aplicación permite la gestión de personas, solicitudes y concesiones de permisos en un entorno Microsoft 365.
Se apoya en listas de SharePoint Online como repositorio de datos y utiliza Power Automate para exportación a Excel.

## 2. Tecnologías
- Microsoft Power Apps (Power Fx)
- Microsoft Power Automate
- SharePoint Online (listas)
- Excel Online (Business)

## 3. Modelo de datos (SharePoint Online)
Listas principales utilizadas por la aplicación:

- **Personas**
  - Campos relevantes: `Nombre (Title)`, `Apellidos`, `DNI`, `Activa`
- **Solicitudes**
  - Campos relevantes: `Persona` (lookup), `Recurso` (lookup/choice), `TipoPermiso` (lookup/choice), `Estado` (choice), `FechaFin`, `Observaciones`, `Author`
- **Concesiones**
  - Campos relevantes: `Persona` (lookup), `Recurso` (lookup/choice), `TipoPermiso` (lookup/choice), `EstadoConcesion` (choice), `FechaConcesion`, `FechaFin`, `Observaciones`, `SolicitudRef` (lookup), `Título`
- **Roles**
  - Campos relevantes: `Usuario` (persona/email), `Rol` (choice)

> Nota: Los nombres de campos reflejan el modelo usado en la aplicación. Este repositorio no contiene datos reales.

## 4. Variables y colecciones de la aplicación
Variables globales destacadas:
- `varRolUsuario`: rol del usuario autenticado (consultado en lista **Roles**).
- `varEsTIC`: booleano derivado de `varRolUsuario` para habilitar funcionalidades TIC.
- `varSolicitudSeleccionada`: solicitud actualmente seleccionada/editar.
- `varPersonaSeleccionada`: persona seleccionada en pantallas de gestión.
- `varPopupBajaPersona`, `varPopupRevocar`: control de popups de confirmación.
- `varPersonaExpandida`: control de expansión de detalle en galerías.

Colecciones:
- `colExportarPermisos`: colección con datos preparados para exportación a Excel.
- `colConcesionesSel`: colección con concesiones seleccionadas para revocación masiva.

## 5. Pantallas y funcionalidades

### 5.1 PantallaInicio
- Inicializa variables de contexto (rol del usuario y bandera TIC).
- Navegación al resto de módulos: Personas, Solicitudes, Concesiones y Listados.

### 5.2 Gestión de Personas
- **PantallaPersonas**
  - Listado con filtro por estado (activas/todas) y buscador por nombre/apellidos/DNI.
  - Selección visual mediante `TemplateFill`.
  - Acceso a creación y baja.
- **PantallaPersonaDetalle**
  - Formulario de alta/edición.
  - Mensajes en `OnSuccess` y navegación de retorno.
- **PantallaBajaPersona**
  - Proceso de baja (marca `Activa=false`) y revocación automática de concesiones vigentes asociadas.
  - Confirmación mediante popup.

### 5.3 Gestión de Solicitudes
- **PantallaEditarSolicitud**
  - Alta/edición de solicitudes (título dinámico según modo del formulario).
  - Gestión de errores (`OnFailure`) y confirmación (`OnSuccess`).
- **PantallaMisSolicitudes**
  - Si `varEsTIC` muestra todas; si no, filtra por `Author.Email = User().Email`.
- **PantallaSolicitudesPendientes**
  - Filtra solicitudes en estado `Pendiente`.
  - Selección de solicitud y navegación a tramitación.
- **PantallaTramitarSolicitud**
  - Aceptar/Rechazar solicitud.
  - Aceptación: `Patch` a Solicitudes + creación de concesión asociada en Concesiones.
  - Rechazo: `Patch` de estado a `Rechazada`.

### 5.4 Gestión de Concesiones
- **PantallaMenuConcesiones**
  - Menú de acceso: revocar concesión, bajas, caducadas, consulta por persona.
- **PantallaRevocarConcesion**
  - Filtra concesiones vigentes.
  - Filtro por persona + búsqueda por texto (recurso/observaciones).
  - Revocación con confirmación (popup) y `Patch` de `EstadoConcesion` + `FechaFin`.
- **PantallaConcesionesCaducadas**
  - Revocación masiva de concesiones caducadas seleccionadas (`colConcesionesSel`) con confirmación.
- **PantallaConsultaPersona**
  - Listado de personas con filtros (activas/todas) y buscador.

### 5.5 Listados exportables
- **PantallaMenuListados**
  - Acceso a listados exportables.
- **PantallaListadoPorPersona**
  - Filtrado de concesiones por persona seleccionada.
- **PantallaListadoPorRecurso**
  - Combo de recursos (distinct) y listado de concesiones vigentes filtradas por recurso.

## 6. Exportación a Excel (Power Automate)
La exportación se realiza desde Power Apps:
1. Se construye `colExportarPermisos` con los campos a exportar.
2. Se llama al flujo `ExportarPermisosExcel` enviando la colección en JSON.
3. El flujo genera el fichero Excel (Excel Online) y devuelve la URL del archivo.
4. La app abre el fichero resultante (`Launch(fileurl)`).

Los detalles de expresiones y pasos se documentan en:
- `Powerautomate/FlujoExportacion.md`
- `Powerautomate/Expresiones.txt`
