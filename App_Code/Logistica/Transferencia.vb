Imports System.Collections.Generic
Imports System.Linq
'Imports System.Runtime.Serialization.Json
Imports System.ServiceModel
Imports System.Text
Imports System.Data.SqlClient
Imports System.Configuration
Imports System.Web.Script.Serialization
Imports System.ServiceModel.Activation
Imports System.ServiceModel.Web
Imports System.Web.Script.Services
Imports System.IO
Imports System.Web.Services
Imports System.Data
Imports System.ComponentModel
Imports System
Imports System.Web
Imports System.Collections
Imports System.Web.Services.Protocols
Imports CrystalDecisions.CrystalReports.Engine
Imports CrystalDecisions.Shared
Imports System.Web.UI
Imports System.Web.UI.WebControls

<ServiceContract()> _
<AspNetCompatibilityRequirements(RequirementsMode:=AspNetCompatibilityRequirementsMode.Allowed)> _
Public Class Transferencia

    Inherits System.Web.UI.Page
    <OperationContract()> _
    <WebInvoke(Method:="POST", ResponseFormat:=WebMessageFormat.Json)> _
    Public Function listarGuia(ByVal IdTipoMovimientoStock As String, ByVal prefix As String, ByVal empresa As String) As String
        Dim fgp As String
        Dim Guia As New List(Of Object)()
        Using conn As New SqlConnection()
            Dim cx As String = ""

            If empresa = 1 Then
                cx = "cnEmape"
            ElseIf empresa = 2 Then
                cx = "cnEmapeMunicipal"
            ElseIf empresa = 3 Then
                cx = "cnRegional"
            ElseIf empresa = 4 Then
                cx = "cnMantenimiento"
            End If

            conn.ConnectionString = ConfigurationManager.ConnectionStrings(cx).ConnectionString
            Using cmd As New SqlCommand()

                cmd.CommandText = "SP_ALM_Listar_Guia"
                cmd.CommandType = CommandType.StoredProcedure

                cmd.Parameters.AddWithValue("@IdTipoMovimientoStock", IdTipoMovimientoStock)
                cmd.Parameters.AddWithValue("@IdCentroCosto", "")


                '  cmd.CommandText = "select IdBanco, Descripcion,DescripcionCorta,Direccion,Distrito,CodigoPostal from Banco "
                '& _                  "ContactName like '%'+ @prefix + '%'"
                'cmd.Parameters.AddWithValue("@prefix", prefix)
                cmd.Connection = conn
                conn.Open()
                Using sdr As SqlDataReader = cmd.ExecuteReader()
                    While sdr.Read()



                        If (IsDBNull(sdr("FechaFactura"))) Then
                            fgp = ""
                        Else
                            fgp = Format(sdr("FechaFactura"), "dd/MM/yyyy")
                        End If

                        Guia.Add(New With { _
                         Key .IdGuia = sdr("IdGuia"), _
                         Key .FechaGuia = Format(sdr("FechaGuia"), "dd/MM/yyyy"), _
                         Key .IdProveedor = IIf(IsDBNull(sdr("IdProveedor")), "", sdr("IdProveedor")), _
                         Key .Proveedor = IIf(IsDBNull(sdr("RazonSocial")), "", sdr("RazonSocial")), _
                         Key .IdOrdenCompra = IIf(IsDBNull(sdr("IdOrdenCompra")), "", sdr("IdOrdenCompra")), _
                         Key .IdRequerimiento = IIf(IsDBNull(sdr("IdRequerimiento")), "", sdr("IdRequerimiento")), _
                         Key .GuiaProveedor = IIf(IsDBNull(sdr("IdFactura")), "", sdr("IdFactura")), _
                         Key .FechaGuiaProveedor = fgp, _
                         Key .DescripTransaccion = sdr("DescripTransaccion"), _
                         Key .Total = sdr("TotalCosto"), _
                         Key .Estado = sdr("Estado") _
                        })


                    End While
                End Using
                conn.Close()
            End Using
            Return (New JavaScriptSerializer().Serialize(Guia))
        End Using
    End Function

    <OperationContract()> _
