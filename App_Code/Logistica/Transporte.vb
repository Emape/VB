Imports System.Collections.Generic
Imports System.Linq
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
Public Class Transporte
    Inherits System.Web.UI.Page
    <OperationContract()> _
    <WebInvoke(Method:="POST", ResponseFormat:=WebMessageFormat.Json)> _
    Public Function listarCombustible(ByVal anno As String, ByVal mes As String) As String
        Dim fec, comb, idcomb, feccrea As String
        Dim Com As New List(Of Object)()
        Using conn As New SqlConnection()


            conn.ConnectionString = ConfigurationManager.ConnectionStrings("cnEmapeProduccion").ConnectionString
            Using cmd As New SqlCommand()
                cmd.CommandText = "select MovilidadComision.*, Choferes.Apellidos +' '+ Choferes.Nombres AS Conductor,Choferes.TipoVehiculo, TipoCombustible.Descripcion as CombustibleTipo, TipoCombustible.IdTipoCombustible from MovilidadComision INNER JOIN Choferes on Choferes.IdChofer=MovilidadComision.IdChofer LEFT OUTER JOIN TipoCombustible on TipoCombustible.IdTipoCombustible=MovilidadComision.TipoCombustible where tipo=2 and IdAnno=" & anno & " and IdMes=" & mes & "  order by MovilidadComision.AudFechaCreacion desc"

                cmd.Connection = conn
                conn.Open()
                Using sdr As SqlDataReader = cmd.ExecuteReader()
                    While sdr.Read()

                        If (IsDBNull(sdr("CombustibleTipo"))) Then
                            comb = ""
                        Else
                            comb = sdr("CombustibleTipo")
                        End If

                        If (IsDBNull(sdr("IdTipoCombustible"))) Then
                            idcomb = "S"
                        Else
                            idcomb = sdr("IdTipoCombustible")
                        End If

                        If (IsDBNull(sdr("AudFechaCreacion"))) Then
                            feccrea = ""
                        Else
                            feccrea = sdr("AudFechaCreacion")
                        End If

                        If Format(sdr("FechaSum"), "dd/MM/yyyy HH:mm:ss") = "01/01/1900 00:00:00" Then
                            fec = ""
                        Else
                            fec = sdr("FechaSum")
                        End If



                        Com.Add(New With { _
                         Key .Idmc = sdr("IdMovilidadComision").ToString().PadLeft(10, CChar("0")), _
                         Key .Placa = sdr("IdPlaca"), _
                         Key .Chofer = sdr("IdChofer") + " - " + sdr("Conductor"), _
                         Key .Suministro = sdr("Suministro"), _
                         Key .IdTipoCombustible = idcomb, _
                         Key .TipoCombustible = comb, _
                         Key .CantidadSum = Format(sdr("CantidadSum"), "0.00"), _
                         Key .ImporteSum = Format(sdr("ImporteSum"), "0.00"), _
                         Key .FechaSum = fec, _
                         Key .Ticket = sdr("Ticket"), _
                         Key .CantidadRen = Format(sdr("CantidadRen"), "0.00"), _
                         Key .Fecha = feccrea, _
                         Key .PrecioRen = Format(sdr("PrecioRen"), "0.00"), _
                         Key .TipoVehiculo = sdr("TipoVehiculo"), _
                         Key .IdFoto = sdr("IdFoto") _
                        })
                    End While
                End Using
                conn.Close()
            End Using
            Return (New JavaScriptSerializer().Serialize(Com))
        End Using
    End Function

    <OperationContract()> _
    <WebInvoke(Method:="POST", ResponseFormat:=WebMessageFormat.Json)> _
    Public Function listarVehiculo(ByVal estado As String) As String
        Dim recurso = ""
        Dim Com As New List(Of Object)()
        Using conn As New SqlConnection()


            conn.ConnectionString = ConfigurationManager.ConnectionStrings("cnEmapeProduccion").ConnectionString
            Using cmd As New SqlCommand()
                cmd.CommandText = "select Vehiculos.*, CentroCosto.Descripcion as areas,ActivoFijoMarca.Descripcion as marca from  Vehiculos LEFT JOIN ActivoFijoMarca on ActivoFijoMarca.IdMarca=Vehiculos.IdMarca  left join CentroCosto  on CentroCosto.IdCentrocosto=Vehiculos.area WHERE Vehiculos.Estado='" + estado + "' and (CentroCosto.Estado='A' or CentroCosto.Estado is null) and (CentroCosto.IdAnno='2016' or CentroCosto.IdAnno is NULL) order by Vehiculos.AudfechaModificacion desc"
                cmd.Connection = conn
                conn.Open()
                Using sdr As SqlDataReader = cmd.ExecuteReader()
                    While sdr.Read()
                        If (sdr("Recurso") = "1") Then
                            recurso = "Empresarial"
                        ElseIf (sdr("Recurso") = "2") Then
                            recurso = "Municipal"
                        End If
                        Com.Add(New With { _
                         Key .IdPlaca = Trim(sdr("Idplaca")), _
                         Key .id = Trim(sdr("id")), _
                         Key .IdRecurso = sdr("Recurso"), _
                         Key .IdMarca = sdr("marca"), _
                         Key .Modelo = IIf(IsDBNull(sdr("Modelo")), "", sdr("Modelo")), _
                         Key .AnnoVehiculo = IIf(IsDBNull(sdr("AnnoVehiculo")), "", sdr("AnnoVehiculo")), _
                         Key .Observacion = sdr("Observacion"), _
                         Key .FlagAlquilado = IIf(sdr("FlagAlquilado") = "N", "No", "Si"), _
                         Key .Color = IIf(IsDBNull(sdr("Color")), "", sdr("Color")), _
                         Key .CapacidadTanque = sdr("CapacidadTanque"), _
                         Key .Area = sdr("areas"), _
                         Key .TipoCombustible = IIf(IsDBNull(sdr("TipoCombustible")), "", sdr("TipoCombustible")) _
                        })
                    End While
                End Using
                conn.Close()
            End Using
            Return (New JavaScriptSerializer().Serialize(Com))
        End Using
    End Function

    <OperationContract()> _
<WebInvoke(Method:="POST", ResponseFormat:=WebMessageFormat.Json)> _
    Public Function listarMarca() As String
        Dim recurso = ""
        Dim Com As New List(Of Object)()
        Using conn As New SqlConnection()


            conn.ConnectionString = ConfigurationManager.ConnectionStrings("cnEmapeProduccion").ConnectionString
            Using cmd As New SqlCommand()
                cmd.CommandText = "select * from  ActivoFijoMarca WHERE Estado='A' and IdTipoMarca='01' order by Descripcion asc"
                cmd.Connection = conn
                conn.Open()
                Using sdr As SqlDataReader = cmd.ExecuteReader()
                    While sdr.Read()
                        Com.Add(New With { _
                         Key .IdMarca = Trim(sdr("IdMarca")), _
                         Key .Descripcion = sdr("Descripcion") _
                        })
                    End While
                End Using
                conn.Close()
            End Using
            Return (New JavaScriptSerializer().Serialize(Com))
        End Using
    End Function

    <OperationContract()> _
<WebInvoke(Method:="POST", ResponseFormat:=WebMessageFormat.Json)> _
    Public Function listarCC() As String
        Dim recurso = ""
        Dim Com As New List(Of Object)()
        Using conn As New SqlConnection()


            conn.ConnectionString = ConfigurationManager.ConnectionStrings("cnEmapeProduccion").ConnectionString
            Using cmd As New SqlCommand()
                cmd.CommandText = "select * from  CentroCosto WHERE Estado='A' and IdAnno=year(GETDATE())  AND (IdDepartamento='00'  or IdDepartamento='01' or IdDepartamento='02' or IdDepartamento='03')    order by Descripcion asc"
                cmd.Connection = conn
                conn.Open()
                Using sdr As SqlDataReader = cmd.ExecuteReader()
                    While sdr.Read()
                        Com.Add(New With { _
                         Key .IdCentroCosto = Trim(sdr("IdCentroCosto")), _
                         Key .Descripcion = sdr("Descripcion") _
                        })
                    End While
                End Using
                conn.Close()
            End Using
            Return (New JavaScriptSerializer().Serialize(Com))
        End Using
    End Function

    <OperationContract()> _
    <WebInvoke(Method:="POST", ResponseFormat:=WebMessageFormat.Json)> _
    Public Function listarChofer(ByVal estado As String) As String

        Dim Cho As New List(Of Object)()
        Using conn As New SqlConnection()


            conn.ConnectionString = ConfigurationManager.ConnectionStrings("cnEmapeProduccion").ConnectionString
            Using cmd As New SqlCommand()
                'cmd.CommandText = "select *,'' as Area,Convert(varchar(10), FechaIngreso, 103) as fecha_ingreso,Convert(varchar(10), FechaExpedicionLC, 103) as fecha_expedicion,Convert(varchar(10), FechaCaducidadLC, 103) as fecha_caducidad from  Choferes WHERE Estado='A' order by Apellidos asc"
                cmd.CommandText = "select Choferes.*,Choferes.TipoVehiculo,cc1.Descripcion as cc,cc2.Descripcion as cc_2,Convert(varchar(10), FechaIngreso, 103) as fecha_ingreso,Convert(varchar(10),FechaExpedicionLC, 103) as fecha_expedicion,Convert(varchar(10), FechaCaducidadLC, 103) as fecha_caducidad from Choferes left join CentroCosto as cc1 on cc1.IdCentrocosto=Choferes.IdCentroCosto left join CentroCosto as cc2 on cc2.IdCentrocosto=Choferes.area WHERE Choferes.Estado='" + estado + "' and (cc1.Estado='A' or cc1.Estado is null) and (cc2.Estado='A' or cc2.Estado is null) and (cc1.IdAnno='2016' or cc1.IdAnno is NULL) and (cc2.IdAnno='2016' or cc2.IdAnno is NULL) order by Apellidos asc"
                cmd.Connection = conn
                conn.Open()
                Using sdr As SqlDataReader = cmd.ExecuteReader()
                    While sdr.Read()
                        Cho.Add(New With { _
                        Key .pkChofer = Trim(sdr("pkChofer")), _
                         Key .IdChofer = Trim(sdr("IdChofer")), _
                         Key .Chofer = sdr("Apellidos") & " " & sdr("Nombres"), _
                         Key .IdCentroCosto = sdr("IdCentroCosto"), _
                         Key .FechaIngreso = IIf(IsDBNull(sdr("fecha_ingreso")), "", sdr("fecha_ingreso")), _
                         Key .LicenciaConducir = IIf(IsDBNull(sdr("LicenciaConducir")), "", sdr("LicenciaConducir")), _
                         Key .FechaExpedicion = IIf(IsDBNull(sdr("fecha_expedicion")), "", sdr("fecha_expedicion")), _
                         Key .FechaCaducidad = IIf(IsDBNull(sdr("fecha_caducidad")), "", sdr("fecha_caducidad")), _
                         Key .Categoria = sdr("Categoria"), _
                         Key .Area = sdr("cc"), _
                         Key .Area2 = sdr("cc_2"), _
                         Key .TipoVehiculo = sdr("TipoVehiculo"), _
                         Key .Pool = sdr("pool") _
                        })
                        'Format(sdr("FechaExpedicionLC"), "dd/MM/yyyy")
                    End While
                End Using
                conn.Close()
            End Using
            Return (New JavaScriptSerializer().Serialize(Cho))
        End Using
    End Function

    <OperationContract()> _
