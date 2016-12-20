
Partial Class FechaAceptacionOrden
    Inherits System.Web.UI.Page

    'Protected Sub EnviarCorreo(sender As Object, e As EventArgs)

    '    Dim Destino = txt_Destino.Text
    '    Dim Cuerpo = txt_Cuerpo.Text
    '    Dim Asunto = txt_Asunto.Text

    '    Dim correo As New System.Net.Mail.MailMessage
    '    Dim destinatario As String
    '    Dim smtp As New System.Net.Mail.SmtpClient


    '    destinatario = Destino
    '    'correo.From = New System.Net.Mail.MailAddress("Direccion@host.com", "NOMBRE QUE APARECERA EN EL FROM")
    '    correo.From = New System.Net.Mail.MailAddress("sistemas01@emape.gob.pe", "CONTROL DE SALIDAS")
    '    correo.To.Add(destinatario)
    '    correo.Subject = Asunto
    '    correo.Body = Cuerpo
    '    correo.IsBodyHtml = False
    '    correo.Priority = System.Net.Mail.MailPriority.Normal


    '    'smtp.Host = "HOST SMTP DESDE LA QE ENVIAS"
    '    smtp.Host = "mailserver.emape.gob.pe"
    '    'smtp.Credentials = New System.Net.NetworkCredential("DIRECCION DESDE LA QUE ENVIAS", "PASSWORD")
    '    smtp.Credentials = New System.Net.NetworkCredential("sistemas01@emape.gob.pe", "lima2016")
    '    'smtp.Port = 587 
    '    'smtp.EnableSsl = True  (Estas te valen para enviar desde GMAIL


    '    smtp.Send(correo)

    'End Sub

End Class
