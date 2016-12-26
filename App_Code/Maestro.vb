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
Public Class Maestro
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
    Public Function listarGerencia(empresa As String) As String
        Dim lista As New List(Of Object)()
        Using conn As New SqlConnection()
            Dim cx As String = entidad(empresa)

            conn.ConnectionString = ConfigurationManager.ConnectionStrings(cx).ConnectionString
            Using cmd As New SqlCommand()

                cmd.CommandText = "LG_CentroCostoLista"
                cmd.CommandType = CommandType.StoredProcedure

                cmd.Parameters.AddWithValue("@IdAnno", Year(Now))

                cmd.Connection = conn
                conn.Open()
                Using sdr As SqlDataReader = cmd.ExecuteReader()
                    While sdr.Read()

                        lista.Add(New With { _
                         Key .IdCentroCosto = sdr("IdCentroCosto"), _
                         Key .DescripcionCorta = sdr("DescripcionCorta") _
                        })
                    End While
                End Using
                conn.Close()
            End Using
            Return (New JavaScriptSerializer().Serialize(lista))
        End Using
    End Function

    <OperationContract()> _
    <WebInvoke(Method:="POST", ResponseFormat:=WebMessageFormat.Json)> _
    Public Function listarDepartamento(gerencia As String, empresa As String) As String
        Dim lista As New List(Of Object)()
        Using conn As New SqlConnection()
            Dim cx As String = entidad(empresa)

            conn.ConnectionString = ConfigurationManager.ConnectionStrings(cx).ConnectionString
            Using cmd As New SqlCommand()

                cmd.CommandText = "LG_CentroCostoLista2"
                cmd.CommandType = CommandType.StoredProcedure

                cmd.Parameters.AddWithValue("@IdAnno", Year(Now))
                cmd.Parameters.AddWithValue("@Gerencia", gerencia)

                cmd.Connection = conn
                conn.Open()
                Using sdr As SqlDataReader = cmd.ExecuteReader()
                    While sdr.Read()

                        lista.Add(New With { _
                         Key .IdCentroCosto = sdr("IdCentroCosto"), _
                         Key .DescripcionCorta = sdr("DescripcionCorta") _
                        })
                    End While
                End Using
                conn.Close()
            End Using
            Return (New JavaScriptSerializer().Serialize(lista))
        End Using
    End Function

    <OperationContract()> _
    <WebInvoke(Method:="POST", ResponseFormat:=WebMessageFormat.Json)> _
    Public Function listarLocadorArea(gerencia As String, departamento As String, empresa As String) As String
        Dim fgp, cod, des As String
        Dim lista As New List(Of Object)()
        Using conn As New SqlConnection()
            Dim cx As String = entidad(empresa)

            conn.ConnectionString = ConfigurationManager.ConnectionStrings(cx).ConnectionString
            Using cmd As New SqlCommand()

                cmd.CommandText = "LG_LocadorPorArea"
                cmd.CommandType = CommandType.StoredProcedure

                cmd.Parameters.AddWithValue("@IdCentroCosto", gerencia)
                cmd.Parameters.AddWithValue("@IdCentroCostoDepartamento", departamento)

                cmd.Connection = conn
                conn.Open()
                Using sdr As SqlDataReader = cmd.ExecuteReader()
                    While sdr.Read()
                        If (IsDBNull(sdr("FechaOrdenCompra"))) Then
                            fgp = ""
                        Else
                            fgp = Format(sdr("FechaOrdenCompra"), "dd/MM/yyyy")
                        End If
                        If (IsDBNull(sdr("IdOrdenCompra"))) Then
                            cod = ""
                        Else
                            cod = sdr("IdOrdenCompra")
                        End If
                        If (IsDBNull(sdr("DescripCC"))) Then
                            des = ""
                        Else
                            des = sdr("DescripCC")
                        End If
                        lista.Add(New With { _
                             Key .IdProveedor = sdr("IdProveedor"), _
                             Key .Razonsocial = sdr("Razonsocial"), _
                             Key .IdCentroCosto = sdr("IdCentroCosto"), _
                             Key .ApPaterno = sdr("ApPaterno"), _
                             Key .ApMaterno = sdr("ApMaterno"), _
                             Key .Nombres = sdr("Nombres"), _
                             Key .CCI = sdr("CCI"), _
                             Key .Importe = sdr("Importe"), _
                             Key .DescripCC = des, _
                             Key .IdOrdenCompra = cod, _
                             Key .FechaOrdenCompra = fgp, _
                             Key .ValorVenta = sdr("ValorVenta"), _
                             Key .DescripLocadorTipo = sdr("DescripLocadorTipo"), _
                             Key .Tarea = sdr("Tarea"), _
                             Key .Saldo = sdr("Saldo") _
                        })
                    End While
                End Using
                conn.Close()
            End Using
            Return (New JavaScriptSerializer().Serialize(lista))
        End Using
    End Function

    <OperationContract()> _
