Imports System.Data
Imports System.Configuration
Imports System.Data.SqlClient
Imports CrystalDecisions.CrystalReports.Engine
Imports CrystalDecisions.Shared

Imports Microsoft.VisualBasic
Public Class RepStock
    Inherits System.Web.UI.Page
    Private Function ConsRep1(anno As String, articulo As String, empresa As String, recurso As String) As dtResStock
        Dim cx, nom As String

        If recurso <> "" Then
            empresa = recurso
        End If

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
            cx = "cnMantenimiento"
            nom = ""
        End If

        Dim conn As String = ConfigurationManager.ConnectionStrings(cx).ConnectionString
        Dim cmd As New SqlCommand("SP_LOG_Listar_Stock_Resumen")
        cmd.Parameters.AddWithValue("@IdAnno", anno)
        cmd.Parameters.AddWithValue("@Articulo", articulo)
        cmd.Parameters.AddWithValue("@NomEmpresa", nom)


        cmd.CommandType = CommandType.StoredProcedure

        Using con As New SqlConnection(conn)
            Using sda As New SqlDataAdapter()
                cmd.Connection = con
                sda.SelectCommand = cmd
                Using ds As New dtResStock()
                    sda.Fill(ds, "DataTable1")
                    Return ds
                End Using
            End Using
        End Using

    End Function

    Private Function ConsRep2(anno As String, mes As String, corte As String, cond As String, tit As String, empresa As String, recurso As String) As dtInventarioValorizado
        Dim cx, nom As String

        If recurso <> "" Then
            empresa = recurso
        End If

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
        Dim cmd As New SqlCommand("SP_LOG_Filtrar_Stock_Mes")
        cmd.Parameters.AddWithValue("@IdAnno", anno)
        cmd.Parameters.AddWithValue("@IdMes", mes)
        cmd.Parameters.AddWithValue("@StkCorte", corte)
        cmd.Parameters.AddWithValue("@Cond", cond)
        cmd.Parameters.AddWithValue("@Tit", tit)
        cmd.Parameters.AddWithValue("@NomEmpresa", nom)
        cmd.CommandType = CommandType.StoredProcedure

        Using con As New SqlConnection(conn)
            Using sda As New SqlDataAdapter()
                cmd.Connection = con
                sda.SelectCommand = cmd
                Using ds As New dtInventarioValorizado()
                    sda.Fill(ds, "DataTable1")
                    Return ds
                End Using
            End Using
        End Using

    End Function

    Protected Sub Imprimir(sender As Object, e As EventArgs)

        'Dim fechas = fecha.Text
        Dim Tipo = tip.Text
        Dim codarticulo = cod_articulo.Text
        Dim articulos = articulo.Text
        Dim empresa = cod_empresa.text
        Dim corte = ""
        Dim cond = ""
        Dim tit = ""
        Dim anno = annox.Text
        Dim mes = mesy.Text
        Dim xexcel = 0
        Dim xrecurso = recurso.Text


        If excel.Checked Then
            xexcel = 1
        End If

        Dim crystalReport As New ReportDocument()

        If (Tipo = "1" Or Tipo = "2" Or Tipo = "3") Then

            If (Tipo = "1") Then
                corte = "N"
                cond = "N"
            ElseIf (Tipo = "2") Then
                corte = "N"
                cond = "S"
            ElseIf (Tipo = "3") Then
                corte = "S"
                cond = "N"
                tit = "AL CORTE DE INVENTARIO"
            Else
                corte = "S"
                cond = "N"
            End If

            crystalReport.Load(Server.MapPath("~/Reportes/rptInventarioValorizado.rpt"))
            Dim ds As dtInventarioValorizado = ConsRep2(anno, mes, corte, cond, tit, empresa, xrecurso)
            crystalReport.SetDataSource(ds)
        ElseIf (Tipo = 5) Then
            crystalReport.Load(Server.MapPath("~/Reportes/rptStockResumen.rpt"))
            Dim ds As dtResStock = ConsRep1(anno, codarticulo, empresa, xrecurso)
            crystalReport.SetDataSource(ds)
        End If


        Dim formatType As ExportFormatType = ExportFormatType.NoFormat

        If xexcel = 0 Then
            formatType = ExportFormatType.PortableDocFormat
        Else
            formatType = ExportFormatType.Excel
        End If

        crystalReport.ExportToHttpResponse(formatType, Response, False, "Reporte_Stock")
        Response.[End]()

    End Sub

End Class
