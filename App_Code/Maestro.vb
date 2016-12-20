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

End Class
