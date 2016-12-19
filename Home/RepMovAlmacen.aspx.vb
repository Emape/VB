Imports System.Data
Imports System.Configuration
Imports System.Data.SqlClient
Imports CrystalDecisions.CrystalReports.Engine
Imports CrystalDecisions.Shared

Imports Microsoft.VisualBasic
Public Class RepMovAlmacen
    Inherits System.Web.UI.Page
    Private Function RepMovAlmacen(sp As String, vanno As String, vmes As String, mov As String, empresa As String) As dtMovAlmacen

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
        Dim cmd As New SqlCommand(sp)
        cmd.Parameters.AddWithValue("@IdAnno", vanno)
        cmd.Parameters.AddWithValue("@IdMes", vmes)
        cmd.Parameters.AddWithValue("@IdTipoMovimientoStock", mov)
        cmd.Parameters.AddWithValue("@NomEmpresa", nom)
        cmd.CommandType = CommandType.StoredProcedure

        Using con As New SqlConnection(conn)
            Using sda As New SqlDataAdapter()
                cmd.Connection = con
                sda.SelectCommand = cmd
                Using ds As New dtMovAlmacen()
                    If sp = "sp_LO_FiltrarGuiasAlmacen1" Then
                        sda.Fill(ds, "DataTable1")
                    Else
                        sda.Fill(ds, "DataTable2")
                    End If

                    Return ds
                End Using
            End Using
        End Using

    End Function

    Protected Sub Imprimir(sender As Object, e As EventArgs)

        Dim vanno = anno.Text
        Dim vmes = mes.Text
        Dim mov = ""
        Dim sp = ""
        Dim ruta = ""
        Dim empresa = cod_empresa.text

        Dim crystalReport As New ReportDocument()
        If tip1.Checked Then
            ruta = "~/Reportes/rptMovimientosAlmacen.rpt"
            sp = "sp_LO_FiltrarGuiasAlmacen1"
            'SP_LOG_Movimientos_Almacen()
        ElseIf tip2.Checked Then
            ruta = "~/Reportes/rptMovimientosAlmacenTransaccion.rpt"
            sp = "SP_LOG_Movimientos_Almacen_Transaccion"
        End If

        If mov1.Checked Then
            mov = "I"
        ElseIf mov2.Checked Then
            mov = "S"
        End If

        crystalReport.Load(Server.MapPath(ruta))
        Dim ds As dtMovAlmacen = RepMovAlmacen(sp, vanno, vmes, mov, empresa)
        crystalReport.SetDataSource(ds)

        Dim formatType As ExportFormatType = ExportFormatType.NoFormat
        formatType = ExportFormatType.PortableDocFormat
        crystalReport.ExportToHttpResponse(formatType, Response, False, "Reporte_Mov_Almacen")
        Response.[End]()

    End Sub
End Class
