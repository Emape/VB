Imports System.Data
Imports System.Configuration
Imports System.Data.SqlClient
Imports CrystalDecisions.CrystalReports.Engine
Imports CrystalDecisions.Shared
Imports Microsoft.VisualBasic

Public Class Incidencia
    Inherits System.Web.UI.Page

    Private Function Imprimir(gerencia As String, departamento As String, empresa As String) As dtMaestro
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
        Dim cmd As New SqlCommand("LG_LocadorPorArea")
        cmd.Parameters.AddWithValue("@IdCentroCosto", gerencia)
        cmd.Parameters.AddWithValue("@IdCentroCostoDepartamento", departamento)
        'cmd.Parameters.AddWithValue("@NomEmpresa", nom)
        cmd.CommandType = CommandType.StoredProcedure

        Using con As New SqlConnection(conn)
            Using sda As New SqlDataAdapter()
                cmd.Connection = con
                sda.SelectCommand = cmd
                Using ds As New dtMaestro()
                    sda.Fill(ds, "LocadorxGerencia")
                    Return ds
                End Using
            End Using
        End Using

    End Function

    Protected Sub Exportar(sender As Object, e As EventArgs)

        Dim excel = tipo.Text
        Dim dep = tdepartamento.Text
        Dim ger = tgerencia.Text
        Dim empresa = cod_empresa.Text

        Dim crystalReport As New ReportDocument()

        crystalReport.Load(Server.MapPath("~/Reportes/rptLocadorPorGerencia.rpt"))
        Dim ds As dtMaestro = Imprimir(ger, dep, empresa)
        crystalReport.SetDataSource(ds)

        Dim formatType As ExportFormatType = ExportFormatType.NoFormat

        If excel = 0 Then
            formatType = ExportFormatType.PortableDocFormat
        Else
            formatType = ExportFormatType.Excel
        End If

        crystalReport.ExportToHttpResponse(formatType, Response, False, "Reporte_Locadores_Gerencia")
        Response.[End]()

    End Sub
End Class
