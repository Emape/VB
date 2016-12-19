Imports System.Data
Imports System.Configuration
Imports System.Data.SqlClient
Imports CrystalDecisions.CrystalReports.Engine
Imports CrystalDecisions.Shared

Imports Microsoft.VisualBasic
Public Class RepTomaInventario
    Inherits System.Web.UI.Page
    Private Function GetTomaInventario(sp As String, vanno As String, empresa As String, stock As String) As dtTomaInventario

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
        cmd.Parameters.AddWithValue("@IdAnno", vanno)
        cmd.Parameters.AddWithValue("@Stock", stock)
        cmd.Parameters.AddWithValue("@TipoArticulo", "B")
        cmd.Parameters.AddWithValue("@Empresa", nom)
        cmd.CommandType = CommandType.StoredProcedure

        Using con As New SqlConnection(conn)
            Using sda As New SqlDataAdapter()
                cmd.Connection = con
                sda.SelectCommand = cmd
                Using ds As New dtTomaInventario()
                    sda.Fill(ds, "DataTable1")
                    Return ds
                End Using
            End Using
        End Using

    End Function

    Protected Sub Imprimir(sender As Object, e As EventArgs)

        Dim vanno = anno.Text
        Dim vstock = stock.Text
        Dim sp = "sp_LOG_GrupoClaseArticulo"
        Dim ruta = "~/Reportes/rptFormatoInventario.rpt"
        Dim empresa = cod_empresa.Text

        Dim crystalReport As New ReportDocument()
        crystalReport.Load(Server.MapPath(ruta))
        Dim ds As dtTomaInventario = GetTomaInventario(sp, vanno, empresa, vstock)
        crystalReport.SetDataSource(ds)

        Dim formatType As ExportFormatType = ExportFormatType.NoFormat
        formatType = ExportFormatType.PortableDocFormat
        crystalReport.ExportToHttpResponse(formatType, Response, False, "Reporte_Toma_Inventario")
        Response.[End]()

    End Sub
End Class

