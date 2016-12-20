Imports System.Data
Imports System.Configuration
Imports System.Data.SqlClient
Imports CrystalDecisions.CrystalReports.Engine
Imports CrystalDecisions.Shared

Imports Microsoft.VisualBasic

Public Class GuiaIngreso
    Inherits System.Web.UI.Page


    Private Function GetGuia(sp As String, idguia As String, empresa As String) As Guias

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
            nom = "Mantenimiento Viales"
        ElseIf empresa = 5 Then
            cx = "cnSiaf"
            nom = "Siaf"
        Else
            cx = "cnMantenimiento"
            nom = ""
        End If

        Dim conn As String = ConfigurationManager.ConnectionStrings(cx).ConnectionString
        'Dim cmd As New SqlCommand(Query)


        Dim cmd As New SqlCommand(sp)
        cmd.Parameters.AddWithValue("@IdGuiaInicial", idguia)
        cmd.Parameters.AddWithValue("@IdGuiaFinal", idguia)
        cmd.Parameters.AddWithValue("@IdTipoMovimientoStock", "I")
        cmd.Parameters.AddWithValue("@Empresa", nom)

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

    Protected Sub Exportargi(sender As Object, e As EventArgs)
        Dim empresa = cod_empresa.text
        Dim usu = txt_gi.Text
        Dim crystalReport As New ReportDocument()
        crystalReport.Load(Server.MapPath("~/Reportes/rptGuias.rpt"))

        Dim dsCustomers As Guias = GetGuia("sp_LO_FiltrarFormatoGuias1", usu, empresa)
        crystalReport.SetDataSource(dsCustomers)

        Dim formatType As ExportFormatType = ExportFormatType.NoFormat
        formatType = ExportFormatType.PortableDocFormat
        crystalReport.ExportToHttpResponse(formatType, Response, False, "Guia_Ingreso")
        Response.[End]()
    End Sub

End Class
