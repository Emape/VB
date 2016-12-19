Imports System.Data
Imports System.Configuration
Imports System.Data.SqlClient
Imports CrystalDecisions.CrystalReports.Engine
Imports CrystalDecisions.Shared

Imports Microsoft.VisualBasic
Public Class RepTransProg
    Inherits System.Web.UI.Page
    Private Function GetProg(mes As String, anno As String) As TranProg

        Dim conn As String = ConfigurationManager.ConnectionStrings("cnEmapeProduccion").ConnectionString
        Dim cmd As New SqlCommand("SP_LO_rptResTran")
        cmd.Parameters.AddWithValue("@Mes", mes)
        cmd.Parameters.AddWithValue("@Anno", anno)
        cmd.Parameters.AddWithValue("@Placa", "")
        cmd.CommandType = CommandType.StoredProcedure

        Using con As New SqlConnection(conn)
            Using sda As New SqlDataAdapter()
                cmd.Connection = con
                sda.SelectCommand = cmd


                Using dsCustomers As New TranProg()
                    sda.Fill(dsCustomers, "DataTable1")
                    Return dsCustomers
                End Using


            End Using
        End Using
    End Function

   

    Protected Sub Exportr1(sender As Object, e As EventArgs)

        Dim mesx = mes.Text
        Dim annox = anno.Text

        Dim crystalReport As New ReportDocument()


        crystalReport.Load(Server.MapPath("~/Reportes/rptTranProg.rpt"))
        Dim dsCustomers As TranProg = GetProg(mesx, annox)
        crystalReport.SetDataSource(dsCustomers)


        Dim formatType As ExportFormatType = ExportFormatType.NoFormat
        formatType = ExportFormatType.Excel
        crystalReport.ExportToHttpResponse(formatType, Response, True, "Reporte de Programación Mensual")
        Response.[End]()
    End Sub

End Class