<WebInvoke(Method:="POST", ResponseFormat:=WebMessageFormat.Json)> _
    Public Function obtenerChofer(ByVal dni As String) As String
        'cmd.CommandText = "select *,Convert(varchar(10), FechaIngreso, 103) as fecha_ingreso,Convert(varchar(10), FechaExpedicionLC, 103) as fecha_expedicion,Convert(varchar(10), FechaCaducidadLC, 103) as fecha_caducidad from  Choferes WHERE Estado='A' and IdChofer='@dni' order by AudFechaCreacion desc"

        Dim Cho As New List(Of Object)()
        Using conn As New SqlConnection()

            conn.ConnectionString = ConfigurationManager.ConnectionStrings("cnEmapeProduccion").ConnectionString
            Using cmd As New SqlCommand()
                cmd.CommandText = "select *,Convert(varchar(10), FechaIngreso, 103) as fecha_ingreso,Convert(varchar(10), FechaExpedicionLC, 103) as fecha_expedicion,Convert(varchar(10), FechaCaducidadLC, 103) as fecha_caducidad from  Choferes WHERE Estado='A' and pkChofer='" + dni + "' order by AudFechaCreacion desc"
                cmd.Connection = conn
                conn.Open()
                Using sdr As SqlDataReader = cmd.ExecuteReader()
                    While sdr.Read()
                        Cho.Add(New With { _
                         Key .IdChofer = Trim(sdr("IdChofer")), _
                         Key .TipoVehiculo = sdr("TipoVehiculo"), _
                         Key .modalidad = sdr("modalidad"), _
                         Key .Apellidos = sdr("Apellidos"), _
                         Key .Nombres = sdr("Nombres"), _
                         Key .IdCentroCosto = sdr("IdCentroCosto"), _
                         Key .Area = sdr("area"), _
                         Key .FechaIngreso = IIf(IsDBNull(sdr("fecha_ingreso")), "", sdr("fecha_ingreso")), _
                         Key .LicenciaConducir = IIf(IsDBNull(sdr("LicenciaConducir")), "", sdr("LicenciaConducir")), _
                         Key .FechaExpedicion = IIf(IsDBNull(sdr("fecha_expedicion")), "", sdr("fecha_expedicion")), _
                         Key .FechaCaducidad = IIf(IsDBNull(sdr("fecha_caducidad")), "", sdr("fecha_caducidad")), _
                         Key .Categoria = sdr("Categoria") _
                        })
                        'Format(sdr("FechaExpedicionLC"), "dd/MM/yyyy")
                    End While
                End Using
                conn.Close()
            End Using
            Return (New JavaScriptSerializer().Serialize(Cho))
        End Using
    End Function


    <OperationContract()> _
<WebInvoke(Method:="POST", ResponseFormat:=WebMessageFormat.Json)> _
    Public Function obtenerVehiculo(ByVal placa As String) As String

        Dim Cho As New List(Of Object)()
        Using conn As New SqlConnection()
            conn.ConnectionString = ConfigurationManager.ConnectionStrings("cnEmapeProduccion").ConnectionString
            Using cmd As New SqlCommand()
                cmd.CommandText = "select * from  Vehiculos WHERE Estado='A' and id='" + placa + "' "
                cmd.Connection = conn
                conn.Open()
                Using sdr As SqlDataReader = cmd.ExecuteReader()
                    While sdr.Read()
                        Cho.Add(New With { _
                         Key .id = Trim(sdr("id")), _
                         Key .IdPlaca = Trim(sdr("Idplaca")), _
                         Key .IdRecurso = sdr("Recurso"), _
                         Key .IdMarca = sdr("IdMarca"), _
                         Key .Modelo = IIf(IsDBNull(sdr("Modelo")), "", sdr("Modelo")), _
                         Key .AnnoVehiculo = IIf(IsDBNull(sdr("AnnoVehiculo")), "", sdr("AnnoVehiculo")), _
                         Key .Observacion = sdr("Observacion"), _
                         Key .FlagAlquilado = IIf(sdr("FlagAlquilado") = "N", "N", "S"), _
                         Key .Color = IIf(IsDBNull(sdr("Color")), "", sdr("Color")), _
                         Key .CapacidadTanque = sdr("CapacidadTanque"), _
                         Key .Area = sdr("area"), _
                         Key .Area2 = sdr("area2"), _
                         Key .TipoCombustible = IIf(IsDBNull(sdr("TipoCombustible")), "", sdr("TipoCombustible")) _
                        })
                    End While
                End Using
                conn.Close()
            End Using
            Return (New JavaScriptSerializer().Serialize(Cho))
        End Using
    End Function

    <OperationContract()> _
    <WebInvoke(Method:="POST", ResponseFormat:=WebMessageFormat.Json)> _
    Public Function listarRendicion(ByVal mes As String, ByVal anio As String) As String
        Dim fec, comb, idcomb, fecren As String
        Dim Com As New List(Of Object)()
        Using conn As New SqlConnection()


            conn.ConnectionString = ConfigurationManager.ConnectionStrings("cnEmapeProduccion").ConnectionString
            Using cmd As New SqlCommand()
                cmd.CommandText = "select MovilidadComision.*, Choferes.Apellidos +' '+ Choferes.Nombres AS Conductor, TipoCombustible.Descripcion as CombustibleTipo, TipoCombustible.IdTipoCombustible from MovilidadComision INNER JOIN Choferes on Choferes.IdChofer=MovilidadComision.IdChofer LEFT OUTER JOIN TipoCombustible on TipoCombustible.IdTipoCombustible=MovilidadComision.TipoCombustible where MovilidadComision.TipoCombustible<>'' and tipo=2 and IdAnno=" & anio & " and IdMes=" & mes & " order by MovilidadComision.AudFechaCreacion desc"
                cmd.Connection = conn
                conn.Open()
                Using sdr As SqlDataReader = cmd.ExecuteReader()
                    While sdr.Read()

                        If (IsDBNull(sdr("CombustibleTipo"))) Then
                            comb = ""
                        Else
                            comb = sdr("CombustibleTipo")
                        End If

                        If (IsDBNull(sdr("IdTipoCombustible"))) Then
                            idcomb = "S"
                        Else
                            idcomb = sdr("IdTipoCombustible")
                        End If



                        If Format(sdr("FechaSum"), "dd/MM/yyyy HH:mm:ss") = "01/01/1900 00:00:00" Then
                            fec = ""
                        Else
                            fec = sdr("FechaSum")
                        End If

                        If Format(sdr("FechaRen"), "dd/MM/yyyy HH:mm:ss") = "01/01/1900 00:00:00" Then
                            fecren = ""
                        Else
                            fecren = sdr("FechaRen")
                        End If

                        Com.Add(New With { _
                         Key .Idmc = sdr("IdMovilidadComision").ToString().PadLeft(10, CChar("0")), _
                         Key .Placa = sdr("IdPlaca"), _
                         Key .Chofer = sdr("IdChofer") + " - " + sdr("Conductor"), _
                         Key .Suministro = sdr("Suministro"), _
                         Key .IdTipoCombustible = idcomb, _
                         Key .TipoCombustible = comb, _
                         Key .CantidadSum = Format(sdr("CantidadSum"), "0.00"), _
                         Key .ImporteSum = Format(sdr("ImporteSum"), "0.00"), _
                         Key .FechaSum = fec, _
                         Key .Ticket = sdr("Ticket"), _
                         Key .CantidadRen = Format(sdr("CantidadRen"), "0.00"), _
                         Key .PrecioRen = Format(sdr("PrecioRen"), "0.00"), _
                         Key .Fecha = Format(sdr("AudFechaCreacion"), "dd/MM/yyyy HH:mm:ss"), _
                         Key .ImporteRen = Format(sdr("ImporteRen"), "0.00"), _
                         Key .FechaRen = fecren _
                        })
                    End While
                End Using
                conn.Close()
            End Using
            Return (New JavaScriptSerializer().Serialize(Com))
        End Using
    End Function

    <OperationContract()> _
   <WebInvoke(Method:="POST", ResponseFormat:=WebMessageFormat.Json)> _
    Public Function listarDiario(ByVal mes As String, ByVal anio As String) As String
        Dim fec, comb, tip, fecren, feccrea As String
        Dim Com As New List(Of Object)()
        Using conn As New SqlConnection()


            conn.ConnectionString = ConfigurationManager.ConnectionStrings("cnEmapeProduccion").ConnectionString
            Using cmd As New SqlCommand()
                cmd.CommandText = "select MovilidadComision.*, Choferes.Apellidos +' '+ Choferes.Nombres AS Conductor, TipoCombustible.Descripcion as CombustibleTipo, TipoCombustible.IdTipoCombustible from MovilidadComision LEFT JOIN Choferes on Choferes.IdChofer=MovilidadComision.IdChofer LEFT OUTER JOIN TipoCombustible on TipoCombustible.IdTipoCombustible=MovilidadComision.TipoCombustible where MovilidadComision.Tipo<>0 and IdAnno=" & anio & " and (IdMes=" & mes & ")  order by MovilidadComision.AudFechaCreacion desc"
                cmd.Connection = conn
                conn.Open()
                Using sdr As SqlDataReader = cmd.ExecuteReader()
                    While sdr.Read()

                        If (sdr("Combustible") = 1) Then
                            comb = "Menos 1/4"
                        ElseIf (sdr("Combustible") = 2) Then
                            comb = "1/4"
                        ElseIf (sdr("Combustible") = 3) Then
                            comb = "1/2"
                        ElseIf (sdr("Combustible") = 4) Then
                            comb = "3/4"
                        ElseIf (sdr("Combustible") = 5) Then
                            comb = "Más de 3/4"
                        Else
                            comb = ""
                        End If




                        If (sdr("Tipo") = "1") Then
                            tip = "Ingreso"
                        Else
                            tip = "Salida"
                        End If


                        If Format(sdr("FechaSum"), "dd/MM/yyyy HH:mm:ss") = "01/01/1900 00:00:00" Then
                            fec = ""
                        Else
                            fec = sdr("FechaSum")
                        End If

                        If Format(sdr("FechaRen"), "dd/MM/yyyy HH:mm:ss") = "01/01/1900 00:00:00" Then
                            fecren = ""
                        Else
                            fecren = sdr("FechaRen")
                        End If

                        If (IsDBNull(sdr("AudFechaCreacion"))) Then
                            feccrea = ""
                        Else
                            feccrea = sdr("AudFechaCreacion")
                        End If

                        Com.Add(New With { _
                         Key .Idmc = sdr("IdMovilidadComision").ToString().PadLeft(10, CChar("0")), _
                         Key .Placa = sdr("IdPlaca"), _
                         Key .Chofer = sdr("IdChofer") + " - " + sdr("Conductor"), _
                         Key .Suministro = sdr("Suministro"), _
                         Key .Combustible = comb, _
                         Key .Kilometraje = sdr("kilometraje"), _
                         Key .ImporteSum = Format(sdr("ImporteSum"), "0.00"), _
                         Key .FechaSum = fec, _
                         Key .Tipo = tip, _
                         Key .Ticket = sdr("Ticket"), _
                         Key .Destino = sdr("Destino"), _
                         Key .Descripcion = sdr("Descripcion"), _
                         Key .CantidadRen = Format(sdr("CantidadRen"), "0.00"), _
                         Key .PrecioRen = Format(sdr("PrecioRen"), "0.00"), _
                         Key .Fecha = feccrea, _
                         Key .ImporteRen = Format(sdr("ImporteRen"), "0.00"), _
                         Key .IdFoto = sdr("IdFoto"), _
                         Key .FechaRen = fecren _
                        })
                    End While
                End Using
                conn.Close()
            End Using
            Return (New JavaScriptSerializer().Serialize(Com))
        End Using
    End Function

    <OperationContract()> _
    <WebInvoke(Method:="POST", ResponseFormat:=WebMessageFormat.Json)> _
    Public Function listarTipoCombustible() As String
        Dim Tipo As New List(Of Object)()
        Using conn As New SqlConnection()
            conn.ConnectionString = ConfigurationManager.ConnectionStrings("cnEmapeProduccion").ConnectionString
            Using cmd As New SqlCommand()
                cmd.CommandText = "select * from TipoCombustible where estado='A'"
                cmd.Connection = conn
                conn.Open()
                Using sdr As SqlDataReader = cmd.ExecuteReader()
                    While sdr.Read()

                        Tipo.Add(New With { _
                         Key .IdTipoCombustible = sdr("IdTipoCombustible"), _
                         Key .Descripcion = sdr("Descripcion") _
                        })
                    End While
                End Using
                conn.Close()
            End Using
            Return (New JavaScriptSerializer().Serialize(Tipo))
        End Using
    End Function

    <OperationContract()> _
