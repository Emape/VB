Imports System.IO

Partial Class Index
    Inherits System.Web.UI.Page


    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load
        If Session("username") = "" Then
            Response.Redirect("../login/Index.aspx")
            'Else
            '    Dim serverPath As String = Server.MapPath("~/images/") + Path.GetFileName("~/images/login-logo.png")

            '    If File.Exists(serverPath) Then
            '        Response.Write(Server.MapPath("~/"))
            '    Else
            '        Response.Write("fail")
            '        Response.Redirect("../Home/Index.aspx")
            '    End If

        End If

       


    End Sub


End Class
