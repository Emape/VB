Imports System.Data
Imports System.Configuration
Imports System.Data.SqlClient
Imports CrystalDecisions.CrystalReports.Engine
Imports CrystalDecisions.Shared

Partial Class VB
    Inherits System.Web.UI.Page

    Private Function GetReqAlm(sp As String, idreq As String, empresa As String) As RequerimientoAlmacen

        Dim cx As String = ""

        If empresa = 1 Then
            cx = "cnEmape"
        ElseIf empresa = 2 Then
            cx = "cnEmapeMunicipal"
        ElseIf empresa = 3 Then
            cx = "cnRegional"
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

    Private Function GetGuia(sp As String, idguia As String, empresa As String) As Guias

        Dim cx As String = ""

        If empresa = 1 Then
            cx = "cnEmape"
        ElseIf empresa = 2 Then
            cx = "cnEmapeMunicipal"
        ElseIf empresa = 3 Then
            cx = "cnRegional"
        End If

        Dim conn As String = ConfigurationManager.ConnectionStrings(cx).ConnectionString
        'Dim cmd As New SqlCommand(Query)


        Dim cmd As New SqlCommand(sp)
        cmd.Parameters.AddWithValue("@IdGuiaInicial", idguia)
        cmd.Parameters.AddWithValue("@IdGuiaFinal", idguia)
        cmd.Parameters.AddWithValue("@IdTipoMovimientoStock", "I")

        cmd.CommandType = CommandType.StoredProcedure

        Using con As New SqlConnection(conn)
            Using sda As New SqlDataAdapter()
                cmd.Connection = con
                sda.SelectCommand = cmd
                Using dsCustomers As New Guias()
                    sda.Fill(dsCustomers, "DataTable1")
                    Return dsCustomers
                End Using
            End Using
        End Using

    End Function

    Protected Sub Exportar0(sender As Object, e As EventArgs)


        Dim usu = txt1.Text
        Dim crystalReport As New ReportDocument()
        crystalReport.Load(Server.MapPath("~/Reportes/rptPedidos.rpt"))

        Dim dsCustomers As RequerimientoAlmacen = GetReqAlm("sp_LO_rptPedidoBienes", usu, "1")
        crystalReport.SetDataSource(dsCustomers)

        Dim formatType As ExportFormatType = ExportFormatType.NoFormat
        formatType = ExportFormatType.PortableDocFormat
        crystalReport.ExportToHttpResponse(formatType, Response, True, "Requerimiento de Almacén")
        Response.[End]()
    End Sub

    Protected Sub Exportar(sender As Object, e As EventArgs)

        Dim usu = txt1.Text
        Dim crystalReport As New ReportDocument()
        crystalReport.Load(Server.MapPath("~/Reportes/rptGuias.rpt"))

        Dim dsCustomers As Guias = GetGuia("sp_LO_FiltrarFormatoGuias", usu, "1")
        crystalReport.SetDataSource(dsCustomers)

        Dim formatType As ExportFormatType = ExportFormatType.NoFormat
        formatType = ExportFormatType.PortableDocFormat
        crystalReport.ExportToHttpResponse(formatType, Response, True, "Guía")
        Response.[End]()
    End Sub
   

End Class

