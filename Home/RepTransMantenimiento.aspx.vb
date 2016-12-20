Imports System.Data
Imports System.Configuration
Imports System.Data.SqlClient
Imports CrystalDecisions.CrystalReports.Engine
Imports CrystalDecisions.Shared

Imports Microsoft.VisualBasic
Public Class RepTransMantenimiento
    Inherits System.Web.UI.Page
    Private Function GetMantto(inix As String, finx As String, crix As String) As Mantto
        Dim sp, dt As String
        Dim conn As String = ConfigurationManager.ConnectionStrings("cnEmapeProduccion").ConnectionString

        If (crix = "4") Then
            sp = "SP_LO_rptEstadoVehiculo"
            dt = "DataTable2"
        Else
            sp = "SP_LO_rptMantenimiento"
            dt = "DataTable1"


        End If
        Dim cmd As New SqlCommand(sp)
        cmd.Parameters.AddWithValue("@fechaini", inix)
        cmd.Parameters.AddWithValue("@fechafin", finx)
        cmd.CommandType = CommandType.StoredProcedure

        Using con As New SqlConnection(conn)
            Using sda As New SqlDataAdapter()
                cmd.Connection = con
                sda.SelectCommand = cmd
                Using dsCustomers As New Mantto()
                    sda.Fill(dsCustomers, dt)
                    Return dsCustomers
                End Using
            End Using
        End Using
    End Function

    Protected Sub Exportr1m(sender As Object, e As EventArgs)
        Dim ini As String = inix.Text
        Dim fin As String = finx.Text
        Dim crix = cri.Text
        Dim crystalReport As New ReportDocument()
        If (crix = "1") Then
            crystalReport.Load(Server.MapPath("~/Reportes/Logistica/Transporte/rptManttoVeh.rpt"))
            Dim dsCustomers As Mantto = GetMantto(ini, fin, crix)
            crystalReport.SetDataSource(dsCustomers)
        ElseIf (crix = "2") Then
            crystalReport.Load(Server.MapPath("~/Reportes/Logistica/Transporte/rptManttoRec.rpt"))
            Dim dsCustomers As Mantto = GetMantto(ini, fin, crix)
            crystalReport.SetDataSource(dsCustomers)
        ElseIf (crix = "3") Then
            crystalReport.Load(Server.MapPath("~/Reportes/Logistica/Transporte/rptManttoTipo.rpt"))
            Dim dsCustomers As Mantto = GetMantto(ini, fin, crix)
            crystalReport.SetDataSource(dsCustomers)
        ElseIf (crix = "4") Then
            crystalReport.Load(Server.MapPath("~/Reportes/Logistica/Transporte/rptEstadoVeh.rpt"))
        Dim dsCustomers As Mantto = GetMantto(ini, fin, crix)
        crystalReport.SetDataSource(dsCustomers)
        End If

        Dim formatType As ExportFormatType = ExportFormatType.NoFormat
        formatType = ExportFormatType.Excel
        crystalReport.ExportToHttpResponse(formatType, Response, True, "Reporte de Estado y Mantenimiento")
        Response.[End]()
    End Sub

End Class
