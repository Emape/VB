Imports System.Collections.Generic
Imports System.Linq
Imports System.Runtime.Serialization.Json
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
Imports System.Net
Imports System.Net.Mail

<ServiceContract()> _
<AspNetCompatibilityRequirements(RequirementsMode:=AspNetCompatibilityRequirementsMode.Allowed)> _
Public Class Almacen
    Inherits System.Web.UI.Page

    Public Function entidad(ByVal empresa As String) As String
        Dim bd As String = ""
        If empresa = 1 Then
            bd = "cnEmape"
        ElseIf empresa = 2 Then
            bd = "cnEmapeMunicipal"
        ElseIf empresa = 3 Then
            bd = "cnRegional"
        ElseIf empresa = 4 Then
            bd = "cnMantenimiento"
        ElseIf empresa = 5 Then
            bd = "cnSiaf"
        End If
        Return bd
    End Function

    <OperationContract()> _
<WebInvoke(Method:="POST", ResponseFormat:=WebMessageFormat.Json)> _
    Public Function periodoActivo(ByVal area As String, ByVal empresa As String) As String
        Dim Alm As New List(Of Object)()
        Using conn As New SqlConnection()
            Dim cx As String = ""

            If empresa = 1 Then
                cx = "cnEmape"
            ElseIf empresa = 2 Then
                cx = "cnEmapeMunicipal"
            ElseIf empresa = 3 Then
                cx = "cnRegional"
            ElseIf empresa = 4 Then
                cx = "cnEmapeMunicipal"
            ElseIf empresa = 5 Then
                cx = "cnSiaf"
            End If

            conn.ConnectionString = ConfigurationManager.ConnectionStrings(cx).ConnectionString
            Using cmd As New SqlCommand()

                cmd.CommandText = "select AnnoActual+MesActual from Aplicacion where Estado='A' AND IdAplicacion=@area"
                cmd.Parameters.AddWithValue("@area", area)
                cmd.Connection = conn
                conn.Open()
                Dim cadena As String = cmd.ExecuteScalar
                Return (cadena)
                conn.Close()
            End Using
        End Using
    End Function

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
            ElseIf empresa = 5 Then
                cx = "cnSiaf"
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



                        If (IsDBNull(sdr("FechaGuiaProveedor"))) Then
                            fgp = ""
                        Else
                            fgp = Format(sdr("FechaGuiaProveedor"), "dd/MM/yyyy")
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
    Public Function listarRequerimiento(ByVal empresa As String, ByVal TipoReq As String, ByVal CC As String) As String
        Dim fgp As String
        Dim Req As New List(Of Object)()
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
            ElseIf empresa = 5 Then
                cx = "cnSiaf"
            End If


            conn.ConnectionString = ConfigurationManager.ConnectionStrings(cx).ConnectionString
            Using cmd As New SqlCommand()

                cmd.CommandText = "SP_LOG_Listar_Requerimiento"
                cmd.CommandType = CommandType.StoredProcedure
                'Year(Now)
                cmd.Parameters.AddWithValue("@TipoReq", TipoReq)
                cmd.Parameters.AddWithValue("@IdCentroCosto", Session("useridcc"))
                cmd.Parameters.AddWithValue("@IdAnno", Year(Now))
                cmd.Connection = conn
                conn.Open()
                Using sdr As SqlDataReader = cmd.ExecuteReader()
                    While sdr.Read()



                        If (IsDBNull(sdr("FechaRequerimiento"))) Then
                            fgp = ""
                        Else
                            fgp = Format(sdr("FechaRequerimiento"), "dd/MM/yyyy")
                        End If

                        Req.Add(New With { _
                         Key .IdRequerimiento = sdr("IdRequerimiento"), _
                         Key .Fecha = fgp, _
                         Key .Descripcion = sdr("Descripcion") _
                        })


                    End While
                End Using
                conn.Close()
            End Using
            Return (New JavaScriptSerializer().Serialize(Req))
        End Using
    End Function

    <OperationContract()> _
    <WebInvoke(Method:="POST", ResponseFormat:=WebMessageFormat.Json)> _
    Public Function listarGuiaDetallei(ByVal IdTipoMovimientoStock As String, ByVal guia As String, ByVal empresa As String) As String
        Dim Guiad As New List(Of Object)()
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
            ElseIf empresa = 5 Then
                cx = "cnSiaf"
            End If

            conn.ConnectionString = ConfigurationManager.ConnectionStrings(cx).ConnectionString
            Using cmd As New SqlCommand()

                cmd.CommandText = "SP_ALM_Listar_GuiaDetalle"
                cmd.CommandType = CommandType.StoredProcedure

                cmd.Parameters.AddWithValue("@IdTipoMovimientoStock", IdTipoMovimientoStock)
                cmd.Parameters.AddWithValue("@IdGuia", guia)

                cmd.Connection = conn
                conn.Open()
                Using sdr As SqlDataReader = cmd.ExecuteReader()
                    While sdr.Read()

                        Guiad.Add(New With { _
                         Key .Item = sdr("NumeroItem"), _
                         Key .CC = sdr("IdCentroCosto"), _
                         Key .Detalle = sdr("DescripCC"), _
                         Key .Codigo = IIf(IsDBNull(sdr("IdBienServicio")), "", sdr("IdBienServicio")), _
                         Key .Bien = IIf(IsDBNull(sdr("DescripBien")), "", sdr("DescripBien")), _
                         Key .Medida = IIf(IsDBNull(sdr("DescripUM")), "", sdr("DescripUM")), _
                         Key .Costo = IIf(IsDBNull(sdr("CostoUnitario")), "", sdr("CostoUnitario")), _
                         Key .Cantidad = sdr("Cantidad"), _
                         Key .Total = sdr("TotalCostoItem") _
                        })

                    End While
                End Using
                conn.Close()
            End Using
            Return (New JavaScriptSerializer().Serialize(Guiad))
        End Using
    End Function



    <OperationContract()> _
<WebInvoke(Method:="POST", ResponseFormat:=WebMessageFormat.Json)> _
    Public Function verificarGuiaDetallei(ByVal IdTipoMovimientoStock As String, ByVal guia As String, ByVal empresa As String) As String
        Dim Guiad As New List(Of Object)()
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
            ElseIf empresa = 5 Then
                cx = "cnSiaf"
            End If

            conn.ConnectionString = ConfigurationManager.ConnectionStrings(cx).ConnectionString
            Using cmd As New SqlCommand()

                cmd.CommandText = "SP_ALM_Verificar_Guia"
                cmd.CommandType = CommandType.StoredProcedure

                'cmd.Parameters.AddWithValue("@IdTipoMovimientoStock", IdTipoMovimientoStock)
                cmd.Parameters.AddWithValue("@IdGuia", guia)

                cmd.Connection = conn
                conn.Open()
                Using sdr As SqlDataReader = cmd.ExecuteReader()
                    While sdr.Read()

                        Guiad.Add(New With { _
                        Key .cantidad = sdr("cantidad") _
                        })

                    End While
                End Using
                conn.Close()
            End Using
            Return (New JavaScriptSerializer().Serialize(Guiad))
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
            ElseIf empresa = 5 Then
                cx = "cnSiaf"
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
    Public Function listarAlmacen(ByVal empresa As String) As String
        Dim Alm As New List(Of Object)()
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
            ElseIf empresa = 5 Then
                cx = "cnSiaf"
            End If

            conn.ConnectionString = ConfigurationManager.ConnectionStrings(cx).ConnectionString
            Using cmd As New SqlCommand()

                cmd.CommandText = "SP_ALM_Listar_Almacen"
                cmd.CommandType = CommandType.StoredProcedure

                cmd.Parameters.AddWithValue("@IdAnno", Year(Now))


                cmd.Connection = conn
                conn.Open()
                Using sdr As SqlDataReader = cmd.ExecuteReader()
                    While sdr.Read()

                        Alm.Add(New With { _
                         Key .IdAlm = sdr("IdAlmacen"), _
                         Key .CC = sdr("IdCentroCosto"), _
                         Key .DetalleAlm = sdr("Descripcion") _
                        })

                    End While
                End Using
                conn.Close()
            End Using
            Return (New JavaScriptSerializer().Serialize(Alm))
        End Using
    End Function

    <OperationContract()> _
    <WebInvoke(Method:="POST", ResponseFormat:=WebMessageFormat.Json)> _
    Public Function listarViales(ByVal empresa As String) As String
        Dim Alm As New List(Of Object)()
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
            ElseIf empresa = 5 Then
                cx = "cnSiaf"
            End If

            conn.ConnectionString = ConfigurationManager.ConnectionStrings(cx).ConnectionString
            Using cmd As New SqlCommand()

                cmd.CommandText = "SP_ALM_Listar_Viales"
                cmd.CommandType = CommandType.StoredProcedure

                cmd.Parameters.AddWithValue("@IdAnno", Year(Now))


                cmd.Connection = conn
                conn.Open()
                Using sdr As SqlDataReader = cmd.ExecuteReader()
                    While sdr.Read()

                        Alm.Add(New With { _
                         Key .IdAlm = sdr("IdRedVial"), _
                         Key .CC = sdr("IdUbicacion"), _
                         Key .DetalleAlm = sdr("DescripCC") _
                        })

                    End While
                End Using
                conn.Close()
            End Using
            Return (New JavaScriptSerializer().Serialize(Alm))
        End Using
    End Function


    <OperationContract()> _
   <WebInvoke(Method:="POST", ResponseFormat:=WebMessageFormat.Json)> _
    Public Function listarOrdenCompraDetalle(ByVal ocom As String, ByVal empresa As String) As String
        Dim oc As New List(Of Object)()
        Dim stock As Integer
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
            ElseIf empresa = 5 Then
                cx = "cnSiaf"
            End If

            Dim cadena As String = ""
            Dim canno As String = ""
            Dim cmes As String = ""

            cadena = periodoActivo("03", empresa)
            canno = cadena.Substring(0, 4)
            cmes = cadena.Substring(4, 2)

            conn.ConnectionString = ConfigurationManager.ConnectionStrings(cx).ConnectionString
            Using cmd As New SqlCommand()

                cmd.CommandText = "SP_ALM_Listar_OrdenCompraDetalle"
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.AddWithValue("@IdOrdenCompra", ocom)
                cmd.Parameters.AddWithValue("@IdAnno", canno)
                cmd.Parameters.AddWithValue("@IdMes", Right("00" & cmes, 2))

                cmd.Connection = conn
                conn.Open()
                Using sdr As SqlDataReader = cmd.ExecuteReader()
                    While sdr.Read()
                        If (IsDBNull(sdr("Stock"))) Then
                            stock = 0
                        Else
                            stock = sdr("Stock")
                        End If

                        oc.Add(New With { _
                         Key .Nro = sdr("IdNumeroItem"), _
                         Key .Codigo = sdr("IdBienServicio"), _
                         Key .Descripcion = sdr("Descripcion"), _
                         Key .UM = sdr("UM"), _
                         Key .IdCentroCosto = sdr("IdCentroCosto"), _
                         Key .Id_UM = sdr("Id_UM"), _
                         Key .Stock = stock, _
                         Key .CantSol = sdr("IdOK"), _
                         Key .CU = sdr("CostoItem"), _
                         Key .Almacen = sdr("Almacen"), _
                         Key .NumeroItemOrdenCompra = sdr("IdNumeroItem"), _
                         Key .Id_Alm = sdr("Id_Alm") _
                        })
                    End While
                End Using
                conn.Close()
            End Using
            Return (New JavaScriptSerializer().Serialize(oc))
        End Using
    End Function

    <OperationContract()> _
   <WebInvoke(Method:="POST", ResponseFormat:=WebMessageFormat.Json)> _
    Public Function listarContratoDetalle(ByVal ocom As String, ByVal ccosto As String, ByVal empresa As String) As String
        Dim oc As New List(Of Object)()
        Dim stock As Integer
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
            ElseIf empresa = 5 Then
                cx = "cnSiaf"
            End If

            conn.ConnectionString = ConfigurationManager.ConnectionStrings(cx).ConnectionString
            Using cmd As New SqlCommand()

                cmd.CommandText = "SP_ALM_Listar_ContratoDetalle"
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.AddWithValue("@IdAnno", Year(Now))
                cmd.Parameters.AddWithValue("@IdContrato", ocom)
                cmd.Parameters.AddWithValue("@centrocosto", ccosto)

                cmd.Connection = conn
                conn.Open()
                Using sdr As SqlDataReader = cmd.ExecuteReader()
                    While sdr.Read()
                        If (IsDBNull(sdr("Stock"))) Then
                            stock = 0
                        Else
                            stock = sdr("Stock")
                        End If

                        oc.Add(New With { _
                         Key .Nro = sdr("IdNumeroItem"), _
                         Key .Codigo = sdr("IdBienServicio"), _
                         Key .Descripcion = sdr("descripcion"), _
                         Key .UM = sdr("IdUnidadMedida"), _
                         Key .IdCentroCosto = sdr("IdCentroCosto"), _
                         Key .Id_UM = sdr("IdUnidadMedida"), _
                         Key .Stock = stock, _
                         Key .CantSol = sdr("SaldoCantidad"), _
                         Key .CU = sdr("CostoItem"), _
                         Key .Almacen = sdr("idalmacen"), _
                         Key .NumeroItemOrdenCompra = sdr("itemcontrato"), _
                         Key .Id_Alm = sdr("idalmacen") _
                    })


                        'oc.Add(New With { _
                        ' Key .Nro = sdr("IdNumeroItem"), _
                        ' Key .Codigo = sdr("IdBienServicio"), _
                        ' Key .Descripcion = sdr("Descripcion"), _
                        ' Key .UM = sdr("UM"), _
                        ' Key .IdCentroCosto = sdr("IdCentroCosto"), _
                        ' Key .Id_UM = sdr("Id_UM"), _
                        ' Key .Stock = stock, _
                        ' Key .CantSol = sdr("IdOK"), _
                        ' Key .CU = sdr("CostoItem"), _
                        ' Key .Almacen = sdr("Almacen"), _
                        ' Key .NumeroItemOrdenCompra = sdr("IdNumeroItem"), _
                        ' Key .Id_Alm = sdr("Id_Alm") _
                        '})
                    End While
                End Using
                conn.Close()
            End Using
            Return (New JavaScriptSerializer().Serialize(oc))
        End Using
    End Function


    <OperationContract()> _
  <WebInvoke(Method:="POST", ResponseFormat:=WebMessageFormat.Json)> _
    Public Function listarTransferencia(ByVal ocom As String, ByVal empresa As String, ByVal entidad As String) As String
        Dim transferencia As New List(Of Object)()
        Using conn As New SqlConnection()
            Dim cx As String = ""

            If empresa = 1 Then
                cx = "cnEmape"
            ElseIf empresa = 2 Then
                cx = "cnEmapeMunicipal"
            ElseIf empresa = 3 Then
                cx = "cnRegional"
            ElseIf empresa = 4 Then
                cx = "cnEmapeMunicipal"
            ElseIf empresa = 5 Then
                cx = "cnSiaf"
            End If

            Dim cadena As String = ""
            Dim canno As String = ""
            Dim cmes As String = ""

            cadena = periodoActivo("03", empresa)
            canno = cadena.Substring(0, 4)
            cmes = cadena.Substring(4, 2)

            conn.ConnectionString = ConfigurationManager.ConnectionStrings(cx).ConnectionString
            Using cmd As New SqlCommand()

                cmd.CommandText = "SP_ALM_Listar_Transferencias"
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.AddWithValue("@IdGuiaTransferencia", ocom)
                cmd.Parameters.AddWithValue("@IdAnno", canno)
                cmd.Parameters.AddWithValue("@Entidad", entidad)
                'cmd.Parameters.AddWithValue("@IdMes", Month(Now))

                cmd.Connection = conn
                conn.Open()
                Using sdr As SqlDataReader = cmd.ExecuteReader()
                    While sdr.Read()

                        transferencia.Add(New With { _
                         Key .NumeroItem = sdr("NumeroItem"), _
                         Key .IdBienServicio = sdr("IdBienServicio"), _
                         Key .IdUnidadMedida = sdr("IdUnidadMedida"), _
                         Key .Cantidad = sdr("Cantidad"), _
                         Key .CU = 0, _
                         Key .idalmacen = sdr("idalmacen"), _
                         Key .idcentrocosto = sdr("idcentrocosto"), _
                         Key .producto = sdr("producto"), _
                         Key .medida = sdr("medida"), _
                         Key .alamcen = sdr("alamcen") _
                        })
                    End While
                End Using
                conn.Close()
            End Using
            Return (New JavaScriptSerializer().Serialize(transferencia))
        End Using
    End Function


    <OperationContract()> _
  <WebInvoke(Method:="POST", ResponseFormat:=WebMessageFormat.Json)> _
    Public Function listarRequerimientoDetalle(ByVal idreq As String, ByVal empresa As String) As String
        Dim req As New List(Of Object)()
        Dim stock As Integer
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
            ElseIf empresa = 5 Then
                cx = "cnSiaf"
            End If

            Dim cadena As String = ""
            Dim canno As String = ""
            Dim cmes As String = ""

            cadena = periodoActivo("03", empresa)
            canno = cadena.Substring(0, 4)
            cmes = cadena.Substring(4, 2)

            conn.ConnectionString = ConfigurationManager.ConnectionStrings(cx).ConnectionString
            Using cmd As New SqlCommand()

                cmd.CommandText = "SP_ALM_Listar_RequerimientoDetalle"
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.AddWithValue("@IdRequerimiento", idreq)
                cmd.Parameters.AddWithValue("@IdAnno", canno)
                cmd.Parameters.AddWithValue("@IdMes", Right("00" & cmes, 2))

                cmd.Connection = conn
                conn.Open()
                Using sdr As SqlDataReader = cmd.ExecuteReader()
                    While sdr.Read()
                        If (IsDBNull(sdr("Stock"))) Then
                            stock = 0
                        Else
                            stock = sdr("Stock")
                        End If

                        req.Add(New With { _
                         Key .Nro = sdr("IdNumeroItem"), _
                         Key .Codigo = sdr("IdBienServicio"), _
                         Key .Descripcion = sdr("Descripcion"), _
                         Key .UM = sdr("UM"), _
                         Key .IdCentroCosto = sdr("IdCentroCosto"), _
                         Key .Id_UM = sdr("IdUnidadMedida"), _
                         Key .Stock = stock, _
                         Key .CantSol = sdr("CantidadItem"), _
                         Key .SaldoCantidad = sdr("SaldoCantidad"), _
                         Key .CU = sdr("CostoItem"), _
                         Key .Almacen = sdr("Almacen"), _
                         Key .Id_Alm = sdr("IdAlmacen") _
                        })

                    End While
                End Using
                conn.Close()
            End Using
            'a.SaldoSalidaAlmacen as SaldoCantidad,
            'a.SaldoSalidaAlmacen as CantidadGuia, 
            'a.SaldoSalidaAlmacen as SaldoSubTotal, c.CostoPromedioActual,
            'c.StockActual, c.ReservaActual,d.Siglas,
            'a.IdCentroCosto,'000' as ItemGuia,a.SaldoSalidaAlmacen as TotalCostoItem,


            Return (New JavaScriptSerializer().Serialize(req))
        End Using
    End Function

    <OperationContract()> _
  <WebInvoke(Method:="POST", ResponseFormat:=WebMessageFormat.Json)> _
    Public Function ObtenerRequerimientoDetalle(ByVal idreq As String, ByVal empresa As String) As String
        Dim req As New List(Of Object)()
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
            ElseIf empresa = 5 Then
                cx = "cnSiaf"
            End If

            conn.ConnectionString = ConfigurationManager.ConnectionStrings(cx).ConnectionString
            Using cmd As New SqlCommand()

                cmd.CommandText = "SP_ALM_Obtener_RequerimientoDetalle"
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.AddWithValue("@IdRequerimiento", idreq)
                cmd.Parameters.AddWithValue("@IdAnno", Year(now))

                cmd.Connection = conn
                conn.Open()
                Using sdr As SqlDataReader = cmd.ExecuteReader()
                    While sdr.Read()
                        req.Add(New With { _
                         Key .Item = sdr("IdNumeroItem"), _
                         Key .Codigo = sdr("IdBienServicio"), _
                         Key .Descripcion = sdr("Descripcion"), _
                         Key .UM = sdr("UM"), _
                         Key .Cantidad = sdr("CantidadItem") _
                        })
                    End While
                End Using
                conn.Close()
            End Using
            'a.SaldoSalidaAlmacen as SaldoCantidad,
            'a.SaldoSalidaAlmacen as CantidadGuia, 
            'a.SaldoSalidaAlmacen as SaldoSubTotal, c.CostoPromedioActual,
            'c.StockActual, c.ReservaActual,d.Siglas,
            'a.IdCentroCosto,'000' as ItemGuia,a.SaldoSalidaAlmacen as TotalCostoItem,


            Return (New JavaScriptSerializer().Serialize(req))
        End Using
    End Function


    <OperationContract()> _
    <WebInvoke(Method:="POST", ResponseFormat:=WebMessageFormat.Json)> _
    Public Function listarTipoTransaccion(ByVal Detalle As String, ByVal Tabla As String, ByVal TipoMov As String, ByVal TipoTran As String, ByVal IdCentroCosto As String, ByVal empresa As String) As String
        Dim Tran As New List(Of Object)()
        Using conn As New SqlConnection()
            Dim cx As String = ""
            Dim fgp As String = ""
            Dim RazonSocial As String = ""
            Dim CentroCosto As String = ""

            If empresa = 1 Then
                cx = "cnEmape"
            ElseIf empresa = 2 Then
                cx = "cnEmapeMunicipal"
            ElseIf empresa = 3 Then
                cx = "cnRegional"
            ElseIf empresa = 4 Then
                cx = "cnMantenimiento"
            ElseIf empresa = 5 Then
                cx = "cnSiaf"
            End If

            conn.ConnectionString = ConfigurationManager.ConnectionStrings(cx).ConnectionString
            Using cmd As New SqlCommand()

                cmd.CommandText = "SP_ALM_Listar_TipoTransaccion"
                cmd.CommandType = CommandType.StoredProcedure

                cmd.Parameters.AddWithValue("@IdTipoMovimiento", TipoMov)
                cmd.Parameters.AddWithValue("@IdTipoTransaccion", TipoTran)
                cmd.Parameters.AddWithValue("@IdCentroCosto", IdCentroCosto)
                cmd.Parameters.AddWithValue("@Detalle", Detalle)

                cmd.Connection = conn
                conn.Open()



                Using sdr As SqlDataReader = cmd.ExecuteReader()
                    While sdr.Read()



                        If Tabla = "2" Then
                            If (IsDBNull(sdr("FechaRequerimiento"))) Then
                                fgp = ""
                            Else
                                fgp = Format(sdr("FechaRequerimiento"), "dd/MM/yyyy")
                            End If

                            If TipoMov = "I" Then
                                Tran.Add(New With { _
                         Key .IdRequerimiento = sdr("IdRequerimiento"), _
                         Key .Descripcion = sdr("Descripcion"), _
                         Key .Fecha = fgp, _
                         Key .SaldoSubTotal = sdr("SaldoSubTotal"), _
                         Key .CC = sdr("IdCentroCosto"), _
                         Key .Estado = sdr("Pendiente") _
                        })
                            Else
                                If sdr("IdTipoRequerimiento") = "02" Then
                                    Tran.Add(New With { _
                               Key .IdRequerimiento = sdr("IdRequerimiento"), _
                               Key .Descripcion = sdr("Descripcion"), _
                               Key .Fecha = fgp, _
                               Key .SaldoSubTotal = sdr("SaldoSubTotal"), _
                               Key .CC = sdr("IdCentroCosto"), _
                               Key .Estado = sdr("Pendiente") _
                              })
                                End If
                            End If

                        ElseIf Tabla = "3" Then
                            Tran.Add(New With { _
                         Key .Codigo = sdr("IdBienServicio"), _
                         Key .Detalle = sdr("Descripcion"), _
                         Key .UM = sdr("UnidadDetalle"), _
                         Key .Id_UM = sdr("Id_UM"), _
                         Key .costoUnitario = sdr("costoUnitario"), _
                         Key .StockActual = sdr("StockActual") _
                        })

                        ElseIf Tabla = "5" Then

                            RazonSocial = ObtenerProveedor(sdr("IdProveedor"), empresa)
                            CentroCosto = ObtenerCC(sdr("IdCentroCosto"), empresa)

                            Tran.Add(New With { _
                        Key .Id = sdr("IdOrdenCompra"), _
                        Key .Detalle = sdr("Descripcion"), _
                        Key .Proveedor = sdr("IdProveedor"), _
                        Key .Requerimiento = sdr("IdRequerimiento"), _
                        Key .Fecha = Format(sdr("FechaOrdenCompra"), "dd/MM/yyyy"), _
                        Key .Subtotal = sdr("SaldoSubTotal"), _
                        Key .CC = sdr("IdCentroCosto"), _
                        Key .RazonSocial = RazonSocial, _
                        Key .CentroCosto = CentroCosto, _
                        Key .FechaAceptacion = sdr("FechaAceptacion") _
                        })

                        ElseIf Tabla = "1" Then
                            Tran.Add(New With { _
                        Key .Id = sdr("IdContrato"), _
                        Key .NumeroAddendum = sdr("NumeroAddendum"), _
                        Key .Detalle = sdr("IdContratoClase"), _
                        Key .Fecha = sdr("IdCentroCosto"), _
                        Key .Subtotal = sdr("Objeto"), _
                        Key .CC = sdr("FechaContrato") _
                        })

                        ElseIf Tabla = "6" Then
                            Tran.Add(New With { _
                        Key .Id = sdr("NroSobrante"), _
                        Key .Detalle = sdr("Observacion"), _
                        Key .Fecha = sdr("Fecha") _
                        })

                        ElseIf Tabla = "9" Then
                            RazonSocial = ObtenerProveedor(sdr("idproveedor"), empresa)
                            CentroCosto = ObtenerCC(sdr("IdCentroCosto"), empresa)
                            Tran.Add(New With { _
                        Key .Id = sdr("IdContrato"), _
                        Key .NumeroAddendum = sdr("NumeroAddendum"), _
                        Key .Detalle = sdr("objeto"), _
                        Key .Proveedor = sdr("idproveedor"), _
                        Key .Requerimiento = sdr("IdRequerimiento"), _
                        Key .Fecha = Format(sdr("FechaContrato"), "dd/MM/yyyy"), _
                        Key .Subtotal = sdr("ValorContrato"), _
                        Key .RazonSocial = RazonSocial, _
                        Key .CentroCosto = CentroCosto, _
                        Key .CC = sdr("IdCentroCosto") _
                        })
                            'IdCentroCosto, FechaContrato, IdProveedor, TipoCambio, IdContratoClase  --ValorContrato         
                            'Key .Requerimiento = sdr("IdRequerimiento"), _
                            'Key .Fecha = Format(sdr("FechaContrato"), "dd/MM/yyyy"), _
                            'Key .Requerimiento = sdr("IdRequerimiento"), _


                        End If



                    End While
                End Using



                conn.Close()
            End Using
            Return (New JavaScriptSerializer().Serialize(Tran))
        End Using
    End Function


    <OperationContract()> _
