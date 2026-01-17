// =======================================================
// Funcionalidad: Exportación de permisos a Excel
// Origen: Propiedad OnSelect del botón de exportación
// Descripción:
// 1) Construye una colección con los datos visibles en la galería.
// 2) Muestra un aviso con el número de filas a exportar.
// 3) Llama a un flujo de Power Automate enviando la colección en JSON.
// 4) Recupera la URL del fichero generado y lo abre en el navegador.
// =======================================================


// -------------------------------------------------------
// BotónExportar - Propiedad: OnSelect
// -------------------------------------------------------
ClearCollect(
    colExportarPermisos;
    ForAll(
        galListadoPermisos.AllItems;
        {
            Persona: 'Persona:Nombre'.Value & " " & 'Persona:Apellidos'.Value;
            Recurso: Recurso.Value;
            TipoPermiso: TipoPermiso.Value;
            FechaConcesion: Text(FechaConcesion; "[$-es-ES]dd/mm/yyyy")
        }
    )
);;

Notify(
    "Filas a exportar: " & CountRows(colExportarPermisos);
    NotificationType.Information
);;

Set(
    varResultadoExportacion;
    ExportarPermisosExcel.Run(
        JSON(colExportarPermisos; JSONFormat.IgnoreBinaryData)
    )
);;

Set(
    varFileUrl;
    Text(varResultadoExportacion.fileurl)
);;

If(
    !IsBlank(varFileUrl);
    Launch(varFileUrl)
)
