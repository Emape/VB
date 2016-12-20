Imports System.Data
Imports System.Configuration
Imports System.Data.SqlClient
Imports CrystalDecisions.CrystalReports.Engine
Imports CrystalDecisions.Shared

Imports Microsoft.VisualBasic
Public Class RepTransDiario
    Inherits System.Web.UI.Page
    Private Function GetReq(dia As String, placa As String, mes As String, anio As String) As TranDiario

        Dim conn As String = ConfigurationManager.ConnectionStrings("cnEmapeProduccion").ConnectionString
        Dim cmd As New SqlCommand("SP_LO_rptTranDiario")
        cmd.Parameters.AddWithValue("@dia", dia)
        cmd.Parameters.AddWithValue("@placa", placa)
        cmd.Parameters.AddWithValue("@mes", mes)
        cmd.Parameters.AddWithValue("@anio", anio)

        cmd.CommandType = CommandType.StoredProcedure

        Using con As New SqlConnection(conn)
            Using sda As New SqlDataAdapter()
                cmd.Connection = con
                sda.SelectCommand = cmd
                Using dsCustomers As New TranDiario()
                    sda.Fill(dsCustomers, "DataTable1")
                    Return dsCustomers
                End Using
            End Using
        End Using

    End Function

    Protected Sub Exportr1(sender As Object, e As EventArgs)

        Dim valor = search.Text
        Dim placa = placas.Text
        Dim mes = mes0.Text
        Dim anio = anio0.Text

        Dim crystalReport As New ReportDocument()
        crystalReport.Load(Server.MapPath("~/Reportes/rptTranDiario.rpt"))

        Dim dsCustomers As TranDiario = GetReq(valor, placa, mes, anio)
        crystalReport.SetDataSource(dsCustomers)

        Dim formatType As ExportFormatType = ExportFormatType.NoFormat
        formatType = ExportFormatType.Excel
        crystalReport.ExportToHttpResponse(formatType, Response, True, "Control de Ingreso y Salida")
        Response.[End]()
    End Sub

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

    End Sub
End Class
