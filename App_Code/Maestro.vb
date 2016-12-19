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

        Dim Lista As New List(Of Object)()
        Using conn As New SqlConnection()
            Dim cx As String = ""

            cx = entidad(empresa)

            conn.ConnectionString = ConfigurationManager.ConnectionStrings(cx).ConnectionString
            Using cmd As New SqlCommand()

                cmd.CommandText = "LG_CentroCostoLista"
                cmd.CommandType = CommandType.StoredProcedure

                cmd.Parameters.AddWithValue("@IdAnno", Year(Now()))

                cmd.Connection = conn
                conn.Open()
                Using sdr As SqlDataReader = cmd.ExecuteReader()
                    While sdr.Read()
                        Lista.Add(New With { _
                         Key .IdCentroCosto = sdr("IdCentroCosto"), _
                         Key .DescripcionCorta = sdr("DescripcionCorta") _
                        })

                    End While
                End Using
                conn.Close()
            End Using
            Return (New JavaScriptSerializer().Serialize(Lista))
        End Using
    End Function

    <OperationContract()> _
    <WebInvoke(Method:="POST", ResponseFormat:=WebMessageFormat.Json)> _
    Public Function listarDepartamento(gerencia As String, empresa As String) As String

        Dim Lista As New List(Of Object)()
        Using conn As New SqlConnection()
            Dim cx As String = ""

            cx = entidad(empresa)

            conn.ConnectionString = ConfigurationManager.ConnectionStrings(cx).ConnectionString
            Using cmd As New SqlCommand()

                cmd.CommandText = "LG_CentroCostoLista2"
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.AddWithValue("@Gerencia", gerencia)
                cmd.Parameters.AddWithValue("@IdAnno", Year(Now()))

                cmd.Connection = conn
                conn.Open()
                Using sdr As SqlDataReader = cmd.ExecuteReader()
                    While sdr.Read()
                        Lista.Add(New With { _
                         Key .IdCentroCosto = sdr("IdCentroCosto"), _
                         Key .DescripcionCorta = sdr("DescripcionCorta") _
                        })

                    End While
                End Using
                conn.Close()
            End Using
            Return (New JavaScriptSerializer().Serialize(Lista))
        End Using
    End Function

    ' <OperationContract()> _
    '<WebInvoke(Method:="POST", ResponseFormat:=WebMessageFormat.Json)> _
    ' Public Function listarDepartamento(gerencia As String, empresa As String) As String

    '     Dim Lista As New List(Of Object)()
    '     Using conn As New SqlConnection()
    '         Dim cx As String = ""

    '         cx = entidad(empresa)

    '         conn.ConnectionString = ConfigurationManager.ConnectionStrings(cx).ConnectionString
    '         Using cmd As New SqlCommand()

    '             cmd.CommandText = "LG_LocadorArea"
    '             cmd.CommandType = CommandType.StoredProcedure
    '             cmd.Parameters.AddWithValue("@Gerencia", gerencia)
    '             cmd.Parameters.AddWithValue("@IdAnno", Year(Now()))

    '             cmd.Connection = conn
    '             conn.Open()
    '             Using sdr As SqlDataReader = cmd.ExecuteReader()
    '                 While sdr.Read()
    '                     Lista.Add(New With { _
    '                      Key .IdCentroCosto = sdr("IdCentroCosto"), _
    '                      Key .DescripcionCorta = sdr("DescripcionCorta") _
    '                     })

    '                 End While
    '             End Using
    '             conn.Close()
    '         End Using
    '         Return (New JavaScriptSerializer().Serialize(Lista))
    '     End Using
    ' End Function

End Class
