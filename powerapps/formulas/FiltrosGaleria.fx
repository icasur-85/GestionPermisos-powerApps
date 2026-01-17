// =======================================================
// Archivo: FiltrosGaleria.fx
// Funcionalidad: Filtros aplicados a la galería de listado
// Origen: Propiedad Items de la galería (o fórmula reutilizada)
// Descripción:
// Contiene la lógica de filtrado y ordenación aplicada al listado.
// =======================================================

If(
    IsBlank(cmbPersona.Selected.Value);
    Filter(Concesiones; false);
    Filter(
        Concesiones;
        'Persona:Apellidos'.Value & ", " & 'Persona:Nombre'.Value = cmbPersona.Selected.Value
    )
)
