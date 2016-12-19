Imports System.Data
Imports System.Configuration
Imports System.Data.SqlClient
Imports CrystalDecisions.CrystalReports.Engine
Imports CrystalDecisions.Shared

Imports Microsoft.VisualBasic
Public Class RepTransConsumo
    Inherits System.Web.UI.Page
    Private Function GetCom(ini As String, fin As String, cri As String) As TranCom
        Dim conn As String = ConfigurationManager.ConnectionStrings("cnEmapeProduccion").ConnectionString
        Dim cmd As New SqlCommand("SP_LO_rptTranConsumo")
        cmd.Parameters.AddWithValue("@fechaini", ini)
        cmd.Parameters.AddWithValue("@fechafin", fin)
        cmd.Parameters.AddWithValue("@cond", cri)
        cmd.CommandType = CommandType.StoredProcedure

        Using con As New SqlConnection(conn)
            Using sda As New SqlDataAdapter()
                cmd.Connection = con
                sda.SelectCommand = cmd
                Using dsCustomers As New TranCom()
                    If cri = "2" Then
                        sda.Fill(dsCustomers, "DataTable1")
                    Else
                        sda.Fill(dsCustomers, "DataTable3")
                    End If
                    Return dsCustomers
                End Using
            End Using
        End Using
    End Function

    Private Function GetRes(ini As String, fin As String, cri As String) As TranCom

        Dim conn As String = ConfigurationManager.ConnectionStrings("cnEmapeProduccion").ConnectionString
        Dim cmd As New SqlCommand("SP_LO_rptTranConsumo")
        cmd.Parameters.AddWithValue("@fechaini", ini)
        cmd.Parameters.AddWithValue("@fechafin", fin)
        cmd.Parameters.AddWithValue("@cond", cri)
        cmd.CommandType = CommandType.StoredProcedure

        Using con As New SqlConnection(conn)
            Using sda As New SqlDataAdapter()
                cmd.Connection = con
                sda.SelectCommand = cmd


                Using dsCustomers As New TranCom()
                    If cri = "6" Then
                        sda.Fill(dsCustomers, "DataTable4")
                    Else
                        sda.Fill(dsCustomers, "DataTable2")
                    End If
                    Return dsCustomers
                End Using


            End Using
        End Using

    End Function

    Private Function GetKm(ini As String, fin As String, cri As String) As TranKm

        Dim conn As String = ConfigurationManager.ConnectionStrings("cnEmapeProduccion").ConnectionString

        Dim cmd As New SqlCommand("SP_LO_rptTranConsumo")

        cmd.Parameters.AddWithValue("@fechaini", ini)
        cmd.Parameters.AddWithValue("@fechafin", fin)
        cmd.Parameters.AddWithValue("@cond", cri)
        cmd.CommandType = CommandType.StoredProcedure

        Using con As New SqlConnection(conn)
            Using sda As New SqlDataAdapter()
                cmd.Connection = con
                sda.SelectCommand = cmd


                Using dsCustomers As New TranKm()
                    sda.Fill(dsCustomers, "DataTable1")
                    Return dsCustomers
                End Using


            End Using
        End Using

    End Function

    Protected Sub Exportr1(sender As Object, e As EventArgs)

        Dim inix = ini.Text
        Dim finx = fin.Text
        Dim crix = cri.Text

        Dim crystalReport As New ReportDocument()

        If (crix = "1") Then
            crystalReport.Load(Server.MapPath("~/Reportes/rptTranKm.rpt"))
            Dim dsCustomers As TranKm = GetKm(inix, finx, crix)
            crystalReport.SetDataSource(dsCustomers)
        ElseIf (crix = "2") Then
            crystalReport.Load(Server.MapPath("~/Reportes/rptTranCom.rpt"))
            Dim dsCustomers As TranCom = GetCom(inix, finx, crix)
            crystalReport.SetDataSource(dsCustomers)
        ElseIf (crix = "3") Then
            crystalReport.Load(Server.MapPath("~/Reportes/rptTranRes.rpt"))
            Dim dsCustomers As TranCom = GetRes(inix, finx, crix)
            crystalReport.SetDataSource(dsCustomers)
        ElseIf (crix = "6") Then
            crystalReport.Load(Server.MapPath("~/Reportes/Logistica/Transporte/rptTranIS.rpt"))
            Dim dsCustomers As TranCom = GetRes(inix, finx, crix)
            crystalReport.SetDataSource(dsCustomers)
        Else
            crystalReport.Load(Server.MapPath("~/Reportes/rptTranComRes.rpt"))
            Dim dsCustomers As TranCom = GetCom(inix, finx, crix)
            crystalReport.SetDataSource(dsCustomers)
        End If

        Dim formatType As ExportFormatType = ExportFormatType.NoFormat
        formatType = ExportFormatType.Excel
        crystalReport.ExportToHttpResponse(formatType, Response, True, "Reporte de Consumo Vehicular")
        Response.[End]()
    End Sub

    Protected Sub Page_Load(sender As Object, e As EventArgs) Handles Me.Load

    End Sub
End Class