<WebInvoke(Method:="POST", ResponseFormat:=WebMessageFormat.Json)> _
    Public Function listarBienServicio(descripcion As String, tipo As String, empresa As String) As String
        Dim lista As New List(Of Object)()
        Using conn As New SqlConnection()
            Dim cx As String = entidad(empresa)

            conn.ConnectionString = ConfigurationManager.ConnectionStrings(cx).ConnectionString
            Using cmd As New SqlCommand()

                cmd.CommandText = "SP_LOG_Listar_BienServicio"
                cmd.CommandType = CommandType.StoredProcedure

                cmd.Parameters.AddWithValue("@Descripcion", descripcion)
                cmd.Parameters.AddWithValue("@IdTipoBienServicio", tipo)

                cmd.Connection = conn
                conn.Open()
                Using sdr As SqlDataReader = cmd.ExecuteReader()
                    While sdr.Read()
                        lista.Add(New With { _
                             Key .IdBienServicio = sdr("IdBienServicio"), _
                             Key .Descripcion = sdr("Descripcion") _
                        })
                    End While
                End Using
                conn.Close()
            End Using
            Return (New JavaScriptSerializer().Serialize(lista))
        End Using
    End Function



    <OperationContract()> _
  <WebInvoke(Method:="POST", ResponseFormat:=WebMessageFormat.Json)> _
    Public Function EliminarAsignacionGerencia(ruc As String, empresa As String) As String
        Dim strMensaje As String = ""

        Using conn As New SqlConnection()
            Dim cx As String = ""
            cx = entidad(empresa)
            conn.ConnectionString = ConfigurationManager.ConnectionStrings(cx).ConnectionString
            Using cmd As New SqlCommand()
                conn.Open()
                cmd.Connection = conn
                Try
                    cmd.CommandText = "LG_LocadorQuitar"
                    cmd.CommandType = CommandType.StoredProcedure
                    cmd.Parameters.AddWithValue("@IdProveedor", ruc)
                    cmd.Parameters.Add("@Mensaje", SqlDbType.VarChar, 100)
                    cmd.Parameters("@Mensaje").Direction = ParameterDirection.Output
                    cmd.ExecuteNonQuery()

                    'Obtener Mensaje de SP
                    strMensaje = cmd.Parameters("@mensaje").Value.ToString.Trim()
                    Return (strMensaje)
                    conn.Close()
                Catch ex As Exception
                    Return ("Error while inserting record on table..." & ex.Message)
                End Try
            End Using
        End Using
    End Function

    <OperationContract()> _
 <WebInvoke(Method:="POST", ResponseFormat:=WebMessageFormat.Json)> _
    Public Function AsignarGerencia(cod As String, xdepartamento As String, xempresa As String) As String
        Dim strMensaje As String = ""

        Using conn As New SqlConnection()
            Dim cx As String = ""
            cx = entidad(xempresa)
            conn.ConnectionString = ConfigurationManager.ConnectionStrings(cx).ConnectionString
            Using cmd As New SqlCommand()
                conn.Open()
                cmd.Connection = conn
                Try
                    cmd.CommandText = "LG_LocadorAgregar"
                    cmd.CommandType = CommandType.StoredProcedure
                    cmd.Parameters.AddWithValue("@IdProveedor", cod)
                    cmd.Parameters.AddWithValue("@IdCentroCosto", xdepartamento)
                    cmd.Parameters.AddWithValue("@IdLocadorTipo", "")

                    cmd.Parameters.Add("@Mensaje", SqlDbType.VarChar, 100)
                    cmd.Parameters("@Mensaje").Direction = ParameterDirection.Output
                    cmd.ExecuteNonQuery()

                    'Obtener Mensaje de SP
                    strMensaje = cmd.Parameters("@mensaje").Value.ToString.Trim()
                    Return (strMensaje)
                    conn.Close()
                Catch ex As Exception
                    Return ("Error while inserting record on table..." & ex.Message)
                End Try
            End Using
        End Using
    End Function

    <OperationContract()> _
    <WebInvoke(Method:="POST", ResponseFormat:=WebMessageFormat.Json)> _
    Public Function listarIncidencia() As String
        Dim lista As New List(Of Object)()
        Using conn As New SqlConnection()
            Dim cx As String = entidad("1")
            Dim fa, fc As String
            conn.ConnectionString = ConfigurationManager.ConnectionStrings(cx).ConnectionString
            Using cmd As New SqlCommand()

                cmd.CommandText = "SP_MAE_ListarIncidencia"
                cmd.CommandType = CommandType.StoredProcedure

                'cmd.Parameters.AddWithValue("@IdAnno", Year(Now))

                cmd.Connection = conn
                conn.Open()
                Using sdr As SqlDataReader = cmd.ExecuteReader()
                    While sdr.Read()

                        If (IsDBNull(sdr("fecha_creada"))) Then
                            fc = ""
                        Else
                            fc = Format(sdr("fecha_creada"), "dd/MM/yyyy")
                        End If

                        If (IsDBNull(sdr("fecha_atencion"))) Then
                            fa = ""
                        Else
                            fa = Format(sdr("fecha_atencion"), "dd/MM/yyyy")
                        End If

                        lista.Add(New With { _
                             Key .id_registro = sdr("id_registro"), _
                             Key .nro_incidencia = sdr("nro_incidencia"), _
                             Key .motivo = sdr("motivo"), _
                             Key .descripcion = sdr("descripcion"), _
                             Key .usuario_creador = sdr("usuario_creador"), _
                             Key .estado = sdr("estado"), _
                             Key .prioridad = sdr("prioridad"), _
                             Key .accion = sdr("accion"), _
                             Key .fecha_creada = fc, _
                             Key .fecha_atencion = fa, _
                             Key .usuario_modificador = sdr("usuario_modificador"), _
                             Key .correo = sdr("correo"), _
                             Key .area = sdr("area"), _
                             Key .entidad_solucion = sdr("entidad_solucion"), _
                             Key .images = sdr("images"), _
                             Key .DescripcionCorta = sdr("DescripcionCorta"), _
                             Key .usuario = sdr("usuario"), _
                             Key .supervisor = sdr("supervisor"), _
                             Key .estado_registro = sdr("estado_registro") _
                        })
                    End While
                End Using
                conn.Close()
            End Using
            Return (New JavaScriptSerializer().Serialize(lista))
        End Using
    End Function
End Class
