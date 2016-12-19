Imports System.Data
Imports System.Configuration
Imports System.Data.SqlClient
Imports CrystalDecisions.CrystalReports.Engine
Imports CrystalDecisions.Shared

Imports Microsoft.VisualBasic
Public Class RepKardex
    Inherits System.Web.UI.Page
    Private Function GetStock(sp As String, mes0 As String, mes1 As String, anno As String, codarticulo As String, alm As String, stock As String, empresa As String) As dtKardex
        Dim cx, nom, flagstock As String

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

        If stock = 1 Then
            flagstock = 0
        Else
            flagstock = ""
        End If

        Dim conn As String = ConfigurationManager.ConnectionStrings(cx).ConnectionString
        Dim cmd As New SqlCommand(sp)

        cmd.Parameters.AddWithValue("@IdAnno", anno)
        cmd.Parameters.AddWithValue("@IdBienServicio", codarticulo)
        cmd.Parameters.AddWithValue("@NomEmpresa", nom)
        If sp = "SP_ALM_KardexReserva" Then
            cmd.Parameters.AddWithValue("@IdMesIni", mes0)
            cmd.Parameters.AddWithValue("@IdMesFin", mes1)
            cmd.Parameters.AddWithValue("@IdAlmacen", alm)
            cmd.Parameters.AddWithValue("@flagstock", flagstock)
        End If
        cmd.CommandType = CommandType.StoredProcedure

        Using con As New SqlConnection(conn)
            Using sda As New SqlDataAdapter()
                cmd.Connection = con
                sda.SelectCommand = cmd
                Using ds As New dtKardex()
                    If sp = "SP_ALM_KardexReserva" Then
                        sda.Fill(ds, "DataTable2")
                    Else
                        sda.Fill(ds, "DataTable1")
                    End If

                    Return ds
                End Using
            End Using
        End Using

    End Function

    Protected Sub Imprimir(sender As Object, e As EventArgs)

        Dim mes0 = mesx.Text
        Dim mes1 = mesy.Text
        Dim anno = annox.Text
        Dim codarticulo = cod_articulo.Text
        Dim alm = almacen.Text
        'almacen.Text
        Dim empresa = cod_empresa.Text
        Dim xstock As Integer = 0
        Dim xvalor As Integer = 0
        Dim xexcel As Integer = 0
        Dim sp As String = ""
        Dim crystalReport As New ReportDocument()

        If stock.Checked Then
            xstock = 1
        End If

        If valor.Checked Then
            xvalor = 1
        End If

        If excel.Checked Then
            xexcel = 1
        End If

        If alm <> "" Then
            sp = "SP_ALM_KardexReserva"

            If alm = "" Then
                alm = "000002"
            End If

            If xvalor = 1 Then
                If xexcel = 0 Then
                    crystalReport.Load(Server.MapPath("~/Reportes/rptKardexValorizado.rpt"))
                Else
                    crystalReport.Load(Server.MapPath("~/Reportes/Logistica/rptKardexValorizadoExcel.rpt"))
                End If

                Dim ds As dtKardex = GetStock(sp, mes0, mes1, anno, codarticulo, alm, xstock, empresa)
                crystalReport.SetDataSource(ds)
            Else

                crystalReport.Load(Server.MapPath("~/Reportes/rptKardexNoValorizado.rpt"))
                Dim ds As dtKardex = GetStock(sp, mes0, mes1, anno, codarticulo, alm, xstock, empresa)
                crystalReport.SetDataSource(ds)
            End If

        Else
            sp = "SP_ALM_KardexGeneral"
            If xvalor = 1 Then
                crystalReport.Load(Server.MapPath("~/Reportes/rptKardexAlmacenGeneralNuevo.rpt"))
                Dim ds As dtKardex = GetStock(sp, mes0, mes1, anno, codarticulo, alm, xstock, empresa)
                crystalReport.SetDataSource(ds)
            Else
                crystalReport.Load(Server.MapPath("~/Reportes/rptKardexAlmacenGeneral.rpt"))
                Dim ds As dtKardex = GetStock(sp, mes0, mes1, anno, codarticulo, alm, xstock, empresa)
                crystalReport.SetDataSource(ds)
            End If
        End If

        Dim formatType As ExportFormatType = ExportFormatType.NoFormat

        If xexcel = 0 Then
            formatType = ExportFormatType.PortableDocFormat
        Else
            formatType = ExportFormatType.Excel
        End If

        crystalReport.ExportToHttpResponse(formatType, Response, False, "Reporte_Kardex")
        Response.[End]()

    End Sub

End Class
