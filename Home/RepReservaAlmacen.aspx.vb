Imports System.Data
Imports System.Configuration
Imports System.Data.SqlClient
Imports CrystalDecisions.CrystalReports.Engine
Imports CrystalDecisions.Shared

Imports Microsoft.VisualBasic
Public Class RepReservaAlmacen
    Inherits System.Web.UI.Page
    Private Function GetReservaAlmacen(sp As String, ini As String, empresa As String, fin As String) As dtReservaAlmacen

        Dim cx, nom As String

        If empresa = 1 Then
            cx = "cnEmape"
            nom = "Empresarial"
        ElseIf empresa = 2 Then
            cx = "cnEmapeMunicipal"
            nom = "Municipal"
        ElseIf empresa = 3 Then
            cx = "cnRegional"
            nom = "Regional"
        ElseIf empresa = 4 Then
            cx = "cnMantenimiento"
            nom = "Mantenimiento Vial"
        ElseIf empresa = 5 Then
            cx = "cnSiaf"
            nom = "SIAF"
        Else
            cx = ""
            nom = ""
        End If

        Dim conn As String = ConfigurationManager.ConnectionStrings(cx).ConnectionString
        Dim cmd As New SqlCommand(sp)
        cmd.Parameters.AddWithValue("@IdBienServicioIni", ini)
        cmd.Parameters.AddWithValue("@IdBienServicioFin", fin)
        cmd.Parameters.AddWithValue("@Empresa", nom)
        cmd.CommandType = CommandType.StoredProcedure

        Using con As New SqlConnection(conn)
            Using sda As New SqlDataAdapter()
                cmd.Connection = con
                sda.SelectCommand = cmd
                Using ds As New dtReservaAlmacen
                    sda.Fill(ds, "DataTable1")
                    Return ds
                End Using
            End Using
        End Using

    End Function

    Protected Sub Imprimir(sender As Object, e As EventArgs)

        Dim ini = idbienservicioinicial.Text
        Dim fin = idbienserviciofinal.Text
        Dim sp = "LG_ReservaAlmacen1"
        Dim ruta = "~/Reportes/Logistica/rptReservaAlmacen.rpt"
        Dim empresa = cod_empresa.Text

        Dim crystalReport As New ReportDocument()
        crystalReport.Load(Server.MapPath(ruta))
        Dim ds As dtReservaAlmacen = GetReservaAlmacen(sp, ini, empresa, fin)
        crystalReport.SetDataSource(ds)

        Dim formatType As ExportFormatType = ExportFormatType.NoFormat
        formatType = ExportFormatType.PortableDocFormat
        crystalReport.ExportToHttpResponse(formatType, Response, False, "Reporte_Reserva_Almacen")
        Response.[End]()

    End Sub
End Class