<WebInvoke(Method:="POST", ResponseFormat:=WebMessageFormat.Json)> _
    Public Function listarTransaccion(ByVal IdTipoMovimientoStock As String, ByVal empresa As String) As String
        Dim Tran As New List(Of Object)()
        Using conn As New SqlConnection()
            Dim cx As String = ""

            If empresa = 1 Then
                cx = "cnEmape"
            ElseIf empresa = 2 Then
                cx = "cnEmapeMunicipal"
            ElseIf empresa = 3 Then
                cx = "cnRegional"
            ElseIf empresa = 4 Then
                cx = "cnMantenimiento"
            End If

            conn.ConnectionString = ConfigurationManager.ConnectionStrings(cx).ConnectionString
            Using cmd As New SqlCommand()

                cmd.CommandText = "SP_ALM_Listar_TipoMovimientoStock"
                cmd.CommandType = CommandType.StoredProcedure

                cmd.Parameters.AddWithValue("@IdTipoMovimientoStock", IdTipoMovimientoStock)
                cmd.Parameters.AddWithValue("@Reserva", "N")
                cmd.Parameters.AddWithValue("@IdTipoDocumento", "000")

                cmd.Connection = conn
                conn.Open()
                Using sdr As SqlDataReader = cmd.ExecuteReader()
                    While sdr.Read()

                        Tran.Add(New With { _
                         Key .IdTran = sdr("IdMovimientoStock"), _
                         Key .DetalleTran = sdr("DescripcionCorta") _
                        })

                    End While
                End Using
                conn.Close()
            End Using
            Return (New JavaScriptSerializer().Serialize(Tran))
        End Using
    End Function

    <OperationContract()> _
<WebInvoke(Method:="POST", ResponseFormat:=WebMessageFormat.Json)> _
    Public Function listarBienServicio(ByVal articulo As String, ByVal empresa As String) As String
        Dim Guia As New List(Of Object)()
        Using conn As New SqlConnection()
            Dim cx As String = ""

            If empresa = 1 Then
                cx = "cnEmape"
            ElseIf empresa = 2 Then
                cx = "cnEmapeMunicipal"
            ElseIf empresa = 3 Then
                cx = "cnRegional"
            ElseIf empresa = 4 Then
                cx = "cnMantenimiento"
            End If


            conn.ConnectionString = ConfigurationManager.ConnectionStrings(cx).ConnectionString
            Using cmd As New SqlCommand()

                cmd.CommandText = "SP_ALM_Listar_Bien_Stock"
                cmd.CommandType = CommandType.StoredProcedure

                cmd.Parameters.AddWithValue("@Almacen", "000002")

                '  cmd.CommandText = "select IdBanco, Descripcion,DescripcionCorta,Direccion,Distrito,CodigoPostal from Banco "
                '& _                  "ContactName like '%'+ @prefix + '%'"
                'cmd.Parameters.AddWithValue("@prefix", prefix)
                cmd.Connection = conn
                conn.Open()

                Using sdr As SqlDataReader = cmd.ExecuteReader()
                    While sdr.Read()

                        Guia.Add(New With { _
                         Key .IdBienServicio = sdr("IdBienServicio"), _
                         Key .Descripcion = sdr("Descripcion"), _
                         Key .undMedida = IIf(IsDBNull(sdr("undMedida")), "", sdr("undMedida")), _
                         Key .StockActual = IIf(IsDBNull(sdr("StockActual")), "", sdr("StockActual")), _
                         Key .Estado = sdr("Estado") _
                        })


                    End While
                End Using
                conn.Close()
            End Using
            Return (New JavaScriptSerializer().Serialize(Guia))
        End Using
    End Function
    ' Agregue aquí más operaciones y márquelas con <OperationContract()>




End Class
