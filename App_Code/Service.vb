Imports System.Collections.Generic
Imports System.Linq
Imports System.Runtime.Serialization
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
Imports System.Net
Imports System.Net.Mail

<ServiceContract()> _
<AspNetCompatibilityRequirements(RequirementsMode:=AspNetCompatibilityRequirementsMode.Allowed)> _
Public Class Service
    Inherits System.Web.UI.Page
	
	 <OperationContract()> _
    <WebInvoke(Method:="POST", ResponseFormat:=WebMessageFormat.Json)> _
    Public Function Access(ByVal user As String,ByVal pass As String) As String
	Dim userId As Object = 0
    Using con As New SqlConnection()
	con.ConnectionString = ConfigurationManager.ConnectionStrings("cnUtilitarios").ConnectionString
        Using cmd As New SqlCommand()
            cmd.CommandText = "select IdCentroCosto from SS_USUARIO WHERE IdUsuario=@user and Password=@pass and Estado='A'"
			cmd.Parameters.AddWithValue("@user", user)
			cmd.Parameters.AddWithValue("@pass", pass)
            cmd.Connection = con
            con.Open()
            userId = cmd.ExecuteScalar()
			Return (userId)
            con.Close()
        End Using
    End Using

    End Function
	
	<OperationContract()> _
    <WebInvoke(Method:="POST", ResponseFormat:=WebMessageFormat.Json)> _
    Public Function ListPic(ByVal prefix As String) As String
        Dim mc As New List(Of Object)()
        Using conn As New SqlConnection()
            conn.ConnectionString = ConfigurationManager.ConnectionStrings("cn").ConnectionString
            Using cmd As New SqlCommand()
                Dim anio = Year(Now)
                Dim mes = Month(Now)

                If mes > 9 Then
                    mes = mes
                Else
                    mes = "0" + mes
                End If
                cmd.CommandText = "select * from MovilidadComision where Estado='A' and AudFechaCreacion >='01/" & mes & "/" & anio & "' order by AudFechaCreacion desc"

                cmd.Connection = conn
                conn.Open()
                Using sdr As SqlDataReader = cmd.ExecuteReader()
                    While sdr.Read()
                        Dim tipox As String = ""
                        If sdr("Tipo") = 1 Then
                            tipox = "Ingreso"
                        ElseIf sdr("Tipo") = 2 Then
                            tipox = "Salida"
                        Else
                            tipox = ""
                        End If

                        mc.Add(New With { _
                         Key .Idmc = sdr("IdMovilidadComision").ToString().PadLeft(10, CChar("0")), _
                         Key .Placa = sdr("IdPlaca"), _
                         Key .Chofer = sdr("IdChofer"), _
                         Key .Foto = sdr("IdFoto"), _
                         Key .Fecha = Format(sdr("AudFechaCreacion"), "dd/MM/yyyy HH:mm:ss"), _
                         Key .Tipo = tipox, _
                         Key .IdTipo = sdr("Tipo"), _
                         Key .Kilometraje = sdr("Kilometraje"), _
                         Key .Km = sdr("DistanciaKm"), _
                         Key .Destino = sdr("Destino"), _
                         Key .Detalle = sdr("Descripcion") _
                        })
                    End While
                End Using
                conn.Close()
            End Using
            Return (New JavaScriptSerializer().Serialize(mc))
        End Using
    End Function
	
	<OperationContract()> _
    <WebInvoke(Method:="POST", ResponseFormat:=WebMessageFormat.Json)> _
    Public Function getReg(ByVal prefix As Integer) As String
        Dim mc As New List(Of Object)()
        Using conn As New SqlConnection()
            conn.ConnectionString = ConfigurationManager.ConnectionStrings("cn").ConnectionString
            Using cmd As New SqlCommand()
                cmd.CommandText = "select * from MovilidadComision WHERE IdMovilidadComision=@prefix"
				cmd.Parameters.AddWithValue("@prefix", prefix)
                cmd.Connection = conn
                conn.Open()
                Using sdr As SqlDataReader = cmd.ExecuteReader()
                    While sdr.Read()
										
                        mc.Add(New With { _
                         Key .Codigo = sdr("IdMovilidadComision").ToString().PadLeft(10, CChar("0")), _
						 Key .Placa = sdr("IdPlaca"), _
                         Key .Chofer = sdr("IdChofer"), _
						 Key .Foto = sdr("IdFoto"), _
                         Key .Tipo = sdr("Tipo"), _
						 Key .IdTipo = sdr("Tipo"), _
						 Key .Kilometraje = sdr("Kilometraje"), _
                         Key .Km = sdr("DistanciaKm"), _
						 Key .Destino = sdr("Destino"), _
						 Key .Chk = sdr("Chk"), _
						 Key .Combustible = sdr("Combustible"), _
						 Key .Detalle = sdr("Descripcion") _
                        })
	                    End While
                End Using
                conn.Close()
            End Using
            Return (New JavaScriptSerializer().Serialize(mc))
        End Using
    End Function
	
    <OperationContract()> _
     <WebInvoke(Method:="POST", ResponseFormat:=WebMessageFormat.Json)> _
      Public Function EditPic(ByVal cod As String, ByVal placa As String, ByVal chofer As String, ByVal tipo As String, ByVal kilometraje As String, ByVal km As String, ByVal destino As String, ByVal detalle As String, ByVal user As String, ByVal combustible As String, ByVal chk As String, ByVal completo As String) As String

        Try
            Using conn As New SqlConnection()
                conn.ConnectionString = ConfigurationManager.ConnectionStrings("cn").ConnectionString
                Dim fechaactual As DateTime = DateTime.Now
                Dim tipodet As String = ""
                Using cmd As New SqlCommand()
                    conn.Open()
                    cmd.Connection = conn
                    cmd.CommandText = "UPDATE MovilidadComision SET AudUsuarioModificacion=@user,Combustible=@combustible,Chk=@chk,Destino=@destino,AudFechaModificacion=@fechaactual,IdPlaca=@placa, IdChofer=@chofer, Tipo=@tipo, Kilometraje=@kilometraje,DistanciaKm=@km,Descripcion=@detalle WHERE IdMovilidadComision=@cod"
                    cmd.Parameters.AddWithValue("@cod", cod)
                    cmd.Parameters.AddWithValue("@placa", placa)
                    cmd.Parameters.AddWithValue("@chofer", chofer)
                    cmd.Parameters.AddWithValue("@tipo", tipo)
                    cmd.Parameters.AddWithValue("@kilometraje", kilometraje)
                    cmd.Parameters.AddWithValue("@km", km)
                    cmd.Parameters.AddWithValue("@destino", destino)
                    cmd.Parameters.AddWithValue("@detalle", detalle)
                    cmd.Parameters.AddWithValue("@fechaactual", fechaactual)
                    cmd.Parameters.AddWithValue("@user", user)
                    cmd.Parameters.AddWithValue("@combustible", combustible)
                    cmd.Parameters.AddWithValue("@chk", chk)
                    cmd.ExecuteNonQuery()


                    If tipo = 1 Then
                        tipodet = "Ingresar"
                    Else
                        tipodet = "Salir"
                    End If


                    If combustible = 1 Then

                        Dim tos As String = "jpoma@emape.gob.pe"
                        Dim from As String = "rarmijo@emape.gob.pe"
                        Dim subject As String = "Advertencia de Vehículos "
                        Dim body As String = "El Vehículo con placa N° " + placa + ", conducido por " + completo + " acaba de " + tipodet + " con menos de 1/4 de Tanque." + vbCrLf + " Por favor proceder como corresponda."
                        Using mm As New MailMessage(from, tos)
                            mm.Subject = subject
                            mm.Body = body

                            mm.IsBodyHtml = True
                            Dim smtp As New SmtpClient()
                            smtp.Host = "mailserver.emape.gob.pe"
                            'smtp.EnableSsl = True
                            Dim NetworkCred As New NetworkCredential(from, "lima2015")
                            smtp.UseDefaultCredentials = True
                            smtp.Credentials = NetworkCred
                            smtp.Port = 587
                            smtp.Send(mm)
                        End Using




                    End If

                End Using
                Return (1)
            End Using
        Catch ex As Exception
            Return ("Error while inserting record on table..." & ex.Message)
        End Try
    End Function

    <OperationContract()> _
 <WebInvoke(Method:="POST", ResponseFormat:=WebMessageFormat.Json)> _
    Public Function EditPic2(ByVal cod As String, ByVal placa As String, ByVal chofer As String, ByVal tipo As String, ByVal kilometraje As String, ByVal destino As String, ByVal detalle As String, ByVal combustible As String, ByVal fec As String, ByVal documentacion As String, ByVal accesorio As String, ByVal revision As String) As String

        Try
            Using conn As New SqlConnection()
                conn.ConnectionString = ConfigurationManager.ConnectionStrings("cnEmape").ConnectionString
                Using cmd As New SqlCommand()
                    conn.Open()
                    cmd.Connection = conn
                    cmd.CommandText = "UPDATE MovilidadComision SET Combustible=@combustible,AudFechaCreacion=@fec,Destino=@destino,IdPlaca=@placa, IdChofer=@chofer, Tipo=@tipo, Kilometraje=@kilometraje,Descripcion=@detalle,documentacion=@documentacion,accesorio=@accesorio,revision=@revision WHERE IdMovilidadComision=@cod"

                    cmd.Parameters.AddWithValue("@cod", cod * 1)
                    cmd.Parameters.AddWithValue("@placa", placa)
                    cmd.Parameters.AddWithValue("@chofer", chofer)
                    cmd.Parameters.AddWithValue("@tipo", tipo)
                    cmd.Parameters.AddWithValue("@kilometraje", kilometraje)
                    cmd.Parameters.AddWithValue("@destino", destino)
                    cmd.Parameters.AddWithValue("@detalle", detalle)
                    cmd.Parameters.AddWithValue("@fec", DateTime.Parse(fec))
                    cmd.Parameters.AddWithValue("@combustible", combustible)
                    cmd.Parameters.AddWithValue("@documentacion", documentacion)
                    cmd.Parameters.AddWithValue("@accesorio", accesorio)
                    cmd.Parameters.AddWithValue("@revision", revision)
                    cmd.ExecuteNonQuery()
                End Using
                Return (1)
            End Using
        Catch ex As Exception
            Return ("Error..." & ex.Message)
        End Try
    End Function

    <OperationContract()> _
   <WebInvoke(Method:="POST", ResponseFormat:=WebMessageFormat.Json)> _
    Public Function InsPic(ByVal datafoto As String,ByVal user As String,ByVal costo As String) As String
        'Defino mis variables
        Dim idfoto As String
		Dim anno As String = Year(DateTime.Now)
		Dim mes As String = Month(DateTime.Now) 
		Dim fechaactual As DateTime = DateTime.Now 
        'Genero el id de la foto en timestamp
        idfoto = (DateTime.Now - New DateTime(1970, 1, 1, 0, 0, 0, 0)).TotalSeconds & ".jpg"

        datafoto = datafoto.Replace("data:image/png;base64,", "")

        Dim imagePath As String = String.Format("~/Container/{0}", idfoto)
        File.WriteAllBytes(Server.MapPath(imagePath), System.Convert.FromBase64String(datafoto))



        Try
            Using conn As New SqlConnection()
                conn.ConnectionString = ConfigurationManager.ConnectionStrings("cn").ConnectionString

				Using cmd As New SqlCommand()
                    conn.Open()
                    cmd.Connection = conn
                    cmd.CommandText = "INSERT INTO MovilidadComision (idFoto,Tipo,IdAnno,AudUsuario,AudUsuarioModificacion,IdCentroCosto,IdMes,AudFechaCreacion,AudFechaModificacion,Chk,Combustible,Destino) values( @data,'0',@anno,@user,@user,@cc,@mes,@fechaactual,@fechaactual,'1','0','')"
                    cmd.Parameters.AddWithValue("@data", idfoto)
					cmd.Parameters.AddWithValue("@anno", anno)
					cmd.Parameters.AddWithValue("@mes", mes)
					cmd.Parameters.AddWithValue("@fechaactual", fechaactual)
					cmd.Parameters.AddWithValue("@user", user)
					cmd.Parameters.AddWithValue("@cc", costo)
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
    Public Function InsPic2(ByVal placa As String, ByVal chofer As String, ByVal tipo As String, ByVal kilometraje As String, ByVal costo As String, ByVal km As String, ByVal destino As String, ByVal detalle As String, ByVal user As String, ByVal combustible As String, ByVal chk As String, ByVal completo As String, ByVal fec As String) As String

        'Defino mis variables

        Dim anno As String = Year(DateTime.Now)
        Dim mes As String = Month(DateTime.Now)
        Dim fechaactual As DateTime = DateTime.Now

        'Genero el id de la foto en timestamp


        Try
            Using conn As New SqlConnection()
                conn.ConnectionString = ConfigurationManager.ConnectionStrings("cnEmape").ConnectionString

                Using cmd As New SqlCommand()
                    conn.Open()
                    cmd.Connection = conn
                    cmd.CommandText = "INSERT INTO MovilidadComision (Estado,IdPlaca,IdChofer,Tipo,Kilometraje,DistanciaKm,IdAnno,IdMes,IdCentroCosto,Destino,Descripcion,AudFechaCreacion,AudFechaModificacion,AudUsuario,AudUsuarioModificacion,Combustible,Chk,manual) values('A',@placa,@chofer,@tipo,@kilometraje,@km,@anno,@mes,@cc,@destino,@detalle,@fechaorigen,@fechaactual,@user,@user,@combustible,@chk,'1')"
                    cmd.Parameters.AddWithValue("@placa", placa)
                    cmd.Parameters.AddWithValue("@chofer", chofer)
                    cmd.Parameters.AddWithValue("@tipo", tipo)
                    cmd.Parameters.AddWithValue("@kilometraje", kilometraje)
                    cmd.Parameters.AddWithValue("@km", km)
                    cmd.Parameters.AddWithValue("@anno", anno)
                    cmd.Parameters.AddWithValue("@mes", mes)
                    cmd.Parameters.AddWithValue("@cc", "050000")
                    cmd.Parameters.AddWithValue("@destino", destino)
                    cmd.Parameters.AddWithValue("@detalle", detalle)
                    cmd.Parameters.AddWithValue("@user", "0050")
                    If fec = "" Then
                        cmd.Parameters.AddWithValue("@fechaorigen", DBNull.Value)
                    Else
                        cmd.Parameters.AddWithValue("@fechaorigen", DateTime.Parse(fec))
                    End If
                    cmd.Parameters.AddWithValue("@fechaactual", fechaactual)
                    cmd.Parameters.AddWithValue("@combustible", combustible)
                    cmd.Parameters.AddWithValue("@chk", chk)
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
    Public Function getPlaca(ByVal prefix As String) As String
        Dim mc As New List(Of Object)()
        Using conn As New SqlConnection()
            conn.ConnectionString = ConfigurationManager.ConnectionStrings("cnEmape").ConnectionString
            Using cmd As New SqlCommand()
                cmd.CommandText = "select * from Vehiculos LEFT OUTER JOIN ActivoFijoMarca ON ActivoFijoMarca.IdMarca=Vehiculos.IdMarca LEFT OUTER JOIN view_max_kilometraje on view_max_kilometraje.Placa=Vehiculos.Idplaca WHERE Vehiculos.Estado='A' and Idplaca=@prefix "
				cmd.Parameters.AddWithValue("@prefix", prefix)
                cmd.Connection = conn
                conn.Open()
                Using sdr As SqlDataReader = cmd.ExecuteReader()
                    While sdr.Read()	
                        mc.Add(New With { _
                         Key .Modelo = sdr("Modelo"), _
                         Key .Color = sdr("Color"), _
						 Key .Max = sdr("maximo"), _
						 Key .Marca = sdr("Descripcion") _
                        })
                    End While
                End Using
                conn.Close()
            End Using
            Return (New JavaScriptSerializer().Serialize(mc))
        End Using
    End Function
	
	<OperationContract()> _
    <WebInvoke(Method:="POST", ResponseFormat:=WebMessageFormat.Json)> _
    Public Function getChofer(ByVal prefix As String) As String
        Dim chofer As New List(Of Object)()
        Using conn As New SqlConnection()
            conn.ConnectionString = ConfigurationManager.ConnectionStrings("cnEmape").ConnectionString
            Using cmd As New SqlCommand()
                cmd.CommandText = "select * from Choferes where Estado='A' and IdChofer=@prefix"
				cmd.Parameters.AddWithValue("@prefix", prefix)
                cmd.Connection = conn
                conn.Open()
                Using sdr As SqlDataReader = cmd.ExecuteReader()
                    While sdr.Read()
										
                        chofer.Add(New With { _
                         Key .Apellidos = Trim(sdr("Apellidos")), _
						 Key .Nombres = Trim(sdr("Nombres")) _
                        })
                    End While
                End Using
                conn.Close()
            End Using
            Return (New JavaScriptSerializer().Serialize(chofer))
        End Using
    End Function

    Private Shared Function ConvertHexToBytes(hex As String) As Byte()
        Dim bytes As Byte() = New Byte(hex.Length / 2 - 1) {}
        For i As Integer = 0 To hex.Length - 1 Step 2
            bytes(i / 2) = Convert.ToByte(hex.Substring(i, 2), 16)
        Next
        Return bytes
    End Function

End Class
