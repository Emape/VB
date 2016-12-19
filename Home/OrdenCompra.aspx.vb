Imports System.Data
Imports System.Configuration
Imports System.Data.SqlClient
Imports CrystalDecisions.CrystalReports.Engine
Imports CrystalDecisions.Shared

Imports Microsoft.VisualBasic
Partial Class OrderCompra
    Inherits System.Web.UI.Page

    Private Function GetOrden(sp As String, idorden As String, tipoorden As String, empresa As String) As OrdenCompra

        Dim cx, nom, id As String

        If empresa = 1 Then
            cx = "cnEmape"
            nom = "Empresarial"
            id = "1"
        ElseIf empresa = 2 Then
            cx = "cnEmapeMunicipal"
            nom = "Municipal"
            id = "2"
        ElseIf empresa = 3 Then
            cx = "cnRegional"
            nom = "Regional"
            id = "3"
        ElseIf empresa = 4 Then
            cx = "cnMantenimiento"
            nom = "Mantenimiento Vial"
            id = "4"
        ElseIf empresa = 5 Then
            cx = "cnSiaf"
            nom = "Siaf"
            id = "5"
        Else
            cx = "cnMantenimiento"
            nom = ""
            id = ""
        End If

        Dim conn As String = ConfigurationManager.ConnectionStrings(cx).ConnectionString
        'Dim cmd As New SqlCommand(Query)

        Dim cmd As New SqlCommand(sp)
        cmd.Parameters.AddWithValue("@IdOrdenCompra", idorden)
        cmd.Parameters.AddWithValue("@CompraServicio", "C")
        cmd.Parameters.AddWithValue("@IdTipoImp", tipoorden)
        cmd.Parameters.AddWithValue("@Empresa", nom)
        cmd.Parameters.AddWithValue("@IdEmpresa", id)

        cmd.CommandType = CommandType.StoredProcedure

        Using con As New SqlConnection(conn)
            Using sda As New SqlDataAdapter()
                cmd.Connection = con
                sda.SelectCommand = cmd
                Using dsCustomers As New OrdenCompra()
                    sda.Fill(dsCustomers, "DataTable1")
                    Return dsCustomers
                End Using
            End Using
        End Using

    End Function

    Protected Sub Exportargs(sender As Object, e As EventArgs)
        Dim empresa = cod_empresa.text
        Dim id = txt_oc.Text
        Dim tipooc = txt_tipooc.Text
        Dim NroColumnas = txt_nrocolumnas.Text
        'Dim numOrden = txt_numOrden.Text
        Dim crystalReport As New ReportDocument()

        crystalReport.Load(Server.MapPath("~/Reportes/rptOrdenCompra.rpt"))

        'If NroColumnas = "1" Then
        '    crystalReport.Load(Server.MapPath("~/Reportes/rptOrdenesCompra1.rpt"))
        'ElseIf NroColumnas = "2" Then
        '    crystalReport.Load(Server.MapPath("~/Reportes/rptOrdenesCompra2.rpt"))
        'ElseIf NroColumnas = "3" Then
        '    crystalReport.Load(Server.MapPath("~/Reportes/rptOrdenesCompra3.rpt"))
        'ElseIf NroColumnas = "4" Then
        '    crystalReport.Load(Server.MapPath("~/Reportes/rptOrdenesCompra4.rpt"))
        'ElseIf NroColumnas = "5" Then
        '    crystalReport.Load(Server.MapPath("~/Reportes/rptOrdenesCompra5.rpt"))
        'ElseIf NroColumnas = "6" Then
        '    crystalReport.Load(Server.MapPath("~/Reportes/rptOrdenesCompra6.rpt"))
        'ElseIf NroColumnas = "7" Then
        '    crystalReport.Load(Server.MapPath("~/Reportes/rptOrdenesCompra7.rpt"))
        'ElseIf NroColumnas = "8" Then
        '    crystalReport.Load(Server.MapPath("~/Reportes/rptOrdenesCompra8.rpt"))
        'ElseIf NroColumnas = "9" Then
        '    crystalReport.Load(Server.MapPath("~/Reportes/rptOrdenesCompra9.rpt"))
        'ElseIf NroColumnas = "10" Then
        '    crystalReport.Load(Server.MapPath("~/Reportes/rptOrdenesCompra10.rpt"))
        'ElseIf NroColumnas = "11" Then
        '    crystalReport.Load(Server.MapPath("~/Reportes/rptOrdenesCompra11.rpt"))
        'ElseIf NroColumnas = "12" Then
        '    crystalReport.Load(Server.MapPath("~/Reportes/rptOrdenesCompra12.rpt"))
        'ElseIf NroColumnas = "13" Then
        '    crystalReport.Load(Server.MapPath("~/Reportes/rptOrdenesCompra13.rpt"))
        '    'ElseIf NroColumnas = "14" Then
        '    '    crystalReport.Load(Server.MapPath("~/Reportes/rptOrdenesCompra14.rpt"))
        'Else
        '    crystalReport.Load(Server.MapPath("~/Reportes/rptOrdenesCompra.rpt"))
        'End If

        Dim dsCustomers As OrdenCompra = GetOrden("sp_LO_FormatoOrdenes", id, tipooc, empresa)
        crystalReport.SetDataSource(dsCustomers)

        Dim formatType As ExportFormatType = ExportFormatType.NoFormat
        formatType = ExportFormatType.PortableDocFormat
        crystalReport.ExportToHttpResponse(formatType, Response, False, "OrdenCompra")
        Response.[End]()
    End Sub

    'IMPRESION MASIVA
    Private Function GetOrdenServicio_Masiva(sp As String, idorden1 As String, idorden2 As String, tipoorden As String, empresa As String) As OrdenCompra

        Dim cx, nom, id As String

        If empresa = 1 Then
            cx = "cnEmape"
            nom = "Empresarial"
            id = "1"
        ElseIf empresa = 2 Then
            cx = "cnEmapeMunicipal"
            nom = "Municipal"
            id = "2"
        ElseIf empresa = 3 Then
            cx = "cnRegional"
            nom = "Regional"
            id = "3"
        ElseIf empresa = 4 Then
            cx = "cnMantenimiento"
            nom = "Mantenimiento Vial"
            id = "4"
        ElseIf empresa = 5 Then
            cx = "cnSiaf"
            nom = "Siaf"
            id = "5"
        Else
            cx = "cnMantenimiento"
            nom = ""
            id = ""
        End If

        Dim conn As String = ConfigurationManager.ConnectionStrings(cx).ConnectionString
        'Dim cmd As New SqlCommand(Query)

        Dim cmd As New SqlCommand(sp)
        cmd.Parameters.AddWithValue("@CompraServicio", "C")
        cmd.Parameters.AddWithValue("@IdOrden1", idorden1)
        cmd.Parameters.AddWithValue("@IdOrden2", idorden2)
        cmd.Parameters.AddWithValue("@IdTipoImp", tipoorden)
        cmd.Parameters.AddWithValue("@Empresa", nom)
        cmd.Parameters.AddWithValue("@IdEmpresa", id)

        cmd.CommandType = CommandType.StoredProcedure

        Using con As New SqlConnection(conn)
            Using sda As New SqlDataAdapter()
                cmd.Connection = con
                sda.SelectCommand = cmd
                Using dsCustomers As New OrdenCompra()
                    sda.Fill(dsCustomers, "DataTable1")
                    Return dsCustomers
                End Using
            End Using
        End Using

    End Function

    Protected Sub Exportargs_Masiva(sender As Object, e As EventArgs)
        Dim empresa = cod_empresa.Text
        Dim ido1 = txt_idorden1.Text
        Dim ido2 = txt_idorden2.Text
        Dim tipoos = txt_tipooc.Text
        Dim NroColumnas = txt_nrocolumnas.Text
        Dim crystalReport As New ReportDocument()

        crystalReport.Load(Server.MapPath("~/Reportes/rptOrdenCompraMasiva.rpt"))

        'If NroColumnas = "1" Then
        '    crystalReport.Load(Server.MapPath("~/Reportes/rptOrdenesServicio.rpt"))
        'ElseIf NroColumnas = "2" Then
        '    crystalReport.Load(Server.MapPath("~/Reportes/rptOrdenesServicio-2.rpt"))
        'End If

        Dim dsCustomers As OrdenCompra = GetOrdenServicio_Masiva("sp_LO_FormatoOrdenesMasiva", ido1, ido2, tipoos, empresa)
        crystalReport.SetDataSource(dsCustomers)

        Dim formatType As ExportFormatType = ExportFormatType.NoFormat
        formatType = ExportFormatType.PortableDocFormat
        crystalReport.ExportToHttpResponse(formatType, Response, False, "OrdenCompra")
        Response.[End]()
    End Sub
End Class
