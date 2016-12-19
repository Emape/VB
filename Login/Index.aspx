<%@ Page Language="VB" AutoEventWireup="false" CodeFile="~/Login/Index.aspx.vb" Inherits="Index" %>
<!DOCTYPE html>
<html>
    <head>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width; initial-scale=1.0; maximum-scale=1.0;"> 
	<title>EMAPE S.A.</title>
    <link href="../css/bootstrap.css" rel="stylesheet">
    <link href="../css/demo.css" rel="stylesheet">
    <link href="../css/login-theme-6.css" rel="stylesheet" id="fordemo">
    <link href="../css/animate-custom.css" rel="stylesheet">
    <script type="text/javascript" src="../js/jquery.js"></script>
    </head>

    <body>
		<div class="container" id="login-block">
    		<div class="row">
			    <div class="col-sm-6 col-md-4 col-sm-offset-3 col-md-offset-4"> 
			       <div class="login-box clearfix animated flipInY">
			        	<div class="login-logo">
			        		<a href="#"><img width="75%" class="img-responsive" src="../images/login-logo.png" alt="Emape Logo" /></a>
			        	</div> 
			        	<hr />
                       
						<p align=center style="font-size:18px;color:#888"> Módulo de Gema </p>
						<form runat="server" id=form_login name=form_login >
			        	<div class="login-form">
								 <asp:TextBox runat=server type="email" placeholder="Mi Usuario" id=user name=user class="input-field" /> 
						   		 <asp:TextBox TextMode="password" runat=server onkeyup="if(validateEnter(event) == true) { $('#enviar').click(); }" type="password" placeholder="Mi Contraseña" id=pass name=pass class="input-field" /> 
						   	    
								<div id=divinfo name="divinfo" style='display:none' >
								    Alerta: Ingrese su usuario.
								</div> 
								<div id=divinfo2 style='display:none' class="alert alert-warning">
								    Alerta: Ingrese su contraseña.
								</div>
								<div  style='display:none' class="alert alert-danger">
								 	<b>Error: </b>Datos Incorrectos.
								</div> 	

                        <asp:Button class="btn btn-login btn-reset" ID="btn_submit" Text="Iniciar Sessión" runat="server" OnClick="Acceso" />
                        
                        <div align="center">
							   <b> <asp:Label   id="divmsj" runat="server" Text="Label" class="alert alert-danger" Style="display:none" > </asp:Label>
							    </b></div>
                        </div> 
						</form>
			       </div>
			    </div>
			</div>
    	</div>
     	<footer class="container">
     		<p id="footer-text" style="font:15px 'Trebuchet MS'"><small>Copyright &copy; 2015 <a style="cursor:pointer" href="http://www.emape.gob.pe/"> EMAPE S.A.</a></small></p>
     	</footer>

	<script>
	$("#enviar").click(function(){
	$('#diverror').slideUp("fast");
	$('#divinfo').slideUp("fast");
	$('#divinfo2').slideUp("fast");
	
	if($('#user').val()=='')
	{
	$('#diverror').slideUp("fast");
	$('#divinfo').slideDown("fast");
	$('#divinfo2').slideUp("fast");
	}
	else if ($('#pass').val()=='')  {
	$('#diverror').slideUp("fast");
	$('#divinfo').slideUp("fast");
	$('#divinfo2').slideDown("fast");
	}
	   
	else{
    $.ajax({
        url: 'http://isis:88/Services/Logistica/Almacen.svc/Acceso',
        type: 'POST',
        processData: true,
        crossDomain: true,
        dataType: "json",
	contentType: "application/json; charset=utf-8",
	data:'{"user":"'+$("#user").val()+'","pass": "'+$("#pass").val()+'" }',
            dataType: "json",
            success: function (data) {

                if (data.d == '0') {
                    $('#diverror').slideDown("fast");
                    $('#divinfo').slideUp("fast");
                    $('#divinfo2').slideUp("fast");
                }
                else if (data == 'error') {
                    alert("No se puede establecer conexion con la base de datos");
                }
                else {
                    location.href = "../Home/Index.aspx";
                    $('#diverror').slideUp("fast");
                    $('#divinfo').slideUp("fast");
                    $('#divinfo2').slideUp("fast");

                }
               
	        }   
	});
	}
	});
	
	function validateEnter(e) {
	var key=e.keyCode || e.which;
	if (key==13){ return true; } else { return false; }
	}

	</script>
    </body>
</html>