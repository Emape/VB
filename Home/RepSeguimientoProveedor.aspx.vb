Imports System.Data
Imports System.Configuration
Imports System.Data.SqlClient
Imports CrystalDecisions.CrystalReports.Engine
Imports CrystalDecisions.Shared

Imports Microsoft.VisualBasic
Public Class RepSeguimientoProveedor
    Inherits System.Web.UI.Page
    Private Function GetSeguimientoProveedor(sp As String, ruc As String, empresa As String) As dtSeguimientoProveedor
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

        cmd.Parameters.AddWithValue("@IdProveedor", ruc)
        cmd.Parameters.AddWithValue("@Empresa", nom)
        cmd.CommandType = CommandType.StoredProcedure

        Using con As New SqlConnection(conn)
            Using sda As New SqlDataAdapter()
                cmd.Connection = con
                sda.SelectCommand = cmd
                Using ds As New dtSeguimientoProveedor()
                    sda.Fill(ds, "DataTable1")
                    Return ds
                End Using
            End Using
        End Using

    End Function

    Protected Sub Imprimir(sender As Object, e As EventArgs)

        Dim ruc = cod_ruc.Text

        Dim empresa = cod_empresa.Text
        Dim sp As String = "SP_LOG_SEGUIMIENTO_PROVEEDOR"
        Dim crystalReport As New ReportDocument()

        crystalReport.Load(Server.MapPath("~/Reportes/Logistica/rptSeguimientoProveedor.rpt"))
        Dim ds As dtSeguimientoProveedor = GetSeguimientoProveedor(sp, ruc, empresa)
        crystalReport.SetDataSource(ds)


        Dim formatType As ExportFormatType = ExportFormatType.NoFormat
        formatType = ExportFormatType.PortableDocFormat

        crystalReport.ExportToHttpResponse(formatType, Response, False, "Reporte_Seguimiento_Proveedor")
        Response.[End]()

    End Sub

End Class