<WebInvoke(Method:="POST", ResponseFormat:=WebMessageFormat.Json)> _
    Public Function EditarSuministro(ByVal nroreg As String, ByVal osuministro As String, ByVal tipo As String, ByVal fechap As String, ByVal cantidadg As String, ByVal importe As String) As String
        Try
            Using conn As New SqlConnection()
                conn.ConnectionString = ConfigurationManager.ConnectionStrings("cnEmapeProduccion").ConnectionString
                Using cmd As New SqlCommand()
                    conn.Open()
                    cmd.Connection = conn
                    cmd.CommandText = "UPDATE MovilidadComision SET Suministro=@osuministro, TipoCombustible=@tipo, FechaSum=@fechap, CantidadSum=@cantidad, ImporteSum=@importe WHERE idMovilidadComision=@nroreg"
                    cmd.Parameters.AddWithValue("@nroreg", nroreg)
                    cmd.Parameters.AddWithValue("@osuministro", osuministro)
                    cmd.Parameters.AddWithValue("@tipo", tipo)
                    cmd.Parameters.AddWithValue("@fechap", fechap)
                    cmd.Parameters.AddWithValue("@cantidad", cantidadg)
                    cmd.Parameters.AddWithValue("@importe", importe)
                    cmd.ExecuteNonQuery()
                End Using
                Return (1)
            End Using
        Catch ex As Exception
            Return ("Insertar Requerimiento Almacen..." & ex.Message)
        End Try
    End Function

    <OperationContract()> _
<WebInvoke(Method:="POST", ResponseFormat:=WebMessageFormat.Json)> _
    Public Function AgregarChofer(ByVal cod As String, ByVal dni As String, ByVal apellido As String, ByVal nombre As String, ByVal fi As String, ByVal licencia As String, ByVal fe As String, ByVal fc As String, ByVal categoria As String, ByVal pool As String, ByVal area As String, ByVal area2 As String, ByVal TipoVehiculo As String, ByVal modalidad As String) As String

        Try
            Using conn As New SqlConnection()
                conn.ConnectionString = ConfigurationManager.ConnectionStrings("cnEmapeProduccion").ConnectionString
                Using cmd As New SqlCommand()
                    conn.Open()
                    cmd.Connection = conn
                    If cod = "" Then
                        cmd.CommandText = "INSERT INTO Choferes (IdChofer, Apellidos, Nombres, FechaIngreso, LicenciaConducir,FechaExpedicionLC,FechaCaducidadLC,Categoria,AudFechaCreacion,AudFechaModificacion,AudUsuario,AudUsuarioModificacion,Estado,pool,IdCentroCosto,area,TipoVehiculo,modalidad ) VALUES(@idchofer,@apellido,@nombre,@fi,@lc,@felc,@fclc,@categoria,@fc,@fc,@usu,@usu,'A',@pool,@area,@area2,@TipoVehiculo,@modalidad)"
                        cmd.Parameters.AddWithValue("@cod", cod)
                        cmd.Parameters.AddWithValue("@idchofer", dni)
                        cmd.Parameters.AddWithValue("@apellido", apellido.ToUpper())
                        cmd.Parameters.AddWithValue("@nombre", nombre.ToUpper())
                        cmd.Parameters.AddWithValue("@fi", fi)
                        cmd.Parameters.AddWithValue("@lc", licencia.ToUpper())
                        cmd.Parameters.AddWithValue("@felc", fe)
                        cmd.Parameters.AddWithValue("@fclc", fc)
                        cmd.Parameters.AddWithValue("@pool", pool)
                        cmd.Parameters.AddWithValue("@area", area)
                        cmd.Parameters.AddWithValue("@area2", area2)
                        cmd.Parameters.AddWithValue("@TipoVehiculo", TipoVehiculo)
                        cmd.Parameters.AddWithValue("@modalidad", modalidad)
                        cmd.Parameters.AddWithValue("@categoria", categoria.ToUpper())
                        cmd.Parameters.AddWithValue("@fc", DateTime.Today)
                        cmd.Parameters.AddWithValue("@usu", Session("userid"))
                    Else
                        cmd.CommandText = "UPDATE Choferes SET Apellidos='" + apellido + "', Nombres='" + nombre + "', FechaIngreso='" + fi + "', LicenciaConducir='" + licencia + "',FechaExpedicionLC='" + fe + "',FechaCaducidadLC='" + fc + "',Categoria='" + categoria + "',AudFechaModificacion='" + DateTime.Today + "',AudUsuarioModificacion='" + Session("userid") + "',pool='" + pool + "',IdCentroCosto='" + area + "',area='" + area2 + "',TipoVehiculo='" + TipoVehiculo + "' ,modalidad='" + modalidad + "' WHERE pkChofer='" + cod + "'"

                    End If
                    cmd.ExecuteNonQuery()
                End Using
                Return (1)
            End Using
        Catch ex As Exception
            Return ("Insertar Requerimiento Almacen..." & ex.Message)
        End Try
    End Function

    <OperationContract()> _