<WebInvoke(Method:="POST", ResponseFormat:=WebMessageFormat.Json)> _
    Public Function listarTipoTransaccionTransferencia(ByVal Detalle As String, ByVal Tabla As String, ByVal TipoMov As String, ByVal TipoTran As String, ByVal IdCentroCosto As String, ByVal empresa As String) As String
        Dim Tran As New List(Of Object)()
        Using conn As New SqlConnection()
            Dim cx As String = ""
            Dim fgp As String = ""

            If empresa = 1 Then
                cx = "cnEmape"
            ElseIf empresa = 2 Then
                cx = "cnEmapeMunicipal"
            ElseIf empresa = 3 Then
                cx = "cnRegional"
            ElseIf empresa = 4 Then
                cx = "cnEmapeMunicipal"
                'cx = "cnMantenimiento"
            ElseIf empresa = 5 Then
                cx = "cnSiaf"
            End If

            conn.ConnectionString = ConfigurationManager.ConnectionStrings(cx).ConnectionString
            Using cmd As New SqlCommand()

                cmd.CommandText = "SP_ALM_Listar_TipoTransaccion"
                cmd.CommandType = CommandType.StoredProcedure

                cmd.Parameters.AddWithValue("@IdTipoMovimiento", TipoMov)
                cmd.Parameters.AddWithValue("@IdTipoTransaccion", TipoTran)
                cmd.Parameters.AddWithValue("@IdCentroCosto", IdCentroCosto)
                cmd.Parameters.AddWithValue("@Detalle", Detalle)

                cmd.Connection = conn
                conn.Open()



                Using sdr As SqlDataReader = cmd.ExecuteReader()
                    While sdr.Read()


                        If Tabla = "7" Then
                            Tran.Add(New With { _
                        Key .IdAnno = sdr("IdAnno"), _
                        Key .IdGuia = sdr("IdGuia"), _
                        Key .Observacion = sdr("Observacion"), _
                        Key .IdGuiaTransferencia = sdr("IdGuiaTransferencia"), _
                        Key .Entidad = sdr("Entidad"), _
                        Key .TipoTransaccion = sdr("TipoTransaccion") _
                        })

                        End If

                    End While
                End Using



                conn.Close()
            End Using
            Return (New JavaScriptSerializer().Serialize(Tran))
        End Using
    End Function

    <OperationContract()> _
    <WebInvoke(Method:="POST", ResponseFormat:=WebMessageFormat.Json)> _
    Public Function listarAlmacenStock(ByVal IdAlmacen As String, ByVal empresa As String) As String
        Dim Tran As New List(Of Object)()
        Using conn As New SqlConnection()
            Dim cx As String = ""
            Dim fgp As String = ""

            If empresa = 1 Then
                cx = "cnEmape"
            ElseIf empresa = 2 Then
                cx = "cnEmapeMunicipal"
            ElseIf empresa = 3 Then
                cx = "cnRegional"
            ElseIf empresa = 4 Then
                cx = "cnMantenimiento"
            ElseIf empresa = 5 Then
                cx = "cnSiaf"
            End If

            Dim cadena As String = ""
            Dim canno As String = ""
            Dim cmes As String = ""

            cadena = periodoActivo("03", empresa)
            canno = cadena.Substring(0, 4)
            cmes = cadena.Substring(4, 2)

            conn.ConnectionString = ConfigurationManager.ConnectionStrings(cx).ConnectionString
            Using cmd As New SqlCommand()

                cmd.CommandText = "SP_ALM_Listar_Stock"
                cmd.CommandType = CommandType.StoredProcedure

                cmd.Parameters.AddWithValue("@IdAnno", canno)
                cmd.Parameters.AddWithValue("@IdMes", Right("00" & cmes, 2))
                cmd.Parameters.AddWithValue("@IdAlmacen", IdAlmacen)

                cmd.Connection = conn
                conn.Open()

                Using sdr As SqlDataReader = cmd.ExecuteReader()
                    While sdr.Read()

                        Tran.Add(New With { _
                     Key .Codigo = sdr("IdBienServicio"), _
                     Key .Detalle = sdr("Descripcion"), _
                     Key .UM = sdr("UnidadDetalle"), _
                     Key .Stock = sdr("StockActual"), _
                     Key .Reserva = IIf(IsDBNull(sdr("ReservaActual")), 0.0, sdr("ReservaActual")), _
                     Key .Disponible = IIf(IsDBNull(sdr("Disponible")), sdr("StockActual"), sdr("Disponible")), _
                     Key .Costo = sdr("CostoPromedioActual"), _
                     Key .Id_UM = sdr("IdUnidadMedida") _
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
        Dim Tran As New List(Of Object)()
        Using conn As New SqlConnection()
            Dim cx As String = ""
            Dim fgp As String = ""

            If empresa = 1 Then
                cx = "cnEmape"
            ElseIf empresa = 2 Then
                cx = "cnEmapeMunicipal"
            ElseIf empresa = 3 Then
                cx = "cnRegional"
            ElseIf empresa = 4 Then
                cx = "cnMantenimiento"
            ElseIf empresa = 5 Then
                cx = "cnSiaf"
            End If

            conn.ConnectionString = ConfigurationManager.ConnectionStrings(cx).ConnectionString
            Using cmd As New SqlCommand()

                cmd.CommandText = "SP_ALM_Listar_BienServicio"
                cmd.CommandType = CommandType.StoredProcedure

                cmd.Parameters.AddWithValue("@Tipo", "B")
                cmd.Parameters.AddWithValue("@Articulo", articulo)

                cmd.Connection = conn
                conn.Open()

                Using sdr As SqlDataReader = cmd.ExecuteReader()
                    While sdr.Read()

                        Tran.Add(New With { _
                     Key .Codigo = sdr("IdBienServicio"), _
                     Key .Detalle = sdr("Descripcion"), _
                     Key .UM = sdr("um") _
                    })
                    End While
                End Using



                conn.Close()
            End Using
            Dim serializer = New JavaScriptSerializer()
            serializer.MaxJsonLength = Int32.MaxValue

            Return (serializer.Serialize(Tran))
        End Using
    End Function


    'Registrar Cabecera Guia
    <OperationContract()> _
    Public Function InsertarCabeceraGuia(ByVal item As String, ByVal atendidox As String, ByVal almx As String, ByVal n As String, ByVal accion As String, ByVal IdOrdenCompra As String, ByVal nro_guia As String, _
                                         ByVal tran As String, ByVal IdTipoMovimientoStock As String, ByVal IdCentroCosto As String, ByVal alm As String, ByVal detalle As String, ByVal TotalCosto As String, _
                                         ByVal IdProveedor As String, ByVal nump As String, ByVal fechap As String, ByVal IdRequerimiento As String, ByVal cod_articulo As String, ByVal cod_articulox As String, _
                                         ByVal uni As String, ByVal unix As String, ByVal atendido As String, ByVal cu As String, ByVal cux As String, ByVal empresa As String, ByVal idcontrato As String, _
                                         ByVal numeroitem As String, ByVal cond_tabla As String, ByVal nroAddenda As String) As String

        'Inicializando Variables
        Dim cadena As String = ""
        Dim canno As String = ""
        Dim cmes As String = ""
        Dim cx As String = ""
        Dim nrog As String = ""

        Dim fechaactual As DateTime = DateTime.Now
        Dim anno As String = Year(Now)
        Dim mes As String = Month(Now)

        Dim strMensaje As String = ""
        Dim strMensajeItem As String = ""
        Dim strMsj As String = ""

        'Fecha Actual
        cadena = periodoActivo("03", empresa)
        canno = cadena.Substring(0, 4)
        cmes = cadena.Substring(4, 2)
        If mes < 10 Then
            mes = "0" + mes
        End If

        'Condicionando el Registro de OC y Req
        If (IdTipoMovimientoStock = "I" And tran = "07") Then
            IdRequerimiento = ""
            IdOrdenCompra = ""
        End If

        If IdTipoMovimientoStock = "S" Then
            IdRequerimiento = IdOrdenCompra
            IdOrdenCompra = ""
        End If

        'Condicionando CC para Transferencia, Almacen y Otro CC
        If (accion = 4 And empresa = 2 And IdTipoMovimientoStock = "S" And tran = "05") Then
            IdCentroCosto = "040000"
        End If
        If (accion = 4 And empresa = 4) Then
            IdCentroCosto = "150000"
            cu = "0"
        End If
        If accion = "5" Then
            alm = almx
            IdCentroCosto = almx
        End If

        If (alm = "000002") Then
            IdCentroCosto = "040000"
        Else
            IdCentroCosto = alm
        End If
        If (alm = "000002") Then
            IdCentroCosto = "040000"
        Else
            IdCentroCosto = alm
        End If

        'Obtener el Nombre BDEntidad
        cx = entidad(empresa)

        'Inicializando Conexion
        Using conn As New SqlConnection()
            conn.ConnectionString = ConfigurationManager.ConnectionStrings(cx).ConnectionString

            'Abriendo Conexion
            conn.Open()

            'Inicializando Command
            Using cmd As New SqlCommand()

                'Inicializando Transaccion
                Dim transaccion As SqlTransaction = conn.BeginTransaction
                'Asignando la conexion al cmd y a la transaccion
                cmd.Connection = conn
                cmd.Transaction = transaccion

                Try
                    'Procedimiento Almacenado y Parametros para registrar cabecera
                    cmd.CommandText = "sp_LO_ActualizarGuia" 'SP_ALM_Insertar_CabeceraGuia
                    cmd.CommandType = CommandType.StoredProcedure
                    cmd.Parameters.AddWithValue("@IdAnno", canno)
                    cmd.Parameters.AddWithValue("@IdMes", cmes)
                    cmd.Parameters.AddWithValue("@IdRequerimiento", IdRequerimiento)

                    If cond_tabla = "9" Then
                        cmd.Parameters.AddWithValue("@IdOrdenCompra", "")
                        cmd.Parameters.AddWithValue("@IdContrato", IdOrdenCompra)
                    Else
                        cmd.Parameters.AddWithValue("@IdOrdenCompra", IdOrdenCompra)
                        cmd.Parameters.AddWithValue("@IdContrato", "")
                    End If

                    cmd.Parameters.AddWithValue("@IdGuia", "Nuevo")
                    cmd.Parameters.AddWithValue("@IdTipoMovimientoStock", IdTipoMovimientoStock)
                    cmd.Parameters.AddWithValue("@IdMovimientoStock", tran)
                    cmd.Parameters.AddWithValue("@FechaGuia", fechaactual.AddHours(-17))
                    cmd.Parameters.AddWithValue("@FechaTipoCambio", fechaactual)


                    cmd.Parameters.AddWithValue("@IdFechaGuia", "")
                    cmd.Parameters.AddWithValue("@Moneda", "S")
                    cmd.Parameters.AddWithValue("@TipoCambio", "")

                    cmd.Parameters.AddWithValue("@IdCentroCosto", IdCentroCosto)
                    cmd.Parameters.AddWithValue("@IdAlmacen", alm)

                    cmd.Parameters.AddWithValue("@Observacion", detalle)
                    cmd.Parameters.AddWithValue("@TotalCosto", TotalCosto) ' VER MONTO FINAl
                    cmd.Parameters.AddWithValue("@AudUsuario", Session("userid"))
                    cmd.Parameters.AddWithValue("@IdProveedor", IdProveedor)
                    cmd.Parameters.AddWithValue("@GuiaProveedor", nump)

                    If alm = "S" Then
                        alm = ""
                    End If

                    If fechap = "" Then
                        cmd.Parameters.AddWithValue("@FechaGuiaProveedor", DBNull.Value)
                    Else
                        cmd.Parameters.AddWithValue("@FechaGuiaProveedor", DateTime.Parse(fechap))
                    End If

                    cmd.Parameters.AddWithValue("@IdTransferencia", "")
                    cmd.Parameters.AddWithValue("@NumeroAddendum", nroAddenda)
                    cmd.Parameters.AddWithValue("@Insertar", "I")

                    cmd.Parameters.Add("@mensaje", SqlDbType.VarChar, 100)
                    cmd.Parameters("@mensaje").Direction = ParameterDirection.Output

                    cmd.ExecuteNonQuery()

                    'Obtener Mensaje de SP
                    strMensaje = cmd.Parameters("@mensaje").Value.ToString.Trim()

                    ' Obtener el correlativo de la insercion de la cabecera
                    nrog = strMensaje.Substring(16, 13)

                    If Left(strMensaje, 1) = "0" Then
                        strMensajeItem = "1... Inicial"

                        Dim cc As String = alm

                        If accion = 3 Then

                            If cc = "000002" Then
                                cc = "040000"
                            End If

                            Dim almxp() As String = almx.Split(",")
                            Dim cod_articulop() As String = cod_articulox.Split(",")
                            Dim itemp() As String = item.Split(",")
                            Dim unip() As String = unix.Split(",")
                            Dim atendidoxp() As String = atendidox.Split(",")
                            Dim cup() As String = cux.Split(",")
                            Dim idcontratop() As String = idcontrato.Split(",")
                            Dim numeroitemp() As String = numeroitem.Split(",")
                            Dim contador As Integer = 0
                            For i As Integer = 0 To (n - 1)
                                If atendido > 0 Then
                                    contador = contador + 1
                                    If IdTipoMovimientoStock = "I" And (tran = "07" Or tran = "08" Or tran = "10") Then
                                        strMensajeItem = InsertarDetalleGuia(nrog, IdTipoMovimientoStock, tran, almxp(i), cod_articulop(i), itemp(i), unip(i), atendidoxp(i), cup(i), IdOrdenCompra, IdRequerimiento, cc, empresa, "", Right("000" & contador, 3), cond_tabla, nroAddenda, transaccion, conn)
                                    ElseIf IdTipoMovimientoStock = "S" And (tran = "01" Or tran = "05" Or tran = "08" Or tran = "15") Then
                                        strMensajeItem = InsertarDetalleGuia(nrog, IdTipoMovimientoStock, tran, almxp(i), cod_articulop(i), itemp(i), unip(i), atendidoxp(i), cup(i), IdOrdenCompra, IdRequerimiento, cc, empresa, "", Right("000" & contador, 3), cond_tabla, nroAddenda, transaccion, conn)
                                    Else
                                        strMensajeItem = InsertarDetalleGuia(nrog, IdTipoMovimientoStock, tran, almxp(i), cod_articulop(i), itemp(i), unip(i), atendidoxp(i), cup(i), IdOrdenCompra, IdRequerimiento, cc, empresa, "", numeroitemp(i), cond_tabla, nroAddenda, transaccion, conn)
                                    End If

                                    'InsertarDetalleGuia(nrog, IdTipoMovimientoStock, tran, alm, cod_articulo, "001", uni, atendido, cu, IdOrdenCompra, IdRequerimiento, cc, empresa, "", numeroitem)
                                End If
                            Next

                        ElseIf accion = 4 Then

                            If cc = "000002" Then
                                cc = "040000"
                            End If

                            If IdTipoMovimientoStock = "I" And tran = "07" Then
                                If cc = "040000" Then
                                    cc = "150000"
                                End If
                                Using cnx As New SqlCommand()
                                    cnx.Connection = conn

                                    cnx.CommandText = "sp_alm_actualizar_idTransferencia" 'SP_ALM_Insertar_CabeceraGuia
                                    cnx.CommandType = CommandType.StoredProcedure

                                    cnx.Transaction = transaccion

                                    cnx.Parameters.AddWithValue("@IdGuiaOrigen", nrog)
                                    cnx.Parameters.AddWithValue("@IdGuiaTransferencia", IdProveedor)
                                    cnx.ExecuteNonQuery()
                                End Using
                            End If

                            Dim almxp() As String = almx.Split(",")
                            Dim cod_articulop() As String = cod_articulox.Split(",")
                            Dim itemp() As String = item.Split(",")
                            Dim unip() As String = unix.Split(",")
                            Dim cup() As String = cux.Split(",")
                            Dim atendidoxp() As String = atendidox.Split(",")
                            Dim contador As Integer = 0
                            'Dim idcontratop() As String = idcontrato.Split(",")
                            'Dim numeroitemp() As String = numeroitem.Split(",")


                            If IdTipoMovimientoStock = "I" And tran = "07" Then

                                For i As Integer = 0 To (n - 1)
                                    contador = contador + 1
                                    strMensajeItem = InsertarDetalleGuia(nrog, IdTipoMovimientoStock, tran, alm, cod_articulop(i), itemp(i), unip(i), atendidoxp(i), cu, IdOrdenCompra, IdRequerimiento, cc, empresa, "", Right("000" & contador, 3), cond_tabla, nroAddenda, transaccion, conn)


                                Next

                            Else
                                For i As Integer = 0 To (n - 1)
                                    contador = contador + 1
                                    strMensajeItem = InsertarDetalleGuia(nrog, IdTipoMovimientoStock, tran, alm, cod_articulop(i), itemp(i), unip(i), atendidoxp(i), cup(i), IdOrdenCompra, IdRequerimiento, cc, empresa, "", Right("000" & contador, 3), cond_tabla, nroAddenda, transaccion, conn)
                                Next

                            End If
                            'InsertarDetalleGuia(nrog, IdTipoMovimientoStock, tran, alm, cod_articulop(i), itemp(i), uni, atendidoxp(i), cu, IdOrdenCompra, IdRequerimiento, cc, empresa)
                            'InsertarDetalleGuia(nrog, IdTipoMovimientoStock, tran, alm, cod_articulop(0), itemp(0), uni, atendidoxp(0), cu, IdOrdenCompra, IdRequerimiento, cc, empresa, "", numeroitemp(0)

                        ElseIf (accion = 5 Or accion = 9) Then
                            Dim almxp() As String = almx.Split(",")
                            Dim cod_articulop() As String = cod_articulox.Split(",")
                            Dim itemp() As String = item.Split(",")
                            Dim unip() As String = unix.Split(",")
                            Dim atendidoxp() As String = atendidox.Split(",")
                            Dim cup() As String = cux.Split(",")
                            'Dim idcontratop() As String = idcontrato.Split(",")
                            Dim numeroitemp() As String = numeroitem.Split(",")
                            Dim contador As Integer = 0
                            For i As Integer = 0 To (n - 1)
                                If atendidoxp(i) > 0 Then
                                    contador = contador + 1
                                    If IdTipoMovimientoStock = "I" And (tran = "07" Or tran = "08" Or tran = "10") Then
                                        strMensajeItem = InsertarDetalleGuia(nrog, IdTipoMovimientoStock, tran, almxp(i), cod_articulop(i), itemp(i), unip(i), atendidoxp(i), cup(i), IdOrdenCompra, IdRequerimiento, almxp(i), empresa, "", Right("000" & contador, 3), cond_tabla, nroAddenda, transaccion, conn)
                                    ElseIf IdTipoMovimientoStock = "S" And (tran = "01" Or tran = "05" Or tran = "08" Or tran = "15") Then
                                        strMensajeItem = InsertarDetalleGuia(nrog, IdTipoMovimientoStock, tran, almxp(i), cod_articulop(i), itemp(i), unip(i), atendidoxp(i), cup(i), IdOrdenCompra, IdRequerimiento, almxp(i), empresa, "", Right("000" & contador, 3), cond_tabla, nroAddenda, transaccion, conn)
                                    Else
                                        strMensajeItem = InsertarDetalleGuia(nrog, IdTipoMovimientoStock, tran, almxp(i), cod_articulop(i), itemp(i), unip(i), atendidoxp(i), cup(i), IdOrdenCompra, IdRequerimiento, almxp(i), empresa, "", numeroitemp(i), cond_tabla, nroAddenda, transaccion, conn)
                                    End If
                                End If
                            Next
                        End If
                        strMsj = strMensaje
                        If Left(strMensajeItem, 1) = "0" Then
                            strMsj = strMensajeItem
                            transaccion.Commit()
                            ' Mensaje con el texto completo de: strMensajeItem
                        Else
                            strMsj = strMensajeItem
                            transaccion.Rollback()
                            ' Mensaje con el texto completo de: strMensajeItem
                        End If

                    Else
                        strMsj = strMensaje
                        transaccion.Rollback()

                        ' Enviar mensaje con el texto completo de: strMensaje
                    End If

                    Return (strMsj)
                    conn.Close()
                Catch ex As Exception
                    Return ("Error al Insertar ..." & ex.Message)
                End Try

            End Using
        End Using
    End Function
    '<OperationContract()> _
    ' <WebInvoke(Method:="POST", ResponseFormat:=WebMessageFormat.Json)> _
    'Public Function CodigoGuia(ByVal TipoMovimientoStock As String, ByVal empresa As String) As String
    '    Dim Alm As New List(Of Object)()
    '    Using conn As New SqlConnection()
    '        Dim cx As String = ""

    '        If empresa = 1 Then
    '            cx = "cnEmape"
    '        ElseIf empresa = 2 Then
    '            cx = "cnEmapeMunicipal"
    '        ElseIf empresa = 3 Then
    '            cx = "cnRegional"
    '        ElseIf empresa = 4 Then
    '            cx = "cnMantenimiento"
    '        ElseIf empresa = 5 Then
    '            cx = "cnSiaf"
    '        End If

    '        conn.ConnectionString = ConfigurationManager.ConnectionStrings(cx).ConnectionString
    '        Using cmd As New SqlCommand()

    '            cmd.CommandText = "SP_ALM_Generar_CodigoGuia"
    '            cmd.CommandType = CommandType.StoredProcedure
    '            cmd.Parameters.AddWithValue("@IdTipoMovimientoStock", TipoMovimientoStock)
    '            cmd.Connection = conn
    '            conn.Open()
    '            Dim codigo As String = cmd.ExecuteScalar
    '            Return (codigo)
    '            conn.Close()
    '        End Using

    '    End Using
    'End Function


    Public Function InsertarDetalleGuia(ByVal nro_guia As String, ByVal IdTipoMovimientoStock As String, ByVal tran As String, ByVal alm As String, ByVal IdBienServicio As String, _
ByVal ItemGuia As String, ByVal IdUnidadMedida As String, ByVal Cantidad As String, ByVal Costo As String, ByVal IdOrdenCompra As String, ByVal IdRequerimiento As String, ByVal IdCentroCosto As String, _
ByVal empresa As String, ByVal idcontrato As String, ByVal numeroitem As String, ByVal cond_tabla As String, ByVal nroAddenda As String, ByVal transaccion As SqlTransaction, ByVal conn As SqlConnection) As String

        Dim fechaactual As DateTime = DateTime.Now
        Dim anno As String = Year(DateTime.Now)
        Dim mes As String = Month(DateTime.Now)
        Dim dia As String = Day(DateTime.Now)

        Dim cadena As String = ""
        Dim canno As String = ""
        Dim cmes As String = ""
        Dim strMensajeItem As String = ""

        cadena = periodoActivo("03", empresa)
        canno = cadena.Substring(0, 4)
        cmes = cadena.Substring(4, 2)

        If mes < 10 Then
            mes = "0" + mes
        End If
        If dia < 10 Then
            dia = "0" + dia
        End If

        Dim fechaguia As String = anno + mes + dia

        Using cmd As New SqlCommand()

            'conn.Open
            Try
                cmd.Connection = conn
                cmd.CommandText = "sp_LO_InsertarGuiaDetalle"
                cmd.CommandType = CommandType.StoredProcedure

                cmd.Transaction = transaccion

                cmd.Parameters.AddWithValue("@IdAnno", canno)
                cmd.Parameters.AddWithValue("@IdMes", cmes)

                cmd.Parameters.AddWithValue("@IdTipoMovimientoStock", IdTipoMovimientoStock)
                cmd.Parameters.AddWithValue("@IdMovimientoStock", tran)
                cmd.Parameters.AddWithValue("@IdGuia", nro_guia)
                cmd.Parameters.AddWithValue("@IdAlmacen", alm)
                cmd.Parameters.AddWithValue("@IdBienServicio", IdBienServicio) 'no ingresa
                cmd.Parameters.AddWithValue("@ItemGuia", ItemGuia)
                cmd.Parameters.AddWithValue("@IdUnidadMedida", IdUnidadMedida) 'no ingresa
                cmd.Parameters.AddWithValue("@Cantidad", Cantidad)
                cmd.Parameters.AddWithValue("@Costo", Costo)
                cmd.Parameters.AddWithValue("@IdFechaGuia", fechaguia)
                cmd.Parameters.AddWithValue("@FechaGuia", fechaactual.AddHours(-17))
                cmd.Parameters.AddWithValue("@AudUsuario", Session("userid"))
                cmd.Parameters.AddWithValue("@Insertar", "I")
                If cond_tabla = "9" Then
                    cmd.Parameters.AddWithValue("@IdOrdenCompra", DBNull.Value)
                    cmd.Parameters.AddWithValue("@IdContrato", IdOrdenCompra)
                ElseIf cond_tabla = "2" Then
                    cmd.Parameters.AddWithValue("@IdOrdenCompra", DBNull.Value)
                    cmd.Parameters.AddWithValue("@IdContrato", IdOrdenCompra)
                Else
                    cmd.Parameters.AddWithValue("@IdOrdenCompra", IdOrdenCompra)
                    cmd.Parameters.AddWithValue("@IdContrato", "")
                End If
                cmd.Parameters.AddWithValue("@IdRequerimiento", IdRequerimiento)
                cmd.Parameters.AddWithValue("@IdNumeroItem", numeroitem)
                cmd.Parameters.AddWithValue("@NumeroAddendum", nroAddenda)
                cmd.Parameters.AddWithValue("@IdCentroCosto", IdCentroCosto)

                cmd.Parameters.Add("@mensaje", SqlDbType.VarChar, 100)
                cmd.Parameters("@mensaje").Direction = ParameterDirection.Output

                cmd.ExecuteNonQuery()

                'Obtener Mensaje de SP
                strMensajeItem = cmd.Parameters("@mensaje").Value.ToString.Trim()

                Return (strMensajeItem)
            Catch ex As Exception
                Return ("Error al Insertar..." & ex.Message)

            End Try
        End Using
        'End Using
    End Function

    <OperationContract()> _
  <WebInvoke(Method:="POST", ResponseFormat:=WebMessageFormat.Json)> _
    Public Function anularGuiai(ByVal empresa As String, ByVal idguia As String, ByVal tipo As String) As String


        Dim fechaactual As DateTime = DateTime.Now
        Dim anno As String = Year(DateTime.Now)
        Dim mes As String = right("00" & Month(now), 2)

        'Dim cadena As String = ""
        'Dim canno As String = ""
        'Dim cmes As String = ""

        'cadena = periodoActivo("03", empresa)
        'canno = cadena.Substring(0, 4)
        'cmes = cadena.Substring(4, 2)

        Try
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
                ElseIf empresa = 5 Then
                    cx = "cnSiaf"
                End If

                conn.ConnectionString = ConfigurationManager.ConnectionStrings(cx).ConnectionString

                Using cmd As New SqlCommand()
                    conn.Open()
                    cmd.Connection = conn
                    cmd.CommandText = "SP_ALM_Eliminar_Guia"
                    cmd.CommandType = CommandType.StoredProcedure
                    'cmd.Parameters.AddWithValue("@IdAnno", canno)
                    'cmd.Parameters.AddWithValue("@IdMes", cmes)
                    cmd.Parameters.AddWithValue("@IdGuia", idguia)
                    cmd.Parameters.AddWithValue("@IdTipoMovimientoStock", tipo)
                    cmd.Parameters.AddWithValue("@IdMovimientoStock", "")
                    cmd.Parameters.AddWithValue("@AudUsuarioModificacion", Session("userid"))

                    cmd.ExecuteNonQuery()

                End Using
                Return (1)
            End Using
        Catch ex As Exception
            Return ("Error while inserting record on table..." & ex.Message)
        End Try
    End Function

    <OperationContract()> _
 <WebInvoke(Method:="POST", ResponseFormat:=WebMessageFormat.Json)> _
    Public Function anularRequerimientoAlmacen(ByVal empresa As String, ByVal req As String) As String

        Try
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
                ElseIf empresa = 5 Then
                    cx = "cnSiaf"
                End If

                Dim cadena As String = ""
                Dim canno As String = ""
                Dim cmes As String = ""

                cadena = periodoActivo("03", empresa)
                canno = cadena.Substring(0, 4)
                cmes = cadena.Substring(4, 2)

                Dim anno As String = Year(DateTime.Now)
                Dim mes As String = Right("00" & Month(Now), 2)

                conn.ConnectionString = ConfigurationManager.ConnectionStrings(cx).ConnectionString

                Using cmd As New SqlCommand()
                    conn.Open()
                    cmd.Connection = conn
                    cmd.CommandText = "SP_LOG_Eliminar_RequerimientoAlmacen"
                    cmd.CommandType = CommandType.StoredProcedure
                    cmd.Parameters.AddWithValue("@IdRequerimiento", req)
                    cmd.Parameters.AddWithValue("@BienServicio", "B")
                    cmd.Parameters.AddWithValue("@IdAnno", canno)
                    cmd.Parameters.AddWithValue("@IdMes", cmes)
                    'cmd.Parameters.AddWithValue("@AudUsuario", Session("userid"))
                    cmd.ExecuteNonQuery()

                End Using
                Return (1)
            End Using
        Catch ex As Exception
            Return ("Error while inserting record on table..." & ex.Message)
        End Try
    End Function

    <OperationContract()> _
<WebInvoke(Method:="POST", ResponseFormat:=WebMessageFormat.Json)> _
    Public Function InsertarCabeceraRequerimientoAlmacen(ByVal almx As String, ByVal atendidox As String, ByVal n As String, ByVal memo As String, ByVal IdCentroCosto As String, _
                                ByVal concepto As String, ByVal TotalCosto As String, ByVal cod_articulox As String, ByVal unix As String, ByVal cux As String, ByVal empresa As String, ByVal placax As String) As String

        'Inicializando las variables
        Dim strMensaje As String = ""
        Dim strMensajeItem As String = ""
        Dim strMsj As String = ""

        Dim fechaactual As DateTime = DateTime.Now
        Dim cadena As String = periodoActivo("03", empresa)
        Dim canno As String = cadena.Substring(0, 4)
        Dim cmes As String = cadena.Substring(4, 2)

        'Obtener el Nombre BDEntidad
        Dim cx As String = entidad(empresa)

        'Obteniendo la cantidad total
        Dim sumcant As Decimal = 0
        Dim cantidad() As String = atendidox.Split(",")
        For i As Integer = 0 To (n - 1)
            sumcant = sumcant + CInt(cantidad(i))
        Next

        'Inicializando Conexion
        Using conn As New SqlConnection()
            conn.ConnectionString = ConfigurationManager.ConnectionStrings(cx).ConnectionString

            'Abriendo Conexion
            conn.Open()

            'Inicializando Command
            Using cmd As New SqlCommand()

                'Inicializando Transaccion
                Dim transaccion As SqlTransaction = conn.BeginTransaction
                'Asignando la conexion al cmd y a la transaccion
                cmd.Connection = conn
                cmd.Transaction = transaccion

                Try

                    'Procedimiento Almacenado y Parametros para registrar cabecera
                    cmd.CommandText = "SP_LOG_Insertar_RequerimientoAlmacen"
                    cmd.CommandType = CommandType.StoredProcedure

                    cmd.Parameters.AddWithValue("@IdTipoRequerimiento", "02")
                    cmd.Parameters.AddWithValue("@BienServicio", "B")
                    cmd.Parameters.AddWithValue("@IdVia", "")
                    cmd.Parameters.AddWithValue("@IdRequerimiento", "")
                    cmd.Parameters.AddWithValue("@Memo", memo)
                    cmd.Parameters.AddWithValue("@IdCentroCosto", Session("useridcc"))
                    cmd.Parameters.AddWithValue("@Descripcion", concepto)
                    cmd.Parameters.AddWithValue("@CostoTotal", TotalCosto)
                    cmd.Parameters.AddWithValue("@CantidadTotal", sumcant)
                    cmd.Parameters.AddWithValue("@IdAnno", canno)
                    cmd.Parameters.AddWithValue("@IdMes", cmes)
                    cmd.Parameters.AddWithValue("@FechaRequerimiento", fechaactual)
                    cmd.Parameters.AddWithValue("@AudUsuario", Session("userid"))
                    cmd.Parameters.AddWithValue("@Insertar", "I")

                    cmd.Parameters.Add("@mensaje", SqlDbType.VarChar, 100)
                    cmd.Parameters("@mensaje").Direction = ParameterDirection.Output

                    cmd.ExecuteNonQuery()

                    'Obtener Mensaje de SP
                    strMensaje = cmd.Parameters("@mensaje").Value.ToString.Trim()

                    ' Obtener el correlativo de la insercion de la cabecera
                    Dim nro As String = strMensaje.Substring(18, 13)
                    'nro = CodigoRequerimientoAlmacen("02", empresa)

                    If Left(strMensaje, 1) = "0" Then
                        strMensajeItem = "1... Inicial"

                        Dim cod_articulop() As String = cod_articulox.Split(",")
                        Dim unip() As String = unix.Split(",")
                        Dim atendidoxp() As String = atendidox.Split(",")
                        Dim cup() As String = cux.Split(",")
                        Dim placap() As String = placax.Split(",")
                        Dim m As String = ""

                        For i As Integer = 0 To (n - 1)
                            If CInt(atendidoxp(i)) > 0 Then
                                strMensajeItem = InsertarDetalleRequerimientoAlmacen(nro, IdCentroCosto, "000002", cod_articulop(i), unip(i), atendidoxp(i) * 1, cup(i), empresa, placap(i), transaccion, conn)
                            End If
                        Next

                        strMsj = strMensaje
                        If Left(strMensajeItem, 1) = "0" Then
                            strMsj = strMensajeItem
                            transaccion.Commit()
                            ' Mensaje con el texto completo de: strMensajeItem
                        Else
                            strMsj = strMensajeItem
                            transaccion.Rollback()
                            ' Mensaje con el texto completo de: strMensajeItem
                        End If

                    Else
                        strMsj = strMensaje
                        transaccion.Rollback()
                        ' Enviar mensaje con el texto completo de: strMensaje
                    End If

                    Return (strMsj)
                    conn.Close()
                Catch ex As Exception
                    Return ("Error al Insertar0 " & ex.Message)
                End Try

            End Using
        End Using
    End Function
    '<OperationContract()> _
    ' <WebInvoke(Method:="POST", ResponseFormat:=WebMessageFormat.Json)> _
    'Public Function CodigoRequerimientoAlmacen(ByVal TipoReq As String, ByVal empresa As String) As String
    '    Dim Alm As New List(Of Object)()
    '    Using conn As New SqlConnection()
    '        Dim cx As String = ""

    '        If empresa = 1 Then
    '            cx = "cnEmape"
    '        ElseIf empresa = 2 Then
    '            cx = "cnEmapeMunicipal"
    '        ElseIf empresa = 3 Then
    '            cx = "cnRegional"
    '        ElseIf empresa = 4 Then
    '            cx = "cnMantenimiento"
    '        ElseIf empresa = 5 Then
    '            cx = "cnSiaf"
    '        End If

    '        conn.ConnectionString = ConfigurationManager.ConnectionStrings(cx).ConnectionString
    '        Using cmd As New SqlCommand()

    '            cmd.CommandText = "SP_ALM_Generar_CodigoRequerimiento"
    '            cmd.CommandType = CommandType.StoredProcedure
    '            cmd.Parameters.AddWithValue("@TipoReq", TipoReq)
    '            cmd.Connection = conn
    '            conn.Open()
    '            Dim codigo As String = cmd.ExecuteScalar
    '            Return (codigo)
    '            conn.Close()
    '        End Using

    '    End Using
    'End Function

    Public Function InsertarDetalleRequerimientoAlmacen(ByVal IdRequerimiento As String, ByVal IdCentroCosto As String, ByVal alm As String, _
ByVal IdBienServicio As String, ByVal IdUnidadMedida As String, ByVal Cantidad As String, ByVal Costo As String, ByVal empresa As String, ByVal placa As String, ByVal transaccion As SqlTransaction, ByVal conn As SqlConnection) As String

        'Inicializando Variables
        Dim anno As String = Year(DateTime.Now)
        Dim mes As String = Right("00" & Month(Now), 2)

        Dim cadena As String = periodoActivo("03", empresa)
        Dim canno As String = cadena.Substring(0, 4)
        Dim cmes As String = cadena.Substring(4, 2)

        Using cmd As New SqlCommand()
            Try
                cmd.Connection = conn
                cmd.CommandText = "SP_LOG_Insertar_RequerimientoAlmacenDetalle"
                cmd.CommandType = CommandType.StoredProcedure

                cmd.Transaction = transaccion

                cmd.Parameters.AddWithValue("@IdRequerimiento", IdRequerimiento)
                cmd.Parameters.AddWithValue("@BienServicio", "B")
                cmd.Parameters.AddWithValue("@IdNumeroItem", "")
                cmd.Parameters.AddWithValue("@IdAnno", canno)
                cmd.Parameters.AddWithValue("@IdMes", cmes)
                cmd.Parameters.AddWithValue("@IdCentroCosto", Session("useridcc"))
                cmd.Parameters.AddWithValue("@IdAlmacen", alm)
                cmd.Parameters.AddWithValue("@IdBienServicio", IdBienServicio)
                cmd.Parameters.AddWithValue("@IdUnidadMedida", IdUnidadMedida)
                cmd.Parameters.AddWithValue("@CantidadItem", Cantidad)
                cmd.Parameters.AddWithValue("@CostoItem", Costo)
                cmd.Parameters.AddWithValue("@SubTotalItem", Costo)
                cmd.Parameters.AddWithValue("@AudUsuario", Session("userid"))
                cmd.Parameters.AddWithValue("@IdOrdenCompra", "")
                cmd.Parameters.AddWithValue("@NumeroItemOrdenCompra", "")
                cmd.Parameters.AddWithValue("@Insertar", "I")
                cmd.Parameters.AddWithValue("@Placa", placa)

                cmd.Parameters.Add("@mensaje", SqlDbType.VarChar, 100)
                cmd.Parameters("@mensaje").Direction = ParameterDirection.Output

                cmd.ExecuteNonQuery()

                'Obtener Mensaje de SP
                Dim strMensajeItem As String = cmd.Parameters("@mensaje").Value.ToString.Trim()

                Return (strMensajeItem)

            Catch ex As Exception
                Return ("Error al Insertar: " & ex.Message)
            End Try
        End Using
    End Function


    <OperationContract()> _
 <WebInvoke(Method:="POST", ResponseFormat:=WebMessageFormat.Json)> _
    Public Function ImprimirRequerimientoAlmacen(ByVal IdRequerimiento As String, ByVal empresa As String) As String

        Try
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
                ElseIf empresa = 5 Then
                    cx = "cnSiaf"
                End If

                conn.ConnectionString = ConfigurationManager.ConnectionStrings(cx).ConnectionString

                Dim cmd As New SqlCommand("SP_LOG_Imprimir_RequerimientoAlmacen", conn)
                cmd.Parameters.AddWithValue("@IdRequerimiento", IdRequerimiento)
                cmd.Parameters.AddWithValue("@BienServicio", "B")
                cmd.CommandType = CommandType.StoredProcedure
                Dim da As New SqlDataAdapter()
                da.SelectCommand = cmd
                Dim DataTable As New DataTable()
                da.Fill(DataTable)

                Dim cr As New ReportDocument()
                cr.Load(Server.MapPath("../../Reportes/rptPedidos.rpt"))
                cr.SetDataSource(DataTable)
                cr.ExportToHttpResponse(ExportFormatType.PortableDocFormat, Response, True, "RequerimientoAlmacen")

                'With rptRS.DataDefinition.FormulaFields
                '.Item("cTitulo").Text = "'PROVEEDORES DE SERVICIOS '"
                '.Item("cSubTitulo").Text = "'AÑO " & Session("IdAnno") & "'"
                'End With

            End Using

        Catch ex As Exception
            Return ("Imprimir..." & ex.Message)
        End Try

        Return (1)
    End Function

    <OperationContract()> _
<WebInvoke(Method:="POST", ResponseFormat:=WebMessageFormat.Json)> _
    Public Function Acceso(ByVal user As String, ByVal pass As String) As String
        Dim userId As Object = 0
        Dim conta As String
        Try
            Using con As New SqlConnection()
                con.ConnectionString = ConfigurationManager.ConnectionStrings("cnUtilitarios").ConnectionString
                Using cmd As New SqlCommand()
                    cmd.CommandText = "select IdUsuario, Apellidos+' '+ Nombres as NameUsuario ,IdCentroCosto from SS_USUARIO WHERE IdUsuario=@user and Password=@pass and Estado='A'"
                    cmd.Parameters.AddWithValue("@user", user)
                    cmd.Parameters.AddWithValue("@pass", pass)
                    cmd.Connection = con
                    con.Open()

                    Using sdr As SqlDataReader = cmd.ExecuteReader()
                        While sdr.Read()
                            userId = sdr("IdUsuario")
                            Session("userid") = sdr("IdUsuario")
                            Session("useridcc") = sdr("IdCentroCosto")
                            Session("username") = sdr("NameUsuario")
                        End While
                    End Using

                    If userId = 0 Then
                        conta = "0"
                    Else
                        conta = "1"
                    End If
                    Return conta

                    con.Close()
                End Using
            End Using
        Catch ex As Exception
            Return "error"
        End Try
    End Function

    <OperationContract()> _
<WebInvoke(Method:="POST", ResponseFormat:=WebMessageFormat.Json)> _
    Public Function Permiso() As String
        Dim permisos As New List(Of Object)()
        Try
            Using con As New SqlConnection()
                con.ConnectionString = ConfigurationManager.ConnectionStrings("cnUtilitarios").ConnectionString
                Using cmd As New SqlCommand()
                    cmd.CommandText = "select IdMenu+IdMenuItem as Menu from usuariosistema WHERE (IdSistema='16' OR IdSistema='17') AND IdUsuario=@user"
                    cmd.Parameters.AddWithValue("@user", Session("userid"))
                    cmd.Connection = con
                    con.Open()

                    Using sdr As SqlDataReader = cmd.ExecuteReader()
                        While sdr.Read()
                            permisos.Add(New With { _
                                Key .Menu = sdr("Menu") _
                       })
                        End While
                    End Using
                    con.Close()
                End Using
                Return (New JavaScriptSerializer().Serialize(permisos))
            End Using
        Catch ex As Exception
            Return "" & vbCrLf & ex.Message & Session("userid")
        End Try
    End Function

    <OperationContract()> _
     <WebInvoke(Method:="POST", ResponseFormat:=WebMessageFormat.Json)> _
    Public Function ObtenerProveedor(ByVal IdProveedor As String, ByVal empresa As String) As String
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
            ElseIf empresa = 5 Then
                cx = "cnSiaf"
            End If

            conn.ConnectionString = ConfigurationManager.ConnectionStrings(cx).ConnectionString
            Using cmd As New SqlCommand()

                cmd.CommandText = "SELECT RazonSocial FROM Proveedor WHERE Estado='A' and IdProveedor='" & IdProveedor & "'"
                cmd.Connection = conn
                conn.Open()
                Dim razonsocial As String = cmd.ExecuteScalar
                Return (razonsocial)
                conn.Close()
            End Using

        End Using
    End Function

    <OperationContract()> _
 <WebInvoke(Method:="POST", ResponseFormat:=WebMessageFormat.Json)> _
    Public Function ObtenerCC(ByVal IdCentroCosto As String, ByVal empresa As String) As String
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
            ElseIf empresa = 5 Then
                cx = "cnSiaf"
            End If

            conn.ConnectionString = ConfigurationManager.ConnectionStrings(cx).ConnectionString
            Using cmd As New SqlCommand()
                cmd.CommandText = "SELECT Descripcion FROM CentroCosto WHERE Estado='A' and IdAnno='" & Year(Now) & "' and IdCentroCosto='" & IdCentroCosto & "'"
                cmd.Connection = conn
                conn.Open()
                Dim descripcion As String = cmd.ExecuteScalar
                Return (descripcion)
                conn.Close()
            End Using

        End Using

    End Function

    <OperationContract()> _
<WebInvoke(Method:="POST", ResponseFormat:=WebMessageFormat.Json)> _
    Public Function ObtenerGuia(ByVal IdGuia As String, ByVal IdTipoMovimientoStock As String, ByVal empresa As String) As String
        Dim guia As New List(Of Object)()
        Try
            Using con As New SqlConnection()
                Dim cx As String = ""
                Dim fgp As String = ""
                If empresa = 1 Then
                    cx = "cnEmape"
                ElseIf empresa = 2 Then
                    cx = "cnEmapeMunicipal"
                ElseIf empresa = 3 Then
                    cx = "cnRegional"
                ElseIf empresa = 4 Then
                    cx = "cnMantenimiento"
                ElseIf empresa = 5 Then
                    cx = "cnSiaf"
                End If
                con.ConnectionString = ConfigurationManager.ConnectionStrings(cx).ConnectionString
                Using cmd As New SqlCommand()
                    cmd.CommandText = "select * from Guia WHERE IdGuia='" & IdGuia & "' and IdTipoMovimientoStock='" & IdTipoMovimientoStock & "'"
                    cmd.Connection = con
                    con.Open()

                    Using sdr As SqlDataReader = cmd.ExecuteReader()
                        While sdr.Read()
                            If (IsDBNull(sdr("FechaGuiaProveedor"))) Then
                                fgp = ""
                            Else
                                fgp = Format(sdr("FechaGuiaProveedor"), "dd/MM/yyyy")
                            End If

                            guia.Add(New With { _
                                Key .IdMovimientoStock = sdr("IdMovimientoStock"), _
                                Key .FechaGuia = Format(sdr("FechaGuia"), "dd/MM/yyyy"), _
                                Key .IdAlmacen = sdr("IdAlmacen"), _
                                Key .Observacion = sdr("Observacion"), _
                                Key .GuiaProveedor = sdr("GuiaProveedor"), _
                                Key .FechaGuiaProveedor = fgp _
                       })
                        End While
                    End Using
                    con.Close()
                End Using
                Return (New JavaScriptSerializer().Serialize(guia))
            End Using
        Catch ex As Exception
            Return "Error" & ex.Message
        End Try
    End Function

    <OperationContract()> _
<WebInvoke(Method:="POST", ResponseFormat:=WebMessageFormat.Json)> _
    Public Function ModificarCabeceraGuia(ByVal IdGuia As String, ByVal IdTipoMovimientoStock As String, ByVal Detalle As String, ByVal Nump As String, ByVal Fechap As String, ByVal empresa As String) As String
        Try
            Using conn As New SqlConnection()
                Dim cx As String = ""
                Dim fgp As String = ""
                If empresa = 1 Then
                    cx = "cnEmape"
                ElseIf empresa = 2 Then
                    cx = "cnEmapeMunicipal"
                ElseIf empresa = 3 Then
                    cx = "cnRegional"
                ElseIf empresa = 4 Then
                    cx = "cnMantenimiento"
                ElseIf empresa = 5 Then
                    cx = "cnSiaf"
                End If

                conn.ConnectionString = ConfigurationManager.ConnectionStrings(cx).ConnectionString
                Using cmd As New SqlCommand()
                    conn.Open()
                    cmd.Connection = conn

                    If (IdTipoMovimientoStock = "I") Then
                        cmd.CommandText = "UPDATE Guia SET Observacion=@detalle, GuiaProveedor=@nump, FechaGuiaProveedor=@fechap WHERE IdGuia=@idguia and IdTipoMovimientoStock=@idtipomovimientostock"
                    Else
                        cmd.CommandText = "UPDATE Guia SET Observacion=@detalle, GuiaProveedor=@nump WHERE IdGuia=@idguia and IdTipoMovimientoStock=@idtipomovimientostock"
                    End If
                    cmd.Parameters.AddWithValue("@detalle", Detalle)
                    cmd.Parameters.AddWithValue("@nump", Nump)
                    cmd.Parameters.AddWithValue("@fechap", Fechap)
                    cmd.Parameters.AddWithValue("@idguia", IdGuia)
                    cmd.Parameters.AddWithValue("@idtipomovimientostock", IdTipoMovimientoStock)
                    cmd.ExecuteNonQuery()
                End Using
                Return (1)
            End Using
        Catch ex As Exception
            Return ("Modificar Guia ..." & ex.Message)
        End Try
    End Function

    <OperationContract()> _
<WebInvoke(Method:="POST", ResponseFormat:=WebMessageFormat.Json)> _
    Public Function listarExpedienteCompromiso(ByVal empresa As String, ByVal orden As String) As String
        Dim Exp As New List(Of Object)()
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
            ElseIf empresa = 5 Then
                cx = "cnSiaf"
            End If
            conn.ConnectionString = ConfigurationManager.ConnectionStrings(cx).ConnectionString
            Using cmd As New SqlCommand()
                cmd.CommandText = "SELECT  * FROM ExpedienteSiafCompromiso WHERE IdAnno ='2016' and IdOrden like '%" & orden & "%' order by Expediente desc"
                cmd.Connection = conn
                conn.Open()
                Using sdr As SqlDataReader = cmd.ExecuteReader()
                    While sdr.Read()
                        Exp.Add(New With { _
                         Key .Expediente = sdr("Expediente"), _
                         Key .Encargo = sdr("Encargo"), _
                         Key .Solicitud = sdr("IdNroSol"), _
                         Key .CompraServicio = IIf(sdr("CompraSer") = "C", "Compra", "Servicio"), _
                         Key .Orden = sdr("IdOrden"), _
                         Key .Fecha = sdr("Fecha"), _
                         Key .Monto = sdr("monto") _
                        })
                    End While
                End Using
                conn.Close()
            End Using
            Return (New JavaScriptSerializer().Serialize(Exp))
        End Using
    End Function

    <OperationContract()> _
<WebInvoke(Method:="POST", ResponseFormat:=WebMessageFormat.Json)> _
    Public Function listarProcesoSeleccion(ByVal empresa As String, ByVal nro As String, ByVal objeto As String) As String
        Dim Pro As New List(Of Object)()
        Using conn As New SqlConnection()
            Dim cx As String = ""
            Dim fecha As String = ""
            If empresa = 1 Then
                cx = "cnEmape"
            ElseIf empresa = 2 Then
                cx = "cnEmapeMunicipal"
            ElseIf empresa = 3 Then
                cx = "cnRegional"
            ElseIf empresa = 4 Then
                cx = "cnMantenimiento"
            ElseIf empresa = 5 Then
                cx = "cnSiaf"
            End If
            conn.ConnectionString = ConfigurationManager.ConnectionStrings(cx).ConnectionString
            Using cmd As New SqlCommand()

                cmd.CommandText = "LG_ProcesoConsulta"
                cmd.CommandType = CommandType.StoredProcedure

                cmd.Parameters.AddWithValue("@IdProcesoSeleccion", "%" + nro + "%")
                cmd.Parameters.AddWithValue("@Objeto", "%" + objeto + "%")

                cmd.Connection = conn
                conn.Open()

                Using sdr As SqlDataReader = cmd.ExecuteReader()
                    While sdr.Read()
                        If (IsDBNull(sdr("FechaProcesoSeleccion"))) Then
                            fecha = ""
                        Else
                            fecha = Format(sdr("FechaProcesoSeleccion"), "dd/MM/yyyy")
                        End If

                        Pro.Add(New With { _
                        Key .DescripTipo = sdr("DescripTipo"), _
                        Key .DescripClasificacion = sdr("DescripClasificacion"), _
                        Key .IdProcesoSeleccion = sdr("IdProcesoSeleccion"), _
                        Key .FechaProcesoSeleccion = fecha, _
                        Key .Objeto = sdr("Objeto"), _
                            Key .FechaConvocatoria = sdr("FechaConvocatoria"), _
                            Key .InicioVenta = sdr("InicioVenta"), _
                            Key .FinVenta = sdr("FinVenta"), _
                            Key .FechaObservacionIni = sdr("FechaObservacionIni"), _
                            Key .FechaObservacionFin = sdr("FechaObservacionFin"), _
                            Key .FechaAbsolucion = sdr("FechaAbsolucion"), _
                            Key .FechaIntegracionBase = sdr("FechaIntegracionBase"), _
                            Key .FechaPresentacionPropuesta = sdr("FechaPresentacionPropuesta"), _
                            Key .EvaluacionIni = sdr("EvaluacionIni"), _
                            Key .EvaluacionFin = sdr("EvaluacionFin"), _
                            Key .FechaCalificacionPropuesta = sdr("FechaCalificacionPropuesta"), _
                            Key .FechaBuenaPro = sdr("FechaBuenaPro"), _
                            Key .ConsentimientoBuenaPro = sdr("ConsentimientoBuenaPro"), _
                            Key .CitacionParaFirma = sdr("CitacionParaFirma"), _
                            Key .FirmaContratoIni = sdr("FirmaContratoIni"), _
                            Key .FirmaContratoFin = sdr("FirmaContratoFin") _
                    })
                    End While
                End Using
                conn.Close()
            End Using
            Return (New JavaScriptSerializer().Serialize(Pro))
        End Using
    End Function

    <OperationContract()> _
 <WebInvoke(Method:="POST", ResponseFormat:=WebMessageFormat.Json)> _
    Public Function Cierre(ByVal empresa As String) As String
        Dim anno, mes, aanno, ames As String
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
            ElseIf empresa = 5 Then
                cx = "cnSiaf"
            End If

            anno = Year(Now) * 1
            mes = Month(Now) * 1
            aanno = anno

            If mes = "1" Then
                ames = 12
                aanno = anno - 1
            Else
                ames = (mes * 1) - 1
                If ames < 10 Then
                    ames = "0" & ames
                End If
            End If

            If mes < 10 Then
                mes = "0" & mes
            End If

            conn.ConnectionString = ConfigurationManager.ConnectionStrings(cx).ConnectionString
            conn.Open()
            Using cmd0 As New SqlCommand()

                cmd0.Connection = conn

                If empresa = 4 Then
                    cmd0.CommandText = "sp_LO_CierreMesAlmacenMantenimientoVial"
                Else
                    cmd0.CommandText = "sp_LO_CierreMesAlmacenCentral"
                End If

                cmd0.CommandType = CommandType.StoredProcedure

                cmd0.Parameters.AddWithValue("@IdAnno", aanno)
                cmd0.Parameters.AddWithValue("@IdMes", ames)
                cmd0.CommandTimeout = 1200
                cmd0.ExecuteNonQuery()

            End Using

            Using cmd As New SqlCommand()
                cmd.Connection = conn

                If empresa = 4 Then
                    cmd.CommandText = "sp_LO_CierreMesAlmacenMantenimientoVial"
                Else
                    cmd.CommandText = "sp_LO_CierreMesAlmacenCentral"
                End If
                cmd.CommandType = CommandType.StoredProcedure

                cmd.Parameters.AddWithValue("@IdAnno", anno)
                cmd.Parameters.AddWithValue("@IdMes", mes)
                cmd.CommandTimeout = 1200
                cmd.ExecuteNonQuery()

            End Using
            'conn.Close()


            Return (1)

        End Using
    End Function

    <OperationContract()> _
<WebInvoke(Method:="POST", ResponseFormat:=WebMessageFormat.Json)> _
    Public Function listarOrdenDetalle(ByVal IdOrdenCompra As String, ByVal compraservicio As String, ByVal empresa As String) As String

        Dim ordendetalle As New List(Of Object)()
        Using conn As New SqlConnection()
            Dim cx As String = ""

            If empresa = 1 Then
                cx = "cnEmape"
            ElseIf empresa = 2 Then
                cx = "cnEmapeMunicipal"
            ElseIf empresa = 3 Then
                cx = "cnRegional"
            ElseIf empresa = 4 Then
                cx = "cnMantenimientoVial"
            ElseIf empresa = 5 Then
                cx = "cnSiaf"
            End If

            conn.ConnectionString = ConfigurationManager.ConnectionStrings(cx).ConnectionString
            Using cmd As New SqlCommand()

                cmd.CommandText = "sp_LO_FiltrarOrdenCompraDetalle"
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.AddWithValue("@IdOrdenCompra", IdOrdenCompra)
                cmd.Parameters.AddWithValue("@Compraservicio", compraservicio)

                cmd.Connection = conn
                conn.Open()
                Using sdr As SqlDataReader = cmd.ExecuteReader()
                    While sdr.Read()

                        ordendetalle.Add(New With { _
                         Key .NumeroItemOrdenCompra = sdr("NumeroItemOrdenCompra"), _
                         Key .IdRequerimiento = sdr("IdRequerimiento"), _
                         Key .IdCentroCosto = sdr("IdCentroCosto"), _
                         Key .DesCentroCosto = sdr("DesCentroCosto"), _
                         Key .Descripcion = sdr("Descripcion"), _
                         Key .ClasificadorGasto = sdr("ClasificadorGasto"), _
                         Key .IdProyecto = sdr("IdProyecto"), _
                         Key .IdFinalidad = sdr("IdFinalidad"), _
                         Key .Meta = sdr("Meta"), _
                         Key .DescripcionUM = sdr("DescripcionUM"), _
                         Key .Cantidad = sdr("Cantidad"), _
                         Key .Costo = Format(sdr("Costo"), "##,##0.00"), _
                         Key .TotalCosto = Format(sdr("TotalCosto"), "##,##0.00"), _
                         Key .DescripcionEstado = sdr("DescripcionEstado"), _
                         Key .PartidaPresupuestal = sdr("PartidaPresupuestal"), _
                         Key .IdTransaccion = sdr("IdTransaccion") _
                        })
                    End While
                End Using
                conn.Close()
            End Using
            Return (New JavaScriptSerializer().Serialize(ordendetalle))
        End Using
    End Function

    <OperationContract()> _
<WebInvoke(Method:="POST", ResponseFormat:=WebMessageFormat.Json)> _
    Public Function listarAdicionarRequerimiento(ByVal ConvenioBase As String, ByVal BienServicio As String, ByVal idanno As String, ByVal empresa As String) As String

        Dim adicionarrequerimiento As New List(Of Object)()
        Using conn As New SqlConnection()
            Dim cx As String = ""

            If empresa = 1 Then
                cx = "cnEmape"
            ElseIf empresa = 2 Then
                cx = "cnEmapeMunicipal"
            ElseIf empresa = 3 Then
                cx = "cnRegional"
            ElseIf empresa = 4 Then
                cx = "cnMantenimientoVial"
            ElseIf empresa = 5 Then
                cx = "cnSiaf"
            End If

            conn.ConnectionString = ConfigurationManager.ConnectionStrings(cx).ConnectionString
            Using cmd As New SqlCommand()

                cmd.CommandText = "SP_LOG_AdicionarOrden"
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.AddWithValue("@BienServicio", BienServicio)
                cmd.Parameters.AddWithValue("@idanno", Year(Now))

                cmd.Connection = conn
                conn.Open()
                Using sdr As SqlDataReader = cmd.ExecuteReader()
                    While sdr.Read()

                        adicionarrequerimiento.Add(New With { _
                         Key .IdRequerimiento = sdr("IdRequerimiento"), _
                         Key .Descripcion = sdr("Descripcion"), _
                         Key .FechaRequerimiento = Format(sdr("FechaRequerimiento"), "dd/MM/yyyy"), _
                         Key .DescripCentroCosto = sdr("DescripCentroCosto"), _
                         Key .DescripcionCorta = sdr("DescripcionCorta"), _
                         Key .SaldoSubTotal = Format(sdr("SaldoSubTotal"), "###0.00") _
                        })
                    End While
                End Using
                conn.Close()
            End Using
            Return (New JavaScriptSerializer().Serialize(adicionarrequerimiento))
        End Using
    End Function

    <OperationContract()> _
<WebInvoke(Method:="POST", ResponseFormat:=WebMessageFormat.Json)> _
    Public Function listarAdicionarDetalleRequerimiento(ByVal IdCentroCosto As String, ByVal IdRequerimiento As String, ByVal BienServicio As String, ByVal IdTipoDocumento As String, ByVal empresa As String) As String
        'Dim Cantidad As String
        Dim Costo As String
        Dim MontoReser As String
        Dim SaldoReser As String
        Dim SubTotal As String
        Dim SaldoSubTotal As String
        Dim adicionarordendetalle As New List(Of Object)()
        Using conn As New SqlConnection()
            Dim cx As String = ""

            If empresa = 1 Then
                cx = "cnEmape"
            ElseIf empresa = 2 Then
                cx = "cnEmapeMunicipal"
            ElseIf empresa = 3 Then
                cx = "cnRegional"
            ElseIf empresa = 4 Then
                cx = "cnMantenimientoVial"
            ElseIf empresa = 5 Then
                cx = "cnSiaf"
            End If

            conn.ConnectionString = ConfigurationManager.ConnectionStrings(cx).ConnectionString
            Using cmd As New SqlCommand()

                cmd.CommandText = "SP_LOG_AdicionarOrdenDetalle"
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.AddWithValue("@IdRequerimiento", IdRequerimiento)
                cmd.Parameters.AddWithValue("@BienServicio", BienServicio)
                cmd.Parameters.AddWithValue("@Idanno", Year(Now))
                cmd.Parameters.AddWithValue("@TipoDoc", IdTipoDocumento)

                cmd.Connection = conn
                conn.Open()
                Using sdr As SqlDataReader = cmd.ExecuteReader()
                    While sdr.Read()

                        'If (IsDBNull(sdr("SaldoCantidad"))) Then
                        '    Cantidad = "0"
                        'Else
                        '    Cantidad = Format(sdr("SaldoCantidad"), "###0.00")
                        'End If

                        If (IsDBNull(sdr("CostoItem"))) Then
                            Costo = "0.00"
                        Else
                            Costo = Format(sdr("CostoItem"), "###0.00")
                        End If

                        If (IsDBNull(sdr("MontoAReservarActual"))) Then
                            MontoReser = "0.00"
                        Else
                            MontoReser = Format(sdr("MontoAReservarActual"), "###0.00")
                        End If

                        If (IsDBNull(sdr("SaldoReservaActual"))) Then
                            SaldoReser = "0.00"
                        Else
                            SaldoReser = Format(sdr("SaldoReservaActual"), "###0.00")
                        End If

                        If (IsDBNull(sdr("SaldoCosto"))) Then
                            SubTotal = "0.00"
                        Else
                            SubTotal = Format(sdr("SaldoCosto"), "###0.00")
                        End If

                        If (IsDBNull(sdr("SaldoSubTotal"))) Then
                            SaldoSubTotal = "0.00"
                        Else
                            SaldoSubTotal = Format(sdr("SaldoSubTotal"), "###0.00")
                        End If


                        adicionarordendetalle.Add(New With { _
                         Key .IdCentroCosto = sdr("IdCentroCosto"), _
                         Key .PartidaPresupuestal = sdr("PartidaPresupuestal"), _
                         Key .IdTransaccion = sdr("IdTransaccion"), _
                         Key .IdCuentaContable = sdr("IdCuentaContable"), _
                         Key .IdAlmacen = sdr("IdAlmacen"), _
                         Key .IdRequerimiento = sdr("IdRequerimiento"), _
                         Key .IdNumeroItem = sdr("IdNumeroItem"), _
                         Key .IdBienServicio = sdr("IdBienServicio"), _
                         Key .UM = sdr("UM"), _
                         Key .IdUnidadMedida = sdr("IdUnidadMedida"), _
                         Key .Descripcion = sdr("Descripcion"), _
                         Key .Siglas = sdr("Siglas"), _
                         Key .Clasificador = sdr("Clasificador"), _
                         Key .Actividad = sdr("Actividad"), _
                         Key .IdFinalidad = sdr("IdFinalidad"), _
                         Key .Meta = sdr("Meta"), _
                         Key .SaldoCantidad = IIf(IsDBNull(sdr("SaldoCantidad")), 0.0, sdr("SaldoCantidad")), _
                         Key .CostoItem = Costo, _
                         Key .CostoItemOpe = sdr("CostoItem"), _
                         Key .MontoAReservarActual = MontoReser, _
                         Key .SaldoReservaActual = SaldoReser, _
                         Key .SaldoSubTotal = SubTotal, _
                         Key .Inafecto = Format(sdr("Inafecto"), "###0.00"), _
                         Key .Tasa = Format(sdr("Tasa"), "###0.00"), _
                         Key .ValorOper = sdr("ValorOper"), _
                         Key .Neto = Format(sdr("Neto"), "###0.00") _
                        })
                    End While
                End Using
                conn.Close()
            End Using
            Return (New JavaScriptSerializer().Serialize(adicionarordendetalle))
        End Using
    End Function

    'ACTUALIZAR SALDO REQUERIMIENTO
    <OperationContract()> _
    <WebInvoke(Method:="POST", ResponseFormat:=WebMessageFormat.Json)> _
    Public Function actualizarsaldoxrequerimiento(ByVal IdRequerimiento As String, ByVal BienServicio As String, ByVal empresa As String) As String
        Try
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
                ElseIf empresa = 5 Then
                    cx = "cnSiaf"
                End If

                conn.ConnectionString = ConfigurationManager.ConnectionStrings(cx).ConnectionString

                Using cmd As New SqlCommand()
                    conn.Open()
                    cmd.Connection = conn
                    cmd.CommandText = "SP_Actualiza_Saldos_por_Requerimiento"
                    cmd.CommandType = CommandType.StoredProcedure

                    cmd.Parameters.AddWithValue("@IdRequerimiento", IdRequerimiento)
                    cmd.Parameters.AddWithValue("@BienServicio", BienServicio)
                    cmd.ExecuteNonQuery()

                End Using
                Return (1)
            End Using
        Catch ex As Exception
            Return ("Insertar Expediente Siaf Compromiso..." & ex.Message)
        End Try
    End Function

    '    <OperationContract()> _
    '<WebInvoke(Method:="POST", ResponseFormat:=WebMessageFormat.Json)> _
    '    Public Function actualizarsaldoxrequerimiento(ByVal IdRequerimiento As String, ByVal BienServicio As String, ByVal empresa As String) As String
    '        'Dim Guiad As New List(Of Object)()
    '        Using conn As New SqlConnection()
    '            Dim cx As String = ""

    '            If empresa = 1 Then
    '                cx = "cnEmape"
    '            ElseIf empresa = 2 Then
    '                cx = "cnEmapeMunicipal"
    '            ElseIf empresa = 3 Then
    '                cx = "cnRegional"
    '            ElseIf empresa = 4 Then
    '                cx = "cnMantenimiento"
    '            End If

    '            conn.ConnectionString = ConfigurationManager.ConnectionStrings(cx).ConnectionString
    '            Using cmd As New SqlCommand()

    '                cmd.CommandText = "SP_Actualiza_Saldos_por_Requerimiento"
    '                cmd.CommandType = CommandType.StoredProcedure

    '                cmd.Parameters.AddWithValue("@IdRequerimiento", IdRequerimiento)
    '                cmd.Parameters.AddWithValue("@BienServicio", BienServicio)

    '                cmd.Connection = conn
    '                conn.Open()
    '                'Using sdr As SqlDataReader = cmd.ExecuteReader()
    '                '    While sdr.Read()

    '                '        Guiad.Add(New With { _
    '                '        Key .cantidad = sdr("cantidad") _
    '                '        })

    '                '    End While
    '                'End Using
    '                conn.Close()
    '            End Using
    '            Return (1)
    '        End Using
    '    End Function

    <OperationContract()> _
<WebInvoke(Method:="POST", ResponseFormat:=WebMessageFormat.Json)> _
    Public Function tipocambio(ByVal fechaactual As String, ByVal empresa As String) As String
        Try
            Dim tipocamb As New List(Of Object)()
            Using con As New SqlConnection()
                Dim cx As String = ""

                If empresa = 1 Then
                    cx = "cnEmape"
                ElseIf empresa = 2 Then
                    cx = "cnEmapeMunicipal"
                ElseIf empresa = 3 Then
                    cx = "cnRegional"
                ElseIf empresa = 4 Then
                    cx = "cnMantenimientoVial"
                ElseIf empresa = 5 Then
                    cx = "cnSiaf"
                End If

                con.ConnectionString = ConfigurationManager.ConnectionStrings(cx).ConnectionString
                Using cmd As New SqlCommand()

                    cmd.CommandText = "SP_TipoCambio"
                    cmd.CommandType = CommandType.StoredProcedure
                    'cmd.Parameters.AddWithValue("@fechaactual", DateTime.Now)
                    cmd.Parameters.AddWithValue("@fechaactual", fechaactual)

                    cmd.Connection = con

                    con.Open()
                    Using sdr As SqlDataReader = cmd.ExecuteReader()
                        While sdr.Read()

                            tipocamb.Add(New With { _
                             Key .CompraBCR = Format(sdr("CompraBCR"), "##,##0.000") _
                            })
                        End While
                    End Using
                    con.Close()
                End Using
                Return (New JavaScriptSerializer().Serialize(tipocamb))
            End Using

        Catch ex As Exception
            Return "error"
        End Try
    End Function

    <OperationContract()> _
<WebInvoke(Method:="POST", ResponseFormat:=WebMessageFormat.Json)> _
    Public Function listarOrden(ByVal Idanno As String, ByVal IdMes As String, ByVal compraservicio As String, ByVal empresa As String) As String

        Dim ordenes As New List(Of Object)()
        Using conn As New SqlConnection()
            Dim cx As String = ""

            If empresa = 1 Then
                cx = "cnEmape"
            ElseIf empresa = 2 Then
                cx = "cnEmapeMunicipal"
            ElseIf empresa = 3 Then
                cx = "cnRegional"
            ElseIf empresa = 4 Then
                cx = "cnMantenimientoVial"
            ElseIf empresa = 5 Then
                cx = "cnSiaf"
            End If

            conn.ConnectionString = ConfigurationManager.ConnectionStrings(cx).ConnectionString
            Using cmd As New SqlCommand()

                cmd.CommandText = "SP_LOG_FiltrarOrdenCompra_Servicio"
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.AddWithValue("@Idanno", Idanno)
                cmd.Parameters.AddWithValue("@IdMes", IdMes)
                cmd.Parameters.AddWithValue("@Compraservicio", compraservicio)
                cmd.Parameters.AddWithValue("@Prorrateo", "N")

                cmd.Connection = conn
                conn.Open()
                Using sdr As SqlDataReader = cmd.ExecuteReader()
                    While sdr.Read()
                        ordenes.Add(New With { _
                            Key .IdOrdenCompra = sdr("IdOrdenCompra"), _
                            Key .IdRequerimiento = sdr("IdRequerimiento"), _
                            Key .DescripCentroCosto = sdr("DescripCentroCosto"), _
                            Key .FechaOrdenCompra = Format(sdr("FechaOrdenCompra"), "dd-MMM-yy"), _
                            Key .RazonSocial = sdr("RazonSocial").Substring(0, 50), _
                            Key .Moneda = sdr("Moneda") + "/.", _
                            Key .CostoTotal = Format(sdr("CostoTotal"), "##,##0.00"), _
                            Key .IngresoAlmacenDescrip = sdr("IngresoAlmacenDescrip"), _
                            Key .ProcedePagoDescrip = sdr("ProcedePagoDescrip"), _
                            Key .EstadoOrden = sdr("EstadoOrden"), _
                            Key .NroGuia = sdr("NroGuia"), _
                            Key .NroActa = sdr("NroActa"), _
                            Key .EstadoDescrip = sdr("EstadoDescrip"), _
                            Key .usuariomaquina = sdr("usuariomaquina") _
                         })
                    End While
                End Using
                conn.Close()
            End Using
            Return (New JavaScriptSerializer().Serialize(ordenes))
        End Using
    End Function

    <OperationContract()> _
<WebInvoke(Method:="POST", ResponseFormat:=WebMessageFormat.Json)> _
    Public Function BlistarOrden(ByVal BOrden As String, ByVal Idanno As String, ByVal IdMes As String, ByVal compraservicio As String, ByVal empresa As String) As String

        Dim Bordenes As New List(Of Object)()
        Using conn As New SqlConnection()
            Dim cx As String = ""

            If empresa = 1 Then
                cx = "cnEmape"
            ElseIf empresa = 2 Then
                cx = "cnEmapeMunicipal"
            ElseIf empresa = 3 Then
                cx = "cnRegional"
            ElseIf empresa = 4 Then
                cx = "cnMantenimientoVial"
            ElseIf empresa = 5 Then
                cx = "cnSiaf"
            End If

            conn.ConnectionString = ConfigurationManager.ConnectionStrings(cx).ConnectionString
            Using cmd As New SqlCommand()

                cmd.CommandText = "SP_LOG_BFiltrarOrdenCompra_Servicio"
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.AddWithValue("@BOrden", BOrden)
                cmd.Parameters.AddWithValue("@Idanno", Idanno)
                cmd.Parameters.AddWithValue("@IdMes", IdMes)
                cmd.Parameters.AddWithValue("@Compraservicio", compraservicio)
                cmd.Parameters.AddWithValue("@Prorrateo", "N")

                cmd.Connection = conn
                conn.Open()
                Using sdr As SqlDataReader = cmd.ExecuteReader()
                    While sdr.Read()
                        Bordenes.Add(New With { _
                            Key .IdOrdenCompra = sdr("IdOrdenCompra"), _
                            Key .IdRequerimiento = sdr("IdRequerimiento"), _
                            Key .DescripCentroCosto = sdr("DescripCentroCosto"), _
                            Key .FechaOrdenCompra = Format(sdr("FechaOrdenCompra"), "dd-MMM-yy"), _
                            Key .RazonSocial = sdr("RazonSocial").Substring(0, 50), _
                            Key .Moneda = sdr("Moneda") + "/.", _
                            Key .CostoTotal = Format(sdr("CostoTotal"), "##,##0.00"), _
                            Key .IngresoAlmacenDescrip = sdr("IngresoAlmacenDescrip"), _
                            Key .ProcedePagoDescrip = sdr("ProcedePagoDescrip"), _
                            Key .EstadoOrden = sdr("EstadoOrden"), _
                            Key .NroGuia = sdr("NroGuia"), _
                            Key .NroActa = sdr("NroActa"), _
                            Key .EstadoDescrip = sdr("EstadoDescrip"), _
                            Key .usuariomaquina = sdr("usuariomaquina") _
                         })
                    End While
                End Using
                conn.Close()
            End Using
            Return (New JavaScriptSerializer().Serialize(Bordenes))
        End Using
    End Function

    <OperationContract()> _
<WebInvoke(Method:="POST", ResponseFormat:=WebMessageFormat.Json)> _
    Public Function listarFechaAceptacion(ByVal IdAnno As String, ByVal CompraServicio As String, ByVal TipoBusqueda As String, ByVal Busqueda As String, ByVal empresa As String) As String

        Dim fechaAceptacion As String
        Dim fechAcept As New List(Of Object)()
        Using conn As New SqlConnection()
            Dim cx As String = ""

            If empresa = 1 Then
                cx = "cnEmape"
            ElseIf empresa = 2 Then
                cx = "cnEmapeMunicipal"
            ElseIf empresa = 3 Then
                cx = "cnRegional"
            ElseIf empresa = 4 Then
                cx = "cnMantenimientoVial"
            ElseIf empresa = 5 Then
                cx = "cnSiaf"
            End If

            conn.ConnectionString = ConfigurationManager.ConnectionStrings(cx).ConnectionString
            Using cmd As New SqlCommand()

                cmd.CommandText = "SP_LOG_ListarFechaAceptacion"
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.AddWithValue("@IdAnno", IdAnno)
                cmd.Parameters.AddWithValue("@CompraServicio", CompraServicio)
                cmd.Parameters.AddWithValue("@TipoBusqueda", TipoBusqueda)
                cmd.Parameters.AddWithValue("@Busqueda", Busqueda)

                cmd.Connection = conn
                conn.Open()
                Using sdr As SqlDataReader = cmd.ExecuteReader()
                    While sdr.Read()

                        If (IsDBNull(sdr("FechaAceptacion"))) Then
                            fechaAceptacion = ""
                        Else
                            fechaAceptacion = Format(sdr("FechaAceptacion"), "dd/MM/yyyy")
                        End If

                        fechAcept.Add(New With { _
                            Key .IdOrdenCompra = sdr("IdOrdenCompra"), _
                            Key .Descripcion = sdr("Descripcion"), _
                            Key .Siglas = sdr("Siglas"), _
                            Key .FechaEntregaCompra = Format(sdr("FechaEntregaCompra"), "dd-MMM-yy"), _
                            Key .FechaOrdenCompra = Format(sdr("FechaOrdenCompra"), "dd-MMM-yy"), _
                            Key .IdProveedor = sdr("IdProveedor"), _
                            Key .RazonSocial = sdr("RazonSocial").Substring(0, 50), _
                            Key .ValorVenta = sdr("ValorVenta"), _
                            Key .FechaAceptacion = fechaAceptacion _
                         })
                    End While
                End Using
                conn.Close()
            End Using
            Return (New JavaScriptSerializer().Serialize(fechAcept))
        End Using
    End Function

    'ACTA O GUIA
    <OperationContract()> _
<WebInvoke(Method:="POST", ResponseFormat:=WebMessageFormat.Json)> _
    Public Function actasoguias(ByVal IdOrdenCompra As String, ByVal CompraServicio As String, ByVal empresa As String) As String
        Try
            Dim FechaAcep As New List(Of Object)()
            Using con As New SqlConnection()
                Dim cx As String = ""

                If empresa = 1 Then
                    cx = "cnEmape"
                ElseIf empresa = 2 Then
                    cx = "cnEmapeMunicipal"
                ElseIf empresa = 3 Then
                    cx = "cnRegional"
                ElseIf empresa = 4 Then
                    cx = "cnMantenimiento"
                ElseIf empresa = 5 Then
                    cx = "cnSiaf"
                End If

                con.ConnectionString = ConfigurationManager.ConnectionStrings(cx).ConnectionString
                Using cmd As New SqlCommand()

                    cmd.CommandText = "SP_FechaAceptacionConActa"
                    cmd.CommandType = CommandType.StoredProcedure
                    cmd.Parameters.AddWithValue("@IdOrdenCompra", IdOrdenCompra)
                    cmd.Parameters.AddWithValue("@CompraServicio", CompraServicio)

                    cmd.Connection = con

                    con.Open()
                    Using sdr As SqlDataReader = cmd.ExecuteReader()
                        While sdr.Read()

                            FechaAcep.Add(New With { _
                             Key .ActaoGuia = sdr("ActaoGuia") _
                            })
                        End While
                    End Using
                    con.Close()
                End Using
                Return (New JavaScriptSerializer().Serialize(FechaAcep))
            End Using

        Catch ex As Exception
            Return "error"
        End Try
    End Function

    <OperationContract()> _
<WebInvoke(Method:="POST", ResponseFormat:=WebMessageFormat.Json)> _
    Public Function detAsignarFecAcept(ByVal IdOrdenCompra As String, ByVal CompraServicio As String, ByVal IdAnno As String, empresa As String) As String
        Try
            Dim cmpasignarfecacep As New List(Of Object)()
            Using con As New SqlConnection()
                Dim cx As String = ""

                If empresa = 1 Then
                    cx = "cnEmape"
                ElseIf empresa = 2 Then
                    cx = "cnEmapeMunicipal"
                ElseIf empresa = 3 Then
                    cx = "cnRegional"
                ElseIf empresa = 4 Then
                    cx = "cnMantenimiento"
                ElseIf empresa = 5 Then
                    cx = "cnSiaf"
                End If

                con.ConnectionString = ConfigurationManager.ConnectionStrings(cx).ConnectionString
                Using cmd As New SqlCommand()

                    cmd.CommandText = "SP_LOG_CamposAsigFechaAceptacion"
                    cmd.CommandType = CommandType.StoredProcedure
                    cmd.Parameters.AddWithValue("@IdOrdenCompra", IdOrdenCompra)
                    cmd.Parameters.AddWithValue("@CompraServicio", CompraServicio)
                    cmd.Parameters.AddWithValue("@IdAnno", IdAnno)

                    cmd.Connection = con

                    con.Open()
                    Using sdr As SqlDataReader = cmd.ExecuteReader()
                        While sdr.Read()

                            cmpasignarfecacep.Add(New With { _
                             Key .IdOrdenCompra = sdr("IdOrdenCompra"), _
                             Key .Siglas = sdr("Siglas"), _
                             Key .RazonSocial = sdr("RazonSocial"), _
                             Key .Descripcion = sdr("Descripcion") _
                            })
                        End While
                    End Using
                    con.Close()
                End Using
                Return (New JavaScriptSerializer().Serialize(cmpasignarfecacep))
            End Using

        Catch ex As Exception
            Return "error"
        End Try
    End Function

    'SELECCION FECHA ACEPTACION
    <OperationContract()> _
<WebInvoke(Method:="POST", ResponseFormat:=WebMessageFormat.Json)> _
    Public Function selectFecAcept(ByVal IdOrdenCompra As String, ByVal CompraServicio As String, ByVal FechaAceptacion As String, empresa As String) As String
        Try
            Dim FechaAcep As New List(Of Object)()
            Using con As New SqlConnection()
                Dim cx As String = ""

                If empresa = 1 Then
                    cx = "cnEmape"
                ElseIf empresa = 2 Then
                    cx = "cnEmapeMunicipal"
                ElseIf empresa = 3 Then
                    cx = "cnRegional"
                ElseIf empresa = 4 Then
                    cx = "cnMantenimiento"
                ElseIf empresa = 5 Then
                    cx = "cnSiaf"
                End If

                con.ConnectionString = ConfigurationManager.ConnectionStrings(cx).ConnectionString
                Using cmd As New SqlCommand()

                    cmd.CommandText = "SP_SelectFechaAceptacion"
                    cmd.CommandType = CommandType.StoredProcedure
                    cmd.Parameters.AddWithValue("@IdOrdenCompra", IdOrdenCompra)
                    cmd.Parameters.AddWithValue("@CompraServicio", CompraServicio)
                    cmd.Parameters.AddWithValue("@FechaAceptacion", FechaAceptacion)

                    cmd.Connection = con

                    con.Open()
                    Using sdr As SqlDataReader = cmd.ExecuteReader()
                        While sdr.Read()

                            FechaAcep.Add(New With { _
                             Key .FechaAceptacion = sdr("FechaAceptacion"), _
                             Key .FechaOrdenCompra = sdr("FechaOrdenCompra"), _
                             Key .FechaAceptacionSelect = sdr("FechaAceptacionSelect") _
                            })
                        End While
                    End Using
                    con.Close()
                End Using
                Return (New JavaScriptSerializer().Serialize(FechaAcep))
            End Using

        Catch ex As Exception
            Return "error"
        End Try
    End Function

    <OperationContract()> _
<WebInvoke(Method:="POST", ResponseFormat:=WebMessageFormat.Json)> _
    Public Function Correos(ByVal IdProveedor As String, ByVal empresa As String) As String
        Try
            Dim mprov As New List(Of Object)()
            Using con As New SqlConnection()

                Dim cx As String = ""

                If empresa = 1 Then
                    cx = "cnEmape"
                ElseIf empresa = 2 Then
                    cx = "cnEmapeMunicipal"
                ElseIf empresa = 3 Then
                    cx = "cnRegional"
                ElseIf empresa = 4 Then
                    cx = "cnMantenimiento"
                ElseIf empresa = 5 Then
                    cx = "cnSiaf"
                End If

                con.ConnectionString = ConfigurationManager.ConnectionStrings(cx).ConnectionString
                Using cmd As New SqlCommand()

                    cmd.CommandText = "SP_Correo"
                    cmd.CommandType = CommandType.StoredProcedure
                    cmd.Parameters.AddWithValue("@IdProveedor", IdProveedor)

                    cmd.Connection = con

                    con.Open()
                    Using sdr As SqlDataReader = cmd.ExecuteReader()
                        While sdr.Read()

                            mprov.Add(New With { _
                             Key .Correo1 = sdr("Correo1"), _
                             Key .Correo2 = sdr("Correo2"), _
                             Key .BuscarCarEspc = sdr("BuscarCarEspc") _
                            })
                        End While
                    End Using
                    con.Close()
                End Using
                Return (New JavaScriptSerializer().Serialize(mprov))
            End Using

        Catch ex As Exception
            Return "error"
        End Try
    End Function

    'ASIGNANDO FECHA ACEPTACION
    <OperationContract()> _
    <WebInvoke(Method:="POST", ResponseFormat:=WebMessageFormat.Json)> _
    Public Function InsertarFechaAceptacion(ByVal ordencompra_asig As String, ByVal tipoorden_asig As String, ByVal FechaAceptacion As String, empresa As String) As String

        Try
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
                ElseIf empresa = 5 Then
                    cx = "cnSiaf"
                End If

                conn.ConnectionString = ConfigurationManager.ConnectionStrings(cx).ConnectionString

                Using cmd As New SqlCommand()
                    conn.Open()
                    cmd.Connection = conn
                    cmd.CommandText = "sp_LO_FechaEntrega"
                    cmd.CommandType = CommandType.StoredProcedure

                    cmd.Parameters.AddWithValue("@IdOrdenCompra", ordencompra_asig)
                    cmd.Parameters.AddWithValue("@CompraServicio", tipoorden_asig)
                    cmd.Parameters.AddWithValue("@FechaAceptacion", FechaAceptacion)
                    cmd.Parameters.AddWithValue("@Mensaje", "")

                    cmd.ExecuteNonQuery()
                End Using
                Return (1)
            End Using

        Catch ex As Exception
            Return ("Insertar Fecha de Aceptacion..." & ex.Message)

        End Try
    End Function

    <OperationContract()> _
    <WebInvoke(Method:="POST", ResponseFormat:=WebMessageFormat.Json)> _
    Public Function listarFormaPago(ByVal empresa As String) As String
        Dim FormaPago As New List(Of Object)()
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
            ElseIf empresa = 5 Then
                cx = "cnSiaf"
            End If

            conn.ConnectionString = ConfigurationManager.ConnectionStrings(cx).ConnectionString
            Using cmd As New SqlCommand()

                cmd.CommandText = "SP_LOG_LISTAR_FORMAPAGO"
                cmd.CommandType = CommandType.StoredProcedure

                cmd.Parameters.AddWithValue("@Idanno", Year(Now))

                cmd.Connection = conn
                conn.Open()
                Using sdr As SqlDataReader = cmd.ExecuteReader()
                    While sdr.Read()

                        FormaPago.Add(New With { _
                         Key .IdFormaPago = sdr("IdFormaPago"), _
                         Key .DescripFormaPago = sdr("DescripFormaPago") _
                        })

                    End While
                End Using
                conn.Close()
            End Using
            Return (New JavaScriptSerializer().Serialize(FormaPago))
        End Using
    End Function

    <OperationContract()> _
    <WebInvoke(Method:="POST", ResponseFormat:=WebMessageFormat.Json)> _
    Public Function listarTipoDoc(ByVal empresa As String) As String
        Dim TipoDoc As New List(Of Object)()
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
            ElseIf empresa = 5 Then
                cx = "cnSiaf"
            End If

            conn.ConnectionString = ConfigurationManager.ConnectionStrings(cx).ConnectionString
            Using cmd As New SqlCommand()

                cmd.CommandText = "SP_LOG_LISTAR_TIPODOC"
                cmd.CommandType = CommandType.StoredProcedure

                cmd.Parameters.AddWithValue("@Idanno", Year(Now))

                cmd.Connection = conn
                conn.Open()
                Using sdr As SqlDataReader = cmd.ExecuteReader()
                    While sdr.Read()

                        TipoDoc.Add(New With { _
                         Key .IdTipoDocumento = sdr("IdTipoDocumento"), _
                         Key .Descripcion = sdr("Descripcion") _
                        })

                    End While
                End Using
                conn.Close()
            End Using
            Return (New JavaScriptSerializer().Serialize(TipoDoc))
        End Using
    End Function

    <OperationContract()> _
    <WebInvoke(Method:="POST", ResponseFormat:=WebMessageFormat.Json)> _
    Public Function listarOrdenesAnuladas(ByVal CompraServicio As String, ByVal empresa As String) As String
        Dim OrdenAnulada As New List(Of Object)()
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
            ElseIf empresa = 5 Then
                cx = "cnSiaf"
            End If

            conn.ConnectionString = ConfigurationManager.ConnectionStrings(cx).ConnectionString
            Using cmd As New SqlCommand()

                cmd.CommandText = "SP_NroOrdenesAnuladas"
                cmd.CommandType = CommandType.StoredProcedure

                cmd.Parameters.AddWithValue("@CompraServicio", CompraServicio)
                cmd.Parameters.AddWithValue("@IdAnno", Year(Now))

                cmd.Connection = conn
                conn.Open()
                Using sdr As SqlDataReader = cmd.ExecuteReader()
                    While sdr.Read()

                        OrdenAnulada.Add(New With { _
                         Key .IdOrdenCompra = sdr("IdOrdenCompra") _
                        })

                    End While
                End Using
                conn.Close()
            End Using
            Return (New JavaScriptSerializer().Serialize(OrdenAnulada))
        End Using
    End Function

    <OperationContract()> _
    <WebInvoke(Method:="POST", ResponseFormat:=WebMessageFormat.Json)> _
    Public Function listarOrdenesActual(ByVal CompraServicio As String, ByVal empresa As String) As String
        Dim OrdenAnulada As New List(Of Object)()
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
            ElseIf empresa = 5 Then
                cx = "cnSiaf"
            End If

            conn.ConnectionString = ConfigurationManager.ConnectionStrings(cx).ConnectionString
            Using cmd As New SqlCommand()

                cmd.CommandText = "SP_NroOrdenesActual"
                cmd.CommandType = CommandType.StoredProcedure

                cmd.Parameters.AddWithValue("@CompraServicio", CompraServicio)
                cmd.Parameters.AddWithValue("@IdAnno", Year(Now))

                cmd.Connection = conn
                conn.Open()
                Using sdr As SqlDataReader = cmd.ExecuteReader()
                    While sdr.Read()

                        OrdenAnulada.Add(New With { _
                         Key .IdOrdenCompra = sdr("IdOrdenCompra") _
                        })

                    End While
                End Using
                conn.Close()
            End Using
            Return (New JavaScriptSerializer().Serialize(OrdenAnulada))
        End Using
    End Function

    <OperationContract()> _
    <WebInvoke(Method:="POST", ResponseFormat:=WebMessageFormat.Json)> _
    Public Function monedas(ByVal empresa As String) As String
        Dim mon As New List(Of Object)()
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
            ElseIf empresa = 5 Then
                cx = "cnSiaf"
            End If

            conn.ConnectionString = ConfigurationManager.ConnectionStrings(cx).ConnectionString
            Using cmd As New SqlCommand()

                cmd.CommandText = "SP_LOG_MONEDA"
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Connection = conn
                conn.Open()
                Using sdr As SqlDataReader = cmd.ExecuteReader()
                    While sdr.Read()

                        mon.Add(New With { _
                         Key .IdTipoMoneda = sdr("IdTipoMoneda"), _
                         Key .DescripTipoMoneda = sdr("DescripTipoMoneda") _
                        })

                    End While
                End Using
                conn.Close()
            End Using
            Return (New JavaScriptSerializer().Serialize(mon))
        End Using
    End Function

    <OperationContract()> _
        <WebInvoke(Method:="POST", ResponseFormat:=WebMessageFormat.Json)> _
    Public Function centrocostosxOrdenes(ByVal BienServicio As String, ByVal empresa As String) As String
        Dim centrocostOrd As New List(Of Object)()
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
            ElseIf empresa = 5 Then
                cx = "cnSiaf"
            End If

            conn.ConnectionString = ConfigurationManager.ConnectionStrings(cx).ConnectionString
            Using cmd As New SqlCommand()

                cmd.CommandText = "SP_LOG_CentroCostosXRequerimientos"
                cmd.CommandType = CommandType.StoredProcedure

                cmd.Parameters.AddWithValue("@BienServicio", BienServicio)
                cmd.Parameters.AddWithValue("@Idanno", Year(Now))

                cmd.Connection = conn
                conn.Open()
                Using sdr As SqlDataReader = cmd.ExecuteReader()
                    While sdr.Read()

                        centrocostOrd.Add(New With { _
                         Key .IdCentroCosto = sdr("IdCentroCosto"), _
                         Key .DescripcionCorta = sdr("DescripcionCorta") _
                        })

                    End While
                End Using
                conn.Close()
            End Using
            Return (New JavaScriptSerializer().Serialize(centrocostOrd))
        End Using
    End Function

    <OperationContract()> _
<WebInvoke(Method:="POST", ResponseFormat:=WebMessageFormat.Json)> _
    Public Function listar_RequerimientoXCC(ByVal BienServicio As String, ByVal empresa As String) As String

        Dim requerimientoxcentrocosto As New List(Of Object)()
        Using conn As New SqlConnection()
            Dim cx As String = ""

            If empresa = 1 Then
                cx = "cnEmape"
            ElseIf empresa = 2 Then
                cx = "cnEmapeMunicipal"
            ElseIf empresa = 3 Then
                cx = "cnRegional"
            ElseIf empresa = 4 Then
                cx = "cnMantenimientoVial"
            ElseIf empresa = 5 Then
                cx = "cnSiaf"
            End If

            conn.ConnectionString = ConfigurationManager.ConnectionStrings(cx).ConnectionString
            Using cmd As New SqlCommand()

                cmd.CommandText = "SP_LOG_RequerimientoxCentroCostos"
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.AddWithValue("@BienServicio", BienServicio)
                cmd.Parameters.AddWithValue("@idanno", Year(Now))

                cmd.Connection = conn
                conn.Open()
                Using sdr As SqlDataReader = cmd.ExecuteReader()
                    While sdr.Read()

                        requerimientoxcentrocosto.Add(New With { _
                         Key .IdRequerimiento = sdr("IdRequerimiento"), _
                         Key .Descripcion = sdr("Descripcion"), _
                         Key .FechaRequerimiento = Format(sdr("FechaRequerimiento"), "dd/MM/yyyy"), _
                         Key .DescripCentroCosto = sdr("DescripCentroCosto"), _
                         Key .DescripcionCorta = sdr("DescripcionCorta"), _
                         Key .Siglas = sdr("Siglas"), _
                         Key .SaldoSubTotal = Format(sdr("SaldoSubTotal"), "###0.00") _
                        })
                    End While
                End Using
                conn.Close()
            End Using
            Return (New JavaScriptSerializer().Serialize(requerimientoxcentrocosto))
        End Using
    End Function

    <OperationContract()> _
<WebInvoke(Method:="POST", ResponseFormat:=WebMessageFormat.Json)> _
    Public Function listar_BRequerimientoXCC(ByVal IdRequerimiento As String, ByVal BienServicio As String, ByVal empresa As String) As String

        Dim Brequerimientoxcentrocosto As New List(Of Object)()
        Using conn As New SqlConnection()
            Dim cx As String = ""

            If empresa = 1 Then
                cx = "cnEmape"
            ElseIf empresa = 2 Then
                cx = "cnEmapeMunicipal"
            ElseIf empresa = 3 Then
                cx = "cnRegional"
            ElseIf empresa = 4 Then
                cx = "cnMantenimientoVial"
            ElseIf empresa = 5 Then
                cx = "cnSiaf"
            End If

            conn.ConnectionString = ConfigurationManager.ConnectionStrings(cx).ConnectionString
            Using cmd As New SqlCommand()

                cmd.CommandText = "SP_LOG_BRequerimientoxCentroCostos"
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.AddWithValue("@IdRequerimiento", IdRequerimiento)
                cmd.Parameters.AddWithValue("@BienServicio", BienServicio)
                cmd.Parameters.AddWithValue("@idanno", Year(Now))

                cmd.Connection = conn
                conn.Open()
                Using sdr As SqlDataReader = cmd.ExecuteReader()
                    While sdr.Read()

                        Brequerimientoxcentrocosto.Add(New With { _
                         Key .IdRequerimiento = sdr("IdRequerimiento"), _
                         Key .Descripcion = sdr("Descripcion"), _
                         Key .FechaRequerimiento = Format(sdr("FechaRequerimiento"), "dd/MM/yyyy"), _
                         Key .DescripCentroCosto = sdr("DescripCentroCosto"), _
                         Key .DescripcionCorta = sdr("DescripcionCorta"), _
                         Key .Siglas = sdr("Siglas"), _
                         Key .SaldoSubTotal = Format(sdr("SaldoSubTotal"), "###0.00") _
                        })
                    End While
                End Using
                conn.Close()
            End Using
            Return (New JavaScriptSerializer().Serialize(Brequerimientoxcentrocosto))
        End Using
    End Function

    <OperationContract()> _
    <WebInvoke(Method:="POST", ResponseFormat:=WebMessageFormat.Json)> _
    Public Function centrocostosOrdenes(ByVal IdRequerimiento As String, ByVal BienServicio As String, ByVal empresa As String) As String
        Dim centrocostOrd As New List(Of Object)()
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
            ElseIf empresa = 5 Then
                cx = "cnSiaf"
            End If

            conn.ConnectionString = ConfigurationManager.ConnectionStrings(cx).ConnectionString
            Using cmd As New SqlCommand()

                cmd.CommandText = "SP_LOG_CentroCostosXRequerimientos"
                cmd.CommandType = CommandType.StoredProcedure

                cmd.Parameters.AddWithValue("@IdRequerimiento", IdRequerimiento)
                cmd.Parameters.AddWithValue("@BienServicio", BienServicio)
                cmd.Parameters.AddWithValue("@Idanno", Year(Now))

                cmd.Connection = conn
                conn.Open()
                Using sdr As SqlDataReader = cmd.ExecuteReader()
                    While sdr.Read()

                        centrocostOrd.Add(New With { _
                         Key .IdCentroCosto = sdr("IdCentroCosto"), _
                         Key .DescripcionCorta = sdr("DescripcionCorta") _
                        })

                    End While
                End Using
                conn.Close()
            End Using
            Return (New JavaScriptSerializer().Serialize(centrocostOrd))
        End Using
    End Function

    <OperationContract()> _
    <WebInvoke(Method:="POST", ResponseFormat:=WebMessageFormat.Json)> _
    Public Function listarProveedores(ByVal Proveedor As String, ByVal empresa As String) As String
        Dim Prov As New List(Of Object)()
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
            ElseIf empresa = 5 Then
                cx = "cnSiaf"
            End If

            conn.ConnectionString = ConfigurationManager.ConnectionStrings(cx).ConnectionString
            Using cmd As New SqlCommand()

                cmd.CommandText = "SP_LOG_LISTAR_PROVEEDOR"
                cmd.CommandType = CommandType.StoredProcedure

                cmd.Parameters.AddWithValue("@Proveedor", Proveedor)

                cmd.Connection = conn
                conn.Open()
                Using sdr As SqlDataReader = cmd.ExecuteReader()
                    While sdr.Read()

                        Prov.Add(New With { _
                         Key .IdProveedor = sdr("IdProveedor"), _
                         Key .RazonSocial = sdr("RazonSocial") _
                        })

                    End While
                End Using
                conn.Close()
            End Using
            Return (New JavaScriptSerializer().Serialize(Prov))
        End Using
    End Function

    <OperationContract()> _
<WebInvoke(Method:="POST", ResponseFormat:=WebMessageFormat.Json)> _
    Public Function MostrarProveedor(ByVal IdProveedor As String, ByVal empresa As String) As String
        Try
            Dim mprov As New List(Of Object)()
            Using con As New SqlConnection()

                Dim cx As String = ""

                If empresa = 1 Then
                    cx = "cnEmape"
                ElseIf empresa = 2 Then
                    cx = "cnEmapeMunicipal"
                ElseIf empresa = 3 Then
                    cx = "cnRegional"
                ElseIf empresa = 4 Then
                    cx = "cnMantenimiento"
                ElseIf empresa = 5 Then
                    cx = "cnSiaf"
                End If

                con.ConnectionString = ConfigurationManager.ConnectionStrings(cx).ConnectionString
                Using cmd As New SqlCommand()

                    cmd.CommandText = "SP_Proveedor"
                    cmd.CommandType = CommandType.StoredProcedure
                    cmd.Parameters.AddWithValue("@IdProveedor", IdProveedor)

                    cmd.Connection = con

                    con.Open()
                    Using sdr As SqlDataReader = cmd.ExecuteReader()
                        While sdr.Read()

                            mprov.Add(New With { _
                             Key .IdProveedor = sdr("IdProveedor"), _
                             Key .RazonSocial = sdr("RazonSocial") _
                            })
                        End While
                    End Using
                    con.Close()
                End Using
                Return (New JavaScriptSerializer().Serialize(mprov))
            End Using

        Catch ex As Exception
            Return "error"
        End Try
    End Function

    <OperationContract()> _
    <WebInvoke(Method:="POST", ResponseFormat:=WebMessageFormat.Json)> _
    Public Function listarProveedoresbuscar(ByVal IdProveedor As String, ByVal empresa As String) As String
        Dim ProvB As New List(Of Object)()
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
            ElseIf empresa = 5 Then
                cx = "cnSiaf"
            End If

            conn.ConnectionString = ConfigurationManager.ConnectionStrings(cx).ConnectionString
            Using cmd As New SqlCommand()

                cmd.CommandText = "SP_LOG_LISTAR_PROVEEDORM"
                cmd.CommandType = CommandType.StoredProcedure

                cmd.Parameters.AddWithValue("@IdProveedor", IdProveedor)

                cmd.Connection = conn
                conn.Open()
                Using sdr As SqlDataReader = cmd.ExecuteReader()
                    While sdr.Read()

                        ProvB.Add(New With { _
                         Key .IdProveedor = sdr("IdProveedor"), _
                         Key .RazonSocial = sdr("RazonSocial") _
                        })

                    End While
                End Using
                conn.Close()
            End Using
            Return (New JavaScriptSerializer().Serialize(ProvB))
        End Using
    End Function

    <OperationContract()> _
    <WebInvoke(Method:="POST", ResponseFormat:=WebMessageFormat.Json)> _
    Public Function listarProveedoresxReq(ByVal TipoPrestacion As String, ByVal empresa As String) As String
        Dim ProvReq As New List(Of Object)()
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
            ElseIf empresa = 5 Then
                cx = "cnSiaf"
            End If

            conn.ConnectionString = ConfigurationManager.ConnectionStrings(cx).ConnectionString
            Using cmd As New SqlCommand()

                cmd.CommandText = "SP_LISTAR_PROVEEDOR"
                cmd.CommandType = CommandType.StoredProcedure

                cmd.Parameters.AddWithValue("@TipoPrestacion", TipoPrestacion)

                cmd.Connection = conn
                conn.Open()
                Using sdr As SqlDataReader = cmd.ExecuteReader()
                    While sdr.Read()

                        ProvReq.Add(New With { _
                         Key .IdProveedor = sdr("IdProveedor"), _
                         Key .RazonSocial = sdr("RazonSocial") _
                        })

                    End While
                End Using
                conn.Close()
            End Using
            Return (New JavaScriptSerializer().Serialize(ProvReq))
        End Using
    End Function

    <OperationContract()> _
    <WebInvoke(Method:="POST", ResponseFormat:=WebMessageFormat.Json)> _
    Public Function buscarProveedores(ByVal idproveedor As String, ByVal empresa As String) As String
        Dim IdProv As New List(Of Object)()
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
            ElseIf empresa = 5 Then
                cx = "cnSiaf"
            End If

            conn.ConnectionString = ConfigurationManager.ConnectionStrings(cx).ConnectionString
            Using cmd As New SqlCommand()

                cmd.CommandText = "SP_LOG_BUSCAR_PROVEEDOR"
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.AddWithValue("@idproveedor", idproveedor)
                cmd.Connection = conn
                conn.Open()
                Using sdr As SqlDataReader = cmd.ExecuteReader()
                    While sdr.Read()

                        IdProv.Add(New With { _
                         Key .idproveedor = sdr("idproveedor"), _
                         Key .Razonsocial = sdr("Razonsocial") _
                        })

                    End While
                End Using
                conn.Close()
            End Using
            Return (New JavaScriptSerializer().Serialize(IdProv))
        End Using
    End Function

    <OperationContract()> _
    <WebInvoke(Method:="POST", ResponseFormat:=WebMessageFormat.Json)> _
    Public Function listarProv_TipoDocumento(ByVal empresa As String) As String
        Dim Prov_TipoDoc As New List(Of Object)()
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
            ElseIf empresa = 5 Then
                cx = "cnSiaf"
            End If

            conn.ConnectionString = ConfigurationManager.ConnectionStrings(cx).ConnectionString
            Using cmd As New SqlCommand()

                cmd.CommandText = "SP_LOG_PROV_TIPODOCUMENTO"
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Connection = conn
                conn.Open()
                Using sdr As SqlDataReader = cmd.ExecuteReader()
                    While sdr.Read()

                        Prov_TipoDoc.Add(New With { _
                         Key .IdTipoDocumento = sdr("IdTipoDocumento"), _
                         Key .Descripcion = sdr("Descripcion") _
                        })

                    End While
                End Using
                conn.Close()
            End Using
            Return (New JavaScriptSerializer().Serialize(Prov_TipoDoc))
        End Using
    End Function

    <OperationContract()> _
    <WebInvoke(Method:="POST", ResponseFormat:=WebMessageFormat.Json)> _
    Public Function listarProv_BancoTelewiese(ByVal empresa As String) As String
        Dim Prov_BcoTelewiese As New List(Of Object)()
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
            ElseIf empresa = 5 Then
                cx = "cnSiaf"
            End If

            conn.ConnectionString = ConfigurationManager.ConnectionStrings(cx).ConnectionString
            Using cmd As New SqlCommand()

                cmd.CommandText = "SP_LOG_PROV_BANCOTELEWIESE"
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Connection = conn
                conn.Open()
                Using sdr As SqlDataReader = cmd.ExecuteReader()
                    While sdr.Read()

                        Prov_BcoTelewiese.Add(New With { _
                         Key .IdBanco = sdr("IdBanco"), _
                         Key .Descripcion = sdr("Descripcion") _
                        })

                    End While
                End Using
                conn.Close()
            End Using
            Return (New JavaScriptSerializer().Serialize(Prov_BcoTelewiese))
        End Using
    End Function

    <OperationContract()> _
    <WebInvoke(Method:="POST", ResponseFormat:=WebMessageFormat.Json)> _
    Public Function listarProv_FormaPago(ByVal empresa As String) As String
        Dim Prov_FormaPago As New List(Of Object)()
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
            ElseIf empresa = 5 Then
                cx = "cnSiaf"
            End If

            conn.ConnectionString = ConfigurationManager.ConnectionStrings(cx).ConnectionString
            Using cmd As New SqlCommand()

                cmd.CommandText = "SP_LOG_PROV_FORMAPAGO"
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Connection = conn
                conn.Open()
                Using sdr As SqlDataReader = cmd.ExecuteReader()
                    While sdr.Read()

                        Prov_FormaPago.Add(New With { _
                         Key .IdFormaPago = sdr("IdFormaPago"), _
                         Key .descripcion = sdr("descripcion") _
                        })

                    End While
                End Using
                conn.Close()
            End Using
            Return (New JavaScriptSerializer().Serialize(Prov_FormaPago))
        End Using
    End Function

    <OperationContract()> _
    <WebInvoke(Method:="POST", ResponseFormat:=WebMessageFormat.Json)> _
    Public Function listarProv_Clasificacion(ByVal empresa As String) As String
        Dim Prov_Clasificacion As New List(Of Object)()
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
            ElseIf empresa = 5 Then
                cx = "cnSiaf"
            End If

            conn.ConnectionString = ConfigurationManager.ConnectionStrings(cx).ConnectionString
            Using cmd As New SqlCommand()

                cmd.CommandText = "SP_LOG_PROV_CLASIFICACION"
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Connection = conn
                conn.Open()
                Using sdr As SqlDataReader = cmd.ExecuteReader()
                    While sdr.Read()

                        Prov_Clasificacion.Add(New With { _
                         Key .IdClasificacionNegocio = sdr("IdClasificacionNegocio"), _
                         Key .descripcion = sdr("descripcion") _
                        })

                    End While
                End Using
                conn.Close()
            End Using
            Return (New JavaScriptSerializer().Serialize(Prov_Clasificacion))
        End Using
    End Function

    <OperationContract()> _
    <WebInvoke(Method:="POST", ResponseFormat:=WebMessageFormat.Json)> _
    Public Function listarProv_TipoActividad(ByVal empresa As String) As String
        Dim Prov_TipoActividad As New List(Of Object)()
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
            ElseIf empresa = 5 Then
                cx = "cnSiaf"
            End If

            conn.ConnectionString = ConfigurationManager.ConnectionStrings(cx).ConnectionString
            Using cmd As New SqlCommand()

                cmd.CommandText = "SP_LOG_PROV_TIPOACT"
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Connection = conn
                conn.Open()
                Using sdr As SqlDataReader = cmd.ExecuteReader()
                    While sdr.Read()

                        Prov_TipoActividad.Add(New With { _
                         Key .IdTipoActividad = sdr("IdTipoActividad"), _
                         Key .descripcion = sdr("descripcion") _
                        })

                    End While
                End Using
                conn.Close()
            End Using
            Return (New JavaScriptSerializer().Serialize(Prov_TipoActividad))
        End Using
    End Function

    <OperationContract()> _
    <WebInvoke(Method:="POST", ResponseFormat:=WebMessageFormat.Json)> _
    Public Function listarProv_Departamento(ByVal empresa As String) As String
        Dim Prov_Departamento As New List(Of Object)()
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
            ElseIf empresa = 5 Then
                cx = "cnSiaf"
            End If

            conn.ConnectionString = ConfigurationManager.ConnectionStrings(cx).ConnectionString
            Using cmd As New SqlCommand()

                cmd.CommandText = "SP_LOG_PROV_DEPARTAMENTO"
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Connection = conn
                conn.Open()
                Using sdr As SqlDataReader = cmd.ExecuteReader()
                    While sdr.Read()

                        Prov_Departamento.Add(New With { _
                         Key .IdDepartamento = sdr("IdDepartamento"), _
                         Key .Descrip = sdr("Descrip") _
                        })

                    End While
                End Using
                conn.Close()
            End Using
            Return (New JavaScriptSerializer().Serialize(Prov_Departamento))
        End Using
    End Function

    <OperationContract()> _
    <WebInvoke(Method:="POST", ResponseFormat:=WebMessageFormat.Json)> _
    Public Function listarProv_Provincia(ByVal idDepartamento As String, ByVal empresa As String) As String
        Dim Prov_Departamento As New List(Of Object)()
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
            ElseIf empresa = 5 Then
                cx = "cnSiaf"
            End If

            conn.ConnectionString = ConfigurationManager.ConnectionStrings(cx).ConnectionString
            Using cmd As New SqlCommand()

                cmd.CommandText = "SP_LOG_PROV_PROVINCIA"
                cmd.CommandType = CommandType.StoredProcedure

                cmd.Parameters.AddWithValue("@IdDepartamento", idDepartamento)

                cmd.Connection = conn
                conn.Open()
                Using sdr As SqlDataReader = cmd.ExecuteReader()
                    While sdr.Read()

                        Prov_Departamento.Add(New With { _
                         Key .IdProvincia = sdr("IdProvincia"), _
                         Key .Descrip = sdr("Descrip") _
                        })

                    End While
                End Using
                conn.Close()
            End Using
            Return (New JavaScriptSerializer().Serialize(Prov_Departamento))
        End Using
    End Function

    <OperationContract()> _
    <WebInvoke(Method:="POST", ResponseFormat:=WebMessageFormat.Json)> _
    Public Function listarProv_Distrito(ByVal idDepartamento As String, ByVal idProvincia As String, ByVal empresa As String) As String
        Dim Prov_Distrito As New List(Of Object)()
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
            ElseIf empresa = 5 Then
                cx = "cnSiaf"
            End If

            conn.ConnectionString = ConfigurationManager.ConnectionStrings(cx).ConnectionString
            Using cmd As New SqlCommand()

                cmd.CommandText = "SP_LOG_PROV_DISTRITO"
                cmd.CommandType = CommandType.StoredProcedure

                cmd.Parameters.AddWithValue("@IdDepartamento", idDepartamento)
                cmd.Parameters.AddWithValue("@IdProvincia", idProvincia)

                cmd.Connection = conn
                conn.Open()
                Using sdr As SqlDataReader = cmd.ExecuteReader()
                    While sdr.Read()

                        Prov_Distrito.Add(New With { _
                         Key .IdDistrito = sdr("IdDistrito"), _
                         Key .Descrip = sdr("Descrip") _
                        })

                    End While
                End Using
                conn.Close()
            End Using
            Return (New JavaScriptSerializer().Serialize(Prov_Distrito))
        End Using
    End Function

    <OperationContract()> _
<WebInvoke(Method:="POST", ResponseFormat:=WebMessageFormat.Json)> _
    Public Function siglasprov(ByVal ApPaterno As String, ByVal ApMaterno As String, ByVal Nombres As String, ByVal empresa As String) As String
        Try
            Dim siglas_prov As New List(Of Object)()
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
                ElseIf empresa = 5 Then
                    cx = "cnSiaf"
                End If

                conn.ConnectionString = ConfigurationManager.ConnectionStrings(cx).ConnectionString
                Using cmd As New SqlCommand()

                    cmd.CommandText = "SP_LOG_SIGLAS"
                    cmd.CommandType = CommandType.StoredProcedure
                    cmd.Parameters.AddWithValue("@ApPaterno", ApPaterno)
                    cmd.Parameters.AddWithValue("@ApMaterno", ApMaterno)
                    cmd.Parameters.AddWithValue("@Nombres", Nombres)

                    cmd.Connection = conn

                    conn.Open()
                    Using sdr As SqlDataReader = cmd.ExecuteReader()
                        While sdr.Read()

                            siglas_prov.Add(New With { _
                             Key .SIGLASPROV = sdr("SIGLASPROV") _
                            })
                        End While
                    End Using
                    conn.Close()
                End Using
                Return (New JavaScriptSerializer().Serialize(siglas_prov))
            End Using

        Catch ex As Exception
            Return "error"
        End Try
    End Function

    'FECHA NACIMIENTO PROVEEDOR
    <OperationContract()> _
<WebInvoke(Method:="POST", ResponseFormat:=WebMessageFormat.Json)> _
    Public Function FechaNacProveedor(ByVal FecNac As String, ByVal DiaFecAct As String, ByVal MesFecAct As String, ByVal AnoFecAct As String, ByVal empresa As String) As String
        Try
            Dim FechNac As New List(Of Object)()
            Using con As New SqlConnection()
                Dim cx As String = ""

                If empresa = 1 Then
                    cx = "cnEmape"
                ElseIf empresa = 2 Then
                    cx = "cnEmapeMunicipal"
                ElseIf empresa = 3 Then
                    cx = "cnRegional"
                ElseIf empresa = 4 Then
                    cx = "cnMantenimiento"
                ElseIf empresa = 5 Then
                    cx = "cnSiaf"
                End If

                con.ConnectionString = ConfigurationManager.ConnectionStrings(cx).ConnectionString
                Using cmd As New SqlCommand()

                    cmd.CommandText = "SP_LOG_FechaNac"
                    cmd.CommandType = CommandType.StoredProcedure
                    cmd.Parameters.AddWithValue("@FechaNac", FecNac)
                    cmd.Parameters.AddWithValue("@DiaAct", DiaFecAct)
                    cmd.Parameters.AddWithValue("@MesAct", MesFecAct)
                    cmd.Parameters.AddWithValue("@AnoAct", AnoFecAct)

                    cmd.Connection = con

                    con.Open()
                    Using sdr As SqlDataReader = cmd.ExecuteReader()
                        While sdr.Read()

                            FechNac.Add(New With { _
                             Key .FechaNac = sdr("FechaNac"), _
                             Key .FechaHoy = sdr("FechaHoy"), _
                             Key .Edad = sdr("Edad") _
                            })
                        End While
                    End Using
                    con.Close()
                End Using
                Return (New JavaScriptSerializer().Serialize(FechNac))
            End Using

        Catch ex As Exception
            Return "error"
        End Try
    End Function

    'VALIDAR EXISTENCIA DEL PROVEEDOR
    <OperationContract()> _
<WebInvoke(Method:="POST", ResponseFormat:=WebMessageFormat.Json)> _
    Public Function ValExistProv(ByVal IdProveedor As String, ByVal empresa As String) As String
        Try
            Dim Prov As New List(Of Object)()
            Using con As New SqlConnection()
                Dim cx As String = ""

                If empresa = 1 Then
                    cx = "cnEmape"
                ElseIf empresa = 2 Then
                    cx = "cnEmapeMunicipal"
                ElseIf empresa = 3 Then
                    cx = "cnRegional"
                ElseIf empresa = 4 Then
                    cx = "cnMantenimiento"
                ElseIf empresa = 5 Then
                    cx = "cnSiaf"
                End If

                con.ConnectionString = ConfigurationManager.ConnectionStrings(cx).ConnectionString
                Using cmd As New SqlCommand()

                    cmd.CommandText = "SP_LOG_ValExisteProveedor"
                    cmd.CommandType = CommandType.StoredProcedure
                    cmd.Parameters.AddWithValue("@IdProveedor", IdProveedor)

                    cmd.Connection = con

                    con.Open()
                    Using sdr As SqlDataReader = cmd.ExecuteReader()
                        While sdr.Read()

                            Prov.Add(New With { _
                             Key .RazonSocial = sdr("RazonSocial"), _
                             Key .RazSocial = sdr("RazSocial") _
                            })
                        End While
                    End Using
                    con.Close()
                End Using
                Return (New JavaScriptSerializer().Serialize(Prov))
            End Using

        Catch ex As Exception
            Return "error"
        End Try
    End Function

    <OperationContract()> _
    <WebInvoke(Method:="POST", ResponseFormat:=WebMessageFormat.Json)> _
    Public Function InsertarNewProveedor(ByVal IdProveedor As String, ByVal RazSocial As String, ByVal SiglaComercial As String, ByVal RUC As String, ByVal Direccion As String, ByVal Distrito As String, ByVal Provincia As String, ByVal Departamento As String, ByVal TelefonoEmpresa1 As String, ByVal TelefonoEmpresa2 As String, ByVal Fax As String, ByVal eMail As String, ByVal Representante As String, ByVal CargoRepresentante As String, ByVal TelefonoRepresentante1 As String, ByVal TelefonoRepresentante2 As String, ByVal eMailRepresentante As String, ByVal TipoActividad As String, ByVal Clasificacion As String, ByVal Retencion As String, ByVal FormaPago As String, ByVal Bien As String, ByVal Servicio As String, ByVal Honorario As String, ByVal Contrato As String, ByVal Dni As String, ByVal IdTipoDocumentoIdentidad As String, ByVal Insertar As String, ByVal FlagPagoPorTurno As String, ByVal RnpBienes As String, ByVal RnpServicios As String, ByVal RnpConsultoria As String, ByVal RnpBienFechaIni As String, ByVal RnpBienFechaFin As String, ByVal RnpServicioFechaIni As String, ByVal RnpServicioFechaFin As String, ByVal RnpConsultoriaFechaIni As String, ByVal RnpConsultoriaFechaFin As String, ByVal ApPaterno As String, ByVal ApMaterno As String, ByVal Nombres As String, ByVal FecNac As String, ByVal CCI As String, ByVal IdBancoProv As String, ByVal anexo As String, ByVal rpc As String, ByVal IdNumeroCuenta As String, ByVal Val_Locador As String, ByVal empresa As String) As String

        Try
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
                ElseIf empresa = 5 Then
                    cx = "cnSiaf"
                End If

                conn.ConnectionString = ConfigurationManager.ConnectionStrings(cx).ConnectionString

                Using cmd As New SqlCommand()
                    conn.Open()
                    cmd.Connection = conn
                    cmd.CommandText = "sp_LO_NewActualizarProveedor"
                    cmd.CommandType = CommandType.StoredProcedure

                    cmd.Parameters.AddWithValue("@IdProveedor", IdProveedor)
                    'cmd.Parameters.AddWithValue("@IdProveedor", "10426889037")
                    cmd.Parameters.AddWithValue("@RazonSocial", RazSocial.ToUpper())
                    'cmd.Parameters.AddWithValue("@RazonSocial", "IDROGO VASQUEZ PATRICIA ELIZABETH")
                    cmd.Parameters.AddWithValue("@SiglaComercial", SiglaComercial.ToUpper())
                    'cmd.Parameters.AddWithValue("@SiglaComercial", "PEIV")
                    cmd.Parameters.AddWithValue("@RUC", RUC)
                    'cmd.Parameters.AddWithValue("@RUC", "10426889037")
                    cmd.Parameters.AddWithValue("@Direccion", Direccion.ToUpper())
                    'cmd.Parameters.AddWithValue("@Direccion", "AV. LOS OLIVOS 241")
                    cmd.Parameters.AddWithValue("@Distrito", Departamento + Provincia + Distrito)
                    'cmd.Parameters.AddWithValue("@Distrito", "150117")
                    cmd.Parameters.AddWithValue("@Provincia", "")
                    cmd.Parameters.AddWithValue("@Departamento", "")
                    cmd.Parameters.AddWithValue("@TelefonoEmpresa1", TelefonoEmpresa1)
                    'cmd.Parameters.AddWithValue("@TelefonoEmpresa1", "")
                    cmd.Parameters.AddWithValue("@TelefonoEmpresa2", TelefonoEmpresa2)
                    'cmd.Parameters.AddWithValue("@TelefonoEmpresa2", "966336866")
                    'cmd.Parameters.AddWithValue("@Fax", Fax)
                    cmd.Parameters.AddWithValue("@Fax", "")
                    cmd.Parameters.AddWithValue("@eMail", eMail.ToUpper())
                    'cmd.Parameters.AddWithValue("@eMail", "gioco27@hotmail.com")
                    'cmd.Parameters.AddWithValue("@Representante", Representante.ToUpper())
                    cmd.Parameters.AddWithValue("@Representante", "")
                    'cmd.Parameters.AddWithValue("@CargoRepresentante", CargoRepresentante.ToUpper())
                    cmd.Parameters.AddWithValue("@CargoRepresentante", "")
                    'cmd.Parameters.AddWithValue("@TelefonoRepresentante1", TelefonoRepresentante1)
                    cmd.Parameters.AddWithValue("@TelefonoRepresentante1", "")
                    'cmd.Parameters.AddWithValue("@TelefonoRepresentante2", TelefonoRepresentante2)
                    cmd.Parameters.AddWithValue("@TelefonoRepresentante2", "")
                    'cmd.Parameters.AddWithValue("@eMailRepresentante", eMailRepresentante.ToUpper())
                    cmd.Parameters.AddWithValue("@eMailRepresentante", "")
                    cmd.Parameters.AddWithValue("@Prioridad", "")
                    cmd.Parameters.AddWithValue("@TipoProveedor", "")
                    cmd.Parameters.AddWithValue("@TipoActividad", TipoActividad)
                    'cmd.Parameters.AddWithValue("@TipoActividad", "02")
                    cmd.Parameters.AddWithValue("@Clasificacion", Clasificacion)
                    'cmd.Parameters.AddWithValue("@Clasificacion", "00")
                    cmd.Parameters.AddWithValue("@CalificacionBuenContribuyente", "N")
                    cmd.Parameters.AddWithValue("@Retencion", "")
                    cmd.Parameters.AddWithValue("@FormaPago", FormaPago)
                    'cmd.Parameters.AddWithValue("@FormaPago", "04")
                    cmd.Parameters.AddWithValue("@Bien", Bien)
                    'cmd.Parameters.AddWithValue("@Bien", "N")
                    cmd.Parameters.AddWithValue("@Servicio", Servicio)
                    'cmd.Parameters.AddWithValue("@Servicio", "N")
                    cmd.Parameters.AddWithValue("@Honorario", Honorario)
                    'cmd.Parameters.AddWithValue("@Honorario", "S")
                    cmd.Parameters.AddWithValue("@Contrato", Contrato)
                    'cmd.Parameters.AddWithValue("@Contrato", "N")
                    cmd.Parameters.AddWithValue("@AudUsuario", Session("userid"))
                    'cmd.Parameters.AddWithValue("@AudUsuario", "0050")
                    cmd.Parameters.AddWithValue("@Estado", "A")
                    cmd.Parameters.AddWithValue("@Dni", Dni)
                    'cmd.Parameters.AddWithValue("@Dni", "42688903")
                    cmd.Parameters.AddWithValue("@IdTipoDocumentoIdentidad", IdTipoDocumentoIdentidad)
                    'cmd.Parameters.AddWithValue("@IdTipoDocumentoIdentidad", "01")
                    cmd.Parameters.AddWithValue("@Insertar", "I")
                    'cmd.Parameters.AddWithValue("@FlagPagoPorTurno", FlagPagoPorTurno)
                    cmd.Parameters.AddWithValue("@FlagPagoPorTurno", "N")
                    cmd.Parameters.AddWithValue("@RnpBienes", RnpBienes.ToUpper())
                    'cmd.Parameters.AddWithValue("@RnpBienes", "")
                    cmd.Parameters.AddWithValue("@RnpServicios", RnpServicios.ToUpper())
                    'cmd.Parameters.AddWithValue("@RnpServicios", "")
                    cmd.Parameters.AddWithValue("@RnpConsultoria", RnpConsultoria.ToUpper())
                    'cmd.Parameters.AddWithValue("@RnpConsultoria", "")
                    cmd.Parameters.AddWithValue("@RnpBienFechaIni", RnpBienFechaIni)
                    'cmd.Parameters.AddWithValue("@RnpBienFechaIni", "29/03/2016")
                    cmd.Parameters.AddWithValue("@RnpBienFechaFin", RnpBienFechaFin)
                    'cmd.Parameters.AddWithValue("@RnpBienFechaFin", "29/03/2016")
                    cmd.Parameters.AddWithValue("@RnpServicioFechaIni", RnpServicioFechaIni)
                    'cmd.Parameters.AddWithValue("@RnpServicioFechaIni", "29/03/2016")
                    cmd.Parameters.AddWithValue("@RnpServicioFechaFin", RnpServicioFechaFin)
                    'cmd.Parameters.AddWithValue("@RnpServicioFechaFin", "29/03/2016")
                    cmd.Parameters.AddWithValue("@RnpConsultoriaFechaIni", RnpConsultoriaFechaIni)
                    'cmd.Parameters.AddWithValue("@RnpConsultoriaFechaIni", "29/03/2016")
                    cmd.Parameters.AddWithValue("@RnpConsultoriaFechaFin", RnpConsultoriaFechaFin)
                    'cmd.Parameters.AddWithValue("@RnpConsultoriaFechaFin", "29/03/2016")
                    cmd.Parameters.AddWithValue("@ApPaterno", ApPaterno.ToUpper())
                    'cmd.Parameters.AddWithValue("@ApPaterno", "IDROGO")
                    cmd.Parameters.AddWithValue("@ApMaterno", ApMaterno.ToUpper())
                    'cmd.Parameters.AddWithValue("@ApMaterno", "VASQUEZ")
                    cmd.Parameters.AddWithValue("@Nombres", Nombres.ToUpper())
                    'cmd.Parameters.AddWithValue("@Nombres", "PATRICIA ELIZABETH")
                    'cmd.Parameters.AddWithValue("@FecNac", FecNac)
                    cmd.Parameters.AddWithValue("@FecNac", "01/02/1979")
                    cmd.Parameters.AddWithValue("@CCI", CCI)
                    'cmd.Parameters.AddWithValue("@CCI", "100-54457-56484")
                    cmd.Parameters.AddWithValue("@IdBancoProv", IdBancoProv)
                    'cmd.Parameters.AddWithValue("@IdBancoProv", "009")
                    cmd.Parameters.AddWithValue("@mensaje", "")
                    'cmd.Parameters.AddWithValue("@anexo", anexo.ToUpper())
                    cmd.Parameters.AddWithValue("@anexo", "")
                    'cmd.Parameters.AddWithValue("@rpc", rpc)
                    cmd.Parameters.AddWithValue("@rpc", "")
                    cmd.Parameters.AddWithValue("@IdNumeroCuenta", IdNumeroCuenta)
                    'cmd.Parameters.AddWithValue("@IdNumeroCuenta", "101-8724-8540")
                    cmd.Parameters.AddWithValue("@Locador", Val_Locador)

                    cmd.ExecuteNonQuery()
                End Using
                Return (1)
            End Using

        Catch ex As Exception
            Return ("Insertar Requerimiento Proveedor..." & ex.Message)

        End Try
    End Function

    'ACTUALIZAR FECHAS RNP
    <OperationContract()> _
    <WebInvoke(Method:="POST", ResponseFormat:=WebMessageFormat.Json)> _
    Public Function ActualizarFechaRNP(ByVal IdProveedor As String, ByVal empresa As String) As String

        Try
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
                ElseIf empresa = 5 Then
                    cx = "cnSiaf"
                End If

                conn.ConnectionString = ConfigurationManager.ConnectionStrings(cx).ConnectionString

                Using cmd As New SqlCommand()
                    conn.Open()
                    cmd.Connection = conn
                    cmd.CommandText = "SP_NullFechasNoSelect"
                    cmd.CommandType = CommandType.StoredProcedure

                    cmd.Parameters.AddWithValue("@IdProveedor", IdProveedor)

                    cmd.ExecuteNonQuery()
                End Using
                Return (1)
            End Using

        Catch ex As Exception
            Return ("Actualizar Fechas RNP Proveedor..." & ex.Message)

        End Try
    End Function

    'IMPUESTO Y TASA
    <OperationContract()> _
<WebInvoke(Method:="POST", ResponseFormat:=WebMessageFormat.Json)> _
    Public Function impuesto_tasa(ByVal IdTipoDocumento As String, ByVal compraoservicio As String, ByVal empresa As String) As String
        Try
            Dim tasa As New List(Of Object)()
            Using con As New SqlConnection()
                Dim cx As String = ""

                If empresa = 1 Then
                    cx = "cnEmape"
                ElseIf empresa = 2 Then
                    cx = "cnEmapeMunicipal"
                ElseIf empresa = 3 Then
                    cx = "cnRegional"
                ElseIf empresa = 4 Then
                    cx = "cnMantenimiento"
                ElseIf empresa = 5 Then
                    cx = "cnSiaf"
                End If

                con.ConnectionString = ConfigurationManager.ConnectionStrings(cx).ConnectionString
                Using cmd As New SqlCommand()

                    cmd.CommandText = "SP_LOG_Tasa"
                    cmd.CommandType = CommandType.StoredProcedure
                    cmd.Parameters.AddWithValue("@TipoDoc", IdTipoDocumento)

                    cmd.Connection = con

                    con.Open()
                    Using sdr As SqlDataReader = cmd.ExecuteReader()
                        While sdr.Read()

                            tasa.Add(New With { _
                             Key .IdImpuesto = sdr("IdImpuesto"), _
                             Key .ValorImpto = sdr("ValorImpto") _
                            })
                        End While
                    End Using
                    con.Close()
                End Using
                Return (New JavaScriptSerializer().Serialize(tasa))
            End Using

        Catch ex As Exception
            Return "error"
        End Try
    End Function

    <OperationContract()> _
<WebInvoke(Method:="POST", ResponseFormat:=WebMessageFormat.Json)> _
    Public Function AdicSaldoCantOrdenes(ByVal CompraServicio As String, ByVal empresa As String) As String

        Dim anno As String = Year(DateTime.Now)
        Dim mes As String = Right("00" & Month(Now), 2)

        Try
            Dim cabecannoorden As New List(Of Object)()
            Using con As New SqlConnection()
                Dim cx As String = ""

                If empresa = 1 Then
                    cx = "cnEmape"
                ElseIf empresa = 2 Then
                    cx = "cnEmapeMunicipal"
                ElseIf empresa = 3 Then
                    cx = "cnRegional"
                ElseIf empresa = 4 Then
                    cx = "cnMantenimiento"
                ElseIf empresa = 5 Then
                    cx = "cnSiaf"
                End If

                con.ConnectionString = ConfigurationManager.ConnectionStrings(cx).ConnectionString
                Using cmd As New SqlCommand()

                    cmd.CommandText = "SP_LOG_AdicOrdenes"
                    cmd.CommandType = CommandType.StoredProcedure
                    cmd.Parameters.AddWithValue("@CompraServicio", CompraServicio)
                    cmd.Parameters.AddWithValue("@IdAnno", anno)
                    cmd.Parameters.AddWithValue("@IdMes", mes)

                    cmd.Connection = con

                    con.Open()
                    Using sdr As SqlDataReader = cmd.ExecuteReader()
                        While sdr.Read()

                            cabecannoorden.Add(New With { _
                                Key .IdOrdenCompra = sdr("IdOrdenCompra"), _
                                Key .IdAnno = sdr("IdAnno"), _
                                Key .IdMes = sdr("IdMes") _
                            })
                        End While
                    End Using
                    con.Close()
                End Using
                Return (New JavaScriptSerializer().Serialize(cabecannoorden))
            End Using

        Catch ex As Exception
            Return "error"
        End Try
    End Function

    'CABECERA ORDEN DE COMPRA y SERVICIO
    <OperationContract()> _
<WebInvoke(Method:="POST", ResponseFormat:=WebMessageFormat.Json)> _
    Public Function InsertarCabeceraOrdenCompraoServicio(ByVal empresa As String, ByVal cod_idreq As String, ByVal cod_idreqx As String, ByVal agregarcompraoservicio As String, ByVal cod_centcost As String, ByVal cod_centcostx As String, ByVal PlazoEntrega As String, ByVal proveedor As String, _
                                                         ByVal cantidad As String, ByVal concepto As String, ByVal IdFormaPago As String, ByVal TipoDoc As String, ByVal Moneda As String, ByVal Tipo_cambio As Decimal, ByVal FechaTipoCamb As String, ByVal agregarbienservicio As String, ByVal Usuario As String, ByVal UsuarioDet As String, _
                                                         ByVal cantidadx As String, ByVal impuesto_req As String, ByVal impuesto_reqx As String, ByVal valor_ventaXCien As String, ByVal disponible As String, ByVal n As String, ByVal idordencompra As String, ByVal razonsocial As String, _
                                                         ByVal cod_bienser As String, ByVal cod_bienserx As String, ByVal cod_nroitem As String, ByVal cod_nroitemx As String, ByVal cod_idum As String, ByVal cod_idumx As String, ByVal costo_req As String, ByVal costo_reqx As String, ByVal sabdoreserva_req As String, ByVal sabdoreserva_reqx As String, ByVal subtotal_req As String, ByVal subtotal_reqx As String, _
                                                         ByVal partidapresu As String, ByVal partidapresux As String, ByVal cod_trans As String, ByVal cod_transx As String, ByVal cod_ctacontab As String, ByVal cod_ctacontabx As String, ByVal cod_almac As String, ByVal cod_almacx As String, ByVal dias_habiles As String, ByVal TipoServicio As String, ByVal mensaje As String, ByVal IdUsuario As String) As String

        Dim fechaactual As DateTime = DateTime.Now
        Dim anno As String = Year(DateTime.Now)
        Dim mes As String = Right("00" & Month(Now), 2)

        Try
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
                ElseIf empresa = 5 Then
                    cx = "cnSiaf"
                End If

                If agregarcompraoservicio = "C" Then
                    TipoDoc = "001"
                End If

                conn.ConnectionString = ConfigurationManager.ConnectionStrings(cx).ConnectionString

                Dim nroOrdenCompoServ As String
                Dim MensajeCab As String
                Dim MensajeDet As String
                Dim Requerimiento As String

                Dim DiaOrden As String
                Dim MesOrden As String
                Dim AnnoOrden As String

                Using cmd As New SqlCommand()
                    conn.Open()
                    cmd.Connection = conn
                    cmd.CommandText = "sp_LO_NewActualizarOrdenCompra"
                    cmd.CommandType = CommandType.StoredProcedure

                    cmd.Parameters.AddWithValue("@IdOrdenCompra", "NUEVO")
                    'cmd.Parameters.AddWithValue("@IdTipoServicio", TipoServicio)
                    cmd.Parameters.AddWithValue("@IdRequerimiento", cod_idreq)
                    'cmd.Parameters.AddWithValue("@IdRequerimiento", "0050000000301")
                    cmd.Parameters.AddWithValue("@IdAnno", anno)
                    'cmd.Parameters.AddWithValue("@IdAnno", "2016")
                    cmd.Parameters.AddWithValue("@IdMes", mes)
                    'cmd.Parameters.AddWithValue("@IdMes", "04")
                    cmd.Parameters.AddWithValue("@CompraServicio", agregarcompraoservicio)
                    'cmd.Parameters.AddWithValue("@CompraServicio", "C")
                    cmd.Parameters.AddWithValue("@IdCentroCosto", cod_centcost)
                    'cmd.Parameters.AddWithValue("@IdCentroCosto", "040000")
                    'cmd.Parameters.AddWithValue("@FechaOrdenCompra", Format(fechaactual, "yyyyMMdd"))
                    cmd.Parameters.AddWithValue("@FechaOrdenCompra", FechaTipoCamb)
                    'cmd.Parameters.AddWithValue("@FechaOrdenCompra", "20160428")
                    cmd.Parameters.AddWithValue("@FechaTipoCambio", FechaTipoCamb)
                    'cmd.Parameters.AddWithValue("@FechaTipoCambio", "20160428")
                    cmd.Parameters.AddWithValue("@PlazoEntrega", PlazoEntrega)
                    'cmd.Parameters.AddWithValue("@PlazoEntrega", 1)
                    cmd.Parameters.AddWithValue("@Descripcion", concepto)
                    cmd.Parameters.AddWithValue("@IdProveedor", proveedor)
                    'cmd.Parameters.AddWithValue("@IdProveedor", "20100016681")
                    cmd.Parameters.AddWithValue("@TipoProveedor", "")
                    cmd.Parameters.AddWithValue("@IdFormaPago", IdFormaPago)
                    'cmd.Parameters.AddWithValue("@IdFormaPago", "04")
                    cmd.Parameters.AddWithValue("@IdFormaEntrega", "")
                    cmd.Parameters.AddWithValue("@IdTipoDocumento", TipoDoc)
                    'cmd.Parameters.AddWithValue("@IdTipoDocumento", "001")
                    cmd.Parameters.AddWithValue("@IdTipoPago", "")
                    'cmd.Parameters.AddWithValue("@Moneda", Moneda)
                    cmd.Parameters.AddWithValue("@Moneda", "S")
                    cmd.Parameters.AddWithValue("@TipoCambio", Tipo_cambio)
                    'cmd.Parameters.AddWithValue("@TipoCambio", 3.381)
                    cmd.Parameters.AddWithValue("@ValorVenta", costo_req)
                    'cmd.Parameters.AddWithValue("@ValorVenta", 3.0)
                    cmd.Parameters.AddWithValue("@CantidadTotal", cantidad)
                    'cmd.Parameters.AddWithValue("@CantidadTotal", 1.0)
                    cmd.Parameters.AddWithValue("@Impuesto1", impuesto_req)
                    'cmd.Parameters.AddWithValue("@Impuesto1", 630.01) 'Estos valores por mientras
                    cmd.Parameters.AddWithValue("@Tasa1", valor_ventaXCien)
                    'cmd.Parameters.AddWithValue("@Tasa1", 18) 'Estos valores por mientras
                    cmd.Parameters.AddWithValue("@Impuesto2", 0.0)
                    cmd.Parameters.AddWithValue("@Tasa2", 0)
                    cmd.Parameters.AddWithValue("@Impuesto3", 0.0)
                    cmd.Parameters.AddWithValue("@Tasa3", 0)
                    cmd.Parameters.AddWithValue("@Impuesto4", 2.0)
                    cmd.Parameters.AddWithValue("@Tasa4", 0)
                    'cmd.Parameters.AddWithValue("@AudUsuario", Session("userid"))
                    cmd.Parameters.AddWithValue("@AudUsuario", IdUsuario)
                    cmd.Parameters.AddWithValue("@Estado", "A")
                    cmd.Parameters.AddWithValue("@Prorrateo", "N")
                    cmd.Parameters.AddWithValue("@ProcedePago", "N")
                    cmd.Parameters.AddWithValue("@Insertar", "I")
                    cmd.Parameters.AddWithValue("@mensaje", "")
                    cmd.Parameters.AddWithValue("@NuevoIdOrden", "")
                    cmd.Parameters.AddWithValue("@IdProcesoTipo", "")
                    cmd.Parameters.AddWithValue("@IdClasificacionObjeto", "")
                    cmd.Parameters.AddWithValue("@IdProcesoSeleccion", "")
                    cmd.Parameters.AddWithValue("@ServicioPublico", "")
                    cmd.Parameters.AddWithValue("@NumeroAutorizar", "")
                    cmd.Parameters.AddWithValue("@FlagDiaHabil", dias_habiles)
                    'cmd.Parameters.AddWithValue("@FlagDiaHabil", "N")
                    cmd.Parameters.AddWithValue("@ReintegroBienServicio", "B")
                    cmd.Parameters.AddWithValue("@flagordenparcial", "")
                    cmd.CommandTimeout = 500

                    cmd.ExecuteNonQuery()

                    nroOrdenCompoServ = codordenCompraoServicio(agregarcompraoservicio, empresa)

                    'INSERTAR DETALLE ORDEN DE COMPRA/SERVICIO

                    Dim idreq() As String = cod_idreqx.Split(",")
                    Dim centcostp() As String = cod_centcostx.Split(",")
                    Dim bienserp() As String = cod_bienserx.Split(",")
                    Dim nroitemp() As String = cod_nroitemx.Split(",")
                    Dim idump() As String = cod_idumx.Split(",")
                    Dim cantp() As String = cantidadx.Split(",")
                    Dim cstp() As String = costo_reqx.Split(",")
                    Dim saldoresevp() As String = sabdoreserva_reqx.Split(",")
                    Dim impuesto() As String = impuesto_reqx.Split(",")
                    Dim sbtotalp() As String = subtotal_reqx.Split(",")
                    Dim ptdpresp() As String = partidapresux.Split(",")
                    Dim transp() As String = cod_transx.Split(",")
                    Dim ctacontabp() As String = cod_ctacontabx.Split(",")
                    Dim almacp() As String = cod_almacx.Split(",")

                    Dim contadoradicordcomp As Integer = 0

                    For i As Integer = 0 To (n - 1)
                        If cantidad > 0 Then
                            contadoradicordcomp = contadoradicordcomp + 1

                            InsertarDetalleOrdenCompraoServicio(nroOrdenCompoServ, idreq(i), agregarcompraoservicio, centcostp(i), proveedor, bienserp(i), nroitemp(i), idump(i), cantp(i), cstp(i), saldoresevp(i), impuesto(i), sbtotalp(i), ptdpresp(i), transp(i), ctacontabp(i), almacp(i), IdUsuario, empresa)

                            'InsertarDetalleOrdenCompraoServicio("0005000000099", "0050000000301", "C", "040000", "20100016681", "B090100010002", "012", "112", 1.0, 1000.0, 1000.0, 630.01, 1000.0, "2016-15.006.0008.A.500003-01-02-2.3.1.1.1.1-09", "0000000033", "252501", "000002", empresa)

                            'ActualizarSaldoCantidadRequer(idreq(i), nroitemp(i), cantp(i), agregarcompraoservicio, empresa)

                            'ActualizarSaldoCostoRequer(idreq(i), sbtotalp(i), agregarcompraoservicio, empresa)

                            'ActualizarSaldoCantidadCostoRequer(idreq(i), empresa)
                        End If
                    Next

                    'ActualizarSaldoCantidadyCostoRequer(nroOrdenCompoServ, agregarcompraoservicio, empresa)

                    ActualizarImpuestoOrdenes(nroOrdenCompoServ, agregarcompraoservicio, TipoDoc, empresa)

                    If empresa = 5 Then
                        InsertarExpedienteSiafCompromiso(empresa, nroOrdenCompoServ, cod_idreq, agregarcompraoservicio, agregarbienservicio)
                    End If

                    ActualizarValorImpuestoOrdenes(empresa, agregarcompraoservicio)

                    ActualizarFechaAceptLocadores(nroOrdenCompoServ, agregarcompraoservicio, proveedor, empresa)

                    actualizarFechaAceptacion(agregarcompraoservicio, empresa)


                    Requerimiento = Ext_Requerimiento(empresa)
                    DiaOrden = Ext_Dia(nroOrdenCompoServ, agregarcompraoservicio, empresa)
                    MesOrden = Ext_Mes(nroOrdenCompoServ, agregarcompraoservicio, empresa)
                    AnnoOrden = Ext_Anno(nroOrdenCompoServ, agregarcompraoservicio, empresa)


                    MensajeCab = NumMensaje(empresa)

                    If MensajeCab = "0" Then

                        MensajeDet = NumMensajeDet(empresa)

                        If MensajeDet = "0" Then

                            'ActualizarImpuesto(empresa, agregarcompraoservicio)

                            'ActualizarFechaOrdenes(TipoDoc, agregarcompraoservicio, empresa)

                            'ActualizarSaldoCosto(nroOrdenCompoServ, agregarcompraoservicio, empresa)

                        ElseIf MensajeDet <> "0" Then

                            anularOrdenCabecera(nroOrdenCompoServ, Requerimiento, Usuario, agregarcompraoservicio, "E", AnnoOrden, MesOrden, DiaOrden, UsuarioDet, empresa)

                            anularOrdenDetalle(nroOrdenCompoServ, agregarcompraoservicio, UsuarioDet, "E", AnnoOrden, MesOrden, DiaOrden, empresa)

                            eliminarOrden(nroOrdenCompoServ, empresa)

                        End If

                    ElseIf MensajeCab <> "0" Then

                        anularOrdenCabecera(nroOrdenCompoServ, Requerimiento, Usuario, agregarcompraoservicio, "E", AnnoOrden, MesOrden, DiaOrden, UsuarioDet, empresa)

                        anularOrdenDetalle(nroOrdenCompoServ, agregarcompraoservicio, UsuarioDet, "E", AnnoOrden, MesOrden, DiaOrden, empresa)

                        eliminarOrden(nroOrdenCompoServ, empresa)

                    End If

                End Using
                Return (1)
            End Using
        Catch ex As Exception
            Return ("Insertar Requerimiento Orden de Compra2222..." & ex.Message)
        End Try
    End Function

    'IDORDENDECOMPRAOSERVICIO
    <OperationContract()> _
<WebInvoke(Method:="POST", ResponseFormat:=WebMessageFormat.Json)> _
    Public Function codordenCompraoServicio(ByVal CompraServicio As String, ByVal empresa As String) As String
        Dim Alm As New List(Of Object)()
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
            ElseIf empresa = 5 Then
                cx = "cnSiaf"
            End If

            conn.ConnectionString = ConfigurationManager.ConnectionStrings(cx).ConnectionString
            Using cmd As New SqlCommand()

                cmd.CommandText = "SP_LOG_IdOrdenCompraoServicio"
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.AddWithValue("@CompraServicio", CompraServicio)
                cmd.Connection = conn
                conn.Open()
                Dim codigo As String = cmd.ExecuteScalar
                Return (codigo)
                conn.Close()
            End Using

        End Using
    End Function

    'MENSAJE CABECERA
    <OperationContract()> _
<WebInvoke(Method:="POST", ResponseFormat:=WebMessageFormat.Json)> _
    Public Function NumMensaje(ByVal empresa As String) As String
        Dim IdMensaje As New List(Of Object)()
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
            ElseIf empresa = 5 Then
                cx = "cnSiaf"
            End If

            conn.ConnectionString = ConfigurationManager.ConnectionStrings(cx).ConnectionString
            Using cmd As New SqlCommand()

                cmd.CommandText = "SP_ExtraerCMSJ"
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Connection = conn
                conn.Open()
                Dim id As String = cmd.ExecuteScalar
                Return (id)
                conn.Close()
            End Using

        End Using
    End Function

    'MENSAJE DETALLE
    <OperationContract()> _
<WebInvoke(Method:="POST", ResponseFormat:=WebMessageFormat.Json)> _
    Public Function NumMensajeDet(ByVal empresa As String) As String
        Dim IdMensajeDet As New List(Of Object)()
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
            ElseIf empresa = 5 Then
                cx = "cnSiaf"
            End If

            conn.ConnectionString = ConfigurationManager.ConnectionStrings(cx).ConnectionString
            Using cmd As New SqlCommand()

                cmd.CommandText = "SP_ExtraerDMSJ"
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Connection = conn
                conn.Open()
                Dim iddt As String = cmd.ExecuteScalar
                Return (iddt)
                conn.Close()
            End Using

        End Using
    End Function

    'REQUERIMIENTO
    <OperationContract()> _
<WebInvoke(Method:="POST", ResponseFormat:=WebMessageFormat.Json)> _
    Public Function Ext_Requerimiento(ByVal empresa As String) As String
        Dim Req As New List(Of Object)()
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
            ElseIf empresa = 5 Then
                cx = "cnSiaf"
            End If

            conn.ConnectionString = ConfigurationManager.ConnectionStrings(cx).ConnectionString
            Using cmd As New SqlCommand()

                cmd.CommandText = "SP_ExtraerReq"
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Connection = conn
                conn.Open()
                Dim reque As String = cmd.ExecuteScalar
                Return (reque)
                conn.Close()
            End Using

        End Using
    End Function

    'DIA
    <OperationContract()> _
<WebInvoke(Method:="POST", ResponseFormat:=WebMessageFormat.Json)> _
    Public Function Ext_Dia(ByVal IdOrdenCompra As String, ByVal CompraServicio As String, ByVal empresa As String) As String
        Dim Req As New List(Of Object)()
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
            ElseIf empresa = 5 Then
                cx = "cnSiaf"
            End If

            conn.ConnectionString = ConfigurationManager.ConnectionStrings(cx).ConnectionString
            Using cmd As New SqlCommand()

                cmd.CommandText = "SP_LOG_Dia_Ordenes"
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.AddWithValue("@IdOrdenCompra", IdOrdenCompra)
                cmd.Parameters.AddWithValue("@CompraServicio", CompraServicio)
                cmd.Connection = conn
                conn.Open()
                Dim dia As String = cmd.ExecuteScalar
                Return (dia)
                conn.Close()
            End Using

        End Using
    End Function

    'MES
    <OperationContract()> _
<WebInvoke(Method:="POST", ResponseFormat:=WebMessageFormat.Json)> _
    Public Function Ext_Mes(ByVal IdOrdenCompra As String, ByVal CompraServicio As String, ByVal empresa As String) As String
        Dim Req As New List(Of Object)()
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
            ElseIf empresa = 5 Then
                cx = "cnSiaf"
            End If

            conn.ConnectionString = ConfigurationManager.ConnectionStrings(cx).ConnectionString
            Using cmd As New SqlCommand()

                cmd.CommandText = "SP_LOG_Meses_Ordenes"
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.AddWithValue("@IdOrdenCompra", IdOrdenCompra)
                cmd.Parameters.AddWithValue("@CompraServicio", CompraServicio)
                cmd.Connection = conn
                conn.Open()
                Dim mes As String = cmd.ExecuteScalar
                Return (mes)
                conn.Close()
            End Using

        End Using
    End Function

    'ANNO
    <OperationContract()> _
<WebInvoke(Method:="POST", ResponseFormat:=WebMessageFormat.Json)> _
    Public Function Ext_Anno(ByVal IdOrdenCompra As String, ByVal CompraServicio As String, ByVal empresa As String) As String
        Dim Req As New List(Of Object)()
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
            ElseIf empresa = 5 Then
                cx = "cnSiaf"
            End If

            conn.ConnectionString = ConfigurationManager.ConnectionStrings(cx).ConnectionString
            Using cmd As New SqlCommand()

                cmd.CommandText = "SP_LOG_Anno_Ordenes"
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.AddWithValue("@IdOrdenCompra", IdOrdenCompra)
                cmd.Parameters.AddWithValue("@CompraServicio", CompraServicio)
                cmd.Connection = conn
                conn.Open()
                Dim mes As String = cmd.ExecuteScalar
                Return (mes)
                conn.Close()
            End Using

        End Using
    End Function

    'MENSAJE CABECERA
    <OperationContract()> _
<WebInvoke(Method:="POST", ResponseFormat:=WebMessageFormat.Json)> _
    Public Function MSJCabecera(ByVal empresa As String) As String
        Try
            Dim mensajecab As New List(Of Object)()
            Using con As New SqlConnection()

                Dim cx As String = ""

                If empresa = 1 Then
                    cx = "cnEmape"
                ElseIf empresa = 2 Then
                    cx = "cnEmapeMunicipal"
                ElseIf empresa = 3 Then
                    cx = "cnRegional"
                ElseIf empresa = 4 Then
                    cx = "cnMantenimiento"
                ElseIf empresa = 5 Then
                    cx = "cnSiaf"
                End If

                con.ConnectionString = ConfigurationManager.ConnectionStrings(cx).ConnectionString
                Using cmd As New SqlCommand()

                    cmd.CommandText = "SP_ExtraerMensajeCabecera"
                    cmd.CommandType = CommandType.StoredProcedure
                    cmd.Connection = con

                    con.Open()
                    Using sdr As SqlDataReader = cmd.ExecuteReader()
                        While sdr.Read()

                            mensajecab.Add(New With { _
                             Key .IdMensaje = sdr("IdMensaje"), _
                             Key .Mensajes = sdr("Mensajes") _
                            })
                        End While
                    End Using
                    con.Close()
                End Using
                Return (New JavaScriptSerializer().Serialize(mensajecab))
            End Using

        Catch ex As Exception
            Return "error"
        End Try
    End Function

    'MENSAJE DETALLE
    <OperationContract()> _
<WebInvoke(Method:="POST", ResponseFormat:=WebMessageFormat.Json)> _
    Public Function MSJDetalle(ByVal empresa As String) As String
        Try
            Dim mensajedet As New List(Of Object)()
            Using con As New SqlConnection()

                Dim cx As String = ""

                If empresa = 1 Then
                    cx = "cnEmape"
                ElseIf empresa = 2 Then
                    cx = "cnEmapeMunicipal"
                ElseIf empresa = 3 Then
                    cx = "cnRegional"
                ElseIf empresa = 4 Then
                    cx = "cnMantenimiento"
                ElseIf empresa = 5 Then
                    cx = "cnSiaf"
                End If

                con.ConnectionString = ConfigurationManager.ConnectionStrings(cx).ConnectionString
                Using cmd As New SqlCommand()

                    cmd.CommandText = "SP_ExtraerMensajeDetalle"
                    cmd.CommandType = CommandType.StoredProcedure
                    cmd.Connection = con

                    con.Open()
                    Using sdr As SqlDataReader = cmd.ExecuteReader()
                        While sdr.Read()

                            mensajedet.Add(New With { _
                             Key .IdMensaje = sdr("IdMensaje"), _
                             Key .Mensajes = sdr("Mensajes") _
                            })
                        End While
                    End Using
                    con.Close()
                End Using
                Return (New JavaScriptSerializer().Serialize(mensajedet))
            End Using

        Catch ex As Exception
            Return "error"
        End Try
    End Function

    'RAZONSOCIAL
    <OperationContract()> _
<WebInvoke(Method:="POST", ResponseFormat:=WebMessageFormat.Json)> _
    Public Function razonsocial(ByVal IdProveedor As String, ByVal empresa As String) As String
        Try
            Dim razsocial As New List(Of Object)()
            Using con As New SqlConnection()
                Dim cx As String = ""

                If empresa = 1 Then
                    cx = "cnEmape"
                ElseIf empresa = 2 Then
                    cx = "cnEmapeMunicipal"
                ElseIf empresa = 3 Then
                    cx = "cnRegional"
                ElseIf empresa = 4 Then
                    cx = "cnMantenimiento"
                ElseIf empresa = 5 Then
                    cx = "cnSiaf"
                End If

                con.ConnectionString = ConfigurationManager.ConnectionStrings(cx).ConnectionString
                Using cmd As New SqlCommand()

                    cmd.CommandText = "SP_LOG_RAZONSOCIAL"
                    cmd.CommandType = CommandType.StoredProcedure
                    cmd.Parameters.AddWithValue("@IdProveedor", IdProveedor)

                    cmd.Connection = con

                    con.Open()
                    Using sdr As SqlDataReader = cmd.ExecuteReader()
                        While sdr.Read()

                            razsocial.Add(New With { _
                             Key .RazonSocial = sdr("RazonSocial") _
                            })
                        End While
                    End Using
                    con.Close()
                End Using
                Return (New JavaScriptSerializer().Serialize(razsocial))
            End Using

        Catch ex As Exception
            Return "error"
        End Try
    End Function

    'DETALLE ORDEN DE COMPRA y SERVICIO
    <OperationContract()> _
    <WebInvoke(Method:="POST", ResponseFormat:=WebMessageFormat.Json)> _
    Public Function InsertarDetalleOrdenCompraoServicio(ByVal nroOrdenComp As String, ByVal cod_idreq As String, ByVal agregarcompraoservicio As String, ByVal cod_centcost As String, ByVal Proveedor As String, _
                                                        ByVal cod_bienser As String, ByVal cod_nroitem As String, ByVal cod_idum As String, ByVal cantidad As String, _
                                                        ByVal costo As String, ByVal sabdoreserva_req As String, ByVal impuesto_req As String, ByVal subtotal_req As String, _
                                                        ByVal partidapresu As String, ByVal cod_trans As String, ByVal cod_ctacontab As String, ByVal cod_almac As String, ByVal IdUsuario As String, ByVal empresa As String) As String

        Dim fechaactual As DateTime = DateTime.Now
        Dim anno As String = Year(DateTime.Now)
        Dim mes As String = Right("00" & Month(Now), 2)
        Dim razonSoc As String = razonsocial(Proveedor, empresa)

        Try
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
                ElseIf empresa = 5 Then
                    cx = "cnSiaf"
                End If

                conn.ConnectionString = ConfigurationManager.ConnectionStrings(cx).ConnectionString

                Using cmd As New SqlCommand()
                    conn.Open()
                    cmd.Connection = conn
                    cmd.CommandText = "Sp_LO_NewActualizarOrdenCompraDetalleNewIII"
                    cmd.CommandType = CommandType.StoredProcedure

                    'cmd.Parameters.AddWithValue("@IdOrdenCompra", "0005000000102")
                    cmd.Parameters.AddWithValue("@IdOrdenCompra", nroOrdenComp)
                    'cmd.Parameters.AddWithValue("@IdRequerimiento", "0050000000301")
                    cmd.Parameters.AddWithValue("@IdRequerimiento", cod_idreq)
                    'cmd.Parameters.AddWithValue("@IdAnno", "2016")
                    cmd.Parameters.AddWithValue("@IdAnno", anno)
                    'cmd.Parameters.AddWithValue("@IdMes", "03")
                    cmd.Parameters.AddWithValue("@IdMes", mes)
                    'cmd.Parameters.AddWithValue("@CompraServicio",)
                    cmd.Parameters.AddWithValue("@CompraServicio", agregarcompraoservicio)
                    'cmd.Parameters.AddWithValue("@IdCentroCosto", "040000")
                    cmd.Parameters.AddWithValue("@IdCentroCosto", cod_centcost)
                    'cmd.Parameters.AddWithValue("@FechaDocumento", "04/04/2016")
                    cmd.Parameters.AddWithValue("@FechaDocumento", fechaactual)
                    'cmd.Parameters.AddWithValue("@Prorrateo",)
                    cmd.Parameters.AddWithValue("@Prorrateo", "N")
                    'cmd.Parameters.AddWithValue("@IdProveedor", "10426889037")
                    cmd.Parameters.AddWithValue("@IdProveedor", Proveedor)
                    'cmd.Parameters.AddWithValue("@TipoProveedor",)
                    cmd.Parameters.AddWithValue("@TipoProveedor", "")
                    'cmd.Parameters.AddWithValue("@RazonSocial", "IDROGO VASQUEZ PATRICIA")
                    cmd.Parameters.AddWithValue("@RazonSocial", razonSoc)
                    'cmd.Parameters.AddWithValue("@IdBienServicio", "B090100010002")
                    cmd.Parameters.AddWithValue("@IdBienServicio", cod_bienser)
                    'cmd.Parameters.AddWithValue("@NumeroItemRequerimiento", "012")
                    cmd.Parameters.AddWithValue("@NumeroItemRequerimiento", cod_nroitem)
                    'cmd.Parameters.AddWithValue("@NumeroItemOrdenCompra",)
                    cmd.Parameters.AddWithValue("@NumeroItemOrdenCompra", "")
                    'cmd.Parameters.AddWithValue("@IdUnidadMedida", "112")
                    cmd.Parameters.AddWithValue("@IdUnidadMedida", cod_idum)
                    'cmd.Parameters.AddWithValue("@Cantidad", 1.0)
                    cmd.Parameters.AddWithValue("@Cantidad", cantidad)
                    'cmd.Parameters.AddWithValue("@Costo", 1000.0)
                    cmd.Parameters.AddWithValue("@Costo", costo)
                    'cmd.Parameters.AddWithValue("@SaldoReservaActual", 1000.0)
                    cmd.Parameters.AddWithValue("@SaldoReservaActual", sabdoreserva_req)
                    'cmd.Parameters.AddWithValue("@Impuesto1", 630.01)
                    cmd.Parameters.AddWithValue("@Impuesto1", impuesto_req)
                    'cmd.Parameters.AddWithValue("@Impuesto2",)
                    cmd.Parameters.AddWithValue("@Impuesto2", 0.0)
                    'cmd.Parameters.AddWithValue("@Impuesto3",)
                    cmd.Parameters.AddWithValue("@Impuesto3", 0.0)
                    'cmd.Parameters.AddWithValue("@Impuesto4",)
                    cmd.Parameters.AddWithValue("@Impuesto4", 0.0)
                    'cmd.Parameters.AddWithValue("@CantidadPedido", 1.0)
                    cmd.Parameters.AddWithValue("@CantidadPedido", cantidad)
                    'cmd.Parameters.AddWithValue("@CostoPedido", 1000.0)
                    cmd.Parameters.AddWithValue("@CostoPedido", subtotal_req)
                    'cmd.Parameters.AddWithValue("@PartidaPresupuestal", "2016-15.006.0008.A.500003-01-02-2.3.1.1.1.1-09")
                    cmd.Parameters.AddWithValue("@PartidaPresupuestal", partidapresu)
                    'cmd.Parameters.AddWithValue("@IdTransaccionPedido", "0000000033")
                    cmd.Parameters.AddWithValue("@IdTransaccionPedido", cod_trans)
                    'cmd.Parameters.AddWithValue("@IdTransaccionOrden,)
                    cmd.Parameters.AddWithValue("@IdTransaccionOrden", "")
                    'cmd.Parameters.AddWithValue("@IdCuentaContable", "252501")
                    cmd.Parameters.AddWithValue("@IdCuentaContable", cod_ctacontab)
                    'cmd.Parameters.AddWithValue("@IdAlmacen", "000002")
                    cmd.Parameters.AddWithValue("@IdAlmacen", cod_almac)
                    'cmd.Parameters.AddWithValue("@AudUsuario", "0050")
                    'cmd.Parameters.AddWithValue("@AudUsuario", Session("userid"))
                    cmd.Parameters.AddWithValue("@AudUsuario", IdUsuario)
                    'cmd.Parameters.AddWithValue("@ValorVenta", 1000.0)
                    cmd.Parameters.AddWithValue("@ValorVenta", subtotal_req)
                    'cmd.Parameters.AddWithValue("@ValorVentaPedido", 1000.0)
                    cmd.Parameters.AddWithValue("@ValorVentaPedido", subtotal_req)
                    'cmd.Parameters.AddWithValue("@NumeroAutorizar",)
                    cmd.Parameters.AddWithValue("@NumeroAutorizar", "")
                    'cmd.Parameters.AddWithValue("@Insertar",)
                    cmd.Parameters.AddWithValue("@Insertar", "I")
                    'cmd.Parameters.AddWithValue("@Mensaje,)
                    cmd.Parameters.AddWithValue("@Mensaje", "")
                    'cmd.Parameters.AddWithValue("@GuiaReintegro,)
                    cmd.Parameters.AddWithValue("@GuiaReintegro", "")
                    'cmd.Parameters.AddWithValue("@Observacion1,)
                    cmd.Parameters.AddWithValue("@Observacion1", "")
                    'cmd.Parameters.AddWithValue("@Observacion2,)
                    cmd.Parameters.AddWithValue("@Observacion2", "")
                    'cmd.Parameters.AddWithValue("@Observacion3,)
                    cmd.Parameters.AddWithValue("@Observacion3", "")
                    cmd.CommandTimeout = 500

                    cmd.ExecuteNonQuery()

                End Using
                Return (1)
            End Using
        Catch ex As Exception
            Return ("Insertar Detalle Requerimiento Orden de Compra..." & ex.Message)
        End Try
    End Function

    'EXPEDIENTE SIAF COMPROMISO
    <OperationContract()> _
    <WebInvoke(Method:="POST", ResponseFormat:=WebMessageFormat.Json)> _
    Public Function InsertarExpedienteSiafCompromiso(ByVal empresa As String, ByVal IdOrdenCompra As String, ByVal IdRequerimiento As String, ByVal CompraServicio As String, ByVal BienServicio As String) As String
        Try
            Using conn As New SqlConnection()
                Dim cx As String = ""

                If empresa = 5 Then
                    cx = "cnSiaf"
                End If

                conn.ConnectionString = ConfigurationManager.ConnectionStrings(cx).ConnectionString

                Using cmd As New SqlCommand()
                    conn.Open()
                    cmd.Connection = conn
                    cmd.CommandText = "SP_LOG_NewSiafCompromiso"
                    cmd.CommandType = CommandType.StoredProcedure

                    cmd.Parameters.AddWithValue("@IdOrdenCompra", IdOrdenCompra)
                    cmd.Parameters.AddWithValue("@IdRequerimiento", IdRequerimiento)
                    cmd.Parameters.AddWithValue("@CompraServicio", CompraServicio)
                    cmd.Parameters.AddWithValue("@BienServicio", BienServicio)
                    cmd.CommandTimeout = 500

                    cmd.ExecuteNonQuery()

                End Using
                Return (1)
            End Using
        Catch ex As Exception
            Return ("Insertar Expediente Siaf Compromiso..." & ex.Message)
        End Try
    End Function

    'ACTUALIZAR VALOR VENTA Y IMPUESTO
    <OperationContract()> _
    <WebInvoke(Method:="POST", ResponseFormat:=WebMessageFormat.Json)> _
    Public Function ActualizarValorImpuestoOrdenes(ByVal empresa As String, ByVal CompraServicio As String) As String

        Dim anno As String = Year(Now)
        Dim mes As String = Month(Now)

        If mes < 10 Then
            mes = "0" + mes
        End If

        Try
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
                ElseIf empresa = 5 Then
                    cx = "cnSiaf"
                End If

                conn.ConnectionString = ConfigurationManager.ConnectionStrings(cx).ConnectionString

                Using cmd As New SqlCommand()
                    conn.Open()
                    cmd.Connection = conn
                    cmd.CommandText = "SP_LOG_ActualizarOrdenValorImp"
                    cmd.CommandType = CommandType.StoredProcedure

                    cmd.Parameters.AddWithValue("@IdAnno", anno)
                    cmd.Parameters.AddWithValue("@IdMes", mes)
                    cmd.Parameters.AddWithValue("@CompraServicio", CompraServicio)
                    cmd.CommandTimeout = 500

                    cmd.ExecuteNonQuery()

                End Using
                Return (1)
            End Using
        Catch ex As Exception
            Return ("Insertar Expediente Siaf Compromiso..." & ex.Message)
        End Try
    End Function

    'ACTUALIZAR IMPUESTO
    <OperationContract()> _
    <WebInvoke(Method:="POST", ResponseFormat:=WebMessageFormat.Json)> _
    Public Function ActualizarImpuestoOrdenes(ByVal IdOrdenCompra As String, ByVal CompraServicio As String, ByVal IdTipoDocumento As String, ByVal empresa As String) As String

        Dim anno As String = Year(Now)
        Dim mes As String = Month(Now)

        If mes < 10 Then
            mes = "0" + mes
        End If

        Try
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
                ElseIf empresa = 5 Then
                    cx = "cnSiaf"
                End If

                conn.ConnectionString = ConfigurationManager.ConnectionStrings(cx).ConnectionString

                Using cmd As New SqlCommand()
                    conn.Open()
                    cmd.Connection = conn
                    cmd.CommandText = "SP_LOG_ActualizarOrdenImp"
                    cmd.CommandType = CommandType.StoredProcedure

                    cmd.Parameters.AddWithValue("@IdOrdenCompra", IdOrdenCompra)
                    cmd.Parameters.AddWithValue("@CompraServicio", CompraServicio)
                    cmd.Parameters.AddWithValue("@IdAnno", anno)
                    cmd.Parameters.AddWithValue("@IdMes", mes)
                    cmd.Parameters.AddWithValue("@IdTipoDocumento", IdTipoDocumento)
                    cmd.Parameters.AddWithValue("@IdEmpresa", empresa)
                    cmd.CommandTimeout = 500

                    cmd.ExecuteNonQuery()

                End Using
                Return (1)
            End Using
        Catch ex As Exception
            Return ("Insertar Expediente Siaf Compromiso..." & ex.Message)
        End Try
    End Function

    'ACTUALIZAR SALDO COSTO REQUERIMIENTO DETALLE
    <OperationContract()> _
    <WebInvoke(Method:="POST", ResponseFormat:=WebMessageFormat.Json)> _
    Public Function ActualizarSaldoCostoRequer(ByVal IdRequerimiento As String, ByVal SubTotal As String, ByVal CompraServicio As String, ByVal empresa As String) As String

        Try
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
                ElseIf empresa = 5 Then
                    cx = "cnSiaf"
                End If

                conn.ConnectionString = ConfigurationManager.ConnectionStrings(cx).ConnectionString

                Using cmd As New SqlCommand()
                    conn.Open()
                    cmd.Connection = conn
                    cmd.CommandText = "SP_LOG_ActualizarCostoRequer"
                    cmd.CommandType = CommandType.StoredProcedure

                    cmd.Parameters.AddWithValue("@IdRequerimiento", IdRequerimiento)
                    cmd.Parameters.AddWithValue("@SubTotal", SubTotal)
                    cmd.Parameters.AddWithValue("@CompraServicio", CompraServicio)

                    cmd.ExecuteNonQuery()

                End Using
                Return (1)
            End Using
        Catch ex As Exception
            Return ("Actualizar SaldoCosto Requerimientos..." & ex.Message)
        End Try
    End Function

    'ACTUALIZAR SALDO CANTIDAD REQUERIMIENTO DETALLE
    <OperationContract()> _
    <WebInvoke(Method:="POST", ResponseFormat:=WebMessageFormat.Json)> _
    Public Function ActualizarSaldoCantidadRequer(ByVal IdRequerimiento As String, ByVal IdNumeroItem As String, ByVal Cantidad As String, ByVal CompraServicio As String, ByVal empresa As String) As String

        Try
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
                ElseIf empresa = 5 Then
                    cx = "cnSiaf"
                End If

                conn.ConnectionString = ConfigurationManager.ConnectionStrings(cx).ConnectionString

                Using cmd As New SqlCommand()
                    conn.Open()
                    cmd.Connection = conn
                    cmd.CommandText = "SP_LOG_ActualizarSaldoCantidad"
                    cmd.CommandType = CommandType.StoredProcedure

                    cmd.Parameters.AddWithValue("@IdRequerimiento", IdRequerimiento)
                    cmd.Parameters.AddWithValue("@IdNumeroItem", IdNumeroItem)
                    cmd.Parameters.AddWithValue("@Cantidad", Cantidad)
                    cmd.Parameters.AddWithValue("@CompraServicio", CompraServicio)

                    cmd.ExecuteNonQuery()

                End Using
                Return (1)
            End Using
        Catch ex As Exception
            Return ("Actualizar SaldoCosto Requerimientos..." & ex.Message)
        End Try
    End Function

    'ACTUALIZAR SALDO CANTIDAD REQUERIMIENTO
    <OperationContract()> _
    <WebInvoke(Method:="POST", ResponseFormat:=WebMessageFormat.Json)> _
    Public Function ActualizarSaldoCantidadCostoRequer(ByVal IdRequerimiento As String, ByVal empresa As String) As String

        Try
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
                ElseIf empresa = 5 Then
                    cx = "cnSiaf"
                End If

                conn.ConnectionString = ConfigurationManager.ConnectionStrings(cx).ConnectionString

                Using cmd As New SqlCommand()
                    conn.Open()
                    cmd.Connection = conn
                    cmd.CommandText = "SP_LOG_ActualizarSaldoCantidadCosto"
                    cmd.CommandType = CommandType.StoredProcedure

                    cmd.Parameters.AddWithValue("@IdRequerimiento", IdRequerimiento)

                    cmd.ExecuteNonQuery()

                End Using
                Return (1)
            End Using
        Catch ex As Exception
            Return ("Actualizar SaldoCosto Requerimientos..." & ex.Message)
        End Try
    End Function

    'ACTUALIZAR SALDO CANTIDAD y SALDO COSTO REQUERIMIENTO
    <OperationContract()> _
    <WebInvoke(Method:="POST", ResponseFormat:=WebMessageFormat.Json)> _
    Public Function ActualizarSaldoCantidadyCostoRequer(ByVal CompraServicio As String, ByVal empresa As String) As String

        Try
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
                ElseIf empresa = 5 Then
                    cx = "cnSiaf"
                End If

                conn.ConnectionString = ConfigurationManager.ConnectionStrings(cx).ConnectionString

                Using cmd As New SqlCommand()
                    conn.Open()
                    cmd.Connection = conn
                    cmd.CommandText = "SP_ActualizarSaldoCantidadySaldoCostoReq"
                    cmd.CommandType = CommandType.StoredProcedure

                    cmd.Parameters.AddWithValue("@CompraServicio", "S")

                    cmd.ExecuteNonQuery()

                End Using
                Return (1)
            End Using
        Catch ex As Exception
            Return ("Actualizar SaldoCosto Requerimientos..." & ex.Message)
        End Try
    End Function

    'ACTUALIZAR SALDO CANTIDAD y SALDO COSTO REQUERIMIENTO ELIMINAR
    <OperationContract()> _
    <WebInvoke(Method:="POST", ResponseFormat:=WebMessageFormat.Json)> _
    Public Function ActualizarSaldoCantidadyCostoRequer_Eliminar(ByVal IdOrdenCompra As String, ByVal CompraServicio As String, ByVal empresa As String) As String

        Try
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
                ElseIf empresa = 5 Then
                    cx = "cnSiaf"
                End If

                conn.ConnectionString = ConfigurationManager.ConnectionStrings(cx).ConnectionString

                Using cmd As New SqlCommand()
                    conn.Open()
                    cmd.Connection = conn
                    cmd.CommandText = "SP_ActualizarSaldoCantidadySaldoCostoReq_Eliminar"
                    cmd.CommandType = CommandType.StoredProcedure

                    cmd.Parameters.AddWithValue("@IdOrdenCompra", IdOrdenCompra)
                    cmd.Parameters.AddWithValue("@CompraServicio", CompraServicio)

                    cmd.ExecuteNonQuery()

                End Using
                Return (1)
            End Using
        Catch ex As Exception
            Return ("Actualizar SaldoCosto Requerimientos Eliminar..." & ex.Message)
        End Try
    End Function

    'ACTUALIZAR CENTRO COSTO Y REQUERIMIENTO
    <OperationContract()> _
    <WebInvoke(Method:="POST", ResponseFormat:=WebMessageFormat.Json)> _
    Public Function ActualizarCCyReq(ByVal CompraServicio As String, ByVal empresa As String) As String

        Try
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
                ElseIf empresa = 5 Then
                    cx = "cnSiaf"
                End If

                conn.ConnectionString = ConfigurationManager.ConnectionStrings(cx).ConnectionString

                Using cmd As New SqlCommand()
                    conn.Open()
                    cmd.Connection = conn
                    cmd.CommandText = "SP_ActCCReqOCOS"
                    cmd.CommandType = CommandType.StoredProcedure

                    cmd.Parameters.AddWithValue("@CompraServicio", CompraServicio)

                    cmd.ExecuteNonQuery()

                End Using
                Return (1)
            End Using
        Catch ex As Exception
            Return ("Actualizar SaldoCosto Requerimientos Eliminar..." & ex.Message)
        End Try
    End Function

    'ACTUALIZAR FECHA ORDENES
    <OperationContract()> _
    <WebInvoke(Method:="POST", ResponseFormat:=WebMessageFormat.Json)> _
    Public Function ActualizarFechaOrdenes(ByVal IdTipoDoc As String, ByVal CompraServicio As String, ByVal empresa As String) As String

        Try
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
                ElseIf empresa = 5 Then
                    cx = "cnSiaf"
                End If

                conn.ConnectionString = ConfigurationManager.ConnectionStrings(cx).ConnectionString

                Using cmd As New SqlCommand()
                    conn.Open()
                    cmd.Connection = conn
                    cmd.CommandText = "SP_LOG_ActualizarFechaOrdenes"
                    cmd.CommandType = CommandType.StoredProcedure

                    cmd.Parameters.AddWithValue("@IdTipoDoc", IdTipoDoc)
                    cmd.Parameters.AddWithValue("@CompraServicio", CompraServicio)

                    cmd.ExecuteNonQuery()

                End Using
                Return (1)
            End Using
        Catch ex As Exception
            Return ("Actualizar Fecha Ordenes..." & ex.Message)
        End Try
    End Function

    'ACTUALIZAR FECHA ACEPTACION LOCADORES
    <OperationContract()> _
    <WebInvoke(Method:="POST", ResponseFormat:=WebMessageFormat.Json)> _
    Public Function ActualizarFechaAceptLocadores(ByVal IdOrdenCompra As String, ByVal CompraServicio As String, ByVal IdProveedor As String, ByVal empresa As String) As String

        Try
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
                ElseIf empresa = 5 Then
                    cx = "cnSiaf"
                End If

                conn.ConnectionString = ConfigurationManager.ConnectionStrings(cx).ConnectionString

                Using cmd As New SqlCommand()
                    conn.Open()
                    cmd.Connection = conn
                    cmd.CommandText = "SP_LOG_ActuFechaAceptacion"
                    cmd.CommandType = CommandType.StoredProcedure

                    cmd.Parameters.AddWithValue("@IdOrdenCompra", IdOrdenCompra)
                    cmd.Parameters.AddWithValue("@CompraServicio", CompraServicio)
                    cmd.Parameters.AddWithValue("@IdProveedor", IdProveedor)
                    cmd.CommandTimeout = 500

                    cmd.ExecuteNonQuery()

                End Using
                Return (1)
            End Using
        Catch ex As Exception
            Return ("Actualizar Fecha Ordenes..." & ex.Message)
        End Try
    End Function

    'ACTUALIZAR IMPUESTO ORDENES
    <OperationContract()> _
    <WebInvoke(Method:="POST", ResponseFormat:=WebMessageFormat.Json)> _
    Public Function ActualizarImpuesto(ByVal empresa As String, ByVal CompraServicio As String) As String

        Try
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
                ElseIf empresa = 5 Then
                    cx = "cnSiaf"
                End If

                conn.ConnectionString = ConfigurationManager.ConnectionStrings(cx).ConnectionString

                Using cmd As New SqlCommand()
                    conn.Open()
                    cmd.Connection = conn
                    cmd.CommandText = "SP_ActualizarImpuesto"
                    cmd.CommandType = CommandType.StoredProcedure

                    cmd.Parameters.AddWithValue("@IdEmpresa", empresa)
                    cmd.Parameters.AddWithValue("@CompraServicio", CompraServicio)

                    cmd.ExecuteNonQuery()

                End Using
                Return (1)
            End Using
        Catch ex As Exception
            Return ("Actualizar Fecha Ordenes..." & ex.Message)
        End Try
    End Function

    'ACTUALIZAR SALDOCOSTO
    <OperationContract()> _
    <WebInvoke(Method:="POST", ResponseFormat:=WebMessageFormat.Json)> _
    Public Function ActualizarSaldoCosto(ByVal IdOrdenCompra As String, ByVal CompraServicio As String, ByVal empresa As String) As String

        Try
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
                ElseIf empresa = 5 Then
                    cx = "cnSiaf"
                End If

                conn.ConnectionString = ConfigurationManager.ConnectionStrings(cx).ConnectionString

                Using cmd As New SqlCommand()
                    conn.Open()
                    cmd.Connection = conn
                    cmd.CommandText = "SP_LOG_ActualizarSaldoCostoReq"
                    cmd.CommandType = CommandType.StoredProcedure

                    cmd.Parameters.AddWithValue("@IdOrdenCompra", IdOrdenCompra)
                    cmd.Parameters.AddWithValue("@CompraServicio", CompraServicio)

                    cmd.ExecuteNonQuery()

                End Using
                Return (1)
            End Using
        Catch ex As Exception
            Return ("Actualizar Fecha Ordenes..." & ex.Message)
        End Try
    End Function

    <OperationContract()> _
<WebInvoke(Method:="POST", ResponseFormat:=WebMessageFormat.Json)> _
    Public Function cabeceramodifOrdenCompraoServicio(ByVal IdOrdenCompra As String, ByVal IdRequerimiento As String, ByVal CompraServicio As String, ByVal empresa As String) As String
        Try
            Dim cabecorden As New List(Of Object)()
            Using con As New SqlConnection()
                Dim cx As String = ""

                If empresa = 1 Then
                    cx = "cnEmape"
                ElseIf empresa = 2 Then
                    cx = "cnEmapeMunicipal"
                ElseIf empresa = 3 Then
                    cx = "cnRegional"
                ElseIf empresa = 4 Then
                    cx = "cnMantenimiento"
                ElseIf empresa = 5 Then
                    cx = "cnSiaf"
                End If

                con.ConnectionString = ConfigurationManager.ConnectionStrings(cx).ConnectionString
                Using cmd As New SqlCommand()

                    cmd.CommandText = "SP_LOG_CabeceraModifOrden"
                    cmd.CommandType = CommandType.StoredProcedure
                    'cmd.Parameters.AddWithValue("@fechaactual", DateTime.Now)
                    cmd.Parameters.AddWithValue("@IdOrdenCompra", IdOrdenCompra)
                    cmd.Parameters.AddWithValue("@IdRequerimiento", IdRequerimiento)
                    cmd.Parameters.AddWithValue("@CompraServicio", CompraServicio)

                    cmd.Connection = con

                    con.Open()
                    Using sdr As SqlDataReader = cmd.ExecuteReader()
                        While sdr.Read()

                            cabecorden.Add(New With { _
                                Key .Fecha = sdr("Fecha"), _
                                Key .PlazoEntrega = sdr("PlazoEntrega"), _
                                Key .IdFormaPago = sdr("IdFormaPago"), _
                                Key .IdTipoDocumento = sdr("IdTipoDocumento"), _
                                Key .IdProveedor = sdr("IdProveedor"), _
                                Key .FlagDiaHabil = sdr("FlagDiaHabil"), _
                                Key .TipoCambio = Format(sdr("TipoCambio"), "##,##0.000"), _
                                Key .Descripcion = sdr("Descripcion"), _
                                Key .FechaOrdenCompra = Format(sdr("FechaOrdenCompra"), "yyyyMMdd"), _
                                Key .ValorVenta = sdr("ValorVenta"), _
                                Key .Impuesto1 = sdr("Impuesto1"), _
                                Key .Tasa1 = sdr("Tasa1"), _
                                Key .CantidadTotal = sdr("CantidadTotal") _
                            })
                        End While
                    End Using
                    con.Close()
                End Using
                Return (New JavaScriptSerializer().Serialize(cabecorden))
            End Using

        Catch ex As Exception
            Return "error"
        End Try
    End Function

    <OperationContract()> _
<WebInvoke(Method:="POST", ResponseFormat:=WebMessageFormat.Json)> _
    Public Function detallemodifOrden(ByVal IdOrdenCompra As String, ByVal IdRequerimiento As String, ByVal BienServicio As String, ByVal CompraServicio As String, ByVal empresa As String) As String
        Try
            Dim detorden As New List(Of Object)()
            Using con As New SqlConnection()
                Dim cx As String = ""

                If empresa = 1 Then
                    cx = "cnEmape"
                ElseIf empresa = 2 Then
                    cx = "cnEmapeMunicipal"
                ElseIf empresa = 3 Then
                    cx = "cnRegional"
                ElseIf empresa = 4 Then
                    cx = "cnMantenimiento"
                ElseIf empresa = 5 Then
                    cx = "cnSiaf"
                End If

                con.ConnectionString = ConfigurationManager.ConnectionStrings(cx).ConnectionString
                Using cmd As New SqlCommand()

                    cmd.CommandText = "SP_LOG_DetalleModifOrden"
                    cmd.CommandType = CommandType.StoredProcedure
                    cmd.Parameters.AddWithValue("@IdOrdenCompra", IdOrdenCompra)
                    cmd.Parameters.AddWithValue("@IdRequerimiento", IdRequerimiento)
                    cmd.Parameters.AddWithValue("@BienServicio", BienServicio)
                    cmd.Parameters.AddWithValue("@Idanno", Year(Now))
                    cmd.Parameters.AddWithValue("@CompraServicio", CompraServicio)

                    cmd.Connection = con

                    con.Open()
                    Using sdr As SqlDataReader = cmd.ExecuteReader()
                        While sdr.Read()

                            detorden.Add(New With { _
                                Key .CostoItem = sdr("CostoItem"), _
                                Key .Cantidad = sdr("Cantidad") _
                            })
                        End While
                    End Using
                    con.Close()
                End Using
                Return (New JavaScriptSerializer().Serialize(detorden))
            End Using

        Catch ex As Exception
            Return "error"
        End Try
    End Function

    <OperationContract()> _
<WebInvoke(Method:="POST", ResponseFormat:=WebMessageFormat.Json)> _
    Public Function listarModificarRequerimiento(ByVal IdOrdenCompra As String, ByVal CompraServicio As String, ByVal empresa As String) As String

        Dim mofificarrequerimiento As New List(Of Object)()
        Using conn As New SqlConnection()
            Dim cx As String = ""

            If empresa = 1 Then
                cx = "cnEmape"
            ElseIf empresa = 2 Then
                cx = "cnEmapeMunicipal"
            ElseIf empresa = 3 Then
                cx = "cnRegional"
            ElseIf empresa = 4 Then
                cx = "cnMantenimientoVial"
            ElseIf empresa = 5 Then
                cx = "cnSiaf"
            End If

            conn.ConnectionString = ConfigurationManager.ConnectionStrings(cx).ConnectionString
            Using cmd As New SqlCommand()

                cmd.CommandText = "SP_ModificarOrden"
                cmd.CommandType = CommandType.StoredProcedure

                cmd.Parameters.AddWithValue("@IdOrdenCompra", IdOrdenCompra)
                cmd.Parameters.AddWithValue("@CompraServicio", CompraServicio)
                cmd.Parameters.AddWithValue("@IdAnno", Year(Now))

                cmd.Connection = conn
                conn.Open()
                Using sdr As SqlDataReader = cmd.ExecuteReader()
                    While sdr.Read()

                        mofificarrequerimiento.Add(New With { _
                         Key .IdRequerimiento = sdr("IdRequerimiento"), _
                         Key .Descripcion = sdr("Descripcion"), _
                         Key .FechaRequerimiento = sdr("FechaRequerimiento"), _
                         Key .DescripCentroCosto = sdr("DescripCentroCosto"), _
                         Key .SaldoSubTotal = Format(sdr("SaldoSubTotal"), "###0.00") _
                        })
                    End While
                End Using
                conn.Close()
            End Using
            Return (New JavaScriptSerializer().Serialize(mofificarrequerimiento))
        End Using
    End Function


    '    <OperationContract()> _
    '<WebInvoke(Method:="POST", ResponseFormat:=WebMessageFormat.Json)> _
    '    Public Function listarModificarRequerimiento(ByVal IdOrdenCompra As String, ByVal BienServicio As String, ByVal empresa As String) As String

    '        Dim mofificarrequerimiento As New List(Of Object)()
    '        Using conn As New SqlConnection()
    '            Dim cx As String = ""

    '            If empresa = 1 Then
    '                cx = "cnEmape"
    '            ElseIf empresa = 2 Then
    '                cx = "cnEmapeMunicipal"
    '            ElseIf empresa = 3 Then
    '                cx = "cnRegional"
    '            ElseIf empresa = 4 Then
    '                cx = "cnMantenimientoVial"
    '            ElseIf empresa = 5 Then
    '                cx = "cnSiaf"
    '            End If

    '            conn.ConnectionString = ConfigurationManager.ConnectionStrings(cx).ConnectionString
    '            Using cmd As New SqlCommand()

    '                cmd.CommandText = "SP_LOG_ModificarOrden"
    '                cmd.CommandType = CommandType.StoredProcedure

    '                cmd.Parameters.AddWithValue("@IdOrdenCompra", IdOrdenCompra)
    '                cmd.Parameters.AddWithValue("@BienServicio", BienServicio)
    '                cmd.Parameters.AddWithValue("@idanno", Year(Now))

    '                cmd.Connection = conn
    '                conn.Open()
    '                Using sdr As SqlDataReader = cmd.ExecuteReader()
    '                    While sdr.Read()

    '                        mofificarrequerimiento.Add(New With { _
    '                         Key .IdRequerimiento = sdr("IdRequerimiento"), _
    '                         Key .Descripcion = sdr("Descripcion"), _
    '                         Key .FechaRequerimiento = Format(sdr("FechaRequerimiento"), "dd/MM/yyyy"), _
    '                         Key .DescripCentroCosto = sdr("DescripCentroCosto"), _
    '                         Key .SaldoSubTotal = Format(sdr("SaldoSubTotal"), "###0.00") _
    '                        })
    '                    End While
    '                End Using
    '                conn.Close()
    '            End Using
    '            Return (New JavaScriptSerializer().Serialize(mofificarrequerimiento))
    '        End Using
    '    End Function

    <OperationContract()> _
<WebInvoke(Method:="POST", ResponseFormat:=WebMessageFormat.Json)> _
    Public Function listarModificarDetalleRequerimientoI(ByVal IdOrdenCompra As String, ByVal CompraServicio As String, ByVal empresa As String) As String

        Dim modificarordendetalle As New List(Of Object)()
        Using conn As New SqlConnection()
            Dim cx As String = ""

            If empresa = 1 Then
                cx = "cnEmape"
            ElseIf empresa = 2 Then
                cx = "cnEmapeMunicipal"
            ElseIf empresa = 3 Then
                cx = "cnRegional"
            ElseIf empresa = 4 Then
                cx = "cnMantenimientoVial"
            ElseIf empresa = 5 Then
                cx = "cnSiaf"
            End If

            conn.ConnectionString = ConfigurationManager.ConnectionStrings(cx).ConnectionString
            Using cmd As New SqlCommand()

                cmd.CommandText = "SP_ModificarOrdenDetalleI"
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.AddWithValue("@IdOrdenCompra", IdOrdenCompra)
                cmd.Parameters.AddWithValue("@CompraServicio", CompraServicio)
                cmd.Parameters.AddWithValue("@IdAnno", Year(Now))

                cmd.Connection = conn
                conn.Open()
                Using sdr As SqlDataReader = cmd.ExecuteReader()
                    While sdr.Read()
                        modificarordendetalle.Add(New With { _
                         Key .IdOrdenCompra = sdr("IdOrdenCompra"), _
                         Key .IdRequerimiento = sdr("IdRequerimiento"), _
                         Key .NumeroItemRequerimiento = sdr("NumeroItemRequerimiento"), _
                         Key .IdBienServicio = sdr("IdBienServicio"), _
                         Key .Descripcion = sdr("Descripcion"), _
                         Key .IdCorrelativoBienServicio = sdr("IdCorrelativoBienServicio"), _
                         Key .IdCentroCosto = sdr("IdCentroCosto"), _
                         Key .Siglas = sdr("Siglas"), _
                         Key .Cantidad = sdr("Cantidad"), _
                         Key .Costo = sdr("Costo"), _
                         Key .SubTotal = sdr("SubTotal"), _
                         Key .IdUnidadMedida = sdr("IdUnidadMedida"), _
                         Key .UM = sdr("UM") _
                        })
                    End While
                End Using
                conn.Close()
            End Using
            Return (New JavaScriptSerializer().Serialize(modificarordendetalle))
        End Using
    End Function

    '    <OperationContract()> _
    '<WebInvoke(Method:="POST", ResponseFormat:=WebMessageFormat.Json)> _
    '    Public Function listarModificarDetalleRequerimientoI(ByVal IdOrdenCompra As String, ByVal IdRequerimiento As String, ByVal BienServicio As String, ByVal TipoDoc As String, ByVal empresa As String) As String
    '        'Dim Cantidad As String
    '        Dim Costo As String
    '        Dim MontoReser As String
    '        Dim SaldoReser As String
    '        Dim SubTotal As String
    '        Dim modificarordendetalle As New List(Of Object)()
    '        Using conn As New SqlConnection()
    '            Dim cx As String = ""

    '            If empresa = 1 Then
    '                cx = "cnEmape"
    '            ElseIf empresa = 2 Then
    '                cx = "cnEmapeMunicipal"
    '            ElseIf empresa = 3 Then
    '                cx = "cnRegional"
    '            ElseIf empresa = 4 Then
    '                cx = "cnMantenimientoVial"
    '            ElseIf empresa = 5 Then
    '                cx = "cnSiaf"
    '            End If

    '            conn.ConnectionString = ConfigurationManager.ConnectionStrings(cx).ConnectionString
    '            Using cmd As New SqlCommand()

    '                cmd.CommandText = "SP_LOG_ModificarOrdenDetalleI"
    '                cmd.CommandType = CommandType.StoredProcedure
    '                cmd.Parameters.AddWithValue("@IdOrdenCompra", IdOrdenCompra)
    '                cmd.Parameters.AddWithValue("@IdRequerimiento", IdRequerimiento)
    '                cmd.Parameters.AddWithValue("@BienServicio", BienServicio)
    '                cmd.Parameters.AddWithValue("@Idanno", Year(Now))
    '                cmd.Parameters.AddWithValue("@TipoDoc", TipoDoc)

    '                cmd.Connection = conn
    '                conn.Open()
    '                Using sdr As SqlDataReader = cmd.ExecuteReader()
    '                    While sdr.Read()

    '                        'If (IsDBNull(sdr("SaldoCantidad"))) Then
    '                        '    Cantidad = "0"
    '                        'Else
    '                        '    Cantidad = Format(sdr("SaldoCantidad"), "###0.00")
    '                        'End If

    '                        If (IsDBNull(sdr("CostoItem"))) Then
    '                            Costo = "0.00"
    '                        Else
    '                            Costo = Format(sdr("CostoItem"), "###0.00")
    '                        End If

    '                        If (IsDBNull(sdr("MontoAReservarActual"))) Then
    '                            MontoReser = "0.00"
    '                        Else
    '                            MontoReser = Format(sdr("MontoAReservarActual"), "###0.00")
    '                        End If

    '                        If (IsDBNull(sdr("SaldoReservaActual"))) Then
    '                            SaldoReser = "0.00"
    '                        Else
    '                            SaldoReser = Format(sdr("SaldoReservaActual"), "###0.00")
    '                        End If

    '                        If (IsDBNull(sdr("SaldoSubTotal"))) Then
    '                            SubTotal = "0.00"
    '                        Else
    '                            SubTotal = Format(sdr("SaldoSubTotal"), "###0.00")
    '                        End If


    '                        modificarordendetalle.Add(New With { _
    '                         Key .IdCentroCosto = sdr("IdCentroCosto"), _
    '                         Key .PartidaPresupuestal = sdr("PartidaPresupuestal"), _
    '                         Key .IdTransaccion = sdr("IdTransaccion"), _
    '                         Key .IdCuentaContable = sdr("IdCuentaContable"), _
    '                         Key .IdAlmacen = sdr("IdAlmacen"), _
    '                         Key .IdRequerimiento = sdr("IdRequerimiento"), _
    '                         Key .IdNumeroItem = sdr("IdNumeroItem"), _
    '                         Key .IdBienServicio = sdr("IdBienServicio"), _
    '                         Key .UM = sdr("UM"), _
    '                         Key .IdUnidadMedida = sdr("IdUnidadMedida"), _
    '                         Key .Descripcion = sdr("Descripcion"), _
    '                         Key .Siglas = sdr("Siglas"), _
    '                         Key .Clasificador = sdr("Clasificador"), _
    '                         Key .Actividad = sdr("Actividad"), _
    '                         Key .IdFinalidad = sdr("IdFinalidad"), _
    '                         Key .Meta = sdr("Meta"), _
    '                         Key .SaldoCantidad = IIf(IsDBNull(sdr("SaldoCantidad")), 0.0, sdr("SaldoCantidad")), _
    '                         Key .CostoItem = Costo, _
    '                         Key .CostoItemOpe = sdr("CostoItem"), _
    '                         Key .MontoAReservarActual = MontoReser, _
    '                         Key .SaldoReservaActual = SaldoReser, _
    '                         Key .SaldoSubTotal = SubTotal _
    '                        })
    '                    End While
    '                End Using
    '                conn.Close()
    '            End Using
    '            Return (New JavaScriptSerializer().Serialize(modificarordendetalle))
    '        End Using
    '    End Function

    <OperationContract()> _
<WebInvoke(Method:="POST", ResponseFormat:=WebMessageFormat.Json)> _
    Public Function listarModificarDetalleRequerimientoII(ByVal IdOrdenCompra As String, ByVal CompraServicio As String, ByVal BienServicio As String, ByVal Idanno As String, ByVal IdMes As String, ByVal empresa As String) As String

        'Dim Cantidad As String
        'Dim Costo As String
        'Dim MontoReser As String
        'Dim SaldoReser As String
        'Dim SubTotal As String
        Dim requexordenes As New List(Of Object)()

        Using conn As New SqlConnection()
            Dim cx As String = ""

            If empresa = 1 Then
                cx = "cnEmape"
            ElseIf empresa = 2 Then
                cx = "cnEmapeMunicipal"
            ElseIf empresa = 3 Then
                cx = "cnRegional"
            ElseIf empresa = 4 Then
                cx = "cnMantenimientoVial"
            ElseIf empresa = 5 Then
                cx = "cnSiaf"
            End If

            conn.ConnectionString = ConfigurationManager.ConnectionStrings(cx).ConnectionString
            Using cmd As New SqlCommand()

                cmd.CommandText = "SP_LOG_REQUERXORDENES"
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.AddWithValue("@IdOrdenCompra", IdOrdenCompra)
                cmd.Parameters.AddWithValue("@CompraServicio", CompraServicio)
                cmd.Parameters.AddWithValue("@BienServicio", BienServicio)
                cmd.Parameters.AddWithValue("@IdAnno", Idanno)
                cmd.Parameters.AddWithValue("@IdMes", IdMes)

                cmd.Connection = conn
                conn.Open()
                Using sdr As SqlDataReader = cmd.ExecuteReader()
                    While sdr.Read()

                        'If (IsDBNull(sdr("SaldoCantidad"))) Then
                        '    Cantidad = "0"
                        'Else
                        '    Cantidad = Format(sdr("SaldoCantidad"), "###0.00")
                        'End If

                        'If (IsDBNull(sdr("CostoItem"))) Then
                        '    Costo = "0.00"
                        'Else
                        '    Costo = Format(sdr("CostoItem"), "###0.00")
                        'End If

                        'If (IsDBNull(sdr("MontoAReservarActual"))) Then
                        '    MontoReser = "0.00"
                        'Else
                        '    MontoReser = Format(sdr("MontoAReservarActual"), "###0.00")
                        'End If

                        'If (IsDBNull(sdr("SaldoReservaActual"))) Then
                        '    SaldoReser = "0.00"
                        'Else
                        '    SaldoReser = Format(sdr("SaldoReservaActual"), "###0.00")
                        'End If

                        'If (IsDBNull(sdr("SaldoSubTotal"))) Then
                        '    SubTotal = "0.00"
                        'Else
                        '    SubTotal = Format(sdr("SaldoSubTotal"), "###0.00")
                        'End If

                        requexordenes.Add(New With { _
                         Key .IdRequerimiento = sdr("IdRequerimiento"), _
                         Key .IdNumeroItem = sdr("IdNumeroItem"), _
                         Key .IdBienServicio = sdr("IdBienServicio"), _
                         Key .DescripcionCorta = sdr("DescripcionCorta"), _
                         Key .Descripcion = sdr("Descripcion"), _
                         Key .Siglas = sdr("Siglas"), _
                         Key .Clasificador = sdr("Clasificador"), _
                         Key .Actividad = sdr("Actividad"), _
                         Key .IdFinalidad = sdr("IdFinalidad"), _
                         Key .Meta = sdr("Meta"), _
                         Key .Cantidad = sdr("Cantidad"), _
                         Key .Costo = sdr("Costo"), _
                         Key .SubTotal = sdr("SubTotal"), _
                         Key .MontoAReservarActual = sdr("MontoAReservarActual"), _
                         Key .SaldoReservaActual = sdr("SaldoReservaActual"), _
                         Key .MontoAReservarFuturo = sdr("MontoAReservarFuturo") _
                        })
                    End While
                End Using
                conn.Close()
            End Using
            Return (New JavaScriptSerializer().Serialize(requexordenes))
        End Using
    End Function

    <OperationContract()> _
<WebInvoke(Method:="POST", ResponseFormat:=WebMessageFormat.Json)> _
    Public Function datoselimordencompra(ByVal IdOrdenCompra As String, ByVal IdRequerimiento As String, ByVal CompraServicio As String, ByVal empresa As String) As String
        Try
            Dim datoselorden As New List(Of Object)()
            Using con As New SqlConnection()
                Dim cx As String = ""

                If empresa = 1 Then
                    cx = "cnEmape"
                ElseIf empresa = 2 Then
                    cx = "cnEmapeMunicipal"
                ElseIf empresa = 3 Then
                    cx = "cnRegional"
                ElseIf empresa = 4 Then
                    cx = "cnMantenimiento"
                ElseIf empresa = 5 Then
                    cx = "cnSiaf"
                End If

                con.ConnectionString = ConfigurationManager.ConnectionStrings(cx).ConnectionString
                Using cmd As New SqlCommand()

                    cmd.CommandText = "SP_LOG_ElimOrdenCompra"
                    cmd.CommandType = CommandType.StoredProcedure
                    cmd.Parameters.AddWithValue("@IdOrdenCompra", IdOrdenCompra)
                    cmd.Parameters.AddWithValue("@CompraServicio", CompraServicio)

                    cmd.Connection = con

                    con.Open()
                    Using sdr As SqlDataReader = cmd.ExecuteReader()
                        While sdr.Read()

                            datoselorden.Add(New With { _
                             Key .NumeroItemOrdenCompra = sdr("NumeroItemOrdenCompra"), _
                             Key .PartidaPresupuestal = sdr("PartidaPresupuestal"), _
                             Key .IdTransaccion = sdr("IdTransaccion"), _
                             Key .IdCentroCosto = sdr("IdCentroCosto"), _
                             Key .Estado = sdr("Estado"), _
                             Key .ActaConformidadOGuia = sdr("ActaConformidadOGuia") _
                            })
                        End While
                    End Using
                    con.Close()
                End Using
                Return (New JavaScriptSerializer().Serialize(datoselorden))
            End Using

        Catch ex As Exception
            Return "error"
        End Try
    End Function

    <OperationContract()> _
<WebInvoke(Method:="POST", ResponseFormat:=WebMessageFormat.Json)> _
    Public Function FilasxRequerimiento(ByVal IdRequerimiento As String, ByVal BienServicio As String, ByVal empresa As String) As String
        Try
            Dim filasxreq As New List(Of Object)()
            Using con As New SqlConnection()
                Dim cx As String = ""

                If empresa = 1 Then
                    cx = "cnEmape"
                ElseIf empresa = 2 Then
                    cx = "cnEmapeMunicipal"
                ElseIf empresa = 3 Then
                    cx = "cnRegional"
                ElseIf empresa = 4 Then
                    cx = "cnMantenimiento"
                ElseIf empresa = 5 Then
                    cx = "cnSiaf"
                End If

                con.ConnectionString = ConfigurationManager.ConnectionStrings(cx).ConnectionString
                Using cmd As New SqlCommand()

                    cmd.CommandText = "SP_NroFilasxRequerimiento"
                    cmd.CommandType = CommandType.StoredProcedure
                    cmd.Parameters.AddWithValue("@IdRequerimiento", IdRequerimiento)
                    cmd.Parameters.AddWithValue("@BienServicio", BienServicio)
                    cmd.Parameters.AddWithValue("@IdAnno", Year(Now))

                    cmd.Connection = con

                    con.Open()
                    Using sdr As SqlDataReader = cmd.ExecuteReader()
                        While sdr.Read()

                            filasxreq.Add(New With { _
                             Key .Filas = sdr("Filas"), _
                             Key .FlagEvaluado = sdr("FlagEvaluado"), _
                             Key .NroOrden = sdr("NroOrden") _
                            })
                        End While
                    End Using
                    con.Close()
                End Using
                Return (New JavaScriptSerializer().Serialize(filasxreq))
            End Using

        Catch ex As Exception
            Return "error"
        End Try
    End Function

    'Extraer Descripcion Requerimiento
    <OperationContract()> _
<WebInvoke(Method:="POST", ResponseFormat:=WebMessageFormat.Json)> _
    Public Function ExtraerDescripRequer(ByVal IdRequerimiento As String, ByVal BienServicio As String, ByVal empresa As String) As String
        Try
            Dim descripReq As New List(Of Object)()
            Using con As New SqlConnection()
                Dim cx As String = ""

                If empresa = 1 Then
                    cx = "cnEmape"
                ElseIf empresa = 2 Then
                    cx = "cnEmapeMunicipal"
                ElseIf empresa = 3 Then
                    cx = "cnRegional"
                ElseIf empresa = 4 Then
                    cx = "cnMantenimiento"
                ElseIf empresa = 5 Then
                    cx = "cnSiaf"
                End If

                con.ConnectionString = ConfigurationManager.ConnectionStrings(cx).ConnectionString
                Using cmd As New SqlCommand()

                    cmd.CommandText = "SP_ExtraerDescripReque"
                    cmd.CommandType = CommandType.StoredProcedure
                    cmd.Parameters.AddWithValue("@IdRequerimiento", IdRequerimiento)
                    cmd.Parameters.AddWithValue("@BienServicio", BienServicio)

                    cmd.Connection = con

                    con.Open()
                    Using sdr As SqlDataReader = cmd.ExecuteReader()
                        While sdr.Read()

                            descripReq.Add(New With { _
                             Key .Descripcion = sdr("Descripcion"), _
                             Key .flagTipoPrestacion = sdr("flagTipoPrestacion") _
                            })
                        End While
                    End Using
                    con.Close()
                End Using
                Return (New JavaScriptSerializer().Serialize(descripReq))
            End Using

        Catch ex As Exception
            Return "error"
        End Try
    End Function

    'Extraer flagtipoprestacion
    <OperationContract()> _
<WebInvoke(Method:="POST", ResponseFormat:=WebMessageFormat.Json)> _
    Public Function ExtraerFlagTipoPrest(ByVal IdRequerimiento As String, ByVal BienServicio As String, ByVal empresa As String) As String
        Try
            Dim descripTP As New List(Of Object)()
            Using con As New SqlConnection()
                Dim cx As String = ""

                If empresa = 1 Then
                    cx = "cnEmape"
                ElseIf empresa = 2 Then
                    cx = "cnEmapeMunicipal"
                ElseIf empresa = 3 Then
                    cx = "cnRegional"
                ElseIf empresa = 4 Then
                    cx = "cnMantenimiento"
                ElseIf empresa = 5 Then
                    cx = "cnSiaf"
                End If

                con.ConnectionString = ConfigurationManager.ConnectionStrings(cx).ConnectionString
                Using cmd As New SqlCommand()

                    cmd.CommandText = "SP_ExtraerTipoPrestacion"
                    cmd.CommandType = CommandType.StoredProcedure
                    cmd.Parameters.AddWithValue("@IdRequerimiento", IdRequerimiento)
                    cmd.Parameters.AddWithValue("@BienServicio", BienServicio)

                    cmd.Connection = con

                    con.Open()
                    Using sdr As SqlDataReader = cmd.ExecuteReader()
                        While sdr.Read()

                            descripTP.Add(New With { _
                             Key .flagTipoPrestacion = sdr("flagTipoPrestacion") _
                            })
                        End While
                    End Using
                    con.Close()
                End Using
                Return (New JavaScriptSerializer().Serialize(descripTP))
            End Using

        Catch ex As Exception
            Return "error"
        End Try
    End Function

    <OperationContract()> _
<WebInvoke(Method:="POST", ResponseFormat:=WebMessageFormat.Json)> _
    Public Function annoordenes(ByVal IdOrdenCompra As String, ByVal CompraServicio As String, ByVal empresa As String) As String
        Try
            Dim cabecannoorden As New List(Of Object)()
            Using con As New SqlConnection()
                Dim cx As String = ""

                If empresa = 1 Then
                    cx = "cnEmape"
                ElseIf empresa = 2 Then
                    cx = "cnEmapeMunicipal"
                ElseIf empresa = 3 Then
                    cx = "cnRegional"
                ElseIf empresa = 4 Then
                    cx = "cnMantenimiento"
                ElseIf empresa = 5 Then
                    cx = "cnSiaf"
                End If

                con.ConnectionString = ConfigurationManager.ConnectionStrings(cx).ConnectionString
                Using cmd As New SqlCommand()

                    cmd.CommandText = "SP_LOG_AnnoOrdenes"
                    cmd.CommandType = CommandType.StoredProcedure
                    cmd.Parameters.AddWithValue("@IdOrdenCompra", IdOrdenCompra)
                    cmd.Parameters.AddWithValue("@CompraServicio", CompraServicio)

                    cmd.Connection = con

                    con.Open()
                    Using sdr As SqlDataReader = cmd.ExecuteReader()
                        While sdr.Read()

                            cabecannoorden.Add(New With { _
                                Key .IdAnno = sdr("IdAnno"), _
                                Key .IdMes = sdr("IdMes"), _
                                Key .Dia = sdr("Dia") _
                            })
                        End While
                    End Using
                    con.Close()
                End Using
                Return (New JavaScriptSerializer().Serialize(cabecannoorden))
            End Using

        Catch ex As Exception
            Return "error"
        End Try
    End Function

    <OperationContract()> _
<WebInvoke(Method:="POST", ResponseFormat:=WebMessageFormat.Json)> _
    Public Function ExtraerFechaRNP(ByVal IdProveedor As String, ByVal CompraServicio As String, ByVal empresa As String) As String
        Try
            Dim FechaRNP As New List(Of Object)()
            Using con As New SqlConnection()
                Dim cx As String = ""

                If empresa = 1 Then
                    cx = "cnEmape"
                ElseIf empresa = 2 Then
                    cx = "cnEmapeMunicipal"
                ElseIf empresa = 3 Then
                    cx = "cnRegional"
                ElseIf empresa = 4 Then
                    cx = "cnMantenimiento"
                ElseIf empresa = 5 Then
                    cx = "cnSiaf"
                End If

                con.ConnectionString = ConfigurationManager.ConnectionStrings(cx).ConnectionString
                Using cmd As New SqlCommand()

                    cmd.CommandText = "SP_ExtraerFechaFinRNP"
                    cmd.CommandType = CommandType.StoredProcedure
                    cmd.Parameters.AddWithValue("@IdProveedor", IdProveedor)
                    cmd.Parameters.AddWithValue("@CompraServicio", CompraServicio)
                    cmd.Parameters.AddWithValue("@IdAnno", Year(Now))

                    cmd.Connection = con

                    con.Open()
                    Using sdr As SqlDataReader = cmd.ExecuteReader()
                        While sdr.Read()

                            FechaRNP.Add(New With { _
                                Key .RazonSocial = sdr("RazonSocial"), _
                                Key .FechaFinRNP = sdr("FechaFinRNP"), _
                                Key .ValorVenta = sdr("ValorVenta"), _
                                Key .UIT = sdr("UIT") _
                            })
                        End While
                    End Using
                    con.Close()
                End Using
                Return (New JavaScriptSerializer().Serialize(FechaRNP))
            End Using

        Catch ex As Exception
            Return "error"
        End Try
    End Function

    <OperationContract()> _
<WebInvoke(Method:="POST", ResponseFormat:=WebMessageFormat.Json)> _
    Public Function ExtraerTipoProv(ByVal RUC As String, ByVal empresa As String) As String
        Try
            Dim cabecannoorden As New List(Of Object)()
            Using con As New SqlConnection()
                Dim cx As String = ""

                If empresa = 1 Then
                    cx = "cnEmape"
                ElseIf empresa = 2 Then
                    cx = "cnEmapeMunicipal"
                ElseIf empresa = 3 Then
                    cx = "cnRegional"
                ElseIf empresa = 4 Then
                    cx = "cnMantenimiento"
                ElseIf empresa = 5 Then
                    cx = "cnSiaf"
                End If

                con.ConnectionString = ConfigurationManager.ConnectionStrings(cx).ConnectionString
                Using cmd As New SqlCommand()

                    cmd.CommandText = "SP_LOG_ExtraerRUC"
                    cmd.CommandType = CommandType.StoredProcedure
                    cmd.Parameters.AddWithValue("@RUC", RUC)

                    cmd.Connection = con

                    con.Open()
                    Using sdr As SqlDataReader = cmd.ExecuteReader()
                        While sdr.Read()

                            cabecannoorden.Add(New With { _
                                Key .Tipo_RUC = sdr("Tipo_RUC"), _
                                Key .Locador = sdr("Locador") _
                            })
                        End While
                    End Using
                    con.Close()
                End Using
                Return (New JavaScriptSerializer().Serialize(cabecannoorden))
            End Using

        Catch ex As Exception
            Return "error"
        End Try
    End Function

    <OperationContract()> _
<WebInvoke(Method:="POST", ResponseFormat:=WebMessageFormat.Json)> _
    Public Function validacionANUL_ordencompra(ByVal IdOrdenCompra As String, ByVal IdAnno As String, ByVal empresa As String) As String
        Try
            Dim cabecanulOC As New List(Of Object)()
            Using con As New SqlConnection()
                Dim cx As String = ""

                If empresa = 1 Then
                    cx = "cnEmape"
                ElseIf empresa = 2 Then
                    cx = "cnEmapeMunicipal"
                ElseIf empresa = 3 Then
                    cx = "cnRegional"
                ElseIf empresa = 4 Then
                    cx = "cnMantenimiento"
                ElseIf empresa = 5 Then
                    cx = "cnSiaf"
                End If

                con.ConnectionString = ConfigurationManager.ConnectionStrings(cx).ConnectionString
                Using cmd As New SqlCommand()

                    cmd.CommandText = "SP_LOG_VALIANUL_ORDENCOMPRA"
                    cmd.CommandType = CommandType.StoredProcedure
                    cmd.Parameters.AddWithValue("@IdOrdenCompra", IdOrdenCompra)
                    cmd.Parameters.AddWithValue("@IdAnno", IdAnno)

                    cmd.Connection = con

                    con.Open()
                    Using sdr As SqlDataReader = cmd.ExecuteReader()
                        While sdr.Read()

                            cabecanulOC.Add(New With { _
                                Key .IdGuia = sdr("IdGuia"), _
                                Key .IdOrdenCompra = sdr("IdOrdenCompra") _
                            })
                        End While
                    End Using
                    con.Close()
                End Using
                Return (New JavaScriptSerializer().Serialize(cabecanulOC))
            End Using

        Catch ex As Exception
            Return "error"
        End Try
    End Function

    <OperationContract()> _
<WebInvoke(Method:="POST", ResponseFormat:=WebMessageFormat.Json)> _
    Public Function validacionANUL_ordenservicio(ByVal IdOrdenCompra As String, ByVal IdAnno As String, ByVal empresa As String) As String
        Try
            Dim cabecanulOS As New List(Of Object)()
            Using con As New SqlConnection()
                Dim cx As String = ""

                If empresa = 1 Then
                    cx = "cnEmape"
                ElseIf empresa = 2 Then
                    cx = "cnEmapeMunicipal"
                ElseIf empresa = 3 Then
                    cx = "cnRegional"
                ElseIf empresa = 4 Then
                    cx = "cnMantenimiento"
                ElseIf empresa = 5 Then
                    cx = "cnSiaf"
                End If

                con.ConnectionString = ConfigurationManager.ConnectionStrings(cx).ConnectionString
                Using cmd As New SqlCommand()

                    cmd.CommandText = "SP_LOG_VALIANUL_ORDENSERVICIO"
                    cmd.CommandType = CommandType.StoredProcedure
                    cmd.Parameters.AddWithValue("@IdOrdenCompra", IdOrdenCompra)
                    cmd.Parameters.AddWithValue("@IdAnno", IdAnno)

                    cmd.Connection = con

                    con.Open()
                    Using sdr As SqlDataReader = cmd.ExecuteReader()
                        While sdr.Read()

                            cabecanulOS.Add(New With { _
                                Key .IdActaConformidad = sdr("IdActaConformidad"), _
                                Key .IdOrdenCompra = sdr("IdOrdenCompra") _
                            })
                        End While
                    End Using
                    con.Close()
                End Using
                Return (New JavaScriptSerializer().Serialize(cabecanulOS))
            End Using

        Catch ex As Exception
            Return "error"
        End Try
    End Function

    <OperationContract()> _
<WebInvoke(Method:="POST", ResponseFormat:=WebMessageFormat.Json)> _
    Public Function columnsModifOrden(ByVal IdOrdenCompra As String, ByVal CompraServicio As String, ByVal empresa As String) As String
        Try
            Dim columnsordendet As New List(Of Object)()
            Using con As New SqlConnection()
                Dim cx As String = ""

                If empresa = 1 Then
                    cx = "cnEmape"
                ElseIf empresa = 2 Then
                    cx = "cnEmapeMunicipal"
                ElseIf empresa = 3 Then
                    cx = "cnRegional"
                ElseIf empresa = 4 Then
                    cx = "cnMantenimiento"
                ElseIf empresa = 5 Then
                    cx = "cnSiaf"
                End If

                con.ConnectionString = ConfigurationManager.ConnectionStrings(cx).ConnectionString
                Using cmd As New SqlCommand()

                    cmd.CommandText = "SP_LOG_ModificarOrdenDetalleColumns"
                    cmd.CommandType = CommandType.StoredProcedure
                    cmd.Parameters.AddWithValue("@IdOrdenCompra", IdOrdenCompra)
                    cmd.Parameters.AddWithValue("@CompraServicio", CompraServicio)

                    cmd.Connection = con

                    con.Open()
                    Using sdr As SqlDataReader = cmd.ExecuteReader()
                        While sdr.Read()

                            columnsordendet.Add(New With { _
                                Key .Columnas = sdr("Columnas") _
                            })
                        End While
                    End Using
                    con.Close()
                End Using
                Return (New JavaScriptSerializer().Serialize(columnsordendet))
            End Using

        Catch ex As Exception
            Return "error"
        End Try
    End Function

    <OperationContract()> _
<WebInvoke(Method:="POST", ResponseFormat:=WebMessageFormat.Json)> _
    Public Function validacionCentif_Ordenes(ByVal IdRequerimiento As String, ByVal IdAnno As String, ByVal empresa As String) As String

        Dim anno As String = Year(DateTime.Now)

        Try
            Dim certifOrdenes As New List(Of Object)()
            Using con As New SqlConnection()
                Dim cx As String = ""

                If empresa = 1 Then
                    cx = "cnEmape"
                ElseIf empresa = 2 Then
                    cx = "cnEmapeMunicipal"
                ElseIf empresa = 3 Then
                    cx = "cnRegional"
                ElseIf empresa = 4 Then
                    cx = "cnMantenimiento"
                ElseIf empresa = 5 Then
                    cx = "cnSiaf"
                End If

                con.ConnectionString = ConfigurationManager.ConnectionStrings(cx).ConnectionString
                Using cmd As New SqlCommand()

                    cmd.CommandText = "SP_LOG_ValCerficacionReq"
                    cmd.CommandType = CommandType.StoredProcedure
                    cmd.Parameters.AddWithValue("@IdRequerimiento", IdRequerimiento)
                    cmd.Parameters.AddWithValue("@IdAnno", IdAnno)

                    cmd.Connection = con

                    con.Open()
                    Using sdr As SqlDataReader = cmd.ExecuteReader()
                        While sdr.Read()

                            certifOrdenes.Add(New With { _
                                Key .IdNroSolicitud = sdr("IdNroSolicitud") _
                            })
                        End While
                    End Using
                    con.Close()
                End Using
                Return (New JavaScriptSerializer().Serialize(certifOrdenes))
            End Using

        Catch ex As Exception
            Return "error"
        End Try
    End Function

    'ELIMINAR ORDEN
    <OperationContract()> _
<WebInvoke(Method:="POST", ResponseFormat:=WebMessageFormat.Json)> _
    Public Function eliminarOrden(ByVal IdOrdenCompra As String, ByVal empresa As String) As String
        Try
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
                ElseIf empresa = 5 Then
                    cx = "cnSiaf"
                End If

                conn.ConnectionString = ConfigurationManager.ConnectionStrings(cx).ConnectionString

                Using cmd As New SqlCommand()
                    conn.Open()
                    cmd.Connection = conn
                    cmd.CommandText = "SP_ElimOrden"
                    cmd.CommandType = CommandType.StoredProcedure

                    cmd.Parameters.AddWithValue("@IdOrdenCompra", IdOrdenCompra)

                    cmd.ExecuteNonQuery()

                End Using
                Return (1)
            End Using
        Catch ex As Exception
            Return ("Anular Cabecera Orden de Compra..." & ex.Message)
        End Try
    End Function

    'ANULAR CABECERA ORDEN
    <OperationContract()> _
<WebInvoke(Method:="POST", ResponseFormat:=WebMessageFormat.Json)> _
    Public Function anularOrdenCabecera(ByVal CodOrdenComp As String, ByVal CodRequer As String, ByVal Usuario As String, ByVal CompraServicio As String, _
                                        ByVal Insertar As String, ByVal IdAnno As String, ByVal IdMes As String, ByVal Dia As String, ByVal UsuarioDeta As String, ByVal empresa As String) As String
        Try
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
                ElseIf empresa = 5 Then
                    cx = "cnSiaf"
                End If

                conn.ConnectionString = ConfigurationManager.ConnectionStrings(cx).ConnectionString

                Using cmd As New SqlCommand()
                    conn.Open()
                    cmd.Connection = conn
                    cmd.CommandText = "SP_LOG_sp_LO_EliminarOrdenCompra"
                    cmd.CommandType = CommandType.StoredProcedure

                    cmd.Parameters.AddWithValue("@IdOrdenCompra", CodOrdenComp)
                    cmd.Parameters.AddWithValue("@IdRequerimiento", CodRequer)
                    cmd.Parameters.AddWithValue("@AudUsuario", Usuario)
                    cmd.Parameters.AddWithValue("@CompraServicio", CompraServicio)

                    cmd.ExecuteNonQuery()

                    'anularOrdenDetalle(CodOrdenComp, CodRequer, CompraServicio, CodCentroCostDet, NumItemOrdenCompDet, CodTransacDet, empresa)
                    anularOrdenDetalle(CodOrdenComp, CompraServicio, UsuarioDeta, Insertar, IdAnno, IdMes, Dia, empresa)

                    'ActSaldoCostoAnulOCOS(CodOrdenComp, CompraServicio, IdAnno, IdMes, empresa)

                End Using
                Return (1)
            End Using
        Catch ex As Exception
            Return ("Anular Cabecera Orden de Compra..." & ex.Message)
        End Try
    End Function

    'ANULAR DETALLE ORDEN
    <OperationContract()> _
<WebInvoke(Method:="POST", ResponseFormat:=WebMessageFormat.Json)> _
    Public Function anularOrdenDetalle(ByVal IdOrdenCompra As String, ByVal CompraServicio As String, ByVal UsuarioDeta As String, ByVal Insertar As String, ByVal IdAnno As String, ByVal IdMes As String, ByVal Dia As String, ByVal empresa As String) As String
        Try
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
                ElseIf empresa = 5 Then
                    cx = "cnSiaf"
                End If

                conn.ConnectionString = ConfigurationManager.ConnectionStrings(cx).ConnectionString

                Using cmd As New SqlCommand()
                    conn.Open()
                    cmd.Connection = conn
                    cmd.CommandText = "SP_LOG_ElimDetalleOrdenCompra"
                    cmd.CommandType = CommandType.StoredProcedure

                    cmd.Parameters.AddWithValue("@IdOrdenCompra", IdOrdenCompra)
                    cmd.Parameters.AddWithValue("@CompraServicio", CompraServicio)
                    cmd.Parameters.AddWithValue("@AudUsuario", UsuarioDeta)
                    cmd.Parameters.AddWithValue("@Insertar", Insertar)
                    cmd.Parameters.AddWithValue("@IdAnno", IdAnno)
                    cmd.Parameters.AddWithValue("@IdMes", IdMes)
                    cmd.Parameters.AddWithValue("@Dia", Dia)

                    cmd.ExecuteNonQuery()

                End Using
                Return (1)
            End Using
        Catch ex As Exception
            Return ("Anular Detalle Orden de Compra..." & ex.Message)
        End Try
    End Function

    'ACTUALIZAR FECHA ACEPTACION
    <OperationContract()> _
<WebInvoke(Method:="POST", ResponseFormat:=WebMessageFormat.Json)> _
    Public Function actualizarFechaAceptacion(ByVal CompraServicio As String, ByVal empresa As String) As String
        Try
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
                ElseIf empresa = 5 Then
                    cx = "cnSiaf"
                End If

                conn.ConnectionString = ConfigurationManager.ConnectionStrings(cx).ConnectionString

                Using cmd As New SqlCommand()
                    conn.Open()
                    cmd.Connection = conn
                    cmd.CommandText = "SP_ActualizarFechAceptacion"
                    cmd.CommandType = CommandType.StoredProcedure

                    cmd.Parameters.AddWithValue("@CompraServicio", CompraServicio)
                    cmd.Parameters.AddWithValue("@IdAnno", Year(Now))

                    cmd.ExecuteNonQuery()

                End Using
                Return (1)
            End Using
        Catch ex As Exception
            Return ("Actualizar Fecha Aceptacion..." & ex.Message)
        End Try
    End Function

    'REEMPLAZAR ORDEN ANULADA POR ACTUAL
    <OperationContract()> _
<WebInvoke(Method:="POST", ResponseFormat:=WebMessageFormat.Json)> _
    Public Function reemplazarOrdenAnulxAct(ByVal IdOrdenCompraAnulada As String, ByVal IdOrdenCompraActual As String, ByVal CompraServicio As String, ByVal empresa As String) As String
        Try
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
                ElseIf empresa = 5 Then
                    cx = "cnSiaf"
                End If

                conn.ConnectionString = ConfigurationManager.ConnectionStrings(cx).ConnectionString

                Using cmd As New SqlCommand()
                    conn.Open()
                    cmd.Connection = conn
                    cmd.CommandText = "SP_CAMBIAR_IDORDEN"
                    cmd.CommandType = CommandType.StoredProcedure

                    cmd.Parameters.AddWithValue("@IdOrdenCompraAnulada", IdOrdenCompraAnulada)
                    cmd.Parameters.AddWithValue("@IdOrdenCompraActual", IdOrdenCompraActual)
                    cmd.Parameters.AddWithValue("@CompraServicio", CompraServicio)
                    cmd.Parameters.AddWithValue("@IdAnno", Year(Now))

                    cmd.ExecuteNonQuery()
                End Using
                Return (1)
            End Using
        Catch ex As Exception
            Return ("Anular Cabecera Orden de Compra..." & ex.Message)
        End Try
    End Function

    'ACTUALIZAR SALDO COSTO AL ANULAR OC / OS
    <OperationContract()> _
<WebInvoke(Method:="POST", ResponseFormat:=WebMessageFormat.Json)> _
    Public Function ActSaldoCostoAnulOCOS(ByVal IdOrdenCompra As String, ByVal CompraServicio As String, ByVal IdAnno As String, ByVal IdMes As String, ByVal empresa As String) As String
        Try
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
                ElseIf empresa = 5 Then
                    cx = "cnSiaf"
                End If

                conn.ConnectionString = ConfigurationManager.ConnectionStrings(cx).ConnectionString

                Using cmd As New SqlCommand()
                    conn.Open()
                    cmd.Connection = conn
                    cmd.CommandText = "SP_LOG_ActualizarCostoxAnulOCOS"
                    cmd.CommandType = CommandType.StoredProcedure

                    cmd.Parameters.AddWithValue("@IdOrdenCompra", IdOrdenCompra)
                    cmd.Parameters.AddWithValue("@CompraServicio", CompraServicio)
                    cmd.Parameters.AddWithValue("@IdAnno", IdAnno)
                    cmd.Parameters.AddWithValue("@IdMes", IdMes)

                    cmd.ExecuteNonQuery()

                End Using
                Return (1)
            End Using
        Catch ex As Exception
            Return ("Anular Detalle Orden de Compra..." & ex.Message)
        End Try
    End Function

    <OperationContract()> _
<WebInvoke(Method:="POST", ResponseFormat:=WebMessageFormat.Json)> _
    Public Function delReqOrdenes(ByVal IdOrdenCompra As String, ByVal CompraServicio As String, ByVal IdAnno As String, ByVal IdMes As String, ByVal empresa As String) As String
        Try
            Dim datosreqordenes As New List(Of Object)()
            Using con As New SqlConnection()
                Dim cx As String = ""

                If empresa = 1 Then
                    cx = "cnEmape"
                ElseIf empresa = 2 Then
                    cx = "cnEmapeMunicipal"
                ElseIf empresa = 3 Then
                    cx = "cnRegional"
                ElseIf empresa = 4 Then
                    cx = "cnMantenimiento"
                ElseIf empresa = 5 Then
                    cx = "cnSiaf"
                End If

                con.ConnectionString = ConfigurationManager.ConnectionStrings(cx).ConnectionString
                Using cmd As New SqlCommand()

                    cmd.CommandText = "SP_LOG_DelReqOrdenes"
                    cmd.CommandType = CommandType.StoredProcedure
                    cmd.Parameters.AddWithValue("@IdOrdenCompra", IdOrdenCompra)
                    cmd.Parameters.AddWithValue("@CompraServicio", CompraServicio)
                    cmd.Parameters.AddWithValue("@IdAnno", IdAnno)
                    cmd.Parameters.AddWithValue("@IdMes", IdMes)

                    cmd.Connection = con

                    con.Open()
                    Using sdr As SqlDataReader = cmd.ExecuteReader()
                        While sdr.Read()

                            datosreqordenes.Add(New With { _
                                Key .IdRequerimiento1 = sdr("IdRequerimiento1"), _
                                Key .IdRequerimiento2 = sdr("IdRequerimiento2"), _
                                Key .IdRequerimiento3 = sdr("IdRequerimiento3"), _
                                Key .IdRequerimiento4 = sdr("IdRequerimiento4"), _
                                Key .IdRequerimiento5 = sdr("IdRequerimiento5"), _
                                Key .IdRequerimiento6 = sdr("IdRequerimiento6") _
                            })
                        End While
                    End Using
                    con.Close()
                End Using
                Return (New JavaScriptSerializer().Serialize(datosreqordenes))
            End Using

        Catch ex As Exception
            Return "error"
        End Try
    End Function

    <OperationContract()> _
<WebInvoke(Method:="POST", ResponseFormat:=WebMessageFormat.Json)> _
    Public Function delBienSerOrdenes(ByVal IdOrdenCompra As String, ByVal CompraServicio As String, ByVal IdAnno As String, ByVal IdMes As String, ByVal empresa As String) As String
        Try
            Dim datosbienserordenes As New List(Of Object)()
            Using con As New SqlConnection()
                Dim cx As String = ""

                If empresa = 1 Then
                    cx = "cnEmape"
                ElseIf empresa = 2 Then
                    cx = "cnEmapeMunicipal"
                ElseIf empresa = 3 Then
                    cx = "cnRegional"
                ElseIf empresa = 4 Then
                    cx = "cnMantenimiento"
                ElseIf empresa = 5 Then
                    cx = "cnSiaf"
                End If

                con.ConnectionString = ConfigurationManager.ConnectionStrings(cx).ConnectionString
                Using cmd As New SqlCommand()

                    cmd.CommandText = "SP_LOG_DelBienSerOrdenes"
                    cmd.CommandType = CommandType.StoredProcedure
                    cmd.Parameters.AddWithValue("@IdOrdenCompra", IdOrdenCompra)
                    cmd.Parameters.AddWithValue("@CompraServicio", CompraServicio)
                    cmd.Parameters.AddWithValue("@IdAnno", IdAnno)
                    cmd.Parameters.AddWithValue("@IdMes", IdMes)

                    cmd.Connection = con

                    con.Open()
                    Using sdr As SqlDataReader = cmd.ExecuteReader()
                        While sdr.Read()

                            datosbienserordenes.Add(New With { _
                                Key .IdBienServicio1 = sdr("IdBienServicio1"), _
                                Key .IdBienServicio2 = sdr("IdBienServicio2"), _
                                Key .IdBienServicio3 = sdr("IdBienServicio3"), _
                                Key .IdBienServicio4 = sdr("IdBienServicio4"), _
                                Key .IdBienServicio5 = sdr("IdBienServicio5"), _
                                Key .IdBienServicio6 = sdr("IdBienServicio6") _
                            })
                        End While
                    End Using
                    con.Close()
                End Using
                Return (New JavaScriptSerializer().Serialize(datosbienserordenes))
            End Using

        Catch ex As Exception
            Return "error"
        End Try
    End Function

    <OperationContract()> _
<WebInvoke(Method:="POST", ResponseFormat:=WebMessageFormat.Json)> _
    Public Function delNumItemReqOrdenes(ByVal IdOrdenCompra As String, ByVal CompraServicio As String, ByVal IdAnno As String, ByVal IdMes As String, ByVal empresa As String) As String
        Try
            Dim datosnumitemreqordenes As New List(Of Object)()
            Using con As New SqlConnection()
                Dim cx As String = ""

                If empresa = 1 Then
                    cx = "cnEmape"
                ElseIf empresa = 2 Then
                    cx = "cnEmapeMunicipal"
                ElseIf empresa = 3 Then
                    cx = "cnRegional"
                ElseIf empresa = 4 Then
                    cx = "cnMantenimiento"
                ElseIf empresa = 5 Then
                    cx = "cnSiaf"
                End If

                con.ConnectionString = ConfigurationManager.ConnectionStrings(cx).ConnectionString
                Using cmd As New SqlCommand()

                    cmd.CommandText = "SP_LOG_DelNumItemReqOrdenes"
                    cmd.CommandType = CommandType.StoredProcedure
                    cmd.Parameters.AddWithValue("@IdOrdenCompra", IdOrdenCompra)
                    cmd.Parameters.AddWithValue("@CompraServicio", CompraServicio)
                    cmd.Parameters.AddWithValue("@IdAnno", IdAnno)
                    cmd.Parameters.AddWithValue("@IdMes", IdMes)

                    cmd.Connection = con

                    con.Open()
                    Using sdr As SqlDataReader = cmd.ExecuteReader()
                        While sdr.Read()

                            datosnumitemreqordenes.Add(New With { _
                                Key .NumeroItemRequerimiento1 = sdr("NumeroItemRequerimiento1"), _
                                Key .NumeroItemRequerimiento2 = sdr("NumeroItemRequerimiento2"), _
                                Key .NumeroItemRequerimiento3 = sdr("NumeroItemRequerimiento3"), _
                                Key .NumeroItemRequerimiento4 = sdr("NumeroItemRequerimiento4"), _
                                Key .NumeroItemRequerimiento5 = sdr("NumeroItemRequerimiento5"), _
                                Key .NumeroItemRequerimiento6 = sdr("NumeroItemRequerimiento6") _
                            })
                        End While
                    End Using
                    con.Close()
                End Using
                Return (New JavaScriptSerializer().Serialize(datosnumitemreqordenes))
            End Using

        Catch ex As Exception
            Return "error"
        End Try
    End Function

    <OperationContract()> _
<WebInvoke(Method:="POST", ResponseFormat:=WebMessageFormat.Json)> _
    Public Function actSalCantRequerimientos(ByVal CodOrdenComp As String, ByVal CompraServicio As String, ByVal IdAnno As String, ByVal IdMes As String, ByVal Cantidad As String, ByVal empresa As String, _
                                             ByVal IdRequerimiento1 As String, ByVal IdRequerimiento2 As String, ByVal IdRequerimiento3 As String, ByVal IdRequerimiento4 As String, ByVal IdRequerimiento5 As String, ByVal IdRequerimiento6 As String, _
                                             ByVal IdBienServicio1 As String, ByVal IdBienServicio2 As String, ByVal IdBienServicio3 As String, ByVal IdBienServicio4 As String, ByVal IdBienServicio5 As String, ByVal IdBienServicio6 As String, _
                                             ByVal NumeroItemRequerimiento1 As String, ByVal NumeroItemRequerimiento2 As String, ByVal NumeroItemRequerimiento3 As String, ByVal NumeroItemRequerimiento4 As String, ByVal NumeroItemRequerimiento5 As String, ByVal NumeroItemRequerimiento6 As String) As String
        Try
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
                ElseIf empresa = 5 Then
                    cx = "cnSiaf"
                End If

                conn.ConnectionString = ConfigurationManager.ConnectionStrings(cx).ConnectionString

                Using cmd As New SqlCommand()
                    conn.Open()
                    cmd.Connection = conn
                    cmd.CommandText = "SP_LOG_ActRequerimientos"
                    cmd.CommandType = CommandType.StoredProcedure

                    cmd.Parameters.AddWithValue("@IdOrdenCompra", CodOrdenComp)
                    cmd.Parameters.AddWithValue("@CompraServicio", CompraServicio)
                    cmd.Parameters.AddWithValue("@IdAnno", IdAnno)
                    cmd.Parameters.AddWithValue("@IdMes", IdMes)
                    cmd.Parameters.AddWithValue("@Cantidad", Cantidad)
                    'REQUERIMIENTOS
                    cmd.Parameters.AddWithValue("@IdRequerimiento1", IdRequerimiento1)
                    cmd.Parameters.AddWithValue("@IdRequerimiento2", IdRequerimiento2)
                    cmd.Parameters.AddWithValue("@IdRequerimiento3", IdRequerimiento3)
                    cmd.Parameters.AddWithValue("@IdRequerimiento4", IdRequerimiento4)
                    cmd.Parameters.AddWithValue("@IdRequerimiento5", IdRequerimiento5)
                    cmd.Parameters.AddWithValue("@IdRequerimiento6", IdRequerimiento6)
                    cmd.Parameters.AddWithValue("@IdRequerimiento7", "")
                    cmd.Parameters.AddWithValue("@IdRequerimiento8", "")
                    cmd.Parameters.AddWithValue("@IdRequerimiento9", "")
                    cmd.Parameters.AddWithValue("@IdRequerimiento10", "")
                    cmd.Parameters.AddWithValue("@IdRequerimiento11", "")
                    cmd.Parameters.AddWithValue("@IdRequerimiento12", "")
                    cmd.Parameters.AddWithValue("@IdRequerimiento13", "")
                    cmd.Parameters.AddWithValue("@IdRequerimiento14", "")
                    cmd.Parameters.AddWithValue("@IdRequerimiento15", "")
                    cmd.Parameters.AddWithValue("@IdRequerimiento16", "")
                    cmd.Parameters.AddWithValue("@IdRequerimiento17", "")
                    cmd.Parameters.AddWithValue("@IdRequerimiento18", "")
                    cmd.Parameters.AddWithValue("@IdRequerimiento19", "")
                    cmd.Parameters.AddWithValue("@IdRequerimiento20", "")
                    cmd.Parameters.AddWithValue("@IdRequerimiento21", "")
                    cmd.Parameters.AddWithValue("@IdRequerimiento22", "")
                    cmd.Parameters.AddWithValue("@IdRequerimiento23", "")
                    cmd.Parameters.AddWithValue("@IdRequerimiento24", "")
                    cmd.Parameters.AddWithValue("@IdRequerimiento25", "")
                    cmd.Parameters.AddWithValue("@IdRequerimiento26", "")
                    cmd.Parameters.AddWithValue("@IdRequerimiento27", "")
                    cmd.Parameters.AddWithValue("@IdRequerimiento28", "")
                    cmd.Parameters.AddWithValue("@IdRequerimiento29", "")
                    cmd.Parameters.AddWithValue("@IdRequerimiento30", "")
                    'BIEN/SERVICIO
                    cmd.Parameters.AddWithValue("@IdBienServicio1", IdBienServicio1)
                    cmd.Parameters.AddWithValue("@IdBienServicio2", IdBienServicio2)
                    cmd.Parameters.AddWithValue("@IdBienServicio3", IdBienServicio3)
                    cmd.Parameters.AddWithValue("@IdBienServicio4", IdBienServicio4)
                    cmd.Parameters.AddWithValue("@IdBienServicio5", IdBienServicio5)
                    cmd.Parameters.AddWithValue("@IdBienServicio6", IdBienServicio6)
                    cmd.Parameters.AddWithValue("@IdBienServicio7", "")
                    cmd.Parameters.AddWithValue("@IdBienServicio8", "")
                    cmd.Parameters.AddWithValue("@IdBienServicio9", "")
                    cmd.Parameters.AddWithValue("@IdBienServicio10", "")
                    cmd.Parameters.AddWithValue("@IdBienServicio11", "")
                    cmd.Parameters.AddWithValue("@IdBienServicio12", "")
                    cmd.Parameters.AddWithValue("@IdBienServicio13", "")
                    cmd.Parameters.AddWithValue("@IdBienServicio14", "")
                    cmd.Parameters.AddWithValue("@IdBienServicio15", "")
                    cmd.Parameters.AddWithValue("@IdBienServicio16", "")
                    cmd.Parameters.AddWithValue("@IdBienServicio17", "")
                    cmd.Parameters.AddWithValue("@IdBienServicio18", "")
                    cmd.Parameters.AddWithValue("@IdBienServicio19", "")
                    cmd.Parameters.AddWithValue("@IdBienServicio20", "")
                    cmd.Parameters.AddWithValue("@IdBienServicio21", "")
                    cmd.Parameters.AddWithValue("@IdBienServicio22", "")
                    cmd.Parameters.AddWithValue("@IdBienServicio23", "")
                    cmd.Parameters.AddWithValue("@IdBienServicio24", "")
                    cmd.Parameters.AddWithValue("@IdBienServicio25", "")
                    cmd.Parameters.AddWithValue("@IdBienServicio26", "")
                    cmd.Parameters.AddWithValue("@IdBienServicio27", "")
                    cmd.Parameters.AddWithValue("@IdBienServicio28", "")
                    cmd.Parameters.AddWithValue("@IdBienServicio29", "")
                    cmd.Parameters.AddWithValue("@IdBienServicio30", "")
                    'NUMERO ITEM REQUERIMIENTO
                    cmd.Parameters.AddWithValue("@NumeroItemRequerimiento1", NumeroItemRequerimiento1)
                    cmd.Parameters.AddWithValue("@NumeroItemRequerimiento2", NumeroItemRequerimiento2)
                    cmd.Parameters.AddWithValue("@NumeroItemRequerimiento3", NumeroItemRequerimiento3)
                    cmd.Parameters.AddWithValue("@NumeroItemRequerimiento4", NumeroItemRequerimiento4)
                    cmd.Parameters.AddWithValue("@NumeroItemRequerimiento5", NumeroItemRequerimiento5)
                    cmd.Parameters.AddWithValue("@NumeroItemRequerimiento6", NumeroItemRequerimiento6)
                    cmd.Parameters.AddWithValue("@NumeroItemRequerimiento7", "")
                    cmd.Parameters.AddWithValue("@NumeroItemRequerimiento8", "")
                    cmd.Parameters.AddWithValue("@NumeroItemRequerimiento9", "")
                    cmd.Parameters.AddWithValue("@NumeroItemRequerimiento10", "")
                    cmd.Parameters.AddWithValue("@NumeroItemRequerimiento11", "")
                    cmd.Parameters.AddWithValue("@NumeroItemRequerimiento12", "")
                    cmd.Parameters.AddWithValue("@NumeroItemRequerimiento13", "")
                    cmd.Parameters.AddWithValue("@NumeroItemRequerimiento14", "")
                    cmd.Parameters.AddWithValue("@NumeroItemRequerimiento15", "")
                    cmd.Parameters.AddWithValue("@NumeroItemRequerimiento16", "")
                    cmd.Parameters.AddWithValue("@NumeroItemRequerimiento17", "")
                    cmd.Parameters.AddWithValue("@NumeroItemRequerimiento18", "")
                    cmd.Parameters.AddWithValue("@NumeroItemRequerimiento19", "")
                    cmd.Parameters.AddWithValue("@NumeroItemRequerimiento20", "")
                    cmd.Parameters.AddWithValue("@NumeroItemRequerimiento21", "")
                    cmd.Parameters.AddWithValue("@NumeroItemRequerimiento22", "")
                    cmd.Parameters.AddWithValue("@NumeroItemRequerimiento23", "")
                    cmd.Parameters.AddWithValue("@NumeroItemRequerimiento24", "")
                    cmd.Parameters.AddWithValue("@NumeroItemRequerimiento25", "")
                    cmd.Parameters.AddWithValue("@NumeroItemRequerimiento26", "")
                    cmd.Parameters.AddWithValue("@NumeroItemRequerimiento27", "")
                    cmd.Parameters.AddWithValue("@NumeroItemRequerimiento28", "")
                    cmd.Parameters.AddWithValue("@NumeroItemRequerimiento29", "")
                    cmd.Parameters.AddWithValue("@NumeroItemRequerimiento30", "")

                    cmd.ExecuteNonQuery()

                End Using
                Return (1)
            End Using
        Catch ex As Exception
            Return ("Actualizar Saldo Cantidad Requerimientos..." & ex.Message)
        End Try
    End Function

    'ANULAR DETALLE ORDEN2
    <OperationContract()> _
 <WebInvoke(Method:="POST", ResponseFormat:=WebMessageFormat.Json)> _
    Public Function anularOrdenDetalle2(ByVal CodOrdenComp As String, ByVal CodRequer As String, ByVal CompraServicio As String, ByVal CodCentroCostDet As String, _
                                            ByVal NumItemOrdenCompDet As String, ByVal CodTransacDet As String, ByVal empresa As String) As String

        Dim anno As String = Year(DateTime.Now)

        Try
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
                ElseIf empresa = 5 Then
                    cx = "cnSiaf"
                End If

                conn.ConnectionString = ConfigurationManager.ConnectionStrings(cx).ConnectionString

                Using cmd As New SqlCommand()
                    conn.Open()
                    cmd.Connection = conn
                    cmd.CommandText = "Sp_LO_NewActualizarOrdenCompraDetalleNewIII"
                    cmd.CommandType = CommandType.StoredProcedure

                    cmd.Parameters.AddWithValue("@IdOrdenCompra", CodOrdenComp)
                    cmd.Parameters.AddWithValue("@IdRequerimiento", CodRequer)
                    cmd.Parameters.AddWithValue("@IdAnno", anno)
                    cmd.Parameters.AddWithValue("@IdMes", "")
                    cmd.Parameters.AddWithValue("@CompraServicio", CompraServicio)
                    cmd.Parameters.AddWithValue("@IdCentroCosto", CodCentroCostDet)
                    cmd.Parameters.AddWithValue("@FechaDocumento", "")
                    cmd.Parameters.AddWithValue("@Prorrateo", "")
                    cmd.Parameters.AddWithValue("@IdProveedor", "")
                    cmd.Parameters.AddWithValue("@TipoProveedor", "")
                    cmd.Parameters.AddWithValue("@RazonSocial", "")
                    cmd.Parameters.AddWithValue("@IdBienServicio", "")
                    cmd.Parameters.AddWithValue("@NumeroItemRequerimiento", "")
                    cmd.Parameters.AddWithValue("@NumeroItemOrdenCompra", "")
                    cmd.Parameters.AddWithValue("@IdUnidadMedida", "")
                    cmd.Parameters.AddWithValue("@Cantidad", 0.0)
                    cmd.Parameters.AddWithValue("@Costo", 0.0)
                    cmd.Parameters.AddWithValue("@SaldoReservaActual", "")
                    cmd.Parameters.AddWithValue("@Impuesto1", 0.0)
                    cmd.Parameters.AddWithValue("@Impuesto2", 0.0)
                    cmd.Parameters.AddWithValue("@Impuesto3", 0.0)
                    cmd.Parameters.AddWithValue("@Impuesto4", 0.0)
                    cmd.Parameters.AddWithValue("@CantidadPedido", 0.0)
                    cmd.Parameters.AddWithValue("@CostoPedido", 0.0)
                    cmd.Parameters.AddWithValue("@PartidaPresupuestal", "")
                    cmd.Parameters.AddWithValue("@IdTransaccionPedido", "")
                    cmd.Parameters.AddWithValue("@IdTransaccionOrden", CodTransacDet)
                    cmd.Parameters.AddWithValue("@IdCuentaContable", "")
                    cmd.Parameters.AddWithValue("@IdAlmacen", "")
                    cmd.Parameters.AddWithValue("@AudUsuario", Session("userid"))
                    cmd.Parameters.AddWithValue("@ValorVenta", 0.0)
                    cmd.Parameters.AddWithValue("@ValorVentaPedido", "")
                    cmd.Parameters.AddWithValue("@NumeroAutorizar", "")
                    cmd.Parameters.AddWithValue("@Insertar", "E")
                    cmd.Parameters.AddWithValue("@Mensaje", "")
                    cmd.Parameters.AddWithValue("@GuiaReintegro", "")
                    cmd.Parameters.AddWithValue("@Observacion1", "")
                    cmd.Parameters.AddWithValue("@Observacion2", "")
                    cmd.Parameters.AddWithValue("@Observacion3", "")

                    cmd.ExecuteNonQuery()

                End Using
                Return (10)
            End Using
        Catch ex As Exception
            Return ("Anular Orden de Compra..." & ex.Message)
        End Try
    End Function

    'VALIDACION PARA PODER MODIFICAR/ELIMINAR
    <OperationContract()> _
<WebInvoke(Method:="POST", ResponseFormat:=WebMessageFormat.Json)> _
    Public Function validacionGuiaxOrden(ByVal IdOrdenCompra As String, ByVal IdRequerimiento As String, ByVal IdAnno As String, ByVal empresa As String) As String
        Try
            Dim datoselorden As New List(Of Object)()
            Using con As New SqlConnection()
                Dim cx As String = ""

                If empresa = 1 Then
                    cx = "cnEmape"
                ElseIf empresa = 2 Then
                    cx = "cnEmapeMunicipal"
                ElseIf empresa = 3 Then
                    cx = "cnRegional"
                ElseIf empresa = 4 Then
                    cx = "cnMantenimiento"
                ElseIf empresa = 5 Then
                    cx = "cnSiaf"
                End If

                con.ConnectionString = ConfigurationManager.ConnectionStrings(cx).ConnectionString
                Using cmd As New SqlCommand()

                    cmd.CommandText = "SP_LOG_ValGuiaxOrden"
                    cmd.CommandType = CommandType.StoredProcedure
                    cmd.Parameters.AddWithValue("@IdOrdenCompra", IdOrdenCompra)
                    cmd.Parameters.AddWithValue("@IdRequerimiento", IdRequerimiento)
                    cmd.Parameters.AddWithValue("@IdAnno", IdAnno)

                    cmd.Connection = con

                    con.Open()
                    Using sdr As SqlDataReader = cmd.ExecuteReader()
                        While sdr.Read()

                            datoselorden.Add(New With { _
                             Key .IdGuia = sdr("IdGuia") _
                            })
                        End While
                    End Using
                    con.Close()
                End Using
                Return (New JavaScriptSerializer().Serialize(datoselorden))
            End Using

        Catch ex As Exception
            Return "error"
        End Try
    End Function


    'MODIFICAR CABECERA ORDER DE COMPRA
    <OperationContract()> _
<WebInvoke(Method:="POST", ResponseFormat:=WebMessageFormat.Json)> _
    Public Function ModificarCabeceraOrdenCompraoServicio(ByVal CodOrdenComp As String, ByVal CompraServicio As String, ByVal FechaTipoCambio As String, ByVal FechaOrdCompModif As String, ByVal PlazoEntregamodif As String, _
                                                          ByVal conceptomodif As String, ByVal Proveedormodif As String, ByVal IdFormaPagomodif As String, ByVal IdTipoDocumentomodif As String, ByVal Tipo_Cambiomodif As String, _
                                                          ByVal CantTotalModif As String, ByVal ImpustModif As String, ByVal TasaModif As String, ByVal ValVtaModif As String, ByVal NumItemOrden As String, _
                                                          ByVal CantModif As String, ByVal CstItemModif As String, ByVal IdUsuario As String, ByVal empresa As String) As String
        Try
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
                ElseIf empresa = 5 Then
                    cx = "cnSiaf"
                End If

                If CompraServicio = "C" Then
                    IdTipoDocumentomodif = "001"
                End If

                conn.ConnectionString = ConfigurationManager.ConnectionStrings(cx).ConnectionString

                Using cmd As New SqlCommand()
                    conn.Open()
                    cmd.Connection = conn
                    cmd.CommandText = "sp_LO_NewActualizarOrdenCompra"
                    cmd.CommandType = CommandType.StoredProcedure

                    cmd.Parameters.AddWithValue("@IdOrdenCompra", CodOrdenComp)
                    'cmd.Parameters.AddWithValue("@IdTipoServicio", "")
                    cmd.Parameters.AddWithValue("@IdRequerimiento", "")
                    cmd.Parameters.AddWithValue("@IdAnno", "")
                    cmd.Parameters.AddWithValue("@IdMes", "")
                    cmd.Parameters.AddWithValue("@CompraServicio", CompraServicio)
                    cmd.Parameters.AddWithValue("@IdCentroCosto", "")
                    cmd.Parameters.AddWithValue("@FechaOrdenCompra", FechaOrdCompModif)
                    cmd.Parameters.AddWithValue("@FechaTipoCambio", FechaTipoCambio)
                    cmd.Parameters.AddWithValue("@PlazoEntrega", PlazoEntregamodif)
                    cmd.Parameters.AddWithValue("@Descripcion", conceptomodif)
                    cmd.Parameters.AddWithValue("@IdProveedor", Proveedormodif)
                    cmd.Parameters.AddWithValue("@TipoProveedor", "")
                    cmd.Parameters.AddWithValue("@IdFormaPago", IdFormaPagomodif)
                    cmd.Parameters.AddWithValue("@IdFormaEntrega", "")
                    cmd.Parameters.AddWithValue("@IdTipoDocumento", IdTipoDocumentomodif)
                    cmd.Parameters.AddWithValue("@IdTipoPago", "")
                    cmd.Parameters.AddWithValue("@Moneda", "S")
                    cmd.Parameters.AddWithValue("@TipoCambio", Tipo_Cambiomodif)
                    cmd.Parameters.AddWithValue("@ValorVenta", ValVtaModif)
                    cmd.Parameters.AddWithValue("@CantidadTotal", CantTotalModif)
                    cmd.Parameters.AddWithValue("@Impuesto1", ImpustModif)
                    cmd.Parameters.AddWithValue("@Tasa1", TasaModif)
                    cmd.Parameters.AddWithValue("@Impuesto2", 0.0)
                    cmd.Parameters.AddWithValue("@Tasa2", 0)
                    cmd.Parameters.AddWithValue("@Impuesto3", 0.0)
                    cmd.Parameters.AddWithValue("@Tasa3", 0)
                    cmd.Parameters.AddWithValue("@Impuesto4", 0.0)
                    cmd.Parameters.AddWithValue("@Tasa4", 0)
                    cmd.Parameters.AddWithValue("@AudUsuario", IdUsuario)
                    cmd.Parameters.AddWithValue("@Estado", "")
                    cmd.Parameters.AddWithValue("@Prorrateo", "")
                    cmd.Parameters.AddWithValue("@ProcedePago", "")
                    cmd.Parameters.AddWithValue("@Insertar", "A")
                    cmd.Parameters.AddWithValue("@mensaje", "")
                    cmd.Parameters.AddWithValue("@NuevoIdOrden", "")
                    cmd.Parameters.AddWithValue("@IdProcesoTipo", "")
                    cmd.Parameters.AddWithValue("@IdClasificacionObjeto", "")
                    cmd.Parameters.AddWithValue("@IdProcesoSeleccion", "")
                    cmd.Parameters.AddWithValue("@ServicioPublico", "")
                    cmd.Parameters.AddWithValue("@NumeroAutorizar", "")
                    cmd.Parameters.AddWithValue("@FlagDiaHabil", "")
                    cmd.Parameters.AddWithValue("@ReintegroBienServicio", "")
                    cmd.Parameters.AddWithValue("@flagordenparcial", "")
                    cmd.ExecuteNonQuery()

                    'ModificarDetalleOrdenCompra(CodOrdenComp, NumItemOrden, CantModif, CstItemModif, empresa)

                    ActualizarImpuestoOrdenes(CodOrdenComp, CompraServicio, IdTipoDocumentomodif, empresa)

                    ActualizarValorImpuestoOrdenes(empresa, CompraServicio)

                End Using
                Return (1)
            End Using
        Catch ex As Exception
            Return ("Modificar Requerimiento Orden de Compra2..." & ex.Message)
        End Try
    End Function

    'MODIFICAR DETALLE ORDEN DE COMPRA
    <OperationContract()> _
    <WebInvoke(Method:="POST", ResponseFormat:=WebMessageFormat.Json)> _
    Public Function ModificarDetalleOrden(ByVal CodOrdenComp As String, ByVal NumItemOrden As String, ByVal CantModif As String, ByVal CstItemModif As String, ByVal empresa As String) As String
        Try
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
                ElseIf empresa = 5 Then
                    cx = "cnSiaf"
                End If

                conn.ConnectionString = ConfigurationManager.ConnectionStrings(cx).ConnectionString

                Using cmd As New SqlCommand()
                    conn.Open()
                    cmd.Connection = conn
                    cmd.CommandText = "Sp_LO_NewActualizarOrdenCompraDetalleNewIII"
                    cmd.CommandType = CommandType.StoredProcedure

                    cmd.Parameters.AddWithValue("@IdOrdenCompra", CodOrdenComp)
                    cmd.Parameters.AddWithValue("@IdRequerimiento", "")
                    cmd.Parameters.AddWithValue("@IdAnno", "")
                    cmd.Parameters.AddWithValue("@IdMes", "")
                    cmd.Parameters.AddWithValue("@CompraServicio", "C")
                    cmd.Parameters.AddWithValue("@IdCentroCosto", "")
                    cmd.Parameters.AddWithValue("@FechaDocumento", "")
                    cmd.Parameters.AddWithValue("@Prorrateo", "")
                    cmd.Parameters.AddWithValue("@IdProveedor", "")
                    cmd.Parameters.AddWithValue("@TipoProveedor", "")
                    cmd.Parameters.AddWithValue("@RazonSocial", "")
                    cmd.Parameters.AddWithValue("@IdBienServicio", "")
                    cmd.Parameters.AddWithValue("@NumeroItemRequerimiento", "")
                    cmd.Parameters.AddWithValue("@NumeroItemOrdenCompra", NumItemOrden)
                    cmd.Parameters.AddWithValue("@IdUnidadMedida", "")
                    cmd.Parameters.AddWithValue("@Cantidad", CantModif)
                    cmd.Parameters.AddWithValue("@Costo", CstItemModif)
                    cmd.Parameters.AddWithValue("@SaldoReservaActual", "")
                    cmd.Parameters.AddWithValue("@Impuesto1", 0.0)
                    cmd.Parameters.AddWithValue("@Impuesto2", 0.0)
                    cmd.Parameters.AddWithValue("@Impuesto3", 0.0)
                    cmd.Parameters.AddWithValue("@Impuesto4", 0.0)
                    cmd.Parameters.AddWithValue("@CantidadPedido", 0.0)
                    cmd.Parameters.AddWithValue("@CostoPedido", 0.0)
                    cmd.Parameters.AddWithValue("@PartidaPresupuestal", "")
                    cmd.Parameters.AddWithValue("@IdTransaccionPedido", "")
                    cmd.Parameters.AddWithValue("@IdTransaccionOrden", "")
                    cmd.Parameters.AddWithValue("@IdCuentaContable", "")
                    cmd.Parameters.AddWithValue("@IdAlmacen", "")
                    cmd.Parameters.AddWithValue("@AudUsuario", Session("userid"))
                    cmd.Parameters.AddWithValue("@ValorVenta", 0.0)
                    cmd.Parameters.AddWithValue("@ValorVentaPedido", 0.0)
                    cmd.Parameters.AddWithValue("@NumeroAutorizar", "")
                    cmd.Parameters.AddWithValue("@Insertar", "A")
                    cmd.Parameters.AddWithValue("@Mensaje", "")
                    cmd.Parameters.AddWithValue("@GuiaReintegro", "")
                    cmd.Parameters.AddWithValue("@Observacion1", "")
                    cmd.Parameters.AddWithValue("@Observacion2", "")
                    cmd.Parameters.AddWithValue("@Observacion3", "")

                    cmd.ExecuteNonQuery()

                End Using
                Return (2)
            End Using
        Catch ex As Exception
            Return ("Modificar Detalle Requerimiento Orden de Compra123..." & ex.Message)
        End Try
    End Function

    <OperationContract()> _
    <WebInvoke(Method:="POST", ResponseFormat:=WebMessageFormat.Json)> _
    Public Function listarProveedoresxOrdenes(ByVal CompraServicio As String, ByVal RazonSocial As String, ByVal empresa As String) As String
        Dim ProvXOrd As New List(Of Object)()
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
            ElseIf empresa = 5 Then
                cx = "cnSiaf"
            End If

            conn.ConnectionString = ConfigurationManager.ConnectionStrings(cx).ConnectionString
            Using cmd As New SqlCommand()

                cmd.CommandText = "SP_BuscarProvXOrd"
                cmd.CommandType = CommandType.StoredProcedure

                cmd.Parameters.AddWithValue("@CompraServicio", CompraServicio)
                cmd.Parameters.AddWithValue("@RazonSocial", RazonSocial)

                cmd.Connection = conn
                conn.Open()
                Using sdr As SqlDataReader = cmd.ExecuteReader()
                    While sdr.Read()

                        ProvXOrd.Add(New With { _
                         Key .IdProveedor = sdr("IdProveedor"), _
                         Key .RazonSocial = sdr("RazonSocial") _
                        })

                    End While
                End Using
                conn.Close()
            End Using
            Return (New JavaScriptSerializer().Serialize(ProvXOrd))
        End Using
    End Function

    <OperationContract()> _
<WebInvoke(Method:="POST", ResponseFormat:=WebMessageFormat.Json)> _
    Public Function DatosProveedor(ByVal IdProveedor As String, ByVal empresa As String) As String
        Try
            Dim datosProv As New List(Of Object)()
            Using conn As New SqlConnection()
                Dim cx As String = ""

                If empresa = 1 Then
                    cx = "cnEmape"
                ElseIf empresa = 2 Then
                    cx = "cnEmapeMunicipal"
                ElseIf empresa = 3 Then
                    cx = "cnRegional"
                ElseIf empresa = 4 Then
                    cx = "cnMantenimientoVial"
                ElseIf empresa = 5 Then
                    cx = "cnSiaf"
                End If

                conn.ConnectionString = ConfigurationManager.ConnectionStrings(cx).ConnectionString
                Using cmd As New SqlCommand()

                    cmd.CommandText = "SP_ExtraerProveedor"
                    cmd.CommandType = CommandType.StoredProcedure
                    cmd.Parameters.AddWithValue("@IdProveedor", IdProveedor)

                    cmd.Connection = conn

                    conn.Open()
                    Using sdr As SqlDataReader = cmd.ExecuteReader()
                        While sdr.Read()

                            datosProv.Add(New With { _
                             Key .RazonSocial = sdr("RazonSocial") _
                            })
                        End While
                    End Using
                    conn.Close()
                End Using

                Return (New JavaScriptSerializer().Serialize(datosProv))
            End Using

        Catch ex As Exception
            Return "error"
        End Try
    End Function

    <OperationContract()> _
<WebInvoke(Method:="POST", ResponseFormat:=WebMessageFormat.Json)> _
    Public Function listarOrdenxProveedor(ByVal Idanno As String, ByVal compraservicio As String, ByVal IdProveedor As String, ByVal empresa As String) As String
        Dim NroActa As String
        Dim NroGuia As String

        Dim ordenesProv As New List(Of Object)()
        Using conn As New SqlConnection()
            Dim cx As String = ""

            If empresa = 1 Then
                cx = "cnEmape"
            ElseIf empresa = 2 Then
                cx = "cnEmapeMunicipal"
            ElseIf empresa = 3 Then
                cx = "cnRegional"
            ElseIf empresa = 4 Then
                cx = "cnMantenimientoVial"
            ElseIf empresa = 5 Then
                cx = "cnSiaf"
            End If

            conn.ConnectionString = ConfigurationManager.ConnectionStrings(cx).ConnectionString
            Using cmd As New SqlCommand()

                cmd.CommandText = "SP_FiltrarOrdenCompra_ServicioXProveedores"
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.AddWithValue("@Idanno", Idanno)
                cmd.Parameters.AddWithValue("@Compraservicio", compraservicio)
                cmd.Parameters.AddWithValue("@IdProveedor", IdProveedor)
                cmd.Parameters.AddWithValue("@Prorrateo", "N")

                cmd.Connection = conn
                conn.Open()
                Using sdr As SqlDataReader = cmd.ExecuteReader()
                    While sdr.Read()

                        If (IsDBNull(sdr("NroGuia"))) Then
                            NroGuia = ""
                        Else
                            NroGuia = sdr("NroGuia")
                        End If

                        If (IsDBNull(sdr("NroActa"))) Then
                            NroActa = ""
                        Else
                            NroActa = sdr("NroActa")
                        End If


                        ordenesProv.Add(New With { _
                            Key .IdOrdenCompra = sdr("IdOrdenCompra"), _
                            Key .IdRequerimiento = sdr("IdRequerimiento"), _
                            Key .DescripCentroCosto = sdr("DescripCentroCosto"), _
                            Key .FechaOrdenCompra = Format(sdr("FechaOrdenCompra"), "dd-MMM-yy"), _
                            Key .RazonSocial = sdr("RazonSocial").Substring(0, 50), _
                            Key .Moneda = sdr("Moneda") + "/.", _
                            Key .CostoTotal = Format(sdr("CostoTotal"), "##,##0.00"), _
                            Key .IngresoAlmacenDescrip = sdr("IngresoAlmacenDescrip"), _
                            Key .ProcedePagoDescrip = sdr("ProcedePagoDescrip"), _
                            Key .EstadoOrden = sdr("EstadoOrden"), _
                            Key .NroGuia = NroGuia, _
                            Key .NroActa = NroActa, _
                            Key .EstadoDescrip = sdr("EstadoDescrip"), _
                            Key .usuariomaquina = sdr("usuariomaquina") _
                         })
                    End While
                End Using
                conn.Close()
            End Using
            Return (New JavaScriptSerializer().Serialize(ordenesProv))
        End Using
    End Function

    '***************************'
    '----ACTA DE CONFORMIDAD----'
    '***************************'

    'LLENADO TABLA ACTA CONFIDAD
    <OperationContract()> _
<WebInvoke(Method:="POST", ResponseFormat:=WebMessageFormat.Json)> _
    Public Function listarActaConf(ByVal IdCentrocosto As String, ByVal IdAnno As String, ByVal IdMes As String, ByVal IdTipoDocumento As String, ByVal empresa As String) As String

        Dim actaconf As New List(Of Object)()
        Using conn As New SqlConnection()
            Dim cx As String = ""

            If empresa = 1 Then
                cx = "cnEmape"
            ElseIf empresa = 2 Then
                cx = "cnEmapeMunicipal"
            ElseIf empresa = 3 Then
                cx = "cnRegional"
            ElseIf empresa = 4 Then
                cx = "cnMantenimientoVial"
            ElseIf empresa = 5 Then
                cx = "cnSiaf"
            End If

            conn.ConnectionString = ConfigurationManager.ConnectionStrings(cx).ConnectionString
            Using cmd As New SqlCommand()

                cmd.CommandText = "SP_LOG_FiltrarActaConformidad2"
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.AddWithValue("@IdCentrocosto", IdCentrocosto)
                cmd.Parameters.AddWithValue("@IdAnno", IdAnno)
                cmd.Parameters.AddWithValue("@IdMes", IdMes)
                cmd.Parameters.AddWithValue("@IdTipoDocumento", IdTipoDocumento)

                cmd.Connection = conn
                conn.Open()
                Using sdr As SqlDataReader = cmd.ExecuteReader()
                    While sdr.Read()

                        actaconf.Add(New With { _
                            Key .DescripcionCentroCosto = sdr("DescripcionCentroCosto"), _
                            Key .RazonSocial = sdr("RazonSocial"), _
                            Key .Idanno = sdr("Idanno"), _
                            Key .Idmes = sdr("Idmes"), _
                            Key .IdActaConformidad = sdr("IdActaConformidad"), _
                            Key .AudFechaCreacion = Format(sdr("AudFechaCreacion"), "dd/MM/yyyy"), _
                            Key .IdFactura = sdr("IdFactura"), _
                            Key .IdOrdenCompra = sdr("IdOrdenCompra"), _
                            Key .Objeto = sdr("Objeto"), _
                            Key .MontoSolicitado = Format(sdr("MontoSolicitado"), "###0.00"), _
                            Key .fechainicioeje = IIf(IsDBNull(sdr("fechainicioeje")), "", sdr("fechainicioeje")), _
                            Key .fechaterminoeje = IIf(IsDBNull(sdr("fechaterminoeje")), "", sdr("fechaterminoeje")) _
                         })

                    End While
                End Using
                conn.Close()
            End Using
            Return (New JavaScriptSerializer().Serialize(actaconf))
        End Using
    End Function

    'MOSTRAR USUARIOS
    <OperationContract()> _
<WebInvoke(Method:="POST", ResponseFormat:=WebMessageFormat.Json)> _
    Public Function datosusuario() As String
        Try
            Dim usuarios As New List(Of Object)()
            Using conn As New SqlConnection()

                conn.ConnectionString = ConfigurationManager.ConnectionStrings("cnUtilitarios").ConnectionString
                Using cmd As New SqlCommand()

                    cmd.CommandText = "SP_MostrarUsuario"
                    cmd.CommandType = CommandType.StoredProcedure
                    cmd.Parameters.AddWithValue("@IdUsuario", Session("userid"))

                    cmd.Connection = conn

                    conn.Open()
                    Using sdr As SqlDataReader = cmd.ExecuteReader()
                        While sdr.Read()

                            usuarios.Add(New With { _
                             Key .IdUsuario = sdr("IdUsuario"), _
                             Key .Password = sdr("Password"), _
                             Key .Apellidos = sdr("Apellidos"), _
                             Key .Nombres = sdr("Nombres"), _
                             Key .IdUsuarioMaquina = sdr("IdUsuarioMaquina") _
                            })
                        End While
                    End Using
                    conn.Close()
                End Using
                Return (New JavaScriptSerializer().Serialize(usuarios))
            End Using

        Catch ex As Exception
            Return "error"
        End Try
    End Function

    <OperationContract()> _
<WebInvoke(Method:="POST", ResponseFormat:=WebMessageFormat.Json)> _
    Public Function datosConsultaDoc(ByVal IdOrdenCompra As String, ByVal IdRequerimiento As String, ByVal CompraServicio As String, ByVal empresa As String) As String
        Try
            Dim datosordenes As New List(Of Object)()
            Using con As New SqlConnection()
                Dim cx As String = ""

                If empresa = 1 Then
                    cx = "cnEmape"
                ElseIf empresa = 2 Then
                    cx = "cnEmapeMunicipal"
                ElseIf empresa = 3 Then
                    cx = "cnRegional"
                ElseIf empresa = 4 Then
                    cx = "cnMantenimiento"
                ElseIf empresa = 5 Then
                    cx = "cnSiaf"
                End If

                con.ConnectionString = ConfigurationManager.ConnectionStrings(cx).ConnectionString
                Using cmd As New SqlCommand()

                    cmd.CommandText = "SP_DatosConsultaOrdenes"
                    cmd.CommandType = CommandType.StoredProcedure
                    cmd.Parameters.AddWithValue("@IdOrdenCompra", IdOrdenCompra)
                    cmd.Parameters.AddWithValue("@CompraServicio", CompraServicio)

                    cmd.Connection = con

                    con.Open()
                    Using sdr As SqlDataReader = cmd.ExecuteReader()
                        While sdr.Read()

                            datosordenes.Add(New With { _
                             Key .IdProveedor = sdr("IdProveedor"), _
                             Key .RazonSocial = sdr("RazonSocial"), _
                             Key .Descripcion = sdr("Descripcion") _
                            })
                        End While
                    End Using
                    con.Close()
                End Using
                Return (New JavaScriptSerializer().Serialize(datosordenes))
            End Using

        Catch ex As Exception
            Return "error"
        End Try
    End Function

    <OperationContract()> _
     <WebInvoke(Method:="POST", ResponseFormat:=WebMessageFormat.Json)> _
    Public Function Envio_Email(ByVal Correo As String, ByVal Cuerpo As String) As String

        Try
            Dim tos As String = Correo
            'Dim from As String = "sistemas01@emape.gob.pe"
            Dim from As String = "sistemas01@emape.gob.pe"
            Dim subject As String = "FECHA DE ACEPTACION"
            Dim body As String = Cuerpo
            Using mm As New MailMessage(from, tos)
                mm.Subject = subject
                mm.Body = body

                mm.IsBodyHtml = True
                Dim smtp As New SmtpClient()
                smtp.Host = "mailserver.emape.gob.pe"
                'smtp.EnableSsl = True
                Dim NetworkCred As New NetworkCredential(from, "lima2016")
                smtp.UseDefaultCredentials = True
                smtp.Credentials = NetworkCred
                'smtp.Port = 587
                smtp.Send(mm)
            End Using

            Return (1)
        Catch ex As Exception
            Return ("Error while inserting record on table..." & ex.Message)
        End Try
    End Function

    <OperationContract()> _
     <WebInvoke(Method:="POST", ResponseFormat:=WebMessageFormat.Json)> _
    Public Function Envio_Email_Asistentes(ByVal CorreoAsistente As String, ByVal Cuerpo_mAsistente As String) As String

        Try
            Dim tos As String = CorreoAsistente
            'Dim from As String = "sistemas01@emape.gob.pe"
            Dim from As String = "sistemas01@emape.gob.pe"
            Dim subject As String = "FECHA DE ACEPTACION"
            Dim body As String = Cuerpo_mAsistente
            Using mm As New MailMessage(from, tos)
                mm.Subject = subject
                mm.Body = body

                mm.IsBodyHtml = True
                Dim smtp As New SmtpClient()
                smtp.Host = "mailserver.emape.gob.pe"
                'smtp.EnableSsl = True
                Dim NetworkCred As New NetworkCredential(from, "lima2016")
                smtp.UseDefaultCredentials = True
                smtp.Credentials = NetworkCred
                'smtp.Port = 587
                smtp.Send(mm)
            End Using

            Return (1)
        Catch ex As Exception
            Return ("Error while inserting record on table..." & ex.Message)
        End Try
    End Function
End Class

