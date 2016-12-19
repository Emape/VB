Imports System.Data
Imports System.Configuration
Imports System.Data.SqlClient
Imports CrystalDecisions.CrystalReports.Engine
Imports CrystalDecisions.Shared

Imports Microsoft.VisualBasic

Public Class RequerimientoAlm
    Inherits System.Web.UI.Page
    Private Function GetReq(sp As String, idreq As String, empresa As String) As RequerimientoAlmacen

        Dim cx As String = ""

        If empresa = 1 Then
            cx = "cnEmape"
        ElseIf empresa = 2 Then
            cx = "cnEmapeMunicipal"
        ElseIf empresa = 3 Then
            cx = "cnRegional"
        ElseIf empresa = 4 Then
            cx = "cnMantenimiento"
        ElseIf empresa = 5 Then
            cx = "cnSiaf"
        End If

        Dim conn As String = ConfigurationManager.ConnectionStrings(cx).ConnectionString
        'Dim cmd As New SqlCommand(Query)


        Dim cmd As New SqlCommand(sp)
        cmd.Parameters.AddWithValue("@IdRequerimiento", idreq)
        cmd.Parameters.AddWithValue("@BienServicio", "B")
        cmd.CommandType = CommandType.StoredProcedure

        Using con As New SqlConnection(conn)
            Using sda As New SqlDataAdapter()
                cmd.Connection = con
                sda.SelectCommand = cmd
                Using dsCustomers As New RequerimientoAlmacen()
                    sda.Fill(dsCustomers, "DataTable1")
                    Return dsCustomers
                End Using
            End Using
        End Using

    End Function

    Protected Sub ExportarReq(sender As Object, e As EventArgs)
        Dim empresa = cod_empresa.text
        Dim req = txt_req.Text
        Dim crystalReport As New ReportDocument()
        crystalReport.Load(Server.MapPath("~/Reportes/rptPedidos.rpt"))

        Dim dsCustomers As RequerimientoAlmacen = GetReq("sp_LO_rptPedidoBienes", req, empresa)
        crystalReport.SetDataSource(dsCustomers)

        Dim formatType As ExportFormatType = ExportFormatType.NoFormat
        formatType = ExportFormatType.PortableDocFormat
        crystalReport.ExportToHttpResponse(formatType, Response, False, "Requerimiento de Almacén")
        Response.[End]()
    End Sub
End Class