<WebInvoke(Method:="POST", ResponseFormat:=WebMessageFormat.Json)> _
    Public Function AgregarVehiculo(ByVal cod As String, ByVal placa As String, ByVal recurso As String, ByVal marca As String, ByVal modelo As String, ByVal anno As String, ByVal txtalquilado As String, ByVal color As String, ByVal capacidad As String, ByVal combustible As String, ByVal area As String, ByVal area2 As String) As String
        Try
            Using conn As New SqlConnection()
                conn.ConnectionString = ConfigurationManager.ConnectionStrings("cnEmapeProduccion").ConnectionString
                Using cmd As New SqlCommand()
                    conn.Open()
                    cmd.Connection = conn
                    If cod = "" Then
                        cmd.CommandText = "INSERT INTO Vehiculos (IdPlaca,Recurso,IdMarca,Modelo,AnnoVehiculo,FlagAlquilado,color,capacidadTanque,TipoCombustible, AudFechaCreacion,AudFechaModificacion,AudUsuario,AudUsuarioModificacion,Estado,area,area2 ) VALUES(@placa,@recurso,@marca,@modelo,@anno,@alquilado,@color,@capacidad,@combustible,@fc,@fc,@usu,@usu,'A',@area,@area2)"
                        cmd.Parameters.AddWithValue("@placa", placa.ToUpper())
                        cmd.Parameters.AddWithValue("@recurso", recurso)
                        cmd.Parameters.AddWithValue("@marca", marca)
                        cmd.Parameters.AddWithValue("@modelo", modelo)
                        cmd.Parameters.AddWithValue("@anno", anno)
                        cmd.Parameters.AddWithValue("@alquilado", txtalquilado)
                        cmd.Parameters.AddWithValue("@color", color)
                        cmd.Parameters.AddWithValue("@area", area)
                        cmd.Parameters.AddWithValue("@area2", area2)
                        cmd.Parameters.AddWithValue("@capacidad", capacidad)
                        cmd.Parameters.AddWithValue("@combustible", combustible)
                        cmd.Parameters.AddWithValue("@fc", DateTime.Today)
                        cmd.Parameters.AddWithValue("@usu", Session("userid"))
                    Else
                        cmd.CommandText = "UPDATE Vehiculos SET IdPlaca='" + placa + "',Recurso='" + recurso + "', IdMarca='" + marca + "', Modelo='" + modelo + "', AnnoVehiculo='" + anno + "',FlagAlquilado='" + txtalquilado + "',color='" + color + "',capacidadTanque='" + capacidad + "',area='" + area + "',area2='" + area2 + "',TipoCombustible='" + combustible + "',AudFechaModificacion='" + DateTime.Today + "',AudUsuarioModificacion='" + Session("userid") + "' WHERE id='" + cod + "'"
                    End If
                    cmd.ExecuteNonQuery()
                End Using
                Return (1)
            End Using
        Catch ex As Exception
            Return ("Insertar Requerimiento Almacen..." & ex.Message)
        End Try
    End Function

    <OperationContract()> _
<WebInvoke(Method:="POST", ResponseFormat:=WebMessageFormat.Json)> _
    Public Function EditarRendicion(ByVal nroreg As String, ByVal osuministro As String, ByVal fechap As String, ByVal cantidadg As String, ByVal precio As String, ByVal importe As String) As String
        Try
            Using conn As New SqlConnection()
                conn.ConnectionString = ConfigurationManager.ConnectionStrings("cnEmapeProduccion").ConnectionString
                Using cmd As New SqlCommand()
                    conn.Open()
                    cmd.Connection = conn
                    cmd.CommandText = "UPDATE MovilidadComision SET Ticket=@osuministro, PrecioRen=@precio, FechaRen=@fechap, CantidadRen=@cantidad, ImporteRen=@importe WHERE idMovilidadComision=@nroreg"
                    cmd.Parameters.AddWithValue("@nroreg", nroreg)
                    cmd.Parameters.AddWithValue("@osuministro", osuministro)

                    cmd.Parameters.AddWithValue("@fechap", fechap)
                    cmd.Parameters.AddWithValue("@cantidad", cantidadg)
                    cmd.Parameters.AddWithValue("@precio", precio)
                    cmd.Parameters.AddWithValue("@importe", importe)
                    cmd.ExecuteNonQuery()
                End Using
                Return (1)
            End Using
        Catch ex As Exception
            Return ("Insertar Requerimiento Almacen..." & ex.Message)
        End Try
    End Function

    <OperationContract()> _
<WebInvoke(Method:="POST", ResponseFormat:=WebMessageFormat.Json)> _
    Public Function eliminarChofer(ByVal dni As String) As String
        Try
            Using conn As New SqlConnection()
                conn.ConnectionString = ConfigurationManager.ConnectionStrings("cnEmapeProduccion").ConnectionString
                Using cmd As New SqlCommand()
                    conn.Open()
                    cmd.Connection = conn
                    cmd.CommandText = "UPDATE Choferes SET Estado='I' WHERE pkChofer=@dni"
                    cmd.Parameters.AddWithValue("@dni", dni)
                    cmd.ExecuteNonQuery()
                End Using
                Return (1)
            End Using
        Catch ex As Exception
            Return ("Insertar Requerimiento Almacen..." & ex.Message)
        End Try
    End Function

    <OperationContract()> _
<WebInvoke(Method:="POST", ResponseFormat:=WebMessageFormat.Json)> _
    Public Function eliminarVehiculo(ByVal placa As String) As String
        Try
            Using conn As New SqlConnection()
                conn.ConnectionString = ConfigurationManager.ConnectionStrings("cnEmapeProduccion").ConnectionString
                Using cmd As New SqlCommand()
                    conn.Open()
                    cmd.Connection = conn
                    cmd.CommandText = "UPDATE Vehiculos SET Estado='I' WHERE id=@placa"
                    cmd.Parameters.AddWithValue("@placa", placa)
                    cmd.ExecuteNonQuery()
                End Using
                Return (1)
            End Using
        Catch ex As Exception
            Return ("Insertar Requerimiento Almacen..." & ex.Message)
        End Try
    End Function

    <OperationContract()> _
 <WebInvoke(Method:="POST", ResponseFormat:=WebMessageFormat.Json)> _
    Public Function Cierre(ByVal mes As String, ByVal anno As String) As String
        Dim Alm As New List(Of Object)()
        Using conn As New SqlConnection()
            Dim fechadia As String
            'fechacadena = "01/" + mes + "/2015"
            conn.ConnectionString = ConfigurationManager.ConnectionStrings("cnEmapeProduccion").ConnectionString
            Using cmd As New SqlCommand()

                cmd.CommandText = "SP_LO_ProgTrans"
                cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.AddWithValue("@Mes", mes)
                cmd.Parameters.AddWithValue("@Anno", anno)
                'cmd.Parameters.AddWithValue("@Fecha", fechacadena)
                cmd.Connection = conn
                conn.Open()
                cmd.ExecuteNonQuery()
                Dim v, dia As String
                For i As Integer = 1 To (30)
                    v = i
                    If (i < 10) Then
                        dia = "0" + v

                    Else
                        dia = v
                    End If

                    fechadia = dia + "/" + mes + "/" + anno

                    If IsDate(fechadia) Then
                        CierreDia(mes, anno, fechadia, i)
                        CierreDiaKm(mes, anno, fechadia, i)
                    End If



                Next
                Return (1)
                conn.Close()
            End Using

        End Using
    End Function


    <OperationContract()> _
<WebInvoke(Method:="POST", ResponseFormat:=WebMessageFormat.Json)> _
    Public Function CierreDia(ByVal mes As String, ByVal anno As String, ByVal fechadia As String, ByVal i As String) As String
        Dim Alm As New List(Of Object)()
        Using conn As New SqlConnection()

            conn.ConnectionString = ConfigurationManager.ConnectionStrings("cnEmapeProduccion").ConnectionString
            Using cmd As New SqlCommand()

                cmd.CommandText = "UPDATE d SET  d.Tip" + i + "=c.TipoCombustible,d.Cant" + i + "=c.Cantidad,d.Dist" + i + "=g.TotKm FROM ResMovilidadComision d INNER JOIN vw_ResTranProg c on c.Placa=d.IdPlaca INNER JOIN vw_ResTranKm g on g.Placa=d.IdPlaca where DATEADD(dd, 0, DATEDIFF(dd, 0, c.Fecha))=@Fecha and DATEADD(dd, 0, DATEDIFF(dd, 0, g.Fecha))=@Fecha and d.Anno=@Anno and d.Mes=@Mes"
                'cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.AddWithValue("@Mes", mes)
                cmd.Parameters.AddWithValue("@Anno", anno)
                cmd.Parameters.AddWithValue("@Fecha", fechadia)

                cmd.Connection = conn
                conn.Open()
                cmd.ExecuteNonQuery()

                Return (1)
                conn.Close()
            End Using
        End Using
    End Function

    <OperationContract()> _
<WebInvoke(Method:="POST", ResponseFormat:=WebMessageFormat.Json)> _
    Public Function CierreDiaKm(ByVal mes As String, ByVal anno As String, ByVal fechadia As String, ByVal i As String) As String
        Dim Alm As New List(Of Object)()
        Using conn As New SqlConnection()

            conn.ConnectionString = ConfigurationManager.ConnectionStrings("cnEmapeProduccion").ConnectionString
            Using cmd As New SqlCommand()



                cmd.CommandText = "UPDATE d SET  d.Dist" + i + "=g.TotKm FROM ResMovilidadComision d LEFT JOIN vw_ResTranKm g on g.Placa=d.IdPlaca where DATEADD(dd, 0, DATEDIFF(dd, 0, g.Fecha))=@Fecha and d.Anno=@Anno and d.Mes=@Mes"
                'cmd.CommandType = CommandType.StoredProcedure
                cmd.Parameters.AddWithValue("@Mes", mes)
                cmd.Parameters.AddWithValue("@Anno", anno)
                cmd.Parameters.AddWithValue("@Fecha", fechadia)

                cmd.Connection = conn
                conn.Open()
                cmd.ExecuteNonQuery()

                Return (1)
                conn.Close()
            End Using
        End Using
    End Function

    <OperationContract()> _
