Imports System.Data
Imports System.Data.SqlClient
Imports System.Web.Script.Serialization

Public Class Index
    Inherits System.Web.UI.Page

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        Session.RemoveAll()
    End Sub

    Public Function Acceso() As String

        If user.Text = "" Then
            divmsj.Text = "Ingrese su usuario"
            divmsj.Style.Value = Visible
        ElseIf pass.Text = "" Then
            divmsj.Text = "Ingrese su contraseña"
            divmsj.Style.Value = Visible
        Else
            Dim userId As Object = 0

            Try
                Using con As New SqlConnection()
                    con.ConnectionString = ConfigurationManager.ConnectionStrings("cnUtilitarios").ConnectionString
                    Using cmd As New SqlCommand()
                        cmd.CommandText = "select Email, Transporte,EstadoSiaf,EstadoVial,IdUsuario, Apellidos+' '+ Nombres as NameUsuario ,IdCentroCosto from SS_USUARIO WHERE IdUsuario=@user and Password=@pass and Estado='A'"
                        cmd.Parameters.AddWithValue("@user", user.Text)
                        cmd.Parameters.AddWithValue("@pass", pass.Text)
                        cmd.Connection = con
                        con.Open()

                        Using sdr As SqlDataReader = cmd.ExecuteReader()
                            While sdr.Read()
                                userId = sdr("IdUsuario")
                                Session("userid") = sdr("IdUsuario")
                                Session("email") = sdr("Email")
                                Session("useridcc") = sdr("IdCentroCosto")
                                Session("username") = sdr("NameUsuario")
                                Session("siaf") = sdr("EstadoSiaf")
                                Session("vial") = sdr("EstadoVial")
                                Session("transporte") = IIf(IsDBNull(sdr("Transporte")), "", sdr("Transporte"))
                            End While
                        End Using

                        If userId = 0 Then
                            divmsj.Text = "Datos Incorrectos"
                            divmsj.Style.Value = Visible
                        Else
                            Response.Redirect("../Home/Index.aspx")
                        End If
                        Return ""

                        con.Close()
                    End Using
                End Using
            Catch ex As Exception
                divmsj.Text = "Error del Sistema"
                Return ""
            End Try
        End If
        Return ""
    End Function

   

End Class