<WebInvoke(Method:="POST", ResponseFormat:=WebMessageFormat.Json)> _
    Public Function getReg(ByVal prefix As Integer) As String
        Dim mc As New List(Of Object)()
        Using conn As New SqlConnection()
            conn.ConnectionString = ConfigurationManager.ConnectionStrings("cnEmapeProduccion").ConnectionString
            Using cmd As New SqlCommand()
                cmd.CommandText = "select * from MovilidadComision WHERE IdMovilidadComision=@prefix"
                cmd.Parameters.AddWithValue("@prefix", prefix)
                cmd.Connection = conn
                conn.Open()
                Using sdr As SqlDataReader = cmd.ExecuteReader()
                    While sdr.Read()

                        mc.Add(New With { _
                         Key .Codigo = sdr("IdMovilidadComision").ToString().PadLeft(10, CChar("0")), _
                         Key .Fecha = Format(sdr("AudFechaCreacion"), "dd/MM/yyyy"), _
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
                             Key .documentacion = sdr("documentacion"), _
                             Key .accesorio = sdr("accesorio"), _
                             Key .revision = sdr("revision"), _
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
    Public Function graficoDia(placa As String, mes As String, anno As String) As String
        Dim fgp As String
        Dim dato As New List(Of Object)()
        Using conn As New SqlConnection()
            Dim cx As String = ""


            conn.ConnectionString = ConfigurationManager.ConnectionStrings("cnEmapeProduccion").ConnectionString
            Using cmd As New SqlCommand()

                cmd.CommandText = "SP_LO_rptResTran"
                cmd.CommandType = CommandType.StoredProcedure

                cmd.Parameters.AddWithValue("@Mes", mes)
                cmd.Parameters.AddWithValue("@Anno", anno)
                cmd.Parameters.AddWithValue("@Placa", placa)
                cmd.Connection = conn
                conn.Open()
                Using sdr As SqlDataReader = cmd.ExecuteReader()
                    While sdr.Read()

                        dato.Add(New With { _
                         Key .IdPlaca = sdr("Idplaca"), _
                         Key .Cant1 = sdr("Cant1"), _
                         Key .Cant2 = sdr("Cant2"), _
                         Key .Cant3 = sdr("Cant3"), _
                         Key .Cant4 = sdr("Cant4"), _
                         Key .Cant5 = sdr("Cant5"), _
                         Key .Cant6 = sdr("Cant6"), _
                         Key .Cant7 = sdr("Cant7"), _
                         Key .Cant8 = sdr("Cant8"), _
                         Key .Cant9 = sdr("Cant9"), _
                         Key .Cant10 = sdr("Cant10"), _
                         Key .Cant11 = sdr("Cant11"), _
                         Key .Cant12 = sdr("Cant12"), _
                         Key .Cant13 = sdr("Cant13"), _
                         Key .Cant14 = sdr("Cant14"), _
                         Key .Cant15 = sdr("Cant15"), _
                         Key .Cant16 = sdr("Cant16"), _
                         Key .Cant17 = sdr("Cant17"), _
                         Key .Cant18 = sdr("Cant18"), _
                         Key .Cant19 = sdr("Cant19"), _
                         Key .Cant20 = sdr("Cant20"), _
                         Key .Cant21 = sdr("Cant21"), _
                         Key .Cant22 = sdr("Cant22"), _
                         Key .Cant23 = sdr("Cant23"), _
                         Key .Cant24 = sdr("Cant24"), _
                         Key .Cant25 = sdr("Cant25"), _
                         Key .Cant26 = sdr("Cant26"), _
                         Key .Cant27 = sdr("Cant27"), _
                         Key .Cant28 = sdr("Cant28"), _
                         Key .Cant29 = sdr("Cant29"), _
                         Key .Cant30 = sdr("Cant30"), _
                         Key .Cant31 = sdr("Cant31"), _
                         Key .Dist1 = sdr("Dist1"), _
                         Key .Dist2 = sdr("Dist2"), _
                         Key .Dist3 = sdr("Dist3"), _
                         Key .Dist4 = sdr("Dist4"), _
                         Key .Dist5 = sdr("Dist5"), _
                         Key .Dist6 = sdr("Dist6"), _
                         Key .Dist7 = sdr("Dist7"), _
                         Key .Dist8 = sdr("Dist8"), _
                         Key .Dist9 = sdr("Dist9"), _
                         Key .Dist10 = sdr("Dist10"), _
                         Key .Dist11 = sdr("Dist11"), _
                         Key .Dist12 = sdr("Dist12"), _
                         Key .Dist13 = sdr("Dist13"), _
                         Key .Dist14 = sdr("Dist14"), _
                         Key .Dist15 = sdr("Dist15"), _
                         Key .Dist16 = sdr("Dist16"), _
                         Key .Dist17 = sdr("Dist17"), _
                         Key .Dist18 = sdr("Dist18"), _
                         Key .Dist19 = sdr("Dist19"), _
                         Key .Dist20 = sdr("Dist20"), _
                         Key .Dist21 = sdr("Dist21"), _
                         Key .Dist22 = sdr("Dist22"), _
                         Key .Dist23 = sdr("Dist23"), _
                         Key .Dist24 = sdr("Dist24"), _
                         Key .Dist25 = sdr("Dist25"), _
                         Key .Dist26 = sdr("Dist26"), _
                         Key .Dist27 = sdr("Dist27"), _
                         Key .Dist28 = sdr("Dist28"), _
                         Key .Dist29 = sdr("Dist29"), _
                         Key .Dist30 = sdr("Dist30"), _
                         Key .Dist31 = sdr("Dist31") _
                        })
                    End While
                End Using
                conn.Close()
            End Using
            Return (New JavaScriptSerializer().Serialize(dato))
        End Using
    End Function

    <OperationContract()> _
   <WebInvoke(Method:="POST", ResponseFormat:=WebMessageFormat.Json)> _
    Public Function listarSolicitud() As String
        Dim fec, xvehiculo, xchofer, xapellidos, xnombres As String
        Dim Sol As New List(Of Object)()
        Using conn As New SqlConnection()

            conn.ConnectionString = ConfigurationManager.ConnectionStrings("cnEmapeProduccion").ConnectionString
            Using cmd As New SqlCommand()

                If Session("transporte") = "1" Then
                    cmd.CommandText = "select Vehiculos.IdPlaca, Choferes.IdChofer,SolicitarTransporte.*, Choferes.Apellidos, Choferes.Nombres, CentroCosto.Descripcion from SolicitarTransporte LEFT JOIN Choferes on Choferes.pkChofer=SolicitarTransporte.IdChofer LEFT JOIN CentroCosto on CentroCosto.IdCentroCosto=SolicitarTransporte.IdCentroCosto LEFT JOIN Vehiculos on Vehiculos.id=SolicitarTransporte.IdPlaca WHERE CentroCosto.IdAnno=year(GETDATE()) ORDER BY NroSolicitud desc"
                Else
                    cmd.CommandText = "select Vehiculos.IdPlaca, Choferes.IdChofer,SolicitarTransporte.*, Choferes.Apellidos, Choferes.Nombres, CentroCosto.Descripcion from SolicitarTransporte LEFT JOIN Choferes on Choferes.pkChofer=SolicitarTransporte.IdChofer LEFT JOIN CentroCosto on CentroCosto.IdCentroCosto=SolicitarTransporte.IdCentroCosto LEFT JOIN Vehiculos on Vehiculos.id=SolicitarTransporte.IdPlaca WHERE CentroCosto.IdAnno=year(GETDATE()) and AudUsuarioCreacion=" + Session("userid") + " ORDER BY NroSolicitud desc"
                End If

                cmd.Connection = conn
                conn.Open()
                Using sdr As SqlDataReader = cmd.ExecuteReader()
                    While sdr.Read()

                        If Format(sdr("Fecha"), "dd/MM/yyyy HH:mm:ss") = "01/01/1900 00:00:00" Then
                            fec = ""
                        Else
                            fec = sdr("Fecha")
                        End If

                        If (IsDBNull(sdr("IdPlaca"))) Then xvehiculo = "" Else xvehiculo = sdr("IdPlaca")
                        If (IsDBNull(sdr("IdChofer"))) Then xchofer = "" Else xchofer = sdr("IdChofer")

                        If (IsDBNull(sdr("Apellidos"))) Then xapellidos = "" Else xapellidos = sdr("Apellidos")
                        If (IsDBNull(sdr("Nombres"))) Then xnombres = "" Else xnombres = sdr("Nombres")

                        Sol.Add(New With { _
                                                 Key .IdSolicitud = sdr("IdSolicitud"), _
                                                 Key .IdCentroCosto = sdr("IdCentroCosto"), _
                                                 Key .Fecha = fec, _
                                                 Key .Involucrado = sdr("Involucrado"), _
                                                 Key .Origen = sdr("Origen"), _
                                                 Key .Destino = sdr("Destino"), _
                                                 Key .HoraSalida = sdr("HoraSalida"), _
                                                 Key .TipoSolicitud = sdr("TipoSolicitud"), _
                                                 Key .Prioridad = sdr("Prioridad"), _
                                                 Key .IdPlaca = Trim(xvehiculo), _
                                                 Key .IdChofer = Trim(xchofer), _
                                                     Key .Apellidos = xapellidos, _
                                                     Key .Nombres = xnombres, _
                                                     Key .Descripcion = sdr("Descripcion"), _
                                                     Key .NroSolicitud = sdr("NroSolicitud"), _
                                                 Key .Estado = sdr("Estado") _
                        })
                    End While
                End Using
                conn.Close()
            End Using
            Return (New JavaScriptSerializer().Serialize(Sol))
        End Using
    End Function

    <OperationContract()> _
  <WebInvoke(Method:="POST", ResponseFormat:=WebMessageFormat.Json)> _
    Public Function listarOcurrencia() As String
        Dim fec, fec2, xvehiculo As String
        Dim Sol As New List(Of Object)()
        Using conn As New SqlConnection()

            conn.ConnectionString = ConfigurationManager.ConnectionStrings("cnEmapeProduccion").ConnectionString
            Using cmd As New SqlCommand()

                If Session("transporte") = "1" Then
                    cmd.CommandText = "select Vehiculos.IdPlaca, OcurrenciaTransporte.*, CentroCosto.Descripcion as cc from OcurrenciaTransporte  LEFT JOIN CentroCosto on CentroCosto.IdCentroCosto=OcurrenciaTransporte.IdCentroCosto LEFT JOIN Vehiculos on Vehiculos.id=OcurrenciaTransporte.IdPlaca WHERE OcurrenciaTransporte.Estado=1 and (Vehiculos.Estado='A' OR Vehiculos.Estado is null) and  CentroCosto.IdAnno=year(GETDATE()) ORDER BY NroRequerimiento desc"
                Else
                    cmd.CommandText = "select Vehiculos.IdPlaca, OcurrenciaTransporte.*, CentroCosto.Descripcion as cc from OcurrenciaTransporte  LEFT JOIN CentroCosto on CentroCosto.IdCentroCosto=OcurrenciaTransporte.IdCentroCosto LEFT JOIN Vehiculos on Vehiculos.id=OcurrenciaTransporte.IdPlaca WHERE OcurrenciaTransporte.Estado=1 and (Vehiculos.Estado='A' OR Vehiculos.Estado is null)  and CentroCosto.IdAnno=year(GETDATE()) and AudUsuarioCreacion=" + Session("userid") + " ORDER BY NroRequerimiento desc"
                End If

                cmd.Connection = conn
                conn.Open()
                Using sdr As SqlDataReader = cmd.ExecuteReader()
                    While sdr.Read()

                        If Format(sdr("AudFechaCreacion"), "dd/MM/yyyy HH:mm:ss") = "01/01/1900 00:00:00" Then
                            fec = ""
                        Else
                            fec = Format(sdr("AudFechaCreacion"), "dd/MM/yyyy")
                        End If


                        If Format(sdr("Fecha"), "dd/MM/yyyy") = "01/01/1900" Then
                            fec2 = ""
                        Else
                            fec2 = Format(sdr("Fecha"), "dd/MM/yyyy")
                        End If



                        If (IsDBNull(sdr("IdPlaca"))) Then xvehiculo = "" Else xvehiculo = sdr("IdPlaca")

                        Sol.Add(New With { _
                                                 Key .IdOcurrencia = sdr("IdOcurrencia"), _
                                                 Key .IdCentroCosto = sdr("cc"), _
                                                 Key .IdPlaca = Trim(xvehiculo), _
                                                 Key .Descripcion = sdr("Descripcion"), _
                                                 Key .Condicion = sdr("Condicion"), _
                                                 Key .Fecha = fec, _
                                                 Key .Comentario = sdr("Comentario"), _
                                                 Key .Evaluacion = sdr("Evaluacion"), _
                                                 Key .Fecha2 = fec2, _
                                                 Key .NroRequerimiento = sdr("NroRequerimiento") _
                        })
                    End While
                End Using
                conn.Close()
            End Using
            Return (New JavaScriptSerializer().Serialize(Sol))
        End Using
    End Function

    <OperationContract()> _
 <WebInvoke(Method:="POST", ResponseFormat:=WebMessageFormat.Json)> _
    Public Function CodigoSolicitud() As String
        Dim Alm As New List(Of Object)()
        Using conn As New SqlConnection()
            Dim cx As String = ""


            conn.ConnectionString = ConfigurationManager.ConnectionStrings("cnEmapeProduccion").ConnectionString
            Using cmd As New SqlCommand()

                cmd.CommandText = "select max(NroSolicitud)+1 from SolicitarTransporte where Fecha like '%" & Year(Now) & "%'"
                cmd.Connection = conn
                conn.Open()
                Dim codigo As String = IIf(IsDBNull(cmd.ExecuteScalar), 1, cmd.ExecuteScalar)
                Return (codigo)
                conn.Close()
            End Using

        End Using
    End Function


    <OperationContract()> _
<WebInvoke(Method:="POST", ResponseFormat:=WebMessageFormat.Json)> _
    Public Function CodigoSolicitud0(ByVal cod As String) As String
        Dim Alm As New List(Of Object)()
        Using conn As New SqlConnection()
            Dim cx As String = ""


            conn.ConnectionString = ConfigurationManager.ConnectionStrings("cnEmapeProduccion").ConnectionString
            Using cmd As New SqlCommand()

                cmd.CommandText = "select NroSolicitud from SolicitarTransporte where IdSolicitud='" & cod & "' and Fecha like '%" & Year(Now) & "%'"
                cmd.Connection = conn
                conn.Open()
                Dim codigo As String = IIf(IsDBNull(cmd.ExecuteScalar), 1, cmd.ExecuteScalar)
                Return (codigo)
                conn.Close()
            End Using

        End Using
    End Function


    <OperationContract()> _
<WebInvoke(Method:="POST", ResponseFormat:=WebMessageFormat.Json)> _
    Public Function obtenerChofer0(ByVal cod As String) As String
        Dim Alm As New List(Of Object)()
        Using conn As New SqlConnection()
            Dim cx As String = ""


            conn.ConnectionString = ConfigurationManager.ConnectionStrings("cnEmapeProduccion").ConnectionString
            Using cmd As New SqlCommand()

                cmd.CommandText = "select Apellidos+' '+ Nombres from  Choferes WHERE Estado='A' and pkChofer='" + cod + "' order by AudFechaCreacion desc"
                cmd.Connection = conn
                conn.Open()
                Dim codigo As String = IIf(IsDBNull(cmd.ExecuteScalar), 1, cmd.ExecuteScalar)
                Return (codigo)
                conn.Close()
            End Using

        End Using
    End Function

    <OperationContract()> _
<WebInvoke(Method:="POST", ResponseFormat:=WebMessageFormat.Json)> _
    Public Function EmailSolicitud(ByVal cod As String) As String
        Dim Alm As New List(Of Object)()
        Using conn As New SqlConnection()
            Dim cx As String = ""


            conn.ConnectionString = ConfigurationManager.ConnectionStrings("cnEmapeProduccion").ConnectionString
            Using cmd As New SqlCommand()

                cmd.CommandText = "select Email from SolicitarTransporte where IdSolicitud='" & cod & "' and Fecha like '%" & Year(Now) & "%'"
                cmd.Connection = conn
                conn.Open()
                Dim codigo As String = IIf(IsDBNull(cmd.ExecuteScalar), 1, cmd.ExecuteScalar)
                Return (codigo)
                conn.Close()
            End Using

        End Using
    End Function

    <OperationContract()> _
<WebInvoke(Method:="POST", ResponseFormat:=WebMessageFormat.Json)> _
    Public Function CodigoRequerimiento() As String
        Dim Alm As New List(Of Object)()
        Using conn As New SqlConnection()
            Dim cx As String = ""


            conn.ConnectionString = ConfigurationManager.ConnectionStrings("cnEmapeProduccion").ConnectionString
            Using cmd As New SqlCommand()

                cmd.CommandText = "select max(NroRequerimiento)+1 from OcurrenciaTransporte where Fecha like '%" & Year(Now) & "%'"
                cmd.Connection = conn
                conn.Open()
                Dim codigo As String = IIf(IsDBNull(cmd.ExecuteScalar), 1, cmd.ExecuteScalar)
                Return (codigo)
                conn.Close()
            End Using

        End Using
    End Function

    <OperationContract()> _
<WebInvoke(Method:="POST", ResponseFormat:=WebMessageFormat.Json)> _
    Public Function RegistrarSolicitud(ByVal codigo As String, ByVal pasajero As String, ByVal origen As String, ByVal destino As String, ByVal hora As String, ByVal tipo As String, ByVal observacion As String, ByVal vehiculo As String, ByVal chofer As String, ByVal prioridad As String, ByVal estado As String) As String
        Dim nro, xvehiculo, xchofer, xestado, xprioridad, tip, oChofer, oSolicitud, oEmail As String
        Try
            Using conn As New SqlConnection()
                conn.ConnectionString = ConfigurationManager.ConnectionStrings("cnEmapeProduccion").ConnectionString
                Using cmd As New SqlCommand()
                    conn.Open()
                    cmd.Connection = conn
                    If codigo = "" Then

                        nro = CodigoSolicitud()

                        If (IsDBNull(vehiculo)) Then xvehiculo = "" Else xvehiculo = vehiculo
                        If (IsDBNull(chofer)) Then xchofer = "" Else xchofer = chofer
                        If (IsDBNull(estado)) Then xestado = "" Else xestado = estado
                        If (IsDBNull(prioridad)) Then xprioridad = "" Else xprioridad = prioridad

                        cmd.CommandText = "INSERT INTO SolicitarTransporte (IdCentroCosto, Fecha, Involucrado, Origen, Destino,HoraSalida,TipoSolicitud,Observacion,Prioridad,IdPlaca,IdChofer,Estado,AudUsuarioCreacion,AudUsuarioModificacion,AudFechaCreacion,AudFechaModificacion, NroSolicitud,Email) VALUES(@CentroCosto,@Fecha, @Involucrado, @Origen, @Destino, @HoraSalida, @TipoSolicitud, @Observacion, @Prioridad, @IdPlaca, @IdChofer, @Estado, @Usuario, @Usuario,@Fechaactual,@Fechaactual, @NroSolicitud,@Email)"
                        cmd.Parameters.AddWithValue("@CentroCosto", Session("useridcc"))
                        cmd.Parameters.AddWithValue("@Fecha", DateTime.Today)
                        cmd.Parameters.AddWithValue("@Involucrado", pasajero.ToUpper())
                        cmd.Parameters.AddWithValue("@Origen", origen.ToUpper())
                        cmd.Parameters.AddWithValue("@Destino", destino.ToUpper())
                        cmd.Parameters.AddWithValue("@HoraSalida", hora)
                        cmd.Parameters.AddWithValue("@TipoSolicitud", tipo)
                        cmd.Parameters.AddWithValue("@Observacion", observacion.ToUpper())
                        cmd.Parameters.AddWithValue("@Prioridad", xprioridad)
                        cmd.Parameters.AddWithValue("@IdPlaca", xvehiculo)
                        cmd.Parameters.AddWithValue("@IdChofer", xchofer)
                        cmd.Parameters.AddWithValue("@Usuario", Session("userid"))
                        cmd.Parameters.AddWithValue("@Email", Session("Email"))
                        cmd.Parameters.AddWithValue("@Fechaactual", DateTime.Today)
                        cmd.Parameters.AddWithValue("@NroSolicitud", nro)
                        cmd.Parameters.AddWithValue("@Estado", xestado)

                        If (Session("email") <> "") Then
                            Dim tos As String = Session("email")
                            Dim from As String = "webmaster@emape.gob.pe"
                            Dim subject As String = "Solicitud de Vehiculo S" + nro.PadLeft(9, "0")
                            Dim body As String = "Saludos Cordiales:<br> Se ha solicitado un vehiculo para los pasajeros <b>" + pasajero.ToUpper() + "</b>, siendo su origen <b>" + origen.ToUpper() + "</b> y su destino <b>" + destino.ToUpper() + "</b>, a las " + hora + ". Detalle: " + observacion.ToUpper() + "<br><br> Mensajeria: Módulo de Transporte."
                            Using mm As New MailMessage(from, tos)
                                mm.Subject = subject
                                mm.Body = body
                                mm.CC.Add("Rolando Estrada <restrada@emape.gob.pe>")
                                mm.CC.Add("Andrea Palomino <apalomino@emape.gob.pe>")
                                mm.CC.Add("Andrea Palomino <sistemas02@emape.gob.pe>")
                                ' mm.Bcc=''
                                mm.IsBodyHtml = True
                                Dim smtp As New SmtpClient()
                                smtp.Host = "mailserver.emape.gob.pe"
                                'smtp.EnableSsl = True
                                Dim NetworkCred As New NetworkCredential(from, "lima2018")
                                smtp.UseDefaultCredentials = True
                                smtp.Credentials = NetworkCred
                                smtp.Port = 25
                                smtp.Send(mm)
                            End Using

                        End If


                    Else
                        cmd.CommandText = "UPDATE SolicitarTransporte SET Involucrado='" + pasajero.ToUpper() + "',Origen='" + origen.ToUpper() + "', Destino='" + destino.ToUpper() + "', HoraSalida='" + hora + "', TipoSolicitud='" + tipo + "',Prioridad='" + prioridad + "',IdPlaca='" + vehiculo + "',IdChofer='" + chofer + "',Estado='" + estado + "',AudUsuarioModificacion='" + Session("userid") + "',AudFechaModificacion='" + DateTime.Today + "', Observacion='" + observacion.ToUpper() + "' WHERE IdSolicitud='" + codigo + "'"


                        If (estado = 2) Then
                            tip = "Aprobado"
                        ElseIf (estado = 3) Then
                            tip = "Rechazado"
                        ElseIf (estado = 4) Then
                            tip = "En Marcha"
                        ElseIf (estado = 5) Then
                            tip = "Culminado"
                        ElseIf (estado = 6) Then
                            tip = "Anulado"
                        Else
                            tip = ""
                        End If
                        oEmail = EmailSolicitud(codigo)
                        oSolicitud = CodigoSolicitud0(codigo)
                        oChofer = obtenerChofer0(chofer)

                        If (oEmail <> "" And estado <> "1") Then
                            Dim tos As String = oEmail
                            Dim from As String = "webmaster@emape.gob.pe"
                            Dim subject As String = "Solicitud de Vehiculo S" + oSolicitud.PadLeft(9, "0")
                            ' + oSolicitud.PadLeft(9, "0")
                            Dim body As String
                            If estado = "2" Then
                                body = "Saludos Cordiales:<br> Se ha " + tip + " la solicitud del vehiculo con el conductor " + oChofer + ", se le recomienda estar en el patio de vehiculos 10 minutos antes de iniciar su viaje.<br><br> Mensajeria: Módulo de Transporte."
                            Else
                                body = "Saludos Cordiales:<br> Su Solicitud se ha categorizado como: <b>" + tip + "</b>.<br> Si desea puede consultar con la unidad de Transporte.<br><br> Mensajeria: Módulo de Transporte."
                            End If

                            Using mm As New MailMessage(from, tos)
                                mm.Subject = subject
                                mm.Body = body
                                mm.CC.Add("Rolando Estrada <sistemas02@emape.gob.pe>")
                                ' mm.Bcc=''
                                mm.IsBodyHtml = True
                                Dim smtp As New SmtpClient()
                                smtp.Host = "mailserver.emape.gob.pe"
                                'smtp.EnableSsl = True
                                Dim NetworkCred As New NetworkCredential(from, "lima2018")
                                smtp.UseDefaultCredentials = True
                                smtp.Credentials = NetworkCred
                                smtp.Port = 25
                                smtp.Send(mm)
                            End Using

                        End If

                    End If
                    cmd.ExecuteNonQuery()
                End Using
                Return (1)
            End Using
        Catch ex As Exception
            Return ("Insertar Requerimiento Almacen..." & ex.Message)
        End Try
    End Function

    <OperationContract()> _
<WebInvoke(Method:="POST", ResponseFormat:=WebMessageFormat.Json)> _
    Public Function RegistrarOcurrencia(ByVal codigo As String, ByVal vehiculo As String, ByVal condicion As String, ByVal descripcion As String, ByVal fecha2 As String, ByVal evaluacion As String, ByVal comentario As String) As String
        Dim nro As String
        Try
            Using conn As New SqlConnection()
                conn.ConnectionString = ConfigurationManager.ConnectionStrings("cnEmapeProduccion").ConnectionString
                Using cmd As New SqlCommand()
                    conn.Open()
                    cmd.Connection = conn
                    If codigo = "" Then

                        nro = CodigoRequerimiento()

                        cmd.CommandText = "INSERT INTO OcurrenciaTransporte (IdCentroCosto, IdPlaca, Descripcion, Estado, AudUsuarioCreacion,AudUsuarioModificacion,AudFechaCreacion,AudFechaModificacion, NroRequerimiento, Comentario, Evaluacion, Fecha, Condicion) VALUES(@CentroCosto,@IdPlaca, @Descripcion, '1', @Usuario, @Usuario, @Fechaactual, @Fechaactual, @NroRequerimiento, @Comentario, @Evaluacion, @Fecha, @Condicion)"
                        cmd.Parameters.AddWithValue("@CentroCosto", Session("useridcc"))
                        cmd.Parameters.AddWithValue("@IdPlaca", vehiculo)
                        cmd.Parameters.AddWithValue("@Descripcion", descripcion.ToUpper)
                        
                        cmd.Parameters.AddWithValue("@Usuario", Session("userid"))
                        cmd.Parameters.AddWithValue("@Fechaactual", DateTime.Today)
                        cmd.Parameters.AddWithValue("@NroRequerimiento", nro)
                        cmd.Parameters.AddWithValue("@Comentario", comentario.ToUpper)
                        cmd.Parameters.AddWithValue("@Evaluacion", evaluacion)
                        cmd.Parameters.AddWithValue("@Fecha", fecha2)
                        cmd.Parameters.AddWithValue("@Condicion", condicion)
                    Else
                        cmd.CommandText = "UPDATE OcurrenciaTransporte SET  IdPlaca='" + vehiculo + "',Descripcion='" + descripcion + "',AudUsuarioModificacion='" + Session("userid") + "',AudFechaModificacion='" + DateTime.Today + "', Comentario='" + comentario.ToUpper() + "', Evaluacion='" + evaluacion + "', Fecha='" + fecha2 + "', Condicion='" + condicion + "' WHERE IdOcurrencia='" + codigo + "'"

                    End If
                    cmd.ExecuteNonQuery()
                End Using
                Return (1)
            End Using
        Catch ex As Exception
            Return ("Insertar ..." & ex.Message)
        End Try
    End Function

    <OperationContract()> _
<WebInvoke(Method:="POST", ResponseFormat:=WebMessageFormat.Json)> _
    Public Function obtenerSolicitud(ByVal codigo As String) As String
        Dim fec As String
        Dim Sol As New List(Of Object)()
        Using conn As New SqlConnection()

            conn.ConnectionString = ConfigurationManager.ConnectionStrings("cnEmapeProduccion").ConnectionString
            Using cmd As New SqlCommand()
                cmd.CommandText = "select * from  SolicitarTransporte WHERE IdSolicitud='" + codigo + "' order by AudFechaCreacion desc"
                cmd.Connection = conn
                conn.Open()
                Using sdr As SqlDataReader = cmd.ExecuteReader()
                    While sdr.Read()

                        If Format(sdr("Fecha"), "dd/MM/yyyy HH:mm:ss") = "01/01/1900 00:00:00" Then
                            fec = ""
                        Else
                            fec = sdr("Fecha")
                        End If

                        Sol.Add(New With { _
                                                 Key .IdSolicitud = sdr("IdSolicitud"), _
                                                 Key .IdCentroCosto = sdr("IdCentroCosto"), _
                                                 Key .Fecha = fec, _
                                                 Key .Involucrado = sdr("Involucrado"), _
                                                 Key .Origen = sdr("Origen"), _
                                                 Key .Destino = sdr("Destino"), _
                                                 Key .HoraSalida = sdr("HoraSalida"), _
                                                 Key .TipoSolicitud = sdr("TipoSolicitud"), _
                                                 Key .Prioridad = sdr("Prioridad"), _
                                                 Key .IdPlaca = Trim(sdr("IdPlaca")), _
                                                 Key .IdChofer = Trim(sdr("IdChofer")), _
                                                 Key .NroSolicitud = sdr("NroSolicitud"), _
                                                 Key .Observacion = sdr("Observacion"), _
                                                 Key .Estado = sdr("Estado") _
                        })
                    End While
                End Using
                conn.Close()
            End Using
            Return (New JavaScriptSerializer().Serialize(Sol))
        End Using
    End Function

    <OperationContract()> _
<WebInvoke(Method:="POST", ResponseFormat:=WebMessageFormat.Json)> _
    Public Function obtenerOcurrencia(ByVal codigo As String) As String
        Dim fec As String
        Dim Sol As New List(Of Object)()
        Using conn As New SqlConnection()

            conn.ConnectionString = ConfigurationManager.ConnectionStrings("cnEmapeProduccion").ConnectionString
            Using cmd As New SqlCommand()
                cmd.CommandText = "select * from  OcurrenciaTransporte WHERE IdOcurrencia='" + codigo + "' order by AudFechaCreacion desc"
                cmd.Connection = conn
                conn.Open()
                Using sdr As SqlDataReader = cmd.ExecuteReader()
                    While sdr.Read()

                        If Format(sdr("Fecha"), "dd/MM/yyyy HH:mm:ss") = "01/01/1900 00:00:00" Then
                            fec = ""
                        Else
                            fec = sdr("Fecha")
                        End If

                        Sol.Add(New With { _
                                                 Key .IdOcurrencia = sdr("IdOcurrencia"), _
                                                 Key .Condicion = sdr("Condicion"), _
                                                 Key .Descripcion = sdr("Descripcion"), _
                                                 Key .Fecha = fec, _
                                                 Key .Evaluacion = sdr("Evaluacion"), _
                                                 Key .Comentario = sdr("Comentario"), _
                                                 Key .Vehiculo = Trim(sdr("IdPlaca")) _
                        })
                    End While
                End Using
                conn.Close()
            End Using
            Return (New JavaScriptSerializer().Serialize(Sol))
        End Using
    End Function
    <OperationContract()> _
<WebInvoke(Method:="POST", ResponseFormat:=WebMessageFormat.Json)> _
    Public Function EliminarSolicitud(ByVal codigo As String) As String
        Try
            Using conn As New SqlConnection()
                conn.ConnectionString = ConfigurationManager.ConnectionStrings("cnEmapeProduccion").ConnectionString
                Using cmd As New SqlCommand()
                    conn.Open()
                    cmd.Connection = conn
                    cmd.CommandText = "UPDATE SolicitarTransporte SET Estado='6' WHERE IdSolicitud=@codigo"
                    cmd.Parameters.AddWithValue("@codigo", codigo)
                    cmd.ExecuteNonQuery()
                End Using
                Return (1)
            End Using
        Catch ex As Exception
            Return ("Insertar Requerimiento Almacen..." & ex.Message)
        End Try
    End Function

    <OperationContract()> _
<WebInvoke(Method:="POST", ResponseFormat:=WebMessageFormat.Json)> _
    Public Function EliminarRequerimiento(ByVal codigo As String) As String
        Try
            Using conn As New SqlConnection()
                conn.ConnectionString = ConfigurationManager.ConnectionStrings("cnEmapeProduccion").ConnectionString
                Using cmd As New SqlCommand()
                    conn.Open()
                    cmd.Connection = conn
                    cmd.CommandText = "UPDATE OcurrenciaTransporte SET Estado='0' WHERE IdOcurrencia=@codigo"
                    cmd.Parameters.AddWithValue("@codigo", codigo)
                    cmd.ExecuteNonQuery()
                End Using
                Return (1)
            End Using
        Catch ex As Exception
            Return ("Insertar Requerimiento Almacen..." & ex.Message)
        End Try
    End Function


    <OperationContract()> _
   <WebInvoke(Method:="POST", ResponseFormat:=WebMessageFormat.Json)> _
    Public Function listarMantenimiento(ByVal codigo As String) As String
        Dim fechaprogramada, fechapago As String
        Dim Sol As New List(Of Object)()
        Using conn As New SqlConnection()

            conn.ConnectionString = ConfigurationManager.ConnectionStrings("cnEmapeProduccion").ConnectionString
            Using cmd As New SqlCommand()
                cmd.CommandText = "select * from MantenimientoVehiculo WHERE IdAnno=year(GETDATE()) and IdPlaca='" & codigo & "' and Estado='A' ORDER BY AudFechaCreacion desc"
                cmd.Connection = conn
                conn.Open()
                Using sdr As SqlDataReader = cmd.ExecuteReader()
                    While sdr.Read()
                        If Format(sdr("FechaProgramada"), "dd/MM/yyyy HH:mm:ss") = "01/01/1900 00:00:00" Then
                            fechaprogramada = ""
                        Else
                            fechaprogramada = sdr("FechaProgramada")
                        End If

                        If Format(sdr("FechaPago"), "dd/MM/yyyy HH:mm:ss") = "01/01/1900 00:00:00" Then
                            fechapago = ""
                        Else
                            fechapago = sdr("FechaPago")
                        End If
                        Sol.Add(New With { _
                                                 Key .IdMantto = sdr("IdMantto"), _
                                                 Key .Descripcion = sdr("Descripcion"), _
                                                 Key .Tipo = sdr("Tipo"), _
                                                 Key .FechaProgramada = fechaprogramada, _
                                                 Key .FechaPago = fechapago, _
                                                 Key .Presupuesto = sdr("Presupuesto"), _
                                                 Key .Requerimiento = sdr("Requerimiento"), _
                                                 Key .Proveedor = sdr("Proveedor"), _
                                                 Key .Recurso = sdr("Recurso") _
                        })
                    End While
                End Using
                conn.Close()
            End Using
            Return (New JavaScriptSerializer().Serialize(Sol))
        End Using
    End Function

    <OperationContract()> _
<WebInvoke(Method:="POST", ResponseFormat:=WebMessageFormat.Json)> _
    Public Function eliminarMantenimiento(ByVal codigo As String) As String
        Try
            Using conn As New SqlConnection()
                conn.ConnectionString = ConfigurationManager.ConnectionStrings("cnEmapeProduccion").ConnectionString
                Using cmd As New SqlCommand()
                    conn.Open()
                    cmd.Connection = conn
                    cmd.CommandText = "UPDATE MantenimientoVehiculo SET Estado='D' WHERE IdMantto=@codigo"
                    cmd.Parameters.AddWithValue("@codigo", codigo)
                    cmd.ExecuteNonQuery()
                End Using
                Return (1)
            End Using
        Catch ex As Exception
            Return ("Insertar Requerimiento Almacen..." & ex.Message)
        End Try
    End Function


    <OperationContract()> _
<WebInvoke(Method:="POST", ResponseFormat:=WebMessageFormat.Json)> _
    Public Function obtenerMantenimiento(ByVal codigo As String) As String
        Dim fechaprogramada, fechapago As String
        Dim Sol As New List(Of Object)()
        Using conn As New SqlConnection()

            conn.ConnectionString = ConfigurationManager.ConnectionStrings("cnEmapeProduccion").ConnectionString
            Using cmd As New SqlCommand()
                cmd.CommandText = "select * from  MantenimientoVehiculo WHERE IdMantto='" + codigo + "' order by AudFechaCreacion desc"
                cmd.Connection = conn
                conn.Open()
                Using sdr As SqlDataReader = cmd.ExecuteReader()
                    While sdr.Read()

                        If Format(sdr("FechaProgramada"), "dd/MM/yyyy HH:mm:ss") = "01/01/1900 00:00:00" Then
                            fechaprogramada = ""
                        Else
                            fechaprogramada = sdr("FechaProgramada")
                        End If

                        If Format(sdr("FechaPago"), "dd/MM/yyyy HH:mm:ss") = "01/01/1900 00:00:00" Then
                            fechapago = ""
                        Else
                            fechapago = sdr("FechaPago")
                        End If

                        Sol.Add(New With { _
                                                 Key .IdMantto = sdr("IdMantto"), _
                                                 Key .Descripcion = sdr("Descripcion"), _
                                                 Key .Tipo = sdr("Tipo"), _
                                                 Key .FechaProgramada = fechaprogramada, _
                                                 Key .FechaPago = fechapago, _
                                                 Key .Presupuesto = sdr("Presupuesto"), _
                                                 Key .Requerimiento = sdr("Requerimiento"), _
                                                 Key .Proveedor = sdr("Proveedor"), _
                                                 Key .Recurso = Trim(sdr("Recurso")), _
                                                 Key .IdPlaca = Trim(sdr("IdPlaca")) _
                        })
                    End While
                End Using
                conn.Close()
            End Using
            Return (New JavaScriptSerializer().Serialize(Sol))
        End Using
    End Function

    <OperationContract()> _
<WebInvoke(Method:="POST", ResponseFormat:=WebMessageFormat.Json)> _
    Public Function RegistrarMantenimiento(ByVal cod As String, ByVal descripcion As String, ByVal tipo As String, ByVal fechaprogramada As String, ByVal fechapago As String, ByVal presupuesto As String, ByVal requerimiento As String, ByVal proveedor As String, ByVal recurso As String, ByVal xcod As String) As String
        'Dim nro As String
        Try
            Using conn As New SqlConnection()
                conn.ConnectionString = ConfigurationManager.ConnectionStrings("cnEmapeProduccion").ConnectionString
                Using cmd As New SqlCommand()
                    conn.Open()
                    cmd.Connection = conn
                    If xcod = "" Then

                        cmd.CommandText = "INSERT INTO MantenimientoVehiculo (Descripcion,Tipo,FechaProgramada,FechaPago,Presupuesto,Requerimiento,Proveedor,Recurso,AudUsuarioCreacion,AudUsuarioModificacion,AudFechaCreacion,AudFechaModificacion,Estado,IdAnno,IdPlaca) VALUES(@descripcion,@tipo, @fechaprogramada, @fechapago, @presupuesto, @requerimiento, @proveedor, @recurso, @Usuario, @Usuario, @Fechaactual, @Fechaactual, 'A', @IdAnno,@placa)"

                        cmd.Parameters.AddWithValue("@descripcion", descripcion.ToUpper())
                        cmd.Parameters.AddWithValue("@tipo", tipo)
                        cmd.Parameters.AddWithValue("@fechaprogramada", fechaprogramada)
                        cmd.Parameters.AddWithValue("@fechapago", fechapago)
                        cmd.Parameters.AddWithValue("@presupuesto", presupuesto)
                        cmd.Parameters.AddWithValue("@requerimiento", requerimiento)
                        cmd.Parameters.AddWithValue("@proveedor", proveedor)
                        cmd.Parameters.AddWithValue("@recurso", recurso)
                        cmd.Parameters.AddWithValue("@placa", cod)
                        cmd.Parameters.AddWithValue("@Usuario", Session("userid"))
                        cmd.Parameters.AddWithValue("@Fechaactual", DateTime.Today)
                        cmd.Parameters.AddWithValue("@Estado", "A")
                        cmd.Parameters.AddWithValue("@IdAnno", Year(Now()))
                    Else
                        cmd.CommandText = "UPDATE MantenimientoVehiculo SET Descripcion='" + descripcion.ToUpper() + "',Tipo='" + tipo + "', FechaProgramada='" + fechaprogramada + "', FechaPago='" + fechapago + "', Presupuesto='" + presupuesto + "',Requerimiento='" + requerimiento + "',Proveedor='" + proveedor + "',Recurso='" + recurso + "',AudUsuarioModificacion='" + Session("userid") + "',AudFechaModificacion='" + DateTime.Today + "' WHERE IdMantto='" + xcod + "'"

                    End If
                    cmd.ExecuteNonQuery()
                End Using
                Return (1)
            End Using
        Catch ex As Exception
            Return ("Insertar Requerimiento Almacen..." & ex.Message)
        End Try
    End Function

End Class

