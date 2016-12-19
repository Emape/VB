<%@ Page Language="VB" AutoEventWireup="false" CodeFile="~/Home/Index.aspx.vb" Inherits="Index" %>

<!DOCTYPE html>


<html>
<head>
    <meta content='width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no' name='viewport'>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <title>EMAPE S.A.</title>
    <link href="../library/bootstrap/css/bootstrap.min.css" rel="stylesheet" type="text/css" />
    <link href="../css/font-awesome.min.css" rel="stylesheet" type="text/css" />
    <link href="../css/ionicons.min.css" rel="stylesheet" type="text/css" />
    <link href="../library/plugins/datatables/dataTables.bootstrap.css" rel="stylesheet" type="text/css" />
    <link href="../library/dist/css/AdminLTE.min.css" rel="stylesheet" type="text/css" />
    <link href="../library/dist/css/skins/_all-skins.min.css" rel="stylesheet" type="text/css" />
	<link href="../library/plugins/datepicker/bootstrap-datepicker3.css" rel="stylesheet" type="text/css" />
    <link rel="shortcut icon" href="../images/favicon.ico">
    <link rel="stylesheet" type="text/css" href="../library/source/jquery.fancybox.css?v=2.1.5" media="screen" />
    <script src="../js/jquery.js" type="text/javascript"></script>

	<script src="../js/custom_jquery.js" type="text/javascript"></script>
	<script src="../js/jquery/jquery-1.4.1.min.js" type="text/javascript"></script>
	<script src='../js/menu_jquery.js' type='text/javascript'  ></script>

    <script>
        jQuery.noConflict();
        $(document).ready(function () {

            $("#vineta").css("display", "none");
            $.ajaxSetup({
                'beforeSend': function (xhr) {
                    xhr.overrideMimeType('text/html; charset=UTF-8');
                },
            });

            var ajax_load = "<div style='text-align:center;padding-top:300px'> <button class='btn btn-lg btn-primary'><span class='glyphicon glyphicon-refresh glyphicon-refresh-animate'></span> Cargando...</button></div>";
            $(".ajaxmenu").on("click", function () {
                myUrl = $(this).attr('href');
                if (myUrl.match('#')) {
                    var myAnchor = myUrl.split('#')[1];
                    /*Ahora arreglamos el URL - para evitar problemas en ie6*/
                    var loadUrl = myUrl.split('#')[0];
                } else {
                    var loadUrl = $(this).attr('href');
                }

                $("#container-ajax").html(ajax_load).load(loadUrl, function () {
                    if (myUrl.match('#')) {
                        /*Calculamos la distancia entre el anchor y la pagina y animamos*/
                        var targetOffset = $("a[name='" + myAnchor + "']").offset().top;
                        $('html').animate({ scrollTop: targetOffset }, 400);
                    }
                }
                );
                return false;
            });

            permiso();


          


        });
	</script>

    <style>
        .glyphicon-refresh-animate {
        -animation: spin .7s infinite linear;
        -webkit-animation: spin2 .7s infinite linear;
	}

	@-webkit-keyframes spin2 {
        from { -webkit-transform: rotate(0deg);}
        to { -webkit-transform: rotate(360deg);}
	}

	@keyframes spin {
        from { transform: scale(1) rotate(0deg);}
        to { transform: scale(1) rotate(360deg);}
	}
    </style>

</head>
<body class="skin-blue">

    <asp:TextBox name="indexi" ID="indexi" value="1" >

    <a style="display:none" id="home" href="../home/principal.aspx" class="ajaxmenu"><i class="fa fa-circle-o"></i> Home</a>
  
    <div class="wrapper">

      <!-- Main Header -->
      <header class="main-header">

        <!-- Logo -->
        <a href="./Index.aspx" class="logo"><b>GEMA</b></a>

        <!-- Header Navbar -->
        <nav class="navbar navbar-static-top" role="navigation">
          <!-- Sidebar toggle button-->
          <a href="#" class="sidebar-toggle" data-toggle="offcanvas" role="button">
            <span class="sr-only">Toggle navigation</span>
          </a>

  

          <!-- Single button -->
             <% If Session("vial") <> "1" And Session("siaf") <> "1" Then %> 
        
<div class="btn-group" style="margin-top:8px;">
  <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown" />
     <span class="sel_empresa"></span> <span class="caret"></span>
  </button>


  <ul class="dropdown-menu" role="menu">
    <li><a style="cursor:pointer" onclick="sel(1)" > <i class="fa fa-building-o"></i> Empresarial</a></li>
    <li><a style="cursor:pointer" onclick="sel(2)"> <i class="fa fa-hospital-o"></i> Municipal</a></li>
    <li><a style="cursor:pointer" onclick="sel(3)"> <i class="fa fa-globe"></i> Regional</a></li>
    <li><a style="cursor:pointer" onclick="sel(4)"> <i class="fa fa-road"></i> Mantenimiento Vial</a></li>
    <li><a style="cursor:pointer" onclick="sel(5)"> <i class="fa fa-bank"></i> SIAF</a></li>
  </ul>
</div>
<input type="hidden" name="id_empresa" id="id_empresa" class="id_empresa">
            
            <% ElseIf Session("vial") = "1" Then%> 
            <input type="hidden" name="id_empresa"  id="id_empresa" class="id_empresa" value="4">
            <% ElseIf Session("siaf") = "1" Then%> 
            <input type="hidden" name="id_empresa"  id="id_empresa" class="id_empresa" value="5">
            <% End If%> 
            

            <% If Session("transporte") = "1" Then%> 
            <input type="hidden" name="id_transporte"  id="id_transporte" value="1">
            <% Else%> 
            <input type="hidden" name="id_transporte"  id="id_transporte" value="0">
            <% End If%> 
             
            <!-- Navbar Right Menu -->
          <div class="navbar-custom-menu">
            <ul class="nav navbar-nav">
             
              <!-- User Account Menu -->
              <li class="dropdown user user-menu">
                <!-- Menu Toggle Button -->
                <a href="#" class="dropdown-toggle" data-toggle="dropdown">
                  <!-- The user image in the navbar-->
                  <img src="../images/user.png" class="user-image" alt="User Image"/>
                  <!-- hidden-xs hides the username on small devices so only the image appears. -->
                  <span class="hidden-xs"><%  Response.Write(Session("username"))%></span>
                </a>
                <ul class="dropdown-menu">
                  <!-- The user image in the menu -->
                  <li class="user-header">
                    <img src="../images/user.png" class="img-circle" alt="User Image" />
                    <p>
                       <%  Response.Write(Session("username"))%>
                      <small>Código: <%  Response.Write(Session("userid"))%></small>
                    </p>
                  </li>
               
                  <li class="user-footer">
                    <!--<div class="pull-left">
                      <a href="#" class="btn btn-default btn-flat">Profile</a>
                    </div>-->
                    <div class="pull-right">
                      <a href="../login/Index.aspx" class="btn btn-default btn-flat"><i class="fa fa-power-off"></i> Salir</a>
                    </div>
                  </li>
                </ul>
              </li>
            </ul>
          </div>
        </nav>
      </header>
      <!-- Left side column. contains the logo and sidebar -->
      <aside class="main-sidebar">

        <!-- sidebar: style can be found in sidebar.less -->
        <section class="sidebar">

       
          <!-- Sidebar Menu -->
          <ul class="sidebar-menu">
            <li class="header"></li>

            <!--<li class="active"><a href="#"><span>Otro</span></a><</li>-->
     
			<!--<li class="treeview">
              <a href="#"><span>Maestros</span> <i class="fa fa-angle-left pull-right"></i></a>
              <ul class="treeview-menu">
                <li><a href="#">Bienes y Servicios</a></li>
              </ul>
            </li>-->
			<% 'If Session("userid") = "0050" Or Session("userid") = "0110" Or Session("userid") = "1060" Or Session("userid") = "1061" Or Session("userid") = "0125" Then%>
            <li class="treeview">
              <a href="#"><span>MAESTRO</span> <i class="fa fa-angle-left pull-right"></i></a>
              <ul class="treeview-menu">
                <li id="0400" class="vineta" style="display:none"><a href="#"><i class="fa fa-car"></i><span>TRANSPORTE</span> <i class="fa fa-angle-left pull-right"></i></a>
			            <ul class="treeview-menu" style="padding-left: 0px;">
                        <li id="0401" class="vineta" style="display:none" ><a href="../home/vehiculo.aspx" class="ajaxmenu"><i class="fa fa-truck"></i> Vehículos</a></li>
						<li id="0402" class="vineta" style="display:none" ><a href="../home/chofer.aspx" class="ajaxmenu"><i class="fa fa-user-secret"></i> Choferes</a></li>
                        </ul>	
		        </li>
                  <li id="0800" class="vineta" style="display:none"><a href="#"><i class="fa fa-group"></i><span>LOCADOR</span> <i class="fa fa-angle-left pull-right"></i></a>
			            <ul class="treeview-menu" style="padding-left: 0px;">
                        <li id="0801" class="vineta" style="display:none" ><a href="../home/locadorxgerencia.aspx" class="ajaxmenu"><i class="fa fa-exchange"></i> Gerencia</a></li>
						</ul>	
		        </li>
              </ul>
            </li>


          <%  'End If%>
           
            <li class="treeview">
              <a href="#"><span>LOGÍSTICA</span> <i class="fa fa-angle-left pull-right"></i></a>
              <ul class="treeview-menu">
                <li id="0100" class="vineta" style="display:none"><a href="#"><i class="fa fa-cube"></i><span>ALMACÉN</span> <i class="fa fa-angle-left pull-right"></i></a>
			            <ul class="treeview-menu" style="padding-left: 0px;">
                        <li id="0101" class="vineta" style="display:none"><a href="../home/guiaingreso.aspx" class="ajaxmenu"><i class="fa fa-sign-in"></i> Guía de Ingreso</a></li>
						<li id="0102" class="vineta" style="display:none"><a href="../home/guiasalida.aspx" class="ajaxmenu"><i class="fa fa-sign-out"></i> Guía de Salida</a></li>
                        <li id="0103" class="vineta" style="display:none"><a href="../home/cierrealmacen.aspx" class="ajaxmenu"><i class="fa fa-lock"></i> Cierre</a></li>
                        </ul>	
		        </li>
                <li id="0200" class="vineta" style="display:none"><a href="#"><i class="fa fa-archive"></i><span>REQUERIMIENTOS</span> <i class="fa fa-angle-left pull-right"></i></a>
			            <ul class="treeview-menu" style="padding-left: 0px;">
                        <li id="0201" class="vineta" style="display:none"><a href="../home/requerimientoalm.aspx" class="ajaxmenu"><i class="fa fa-cubes"></i> Almacén</a></li>
                        <li id="0202" class="vineta" style="display:none"><a href="../home/requerimientolocador.aspx" class="ajaxmenu"><i class="fa fa-male"></i> Locador</a></li>
                        </ul>	
		        </li>
                <li id="0300" class="vineta" style="display:none"><a href="#"><i class="fa fa-file-text-o"></i><span>REPORTES</span> <i class="fa fa-angle-left pull-right"></i></a>
			            <ul class="treeview-menu" style="padding-left: 0px;">
                        <li id="0301" class="vineta" style="display:none"><a href="../home/RepMovAlmacen.aspx" class="ajaxmenu"><i class="fa fa-random"></i> Mov. de Almacén</a></li>
                        <li id="0302" class="vineta" style="display:none"><a href="../home/RepKardex.aspx" class="ajaxmenu"><i class="fa fa-cube"></i> Kardex</a></li>
                        <li id="0303" class="vineta" style="display:none"><a href="../home/RepStock.aspx" class="ajaxmenu"><i class="fa fa-cubes"></i> Stock</a></li>
                        <li id="0304" class="vineta" style="display:none"><a href="../home/RepTomaInventario.aspx" class="ajaxmenu"><i class="fa fa-list"></i> Toma de Inventario</a></li>
                        <li id="0305" class="vineta" style="display:none"><a href="../home/RepExpedienteCompromiso.aspx" class="ajaxmenu" id="reportecompromiso"><i class="fa fa-thumb-tack"></i> Compromiso</a></li>
                        <li id="0306" class="vineta" style="display:none"><a href="../home/RepProcesoSeleccion.aspx" class="ajaxmenu" ><i class="fa fa-weixin"></i> P. Selección</a></li>
                        <li id="0307" class="vineta" style="display:none"><a href="../home/RepReservaAlmacen.aspx" class="ajaxmenu" ><i class="fa fa-gift"></i> Reserva de Almacen</a></li>
                        <li id="0308" class="vineta" style="display:none"><a href="../home/RepSeguimientoProveedor.aspx" class="ajaxmenu" ><i class="fa fa-align-left"></i> Seguimiento Proveedor</a></li>
                        </ul>	
		        </li>
                <li id="0700" class="vineta" style="display:none"><a href="#"><i class="fa fa-cube"></i><span>ORDENES</span> <i class="fa fa-angle-left pull-right"></i></a>
                    <ul class="treeview-menu" style="padding-left: 0px;">
                        <li id="0701" class="vineta" style="display:none"><a href="../home/ordencompra.aspx" class="ajaxmenu"><i class="fa fa-cubes"></i> Orden de Compra</a></li>
						<li id="0702" class="vineta" style="display:none"><a href="../home/ordenservicio.aspx" class="ajaxmenu"><i class="fa fa-cubes"></i> Orden de Servicio</a></li>
                        <li id="0703" class="vineta" style="display:none"><a href="../home/fechaaceptacionorden.aspx" class="ajaxmenu"><i class="fa fa-cubes"></i> Fecha de Aceptaci&oacute;n</a></li>
                    </ul>	
		        </li>
              </ul>
            </li>

             <% 'If Session("userid") = "0050" or Session("userid") = "0110" or Session("userid") = "1060" or Session("userid") = "1061" or Session("userid") = "0125" Then%>
            



           <li class="treeview">
              <a href="#"><span>TRANSPORTE</span> <i class="fa fa-angle-left pull-right"></i></a>
              <ul class="treeview-menu">
                <li><a href="#"><i class="fa fa-cube"></i><span>DOCUMENTOS</span> <i class="fa fa-angle-left pull-right"></i></a>
				
			            <ul class="treeview-menu" style="padding-left: 0px;">
                        <li id="0501" class="vineta" style="display:none"><a  href="../home/solicitudtransporte.aspx" class="ajaxmenu"><i class="fa fa-clipboard"></i> Solicitud</a></li>
                        <li id="0505" class="vineta" style="display:none"><a  href="../home/ocurrenciatransporte.aspx" class="ajaxmenu"><i class="fa fa-warning"></i> Ocurrencia</a></li>
                        <li id="0502" class="vineta" style="display:none"><a  href="../home/ordensuministro.aspx" class="ajaxmenu"><i class="fa fa-filter"></i> Orden de Sumnistro</a></li>
						<li id="0503" class="vineta" style="display:none"><a  href="../home/rendicion.aspx" class="ajaxmenu"><i class="fa fa-money"></i> Rendición</a></li>
                        <li id="0504" class="vineta" style="display:none"><a  href="../home/mantenimientotransporte.aspx" class="ajaxmenu"><i class="fa fa-wrench"></i> Mantenimiento</a></li>
                        </ul>	
		        </li>
                
                <li><a href="#"><i class="fa fa-file-text-o"></i><span>REPORTES</span> <i class="fa fa-angle-left pull-right"></i></a>
			            <ul class="treeview-menu" style="padding-left: 0px;">
                        <li id="0601" class="vineta" style="display:none"><a  href="RepTransDiario.aspx" class="ajaxmenu"><i class="fa fa-archive"></i> Registro Diario</a></li>
                        <li id="0602" class="vineta" style="display:none"><a  href="RepTransConsumo.aspx" class="ajaxmenu"><i class="fa fa-archive"></i> Km y Combustible</a></li>
                        <li id="0603" class="vineta" style="display:none"><a  href="RepTransProg.aspx" class="ajaxmenu"><i class="fa fa-archive"></i> Programación Mensual</a></li>
                        <!--<li><a id="A4" href="RepTransAna.aspx" class="ajaxmenu"><i class="fa fa-bar-chart"></i> Análisis Vehicular</a></li>-->
                        <li id="0604" class="vineta" style="display:none"><a  href="RepTransMantenimiento.aspx" class="ajaxmenu"><i class="fa fa-archive"></i> Estado y Mantto.</a></li>
                        </ul>	
		        </li>
                
              </ul>
            </li>
<%  'End If%>

          </ul><!-- /.sidebar-menu -->
        </section>
        <!-- /.sidebar -->
      </aside>

      <!-- Content Wrapper. Contains page content -->
	     <div class="content-wrapper">
	 
	  <div id="container-ajax">

	  </div>
	  
     </div><!-- ./wrapper -->
    
    <!-- jQuery 2.1.3 -->
    <script src="../library/plugins/jQuery/jQuery-2.1.3.min.js"></script>
    <!-- Bootstrap 3.3.2 JS -->
    <script src="../library/bootstrap/js/bootstrap.min.js" type="text/javascript"></script>
    <!-- DATA TABES SCRIPT -->
    <script src="../library/plugins/datatables/jquery.dataTables.js" type="text/javascript"></script>
    <script src="../library/plugins/datatables/dataTables.bootstrap.js" type="text/javascript"></script>
    <!-- SlimScro.ll -->
    <script src="../library/plugins/slimScroll/jquery.slimscroll.min.js" type="text/javascript"></script>
    <!-- FastClick -->
    <script src='../library/plugins/fastclick/fastclick.min.js'></script>
    <!-- AdminLTE App -->
    <script src="../library/dist/js/app.min.js" type="text/javascript"></script>
    <script src="../library/plugins/datepicker/bootstrap-datepicker.js"></script>
    <!-- page script -->

    <!-- page script -->

    <script type="text/javascript" src="../library/source/jquery.fancybox.js?v=2.1.5"></script>
    <script src="../js/highcharts.js" type='text/javascript'></script>
    <script src="../js/data.js" type='text/javascript'></script>
    <script src="../js/exporting.js" type='text/javascript'></script>
          
	<script>
	    function validarNro(e) {
	        var key;
	        if (window.event) // IE
	        {
	            key = e.keyCode;
	        }
	        else if (e.which) // Netscape/Firefox/Opera
	        {
	            key = e.which;
	        }
	        if (key < 48 || key > 57) {
	            if (key == 46 || key == 8) // Detectar . (punto) y backspace (retroceso)
	            { return true; }
	            else
	            { return false; }
	        }
	        return true;
	    }

	    $(document).ready(function () {
	        $(".fancybox-effects-a").fancybox({
	            helpers: {
	                title: {
	                    type: 'outside'
	                },
	                overlay: {
	                    speedOut: 0
	                }
	            }
	        });

	        $("#home").click();
	        $(".sel_empresa").html("Empresarial")
	        if ($("#id_empresa").val() == '5') {
	            $("#id_empresa").val("5");
	            $("#reportecompromiso").click();
	        }
	        else if ($("#id_empresa").val() != '4')
	            $("#id_empresa").val("1");

	        //alert($("#id_empresa").val());

	    });

	    function sel(a) {
	        if (a == 1) {
	            $(".sel_empresa").html("Empresarial");
	            $(".id_empresa").val("1"); $("#home").click();
	            //     $("#0200").css("display", "block");
	        }
	        else if (a == 2) {
	            $(".sel_empresa").html("Municipal");
	            $(".id_empresa").val("2"); $("#home").click();
	            //    $("#0200").css("display", "block");
	        }
	        else if (a == 3) {
	            $(".sel_empresa").html("Regional");
	            $(".id_empresa").val("3"); $("#home").click();
	            //    $("#0200").css("display", "block");
	        }
	        else if (a == 4) {
	            $(".sel_empresa").html("Mantenimiento Vial");
	            $(".id_empresa").val("4"); $("#home").click();
	            //    $("#0200").css("display", "none");
	        }
	        else if (a == 5) {
	            $(".sel_empresa").html("SIAF");
	            $(".id_empresa").val("5"); $("#home").click();
	            //    $("#0200").css("display", "none");
	        }
	        else {
	            $(".sel_empresa").html("");
	            $(".id_empresa").val(""); $("#home").click();
	            //    $("#0200").css("display", "none");
	        }
	    }



	    $(document).on('click', '.asignar_reqalm', function (event) {

	        event.stopPropagation();
	        $(this).closest('tr').find("input:not([class^=conta])").each(function () {
	            v1 = this.value;
	        });

	        $(this).closest('tr').find("input:not([class^=bool])").each(function () {
	            v2 = this.value;
	        });
	        var $row = $(this).closest("tr");
	        var html = "";

	        $("#tbody_det_sel").html("");
	        // $("#tbody_det").empty();
	        if (v1 == 1) {

	            $(this).closest('tr').find("input:not([class^=conta])").val('0');
	            var $ida = $row.find(".ida").text();
	            var $desa = $row.find(".desa").text();
	            var $uma = $row.find(".uma").text();
	            var $id_um = $row.find(".id_um").text();
	            var $disponible = $row.find(".disponiblea").text();
	            var $costo = $row.find(".costoa").text();
	            var contador = $("#contador").val();


	            if ($disponible == 0) {
	                alert("El item no tiene disponibilidad");
	                $("#bool" + v2).val(1);
	            }
	            else {
	                if ($("#n").val() == '')
	                    hr = 0;
	                else
	                    hr = $("#n").val();
	                $("#n").val(parseInt(hr) + 1);
	                html = '<tr ><td style="display:none" class=v1>' + v1 + '</td><td style="display:none" class=v2>' + v2 + '</td><td class=cod_det>' + $ida + '</td><td >' + $desa + '</td>' + '<td><input type=hidden class=uni name="uni" id="uni" value=' + $id_um + '><input type=hidden class=codart name="codart" id="codart" value=' + $ida + '>' + $uma + '</td><td><input type=text  value="' + $costo + '" disabled class=cu name="cu" id="cu' + $("#contador").val() + '" style="width:60px;border-radius:5px;border:1px solid #ccc"  onkeypress="javascript:return validarNro(event)"></td><td><input   type=text id="disponible' + $("#contador").val() + '" name="disponible" value="' + $disponible + '" disabled  style="width:60px;border-radius:5px;border:1px solid #ccc"   ></td><td><input type=text value=' + $disponible + ' class=cantidad name="cantidad" onkeypress="javascript:return validarNro(event)" id="cantidad' + $("#contador").val() + '" onchange="sol_ate(' + $("#contador").val() + ');subtot(' + $("#contador").val() + ')" style="width:60px;border-radius:5px;border:1px solid #ccc" ></td><td><input  style="width:60px;border-radius:5px;border:1px solid #ccc" id="subtotal' + $("#contador").val() + '" name="subtotal" class=subtotal type=text value="' + parseFloat($costo * $disponible).toFixed(4) + '"  disabled ></td><td align=center style="width:100px"><input type=checkbox id="flag' + $("#contador").val() + '" onclick="checkear(' + $("#contador").val() + ')" /> <input type=text placeholder="Placa" class="placa" name="placa" id="placa' + $("#contador").val() + '" value="-" style=width:70px;text-transform:uppercase;display:none > </td><td><span class="fa fa-close clsEliminarFila" ><span></td>' + '</tr>';
	                $('#tbody_det').append(html);
	                $("#contador").val(eval(contador) + 1);
	                $("#guardar").show(); return false;
	            }
	        }

	    });

	    $(document).on('click', '.getsum', function (event) {

	        var $row = $(this).closest("tr");


	        $("#osuministro").val($row.find(".suministro").text());
	        $("#cantidadg").val($row.find(".cantidadsum").text());

	        $("#importe").val($row.find(".importesum").text());
	        $("#fechap").val($row.find(".fechasum").text());

	        $("#tipo").val($row.find(".IdTipoCombustible").text());

	        $("#precio").val($row.find(".preciosum").text());

	        /* var $desa = $row.find(".desa").text();
             var $uma = $row.find(".uma").text();
             var $id_um = $row.find(".id_um").text();*/



	    });

	    //ORDEN DE COMPRA
	    $(document).on('click', '.asignar_ordcomprareq', function (event) {

	        var v1 = 1;

	        event.stopPropagation();
	        $(this).closest('tr').find("input:not([class^=conta])").each(function () {
	            v1 = this.value;
	        });

	        $(this).closest('tr').find("input:not([class^=bool])").each(function () {
	            v2 = this.value;
	        });
	        var $row = $(this).closest("tr");
	        var html = "";

	        $("#tbody_ocreq_comp").html("");
	        // $("#tbody_det").empty();
	        if (v1 == 1) {

	            $(this).closest('tr').find("input:not([class^=conta])").val('0');
	            //var $ida = $row.find(".ida").text();
	            //var $desa = $row.find(".desa").text();
	            //var $uma = $row.find(".uma").text();
	            //var $id_um = $row.find(".id_um").text();
	            //var $disponible = $row.find(".disponiblea").text();
	            //var $costo = $row.find(".costoa").text();
	            //var contador = $("#contador").val();

	            var $idcentcost = $row.find(".idcentcost").text();
	            var $idum = $row.find(".idum").text();

	            var $idreq = $row.find(".idreq").text();
	            var $partpres = $row.find(".partpres").text();
	            var $idtrans = $row.find(".idtrans").text();
	            var $idalmc = $row.find(".idalmc").text();
	            var $idctacont = $row.find(".idctacont").text();
	            var $idnroitem = $row.find(".idnroitem").text();
	            var $idbienser = $row.find(".idbienser").text();
	            var $descum = $row.find(".descum").text();
	            var $descarti = $row.find(".descarti").text();
	            var $ccosto = $row.find(".ccosto").text();
	            var $clasif = $row.find(".clasif").text();
	            var $act = $row.find(".act").text();
	            var $finali = $row.find(".finali").text();
	            var $met = $row.find(".met").text();
	            var $cantid = $row.find(".cantid").text();
	            var $cstitem = $row.find(".cstitem").text();
	            var $csitemope = $row.find(".csitemope").text();
	            var $saldosbtot = $row.find(".saldosbtot").text();
	            var $montoreserv = $row.find(".montoreserv").text();
	            var $saldoreserv = $row.find(".saldoreserv").text();
	            var $tasaimpto = $row.find(".tasaimpto").text();
	            var $ttlinafecto = $row.find(".ttlinafecto").text();
	            var $valope = $row.find(".valope").text();
	            var $ttlneto = $row.find(".ttlneto").text();
	            var contadoradicordcomp = $("#contadoradicordcomp").val();

	            //if ($cantid == 0) {
	            //    alert("El item no tiene disponibilidad");
	            //    $("#bool" + v2).val(1);
	            //}
	            //else {
	            if ($("#n").val() == '') {
	                hrc = 0;
	                hr = 0;
	            }
	            else {
	                hr = $("#n").val();
	                hrc = $("#nc").val();
	            }


	            $("#nc").val(parseInt(hrc) + 1);

	            var val0 = 0;
	            for (i = 0; i <= ($("#n").val()) ; i++) {

	                if ($("#cod_idreq" + i).val() != $idreq || $("#cod_nroitem" + i).val() != $idnroitem) {
	                    val0 = 0;

	                }
	                else {
	                    val0 = 1;
	                    break;
	                }

	            }

	            if (val0 != "1") {
	                $("#n").val(parseInt(hr) + 1);
	                //html = '<tr><td>' + $("#n").val() + '</td><input type="hidden" style="width:60px;border-radius:5px;border:1px solid #ccc" id="subtotal_req' + $("#n").val() + '" name="subtotal_req" class=subtotal_req value="' + parseFloat($cstitem * $cantid).toFixed(2) + '" ><input type="hidden" style="width:60px;border-radius:5px;border:1px solid #ccc" id="impuesto_req' + $("#n").val() + '" name="impuesto_req" class=impuesto_req type=text value="' + parseFloat($cstitem).toFixed(2) + '" ><input type="hidden" id="costo_itemope' + $("#n").val() + '" name="costo_itemope" value=' + $csitemope + ' ><input type="hidden" id="costo_req' + $("#n").val() + '" name="costo_req" value=' + $cstitem + ' ><input type="hidden" id="sabdoreserva_req' + $("#n").val() + '" name="sabdoreserva_req" value=' + $saldoreserv + ' ><input type="hidden" id="cod_centcost' + $("#n").val() + '" name="cod_centcost" value=' + $idcentcost + ' ><input type="hidden" id="partidapresu' + $("#n").val() + '" name="partidapresu" value=' + $partpres + ' ><input type="hidden" id="cod_idum' + $("#n").val() + '" name="cod_idum" value=' + $idum + ' ><input type="hidden" id="cod_trans' + $("#n").val() + '" name="cod_trans" value=' + $idtrans + ' ><input type="hidden" id="cod_ctacontab' + $("#n").val() + '" name="cod_ctacontab" value=' + $idctacont + ' ><input type="hidden" id="cod_almac' + $("#n").val() + '" name="cod_almac" value=' + $idalmc + ' ><td><input type="hidden" id="cod_idreq' + $("#n").val() + '" name="cod_idreq" value=' + $idreq + ' >' + $idreq + '</td><td><input type="hidden" id="cod_nroitem' + $("#n").val() + '" name="cod_nroitem" value=' + $idnroitem + ' >' + $idnroitem + '</td><td><input type="hidden" id="cod_bienser' + $("#n").val() + '" name="cod_bienser" value=' + $idbienser + ' >' + $idbienser + '</td><td><input type="hidden" id="des_um' + $("#n").val() + '" name="des_um" value=' + $descum + ' >' + $descum + '</td><td><input type="hidden" id="des_arti' + $("#n").val() + '" name="des_arti" value=' + $descarti + ' >' + $descarti + '</td><td><input type="hidden" id="ct_costo' + $("#n").val() + '" name="ct_costo" value=' + $ccosto + ' >' + $ccosto + '</td><td><input type="hidden" id="cod_clasif' + $("#n").val() + '" name="cod_clasif" value=' + $clasif + ' >' + $clasif + '</td><td><input type="hidden" id="cod_act' + $("#n").val() + '" name="cod_act" value=' + $act + ' >' + $act + '</td><td><input type="hidden" id="cod_finali' + $("#n").val() + '" name="cod_finali" value=' + $finali + ' >' + $finali + '</td><td><input type="hidden" id="cod_meta' + $("#n").val() + '" name="cod_meta" value=' + $met + ' >' + $met + '</td><td><input type=text  value="' + $cstitem + '" disabled class=cu name="costo" id="costo' + $("#n").val() + '" style="width:60px;border-radius:5px;border:1px solid #ccc"  onkeypress="javascript:return validarNro(event)"></td><td><input type=text id="disponible' + $("#n").val() + '" name="disponible" value="' + $cantid + '" disabled  style="width:60px;border-radius:5px;border:1px solid #ccc" ></td><td><input type=text value=' + $cantid + ' class=cantidad name="cantidad" onkeypress="javascript:return validarNro(event)" id="cantidad' + $("#n").val() + '" onkeyup="sol_cant(' + $("#n").val() + ');subtot(' + $("#n").val() + ')" style="width:60px;border-radius:5px;border:1px solid #ccc" ></td><td><input style="width:60px;border-radius:5px;border:1px solid #ccc" onkeypress="javascript:return validarNro(event)" id="subtotal' + $("#n").val() + '" name="subtotal" disabled class=subtotal type=text value="' + parseFloat($cstitem * $cantid).toFixed(2) + '" ></td><td><span class="fa fa-close clsEliminarFilaAdicRequer" ><span></td></tr>';

	                html = '<tr><td>' + $("#n").val() + '</td><input type="hidden" style="width:60px;border-radius:5px;border:1px solid #ccc" id="subtotal_req' + $("#n").val() + '" name="subtotal_req" class=subtotal_req value="' + parseFloat($cstitem * $cantid).toFixed(5) + '" ><input type="hidden" style="width:60px;border-radius:5px;border:1px solid #ccc" id="impuesto_req' + $("#n").val() + '" name="impuesto_req" class=impuesto_req type=text value="' + parseFloat($cstitem).toFixed(5) + '" ><input type="hidden" id="costo_itemope' + $("#n").val() + '" name="costo_itemope" value=' + $csitemope + ' ><input type="hidden" id="costo_req' + $("#n").val() + '" name="costo_req" value=' + $cstitem + ' ><input type="hidden" id="sabdoreserva_req' + $("#n").val() + '" name="sabdoreserva_req" value=' + $saldoreserv + ' ><input type="hidden" id="cod_centcost' + $("#n").val() + '" name="cod_centcost" value=' + $idcentcost + ' ><input type="hidden" id="partidapresu' + $("#n").val() + '" name="partidapresu" value=' + $partpres + ' ><input type="hidden" id="cod_idum' + $("#n").val() + '" name="cod_idum" value=' + $idum + ' ><input type="hidden" id="cod_trans' + $("#n").val() + '" name="cod_trans" value=' + $idtrans + ' ><input type="hidden" id="cod_ctacontab' + $("#n").val() + '" name="cod_ctacontab" value=' + $idctacont + ' ><input type="hidden" id="cod_almac' + $("#n").val() + '" name="cod_almac" value=' + $idalmc + ' ><td><input type="hidden" id="cod_idreq' + $("#n").val() + '" name="cod_idreq" value=' + $idreq + ' >' + $idreq + '</td><td><input type="hidden" id="cod_nroitem' + $("#n").val() + '" name="cod_nroitem" value=' + $idnroitem + ' >' + $idnroitem + '</td><td><input type="hidden" id="cod_bienser' + $("#n").val() + '" name="cod_bienser" value=' + $idbienser + ' >' + $idbienser + '</td><td><input type="hidden" id="des_um' + $("#n").val() + '" name="des_um" value=' + $descum + ' >' + $descum + '</td><td><input type="hidden" id="des_arti' + $("#n").val() + '" name="des_arti" value=' + $descarti + ' >' + $descarti + '</td><td><input type="hidden" id="ct_costo' + $("#n").val() + '" name="ct_costo" value=' + $ccosto + ' >' + $ccosto + '</td><td><input type="hidden" id="cod_clasif' + $("#n").val() + '" name="cod_clasif" value=' + $clasif + ' >' + $clasif + '</td><td><input type="hidden" id="cod_act' + $("#n").val() + '" name="cod_act" value=' + $act + ' >' + $act + '</td><td><input type="hidden" id="cod_finali' + $("#n").val() + '" name="cod_finali" value=' + $finali + ' >' + $finali + '</td><td><input type="hidden" id="cod_meta' + $("#n").val() + '" name="cod_meta" value=' + $met + ' >' + $met + '</td><td><input type=text id="disponible' + $("#n").val() + '" name="disponible" value="' + $cantid + '" disabled  style="width:60px;border-radius:5px;border:1px solid #ccc" ></td><td><input type=text value=' + $cantid + ' class=cantidad name="cantidad" onkeypress="javascript:return validarNro(event)" id="cantidad' + $("#n").val() + '" onkeyup="sol_cant(' + $("#n").val() + ');subtot(' + $("#n").val() + ')" style="width:60px;border-radius:5px;border:1px solid #ccc" ></td><td><input type=text  value="' + $cstitem + '" class=cu name="costo" onkeypress="javascript:return validarNro(event)" id="costo' + $("#n").val() + '" onkeyup="sol_subtot(' + $("#n").val() + ');subtot(' + $("#n").val() + ');cmb_subtotal(' + $("#n").val() + ')" style="width:60px;border-radius:5px;border:1px solid #ccc" ></td><td><input style="width:60px;border-radius:5px;border:1px solid #ccc" onkeypress="javascript:return validarNro(event)" id="subtotal' + $("#n").val() + '" name="subtotal" disabled class=subtotal type=text value="' + parseFloat($cstitem * $cantid).toFixed(5) + '" ></td><td><span class="fa fa-close clsEliminarFilaAdicRequer" ><span></td></tr>';
	            }

	            //html = '<tr ><td style="display:none" class=v1>' + v1 + '</td><td style="display:none" class=v2>' + v2 + '</td><input type="hidden" style="width:60px;border-radius:5px;border:1px solid #ccc" id="subtotal_req' + $("#contadoradicordcomp").val() + '" name="subtotal_req" class=subtotal_req type=text value="' + parseFloat(((($csitemope * $cantid) - $ttlinafecto) * $tasaimpto * 100 + $valope) / 100).toFixed(2) + '" ><input type="hidden" style="width:60px;border-radius:5px;border:1px solid #ccc" id="impuesto_req' + $("#contadoradicordcomp").val() + '" name="impuesto_req" class=impuesto_req type=text value="' + parseFloat(((($csitemope * $cantid) - $ttlinafecto) * $tasaimpto * 100 + $valope) / 100).toFixed(2) + '" ><input type="hidden" id="costo_itemope' + $("#nc").val() + '" name="costo_itemope" value=' + $csitemope + ' ><input type="hidden" id="costo_req' + $("#nc").val() + '" name="costo_req" value=' + $cstitem + ' ><input type="hidden" id="sabdoreserva_req' + $("#nc").val() + '" name="sabdoreserva_req" value=' + $saldoreserv + ' ><input type="hidden" id="cod_centcost' + $("#nc").val() + '" name="cod_centcost" value=' + $idcentcost + ' ><input type="hidden" id="partidapresu' + $("#nc").val() + '" name="partidapresu" value=' + $partpres + ' ><input type="hidden" id="cod_idum' + $("#nc").val() + '" name="cod_idum" value=' + $idum + ' ><input type="hidden" id="cod_trans' + $("#nc").val() + '" name="cod_trans" value=' + $idtrans + ' ><input type="hidden" id="cod_ctacontab' + $("#nc").val() + '" name="cod_ctacontab" value=' + $idctacont + ' ><input type="hidden" id="cod_almac' + $("#nc").val() + '" name="cod_almac" value=' + $idalmc + ' ><td><input type="hidden" id="cod_idreq' + $("#nc").val() + '" name="cod_idreq" value=' + $idreq + ' >' + $idreq + '</td><td><input type="hidden" id="cod_nroitem' + $("#nc").val() + '" name="cod_nroitem" value=' + $idnroitem + ' >' + $idnroitem + '</td><td><input type="hidden" id="cod_bienser' + $("#nc").val() + '" name="cod_bienser" value=' + $idbienser + ' >' + $idbienser + '</td><td><input type="hidden" id="des_um' + $("#nc").val() + '" name="des_um" value=' + $descum + ' >' + $descum + '</td><td><input type="hidden" id="des_arti' + $("#nc").val() + '" name="des_arti" value=' + $descarti + ' >' + $descarti + '</td><td><input type="hidden" id="ct_costo' + $("#nc").val() + '" name="ct_costo" value=' + $ccosto + ' >' + $ccosto + '</td><td><input type="hidden" id="cod_clasif' + $("#nc").val() + '" name="cod_clasif" value=' + $clasif + ' >' + $clasif + '</td><td><input type="hidden" id="cod_act' + $("#nc").val() + '" name="cod_act" value=' + $act + ' >' + $act + '</td><td><input type="hidden" id="cod_finali' + $("#nc").val() + '" name="cod_finali" value=' + $finali + ' >' + $finali + '</td><td><input type="hidden" id="cod_meta' + $("#nc").val() + '" name="cod_meta" value=' + $met + ' >' + $met + '</td><td><input type=text  value="' + $cstitem + '" disabled class=cu name="costo" id="costo' + $("#contadoradicordcomp").val() + '" style="width:60px;border-radius:5px;border:1px solid #ccc"  onkeypress="javascript:return validarNro(event)"></td><td><input type=text onchange="subtot(' + $("#n").val() + ')" value=1 name="disponible" id="disponible' + $("#n").val() + '" style="width:60px;border-radius:5px;border:1px solid #ccc"  onkeypress="javascript:return validarNro(event)"></td><td><input type=text value=' + $cantid + ' class=cantidad name="cantidad" onkeypress="javascript:return validarNro(event)" id="cantidad' + $("#n").val() + '" onchange="sol_ate(' + $("#n").val() + ');subtot(' + $("#n").val() + ')" style="width:60px;border-radius:5px;border:1px solid #ccc" ></td><td><input style="width:60px;border-radius:5px;border:1px solid #ccc" id="subtotal' + $("#contadoradicordcomp").val() + '" name="subtotal" class=subtotal type=text value="' + parseFloat($csitemope * $cantid).toFixed(2) + '"  disabled ></td><td><input type=text  value="' + $montoreserv + '" disabled class=cu name="montoreserva" id="montoreserva' + $("#contadoradicordcomp").val() + '" style="width:60px;border-radius:5px;border:1px solid #ccc"  onkeypress="javascript:return validarNro(event)"></td><td><input type=text  value="' + $saldoreserv + '" disabled class=cu name="saldoreserva" id="saldoreserva' + $("#contadoradicordcomp").val() + '" style="width:60px;border-radius:5px;border:1px solid #ccc"  onkeypress="javascript:return validarNro(event)"></td><td><span class="fa fa-close clsEliminarFilaAdicRequer" ><span></td>' + '</tr>';

	            //(((((($cstitem * $cantid) - $ttlinafecto) * $tasaimpto) * 100) + 0.5) / 100).toFixed(2)
	            //<input type="hidden" style="width:60px;border-radius:5px;border:1px solid #ccc" id="subtotal_req' + $("#n").val() + '" name="subtotal_req" class=subtotal_req type=text value="' + parseFloat($csitemope * $cantid).toFixed(2) + '" >

	            $('#tbody_ocpreq').append(html);
	            $("#contadoradicordcomp").val(eval(contadoradicordcomp) + 1);
	            $("#guardarordencompra").show(); return false;
	            //}
	        }
	    });


	    //ORDEN DE SERVICIO
	    $(document).on('click', '.asignar_ordcompreq', function (event) {

	        var v1 = 1;

	        event.stopPropagation();
	        $(this).closest('tr').find("input:not([class^=conta])").each(function () {
	            v1 = this.value;
	        });

	        $(this).closest('tr').find("input:not([class^=bool])").each(function () {
	            v2 = this.value;
	        });
	        var $row = $(this).closest("tr");
	        var html = "";

	        $("#tbody_ocreq_sel").html("");
	        // $("#tbody_det").empty();
	        if (v1 == 1) {

	            $(this).closest('tr').find("input:not([class^=conta])").val('0');
	            //var $ida = $row.find(".ida").text();
	            //var $desa = $row.find(".desa").text();
	            //var $uma = $row.find(".uma").text();
	            //var $id_um = $row.find(".id_um").text();
	            //var $disponible = $row.find(".disponiblea").text();
	            //var $costo = $row.find(".costoa").text();
	            //var contador = $("#contador").val();

	            var $idcentcost = $row.find(".idcentcost").text();
	            var $idum = $row.find(".idum").text();

	            var $idreq = $row.find(".idreq").text();
	            var $partpres = $row.find(".partpres").text();
	            var $idtrans = $row.find(".idtrans").text();
	            var $idalmc = $row.find(".idalmc").text();
	            var $idctacont = $row.find(".idctacont").text();
	            var $idnroitem = $row.find(".idnroitem").text();
	            var $idbienser = $row.find(".idbienser").text();
	            var $descum = $row.find(".descum").text();
	            var $descarti = $row.find(".descarti").text();
	            var $ccosto = $row.find(".ccosto").text();
	            var $clasif = $row.find(".clasif").text();
	            var $act = $row.find(".act").text();
	            var $finali = $row.find(".finali").text();
	            var $met = $row.find(".met").text();
	            var $cantid = $row.find(".cantid").text();
	            var $cstitem = $row.find(".cstitem").text();
	            var $csitemope = $row.find(".csitemope").text();
	            var $saldosbtot = $row.find(".saldosbtot").text();
	            var $montoreserv = $row.find(".montoreserv").text();
	            var $saldoreserv = $row.find(".saldoreserv").text();
	            var $tasaimpto = $row.find(".tasaimpto").text();
	            var $ttlinafecto = $row.find(".ttlinafecto").text();
	            var $valope = $row.find(".valope").text();
	            var $ttlneto = $row.find(".ttlneto").text();
	            var contadoradicordcomp = $("#contadoradicordcomp").val();

	            //if ($cantid == 0) {
	            //    alert("El item no tiene disponibilidad");
	            //    $("#bool" + v2).val(1);
	            //}
	            //else {
	            if ($("#n").val() == '') {
	                hrc = 0;
	                hr = 0;
	            }
	            else {
	                hr = $("#n").val();
	                hrc = $("#nc").val();
	            }


	            $("#nc").val(parseInt(hrc) + 1);

	            var val0 = 0;
	            for (i = 0; i <= ($("#n").val()) ; i++) {

	                if ($("#cod_idreq" + i).val() != $idreq || $("#cod_nroitem" + i).val() != $idnroitem) {
	                    val0 = 0;

	                }
	                else {
	                    val0 = 1;
	                    break;
	                }

	            }

	            if (val0 != "1") {
	                $("#n").val(parseInt(hr) + 1);
	                html = '<tr><td>' + $("#n").val() + '</td><input type="hidden" style="width:60px;border-radius:5px;border:1px solid #ccc" id="subtotal_req' + $("#n").val() + '" name="subtotal_req" class=subtotal_req value="' + parseFloat($cstitem * $cantid).toFixed(2) + '" ><input type="hidden" style="width:60px;border-radius:5px;border:1px solid #ccc" id="impuesto_req' + $("#n").val() + '" name="impuesto_req" class=impuesto_req type=text value="' + parseFloat($cstitem).toFixed(2) + '" ><input type="hidden" id="costo_itemope' + $("#n").val() + '" name="costo_itemope" value=' + $csitemope + ' ><input type="hidden" id="costo_req' + $("#n").val() + '" name="costo_req" value=' + $cstitem + ' ><input type="hidden" id="sabdoreserva_req' + $("#n").val() + '" name="sabdoreserva_req" value=' + $saldoreserv + ' ><input type="hidden" id="cod_centcost' + $("#n").val() + '" name="cod_centcost" value=' + $idcentcost + ' ><input type="hidden" id="partidapresu' + $("#n").val() + '" name="partidapresu" value=' + $partpres + ' ><input type="hidden" id="cod_idum' + $("#n").val() + '" name="cod_idum" value=' + $idum + ' ><input type="hidden" id="cod_trans' + $("#n").val() + '" name="cod_trans" value=' + $idtrans + ' ><input type="hidden" id="cod_ctacontab' + $("#n").val() + '" name="cod_ctacontab" value=' + $idctacont + ' ><input type="hidden" id="cod_almac' + $("#n").val() + '" name="cod_almac" value=' + $idalmc + ' ><td><input type="hidden" id="cod_idreq' + $("#n").val() + '" name="cod_idreq" value=' + $idreq + ' >' + $idreq + '</td><td><input type="hidden" id="cod_nroitem' + $("#n").val() + '" name="cod_nroitem" value=' + $idnroitem + ' >' + $idnroitem + '</td><td><input type="hidden" id="cod_bienser' + $("#n").val() + '" name="cod_bienser" value=' + $idbienser + ' >' + $idbienser + '</td><td><input type="hidden" id="des_um' + $("#n").val() + '" name="des_um" value=' + $descum + ' >' + $descum + '</td><td><input type="hidden" id="des_arti' + $("#n").val() + '" name="des_arti" value=' + $descarti + ' >' + $descarti + '</td><td><input type="hidden" id="ct_costo' + $("#n").val() + '" name="ct_costo" value=' + $ccosto + ' >' + $ccosto + '</td><td><input type="hidden" id="cod_clasif' + $("#n").val() + '" name="cod_clasif" value=' + $clasif + ' >' + $clasif + '</td><td><input type="hidden" id="cod_act' + $("#n").val() + '" name="cod_act" value=' + $act + ' >' + $act + '</td><td><input type="hidden" id="cod_finali' + $("#n").val() + '" name="cod_finali" value=' + $finali + ' >' + $finali + '</td><td><input type="hidden" id="cod_meta' + $("#n").val() + '" name="cod_meta" value=' + $met + ' >' + $met + '</td><td><input type=text id="disponible' + $("#n").val() + '" name="disponible" value="' + $cantid + '" disabled  style="width:60px;border-radius:5px;border:1px solid #ccc" ></td><td><input type=text value=' + $cantid + ' class=cantidad name="cantidad" onkeypress="javascript:return validarNro(event)" id="cantidad' + $("#n").val() + '" onkeyup="sol_cant(' + $("#n").val() + ');subtot(' + $("#n").val() + ');cmb_subtotal(' + $("#n").val() + ')" style="width:60px;border-radius:5px;border:1px solid #ccc" ></td><td><input type=text  value="' + $cstitem + '" class=cu name="costo" onkeypress="javascript:return validarNro(event)" id="costo' + $("#n").val() + '" onkeyup="sol_subtot(' + $("#n").val() + ');subtot(' + $("#n").val() + ');cmb_subtotal(' + $("#n").val() + ')" style="width:60px;border-radius:5px;border:1px solid #ccc" ></td><td><input style="width:60px;border-radius:5px;border:1px solid #ccc" onkeypress="javascript:return validarNro(event)" id="subtotal' + $("#n").val() + '" name="subtotal" disabled class=subtotal type=text value="' + parseFloat($cstitem * $cantid).toFixed(2) + '" ></td><td style="display: none"><input style="width:60px;border-radius:5px;border:1px solid #ccc" onkeypress="javascript:return validarNro(event)" id="subtotal_comp' + $("#n").val() + '" name="subtotal_comp" class=subtotal type=text value="' + parseFloat($cstitem * $cantid).toFixed(2) + '" ></td><td style="display: none"><input type=text  value="' + parseFloat($montoreserv).toFixed(2) + '" disabled class=cu name="montoreserva" id="montoreserva' + $("#n").val() + '" style="width:60px;border-radius:5px;border:1px solid #ccc"  onkeypress="javascript:return validarNro(event)"></td><td style="display: none"><input type=text  value="' + parseFloat($cstitem * $cantid).toFixed(2) + '" class=cu name="montosubtotal" id="montosubtotal' + $("#n").val() + '" style="width:60px;border-radius:5px;border:1px solid #ccc"  onkeypress="javascript:return validarNro(event)"></td><td style="display: none"><input type=text  value="' + parseFloat($cstitem).toFixed(2) + '" disabled class=cu name="costoreq" id="costoreq' + $("#n").val() + '" style="width:60px;border-radius:5px;border:1px solid #ccc"  onkeypress="javascript:return validarNro(event)"></td>  <td><span class="fa fa-close clsEliminarFilaAdicRequer" ><span></td></tr>';
	            }

	            //html = '<tr><td>' + $("#n").val() + '</td><input type="hidden" style="width:60px;border-radius:5px;border:1px solid #ccc" id="subtotal_req' + $("#n").val() + '" name="subtotal_req" class=subtotal_req value="' + parseFloat($cstitem * $cantid).toFixed(2) + '" ><input type="hidden" style="width:60px;border-radius:5px;border:1px solid #ccc" id="impuesto_req' + $("#n").val() + '" name="impuesto_req" class=impuesto_req type=text value="' + parseFloat($cstitem).toFixed(2) + '" ><input type="hidden" id="costo_itemope' + $("#n").val() + '" name="costo_itemope" value=' + $csitemope + ' ><input type="hidden" id="costo_req' + $("#n").val() + '" name="costo_req" value=' + $cstitem + ' ><input type="hidden" id="sabdoreserva_req' + $("#n").val() + '" name="sabdoreserva_req" value=' + $saldoreserv + ' ><input type="hidden" id="cod_centcost' + $("#n").val() + '" name="cod_centcost" value=' + $idcentcost + ' ><input type="hidden" id="partidapresu' + $("#n").val() + '" name="partidapresu" value=' + $partpres + ' ><input type="hidden" id="cod_idum' + $("#n").val() + '" name="cod_idum" value=' + $idum + ' ><input type="hidden" id="cod_trans' + $("#n").val() + '" name="cod_trans" value=' + $idtrans + ' ><input type="hidden" id="cod_ctacontab' + $("#n").val() + '" name="cod_ctacontab" value=' + $idctacont + ' ><input type="hidden" id="cod_almac' + $("#n").val() + '" name="cod_almac" value=' + $idalmc + ' ><td><input type="text" id="cod_idreq' + $("#n").val() + '" name="cod_idreq" value=' + $idreq + ' >' + $idreq + '</td><td><input type="text" id="cod_nroitem' + $("#n").val() + '" name="cod_nroitem" value=' + $idnroitem + ' >' + $idnroitem + '</td><td><input type="hidden" id="cod_bienser' + $("#n").val() + '" name="cod_bienser" value=' + $idbienser + ' >' + $idbienser + '</td><td><input type="hidden" id="des_um' + $("#n").val() + '" name="des_um" value=' + $descum + ' >' + $descum + '</td><td><input type="hidden" id="des_arti' + $("#n").val() + '" name="des_arti" value=' + $descarti + ' >' + $descarti + '</td><td><input type="hidden" id="ct_costo' + $("#n").val() + '" name="ct_costo" value=' + $ccosto + ' >' + $ccosto + '</td><td><input type="hidden" id="cod_clasif' + $("#n").val() + '" name="cod_clasif" value=' + $clasif + ' >' + $clasif + '</td><td><input type="hidden" id="cod_act' + $("#n").val() + '" name="cod_act" value=' + $act + ' >' + $act + '</td><td><input type="hidden" id="cod_finali' + $("#n").val() + '" name="cod_finali" value=' + $finali + ' >' + $finali + '</td><td><input type="hidden" id="cod_meta' + $("#n").val() + '" name="cod_meta" value=' + $met + ' >' + $met + '</td><td><input type=text id="disponible' + $("#n").val() + '" name="disponible" value="' + $cantid + '" disabled  style="width:60px;border-radius:5px;border:1px solid #ccc" ></td><td><input type=text value=' + $cantid + ' class=cantidad name="cantidad" onkeypress="javascript:return validarNro(event)" id="cantidad' + $("#n").val() + '" onkeyup="sol_cant(' + $("#n").val() + ');subtot(' + $("#n").val() + ');cmb_subtotal(' + $("#n").val() + ')" style="width:60px;border-radius:5px;border:1px solid #ccc" ></td><td><input type=text  value="' + $cstitem + '" class=cu name="costo" onkeypress="javascript:return validarNro(event)" id="costo' + $("#n").val() + '" onkeyup="sol_subtot(' + $("#n").val() + ');subtot(' + $("#n").val() + ');cmb_subtotal(' + $("#n").val() + ')" style="width:60px;border-radius:5px;border:1px solid #ccc" ></td><td><input style="width:60px;border-radius:5px;border:1px solid #ccc" onkeypress="javascript:return validarNro(event)" id="subtotal' + $("#n").val() + '" name="subtotal" disabled class=subtotal type=text value="' + parseFloat($cstitem * $cantid).toFixed(2) + '" ></td><td style="display: none"><input style="width:60px;border-radius:5px;border:1px solid #ccc" onkeypress="javascript:return validarNro(event)" id="subtotal_comp' + $("#n").val() + '" name="subtotal_comp" class=subtotal type=text value="' + parseFloat($cstitem * $cantid).toFixed(2) + '" ></td><td style="display: none"><input type=text  value="' + parseFloat($montoreserv).toFixed(2) + '" disabled class=cu name="montoreserva" id="montoreserva' + $("#n").val() + '" style="width:60px;border-radius:5px;border:1px solid #ccc"  onkeypress="javascript:return validarNro(event)"></td><td style="display: none"><input type=text  value="' + parseFloat($cstitem * $cantid).toFixed(2) + '" class=cu name="montosubtotal" id="montosubtotal' + $("#n").val() + '" style="width:60px;border-radius:5px;border:1px solid #ccc"  onkeypress="javascript:return validarNro(event)"></td><td style="display: none"><input type=text  value="' + parseFloat($cstitem).toFixed(2) + '" disabled class=cu name="costoreq" id="costoreq' + $("#n").val() + '" style="width:60px;border-radius:5px;border:1px solid #ccc"  onkeypress="javascript:return validarNro(event)"></td>  <td><span class="fa fa-close clsEliminarFilaAdicRequer" ><span></td></tr>';


	            $('#tbody_ocreq').append(html);
	            $("#contadoradicordcomp").val(eval(contadoradicordcomp) + 1);
	            $("#guardarordencompra").show(); return false;
	            //}
	        }
	    });

	    //ORDEN COMPRA - MASIVA
	    //$(document).on('click', '.asignar_ordcomprasreq_masiva', function (event) {
	    //$("#EnviarTodosCompra").click(function () {
	    function Masivamente() {
            var i = 0
	        //alert($("#nroFilas").val());
	        for (i = 0; i <= ($("#nroFilas").val()) ; i++) {
	            $("#Requerimiento" + i).click();
                //alert(i)
	        }

	        $("#tbody_detreq").html("");
            document.getElementById("EnviarTodos").disabled = true;
            $("#guardarordencompra").show();
            $("#QuitarTodos").show();

	        //$('#tabla_req tr').removeClass('highlighted');

	        //var $row = $(this).closest("tr");
	        //$row.addClass('highlighted');
	        //var $id_req = $row.find(".idreq").text();

	        //var html = "";


	        //$("#tbody_ocpreq").html("<tr align=center><td colspan=11><img src='../images/loader.gif'></td></tr>");
	        //$.ajax({
	        //    type: "POST",
	        //    contentType: "application/json; charset=utf-8",
	        //    url: 'http://' + location.host + '/Services/Logistica/Almacen.svc/listarAdicionarDetalleRequerimiento',
	        //    data: '{"IdRequerimiento": "' + $("#IdRequerimiento").val() + '" , "BienServicio": "B" , "IdTipoDocumento": "' + $("#IdTipoDocumento").val() + '" , "empresa": "' + $("#id_empresa").val() + '" }',
	        //    dataType: "json",
	        //    success: function (response) {
	        //        var customers = eval(response.d);
	        //        var n = 1;
	        //        var contadoradicordcomp = $("#contadoradicordcomp").val();

	        //        //var idreque = ""; var idnumitem = ""; var idbienserv = ""; var idum = ""; var idcentrocost = ""; var costobien = ""; var saldocant = ""; var subtot = ""; var saldoreserv = ""; var impuestoreq = ""; var partpresup = ""; var idtrans = ""; var idctacontab = ""; var idalmac = "";

	        //        //$("#cod_idreqx").val("");
	        //        //$("#cod_nroitemx").val("");
	        //        //$("#cod_bienserx").val("");
	        //        //$("#cod_idumx").val("");
	        //        //$("#cod_centcostx").val("");
	        //        //$("#costo_reqx").val("");
	        //        //$("#cantidadx").val("");
	        //        //$("#subtotal_reqx").val("");
	        //        //$("#sabdoreserva_reqx").val("");
	        //        //$("#partidapresux").val("");
	        //        //$("#cod_transx").val("");
	        //        //$("#cod_ctacontabx").val("");
	        //        //$("#cod_almacx").val("");

	        //        $("#tbody_ocpreq").empty();
	        //        $.each(customers, function () {

	        //            //idreque += this.IdRequerimiento + ",";
	        //            //idnumitem += this.IdNumeroItem + ",";
	        //            //idbienserv += this.IdBienServicio + ",";
	        //            //idum += this.IdUnidadMedida + ",";
	        //            //idcentrocost += this.IdCentroCosto + ",";
	        //            //costobien += this.CostoItem + ",";
	        //            //saldocant += this.SaldoCantidad + ",";
	        //            //subtot += (this.SaldoCantidad * this.CostoItem).toFixed(2) + ",";
	        //            //saldoreserv += this.SaldoReservaActual + ",";
	        //            //impuestoreq += ((this.SaldoCantidad * this.CostoItem) - ((this.SaldoCantidad * this.CostoItem) / 1.18)).toFixed(2) + ",";
	        //            //partpresup += this.PartidaPresupuestal + ",";
	        //            //idtrans += this.IdTransaccion + ",";
	        //            //idctacontab += this.IdCuentaContable + ",";
	        //            //idalmac += this.IdAlmacen + ",";

	        //            //html += '<tr><td>' + n + '</td><td>' + this.IdRequerimiento + '<input name="cod_idreq" id="cod_idreq' + n + '" type="hidden" style="width:60px;border-radius:5px;border:1px solid #ccc" value=' + this.IdRequerimiento + ' ><input name="impuesto_req" id="impuesto_req' + n + '" type="hidden" style="width:60px;border-radius:5px;border:1px solid #ccc" value=0.00 ><input name="cod_centcost" id="cod_centcost' + n + '" type="hidden" style="width:60px;border-radius:5px;border:1px solid #ccc" value=' + this.IdCentroCosto + ' ></td><td>' + this.IdNumeroItem + '</td><td>' + this.IdBienServicio + '</td><td>' + this.UM + '</td><td>' + this.Descripcion + '</td><td>' + this.Siglas + '</td><td>' + this.Clasificador + '</td><td>' + this.Actividad + '</td><td>' + this.IdFinalidad + '</td><td>' + this.Meta + '</td><td><input name="costo" id="costo' + n + '" type="text" disabled style="width:60px;border-radius:5px;border:1px solid #ccc" value=' + this.CostoItem + ' ><input name="costo_req" id="costo_req' + n + '" type="hidden" style="width:60px;border-radius:5px;border:1px solid #ccc" value=' + this.CostoItem + ' ></td>' + '<td><input id="disponible' + n + '" name="disponible" type="text" disabled style="width:60px;border-radius:5px;border:1px solid #ccc" value=' + this.SaldoCantidad + ' ></td>' + '<td><input id="cantidad' + n + '" class=cantidad name="cantidad" type="text" style="width:60px;border-radius:5px;border:1px solid #ccc" value=' + this.SaldoCantidad + ' onkeyup=sol_cant("' + n + '");subtot("' + n + '") ></td>' + '<td class="sub_total"><input style="width:60px;border-radius:5px;border:1px solid #ccc" id="subtotal' + n + '" name="subtotal" disabled class=subtotal type=text value="' + (this.SaldoCantidad * this.CostoItem).toFixed(2) + '" ></td>  <td><span class="fa fa-close clsEliminarFilaAdicRequer" ><span></td> </tr>';

	        //            html += '<tr><td>' + n + '</td><td>' + this.IdRequerimiento + '<input name="cod_idreq" id="cod_idreq' + n + '" type="hidden" style="width:60px;border-radius:5px;border:1px solid #ccc" value=' + this.IdRequerimiento + ' ><input name="impuesto_req" id="impuesto_req' + n + '" type="hidden" style="width:60px;border-radius:5px;border:1px solid #ccc" value=0.00 ><input name="cod_centcost" id="cod_centcost' + n + '" type="hidden" style="width:60px;border-radius:5px;border:1px solid #ccc" value=' + this.IdCentroCosto + ' ><input name="cod_nroitem" id="cod_nroitem' + n + '" type="hidden" style="width:60px;border-radius:5px;border:1px solid #ccc" value=' + this.IdNumeroItem + ' ><input name="cod_bienser" id="cod_bienser' + n + '" type="hidden" style="width:60px;border-radius:5px;border:1px solid #ccc" value=' + this.IdBienServicio + ' ><input name="cod_idum" id="cod_idum' + n + '" type="hidden" style="width:60px;border-radius:5px;border:1px solid #ccc" value=' + this.IdUnidadMedida + ' ><input name="sabdoreserva_req" id="sabdoreserva_req' + n + '" type="hidden" style="width:60px;border-radius:5px;border:1px solid #ccc" value=' + this.SaldoReservaActual + ' ><input name="partidapresu" id="partidapresu' + n + '" type="hidden" style="width:60px;border-radius:5px;border:1px solid #ccc" value=' + this.PartidaPresupuestal + ' ><input name="cod_trans" id="cod_trans' + n + '" type="hidden" style="width:60px;border-radius:5px;border:1px solid #ccc" value=' + this.IdTransaccion + ' ><input name="cod_ctacontab" id="cod_ctacontab' + n + '" type="hidden" style="width:60px;border-radius:5px;border:1px solid #ccc" value=' + this.IdCuentaContable + ' ><input name="cod_almac" id="cod_almac' + n + '" type="hidden" style="width:60px;border-radius:5px;border:1px solid #ccc" value=' + this.IdAlmacen + ' ></td><td>' + this.IdNumeroItem + '</td><td>' + this.IdBienServicio + '</td><td>' + this.UM + '</td><td>' + this.Descripcion + '</td><td>' + this.Siglas + '</td><td>' + this.Clasificador + '</td><td>' + this.Actividad + '</td><td>' + this.IdFinalidad + '</td><td>' + this.Meta + '</td><td><input id="disponible' + n + '" name="disponible" type="text" disabled style="width:60px;border-radius:5px;border:1px solid #ccc" value=' + this.SaldoCantidad + ' ></td>' + '<td><input id="cantidad' + n + '" class=cantidad name="cantidad" type="text" style="width:60px;border-radius:5px;border:1px solid #ccc" value=' + this.SaldoCantidad + ' onkeyup=sol_cant("' + n + '");subtot("' + n + '") ></td>' + '<td><input name="costo" id="costo' + n + '" type="text" style="width:60px;border-radius:5px;border:1px solid #ccc" value=' + this.CostoItem + ' onkeyup=sol_cant("' + n + '");subtot("' + n + '") ><input name="costo_req" id="costo_req' + n + '" type="hidden" style="width:60px;border-radius:5px;border:1px solid #ccc" value=' + this.CostoItem + ' ></td>' + '<td class="sub_total"><input style="width:60px;border-radius:5px;border:1px solid #ccc" id="subtotal' + n + '" name="subtotal" disabled class=subtotal type=text value="' + (this.SaldoCantidad * this.CostoItem).toFixed(2) + '" ></td>  <td><span class="fa fa-close clsEliminarFilaAdicRequer" ><span></td> </tr>';
	                    

	        //            //<input name="cod_idreq" id="cod_idreq' + n + '" type="hidden" style="width:60px;border-radius:5px;border:1px solid #ccc" value=' + this.IdRequerimiento + ' >                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                
	        //            //html = '<tr><td>' + $("#n").val() + '</td>
	        //            //    <input type="hidden" style="width:60px;border-radius:5px;border:1px solid #ccc" id="subtotal_req' + $("#n").val() + '" name="subtotal_req" class=subtotal_req value="' + parseFloat($cstitem * $cantid).toFixed(2) + '" >
	        //            //    <input type="hidden" style="width:60px;border-radius:5px;border:1px solid #ccc" id="impuesto_req' + $("#n").val() + '" name="impuesto_req" class=impuesto_req type=text value="' + parseFloat($cstitem).toFixed(2) + '" >
	        //            //    <input type="hidden" id="costo_itemope' + $("#n").val() + '" name="costo_itemope" value=' + $csitemope + ' >
	        //            //    <input type="hidden" id="costo_req' + $("#n").val() + '" name="costo_req" value=' + $cstitem + ' >
	        //            //    <input type="hidden" id="sabdoreserva_req' + $("#n").val() + '" name="sabdoreserva_req" value=' + $saldoreserv + ' >
	        //            //    <input type="hidden" id="cod_centcost' + $("#n").val() + '" name="cod_centcost" value=' + $idcentcost + ' >
	        //            //    <input type="hidden" id="partidapresu' + $("#n").val() + '" name="partidapresu" value=' + $partpres + ' >
	        //            //    <input type="hidden" id="cod_idum' + $("#n").val() + '" name="cod_idum" value=' + $idum + ' >
	        //            //    <input type="hidden" id="cod_trans' + $("#n").val() + '" name="cod_trans" value=' + $idtrans + ' >
	        //            //    <input type="hidden" id="cod_ctacontab' + $("#n").val() + '" name="cod_ctacontab" value=' + $idctacont + ' >
	        //            //    <input type="hidden" id="cod_almac' + $("#n").val() + '" name="cod_almac" value=' + $idalmc + ' >

	        //            //    <td><input type="hidden" id="cod_idreq' + $("#n").val() + '" name="cod_idreq" value=' + $idreq + ' >' + $idreq + '</td>
	        //            //    <td><input type="hidden" id="cod_nroitem' + $("#n").val() + '" name="cod_nroitem" value=' + $idnroitem + ' >' + $idnroitem + '</td>
	        //            //    <td><input type="hidden" id="cod_bienser' + $("#n").val() + '" name="cod_bienser" value=' + $idbienser + ' >' + $idbienser + '</td>
	        //            //    <td><input type="hidden" id="des_um' + $("#n").val() + '" name="des_um" value=' + $descum + ' >' + $descum + '</td>
	        //            //    <td><input type="hidden" id="des_arti' + $("#n").val() + '" name="des_arti" value=' + $descarti + ' >' + $descarti + '</td>
	        //            //    <td><input type="hidden" id="ct_costo' + $("#n").val() + '" name="ct_costo" value=' + $ccosto + ' >' + $ccosto + '</td>
	        //            //    <td><input type="hidden" id="cod_clasif' + $("#n").val() + '" name="cod_clasif" value=' + $clasif + ' >' + $clasif + '</td>
	        //            //    <td><input type="hidden" id="cod_act' + $("#n").val() + '" name="cod_act" value=' + $act + ' >' + $act + '</td>
	        //            //    <td><input type="hidden" id="cod_finali' + $("#n").val() + '" name="cod_finali" value=' + $finali + ' >' + $finali + '</td>
	        //            //    <td><input type="hidden" id="cod_meta' + $("#n").val() + '" name="cod_meta" value=' + $met + ' >' + $met + '</td>

	        //            //    <td><input type=text  value="' + $cstitem + '" disabled class=cu name="costo" id="costo' + $("#n").val() + '" style="width:60px;border-radius:5px;border:1px solid #ccc"  onkeypress="javascript:return validarNro(event)"></td>

	        //            //    <td><input type=text id="disponible' + $("#n").val() + '" name="disponible" value="' + $cantid + '" disabled  style="width:60px;border-radius:5px;border:1px solid #ccc" ></td>

	        //            //    <td><input type=text value=' + $cantid + ' class=cantidad name="cantidad" onkeypress="javascript:return validarNro(event)" id="cantidad' + $("#n").val() + '" onkeyup="sol_cant(' + $("#n").val() + ');subtot(' + $("#n").val() + ')" style="width:60px;border-radius:5px;border:1px solid #ccc" ></td>

	        //            //    <td><input style="width:60px;border-radius:5px;border:1px solid #ccc" onkeypress="javascript:return validarNro(event)" id="subtotal' + $("#n").val() + '" name="subtotal" disabled class=subtotal type=text value="' + parseFloat($cstitem * $cantid).toFixed(2) + '" ></td>

	        //            //    <td><span class="fa fa-close clsEliminarFilaAdicRequer" ><span></td></tr>';

	        //            $('#tbody_ocpreq').append(html);

	        //            n++;

	        //            $("#tbody_detreq").html("");
	        //            $("#contadoradicordcomp").val(eval(contadoradicordcomp) + 1);
	        //            document.getElementById("EnviarTodos").disabled = true;
	        //            $("#guardarordencompra").show();
	        //            $("#QuitarTodos").show();
	        //        });
	                
	        //        //$("#cod_idreqx").val(idreque);
	        //        //$("#cod_nroitemx").val(idnumitem);
	        //        //$("#cod_bienserx").val(idbienserv);
	        //        //$("#cod_idumx").val(idum);
	        //        //$("#cod_centcostx").val(idcentrocost);
	        //        //$("#costo_reqx").val(costobien);
	        //        //$("#cantidadx").val(saldocant);
	        //        //$("#subtotal_reqx").val(subtot);
	        //        //$("#sabdoreserva_reqx").val(saldoreserv);
	        //        //$("#impuesto_reqx").val(impuestoreq);
	        //        //$("#partidapresux").val(partpresup);
	        //        //$("#cod_transx").val(idtrans);
	        //        //$("#cod_ctacontabx").val(idctacontab);
	        //        //$("#cod_almacx").val(idalmac);

	        //        $("#n").val(n - 1);
	        //        //$("#nc").val(n - 1);

	        //        $("#tbody_ocpreq").html(html == "" ? " <tr align=center><td colspan=11>No se encontraron resultados </td></tr>" : html);

	        //        //if (html == "") { $("#guardarordencompra").hide(); }
	        //        //else { $("#guardarordencompra").show();

	        //        //if (html == "") { $("#guardar").hide(); }
	        //        //else { $("#guardar").show(); $(".pbrush").show(); $("#bloqueo").show(); }

	        //    },
	        //    error: function (a) {
	        //        alert(a.responseText);
	        //    }
	        //});

	        //return false;
	        ////});
	    };

	    function SumarCostos() {

	        var nroFilas = $("#tabla_ocreq tr").length;
	        $("#Nro_Filas").val(nroFilas - 2);

	        var Sumar = 0;
	        var i = 1;
	        //alert($("#nroFilas").val());
	        for (i = 1; i <= ($("#Nro_Filas").val()) ; i++) {
	            Sumar = Sumar + eval($("#costo" + i).val());
	            //alert(i);
	        }

	        $("#Valor_Venta").val(Sumar);
	    }

	    $(document).on('click', '.asignar', function (event) {
	        $('#tabla_oc tr').removeClass('highlighted');
	        $('#tabla_transferencia tr').removeClass('highlighted');
	        var v = $('#cond_tabla').val();
	        var v1 = 1;
	        if (v == 3) {

	            event.stopPropagation();
	            $(this).closest('tr').find("input:not([class^=conta])").each(function () {
	                v1 = this.value;
	            });


	            var $row = $(this).closest("tr");
	            var html = "";



	            if ($("#alm").val() == "S") {
	                $("#guardar").hide();
	                alert("Seleccione un Almacen");

	            }
	            else {

	                // $("#tbody_det").html("");
	                // $("#tbody_det").empty();
	                if (v1 == 1) {

	                    if ($("#n").val() == '') {
	                        hrc = 0;
	                        hr = 0;
	                    }
	                    else {
	                        hr = $("#n").val();
	                        hrc = $("#nc").val();
	                    }

	                    $("#n").val(parseInt(hr) + 1);
	                    $("#nc").val(parseInt(hrc) + 1);

	                    $(this).closest('tr').find("input:not([class^=conta])").val('0');
	                    var $ida = $row.find(".ida").text();
	                    var $desa = $row.find(".desa").text();
	                    var $uma = $row.find(".uma").text();
	                    var $id_um = $row.find(".id_um").text();
	                    var $stock = $row.find(".StockActual").text();
	                    var $costoUnitario = $row.find(".costoUnitario").text();
	                    /*var $disponible = $row.find(".disponiblea").text();
	                    var $costo = $row.find(".costoa").text();*/

	                    $("#alm").prop("disabled", true);
	                    $("#tran").prop("disabled", true);
	                    var contador = $("#contador").val();

	                    html = '<tr><td>' + $("#nc").val() + '</td><td><input type="hidden" id="cod_articulo' + $("#nc").val() + '" name="cod_articulo" value=' + $ida + ' >' + $ida + '</td><td>' + $desa + '</td>' + '<td><input type=hidden name="uni" id="uni' + $("#nc").val() + '" value=' + $id_um + '>' + $uma + '</td><td>' + $stock + '</td><td> 0 </td><td><input type=text onchange="subtot(' + $("#nc").val() + ')" value=1 name="atendido" id="atendido' + $("#nc").val() + '" style="width:60px;border-radius:5px;border:1px solid #ccc"  onkeypress="javascript:return validarNro(event)"></td><td><input readonly onchange="subtot(' + $("#nc").val() + ')" type=text id="cu' + $("#nc").val() + '" name="cu" value="' + $costoUnitario + '" style="width:60px;border-radius:5px;border:1px solid #ccc"  onkeypress="javascript:return validarNro(event)" ></td><td><input type=text value=0 name="subtotal[]" id="subtotal' + $("#nc").val() + '" style="width:60px;border-radius:5px;border:1px solid #ccc" disabled ></td><td>' + $("#alm option:selected").html() + '</td><td><span class="fa fa-close clsEliminarFila" ><span></td></tr>';

	                    $('#tbody_det').append(html);
	                    $("#contador").val(eval(contador) + 1);
	                    $("#guardar").show(); return false;
	                }
	            }
	        }
	        else if (v == 5) {
	            var $row = $(this).closest("tr");

	            $row.addClass('highlighted');
	            var $ida = $row.find(".ida").text();
	            var $cc = $row.find(".cc").text();
	            var $prov = $row.find(".proveedor").text();
	            var $saldo = eval($row.find(".saldo").text());
	            var $req = $row.find(".req").text();
	            var $face = $row.find(".face").text();
	            var $RazonSocial = $row.find(".RazonSocial").text();
	            var $CentroCosto = $row.find(".CentroCosto").text();

	            var html = "";
	            var numeroitem = "";

	            $("#tran").prop("disabled", true);
	            $("#IdOrdenCompra").val($ida);
	            $("#IdCentroCosto").val($cc);
	            $("#IdProveedor").val($prov);
	            $("#TotalCosto").val($saldo);
	            $("#IdRequerimiento").val($req);

	            $("#tbody_det").html("<tr align=center><td colspan=11><img src='../images/loader.gif'></td></tr>");
	            $.ajax({
	                type: "POST",
	                contentType: "application/json; charset=utf-8",
	                url: 'http://' + url + '/Services/Logistica/Almacen.svc/listarOrdenCompraDetalle',
	                data: '{"ocom":"' + $ida + '" ,"empresa": "' + $("#id_empresa").val() + '" }',
	                dataType: "json",
	                success: function (response) {
	                    var customers = eval(response.d);
	                    var n = 1;
	                    var cu = ""; var cod = ""; var id_alm = ""; var id_um = "";
	                    $("#cux").val("");
	                    $("#cod_articulox").val("");

	                    $("#tbody_det").empty();
	                    if ($face != 'null') {
	                        $.each(customers, function () {
	                            cu += this.CU.toFixed(4) + ",";
	                            cod += this.Codigo + ",";
	                            id_alm += this.IdCentroCosto + ",";
	                            numeroitem += this.NumeroItemOrdenCompra + ",";
	                            id_um += this.Id_UM + ",";


	                            html += '<tr><td>' + n + '</td><td>' + this.Codigo + '</td><td>' + this.Descripcion + '</td>' + '<td>' + this.UM + '</td>' + '<td>' + this.Stock + '</td>' + '<td>' + this.CantSol + '<input id="solicitado' + n + '" type="hidden" style="width:60px;border-radius:5px;border:1px solid #ccc" value=' + this.CantSol + '  ></td>' + '<td align=center><input id="atendido' + n + '" name="atendido" type="text" style="width:60px;border-radius:5px;border:1px solid #ccc" value=' + this.CantSol + ' onchange=sol_ate("' + n + '") ></td>' + '<td><input id="cu' + n + '" type="hidden" style="width:60px;border-radius:5px;border:1px solid #ccc" value=' + this.CU + '  >' + this.CU.toFixed(4) + '</td>' + '<td>' + (this.CU * this.CantSol).toFixed(4) + '</td>' + '<td>' + this.Almacen + '</td></tr>';



	                            $('#tbody_det').append(html);

	                            n++;
	                        });
	                    }
	                    else {
	                        alert("Aviso: Falta Fecha de Aceptación");
	                    }
	                    $("#cux").val(cu);
	                    $("#cod_articulox").val(cod);
	                    $("#numeroitem").val(numeroitem);
	                    $("#almx").val(id_alm);
	                    $("#unix").val(id_um);

	                    $("#n").val(n - 1);
	                    $("#nc").val(n - 1);
	                    $("#tbody_det").html(html == "" ? " <tr align=center><td colspan=11>No se encontraron resultados </td></tr>" : html);



	                    if (html == "") { $("#guardar").hide(); }
	                    else {

	                        $("#guardar").show(); $(".pbrush").show(); $(".msj1").show(); $(".msj2").html($ida); $("#bloqueo2").show(); $(".msjprov").html("PROVEEDOR: "+$RazonSocial); $(".msjcc").html("CENTRO COSTO: "+$CentroCosto);
	                    }

	                },
	                error: function (a, b, c) {
	                    /*alert(a.responseText);
                        $("#results").html(a.responseText);*/
	                    window.location = "http://" + location.host;
	                }
	            });

	            return false;

	        } else if (v == 9) {
	            var $row = $(this).closest("tr");

	            $row.addClass('highlighted');
	            var $ida = $row.find(".ida").text();
	            var $cc = $row.find(".cc").text();
	            var $prov = $row.find(".proveedor").text();
	            var $saldo = eval($row.find(".saldo").text());
	            var $req = $row.find(".req").text();
	            var $RazonSocial = $row.find(".RazonSocial").text();
	            var $CentroCosto = $row.find(".CentroCosto").text();
	            var html = "";
	            var numeroitem = "";
	            $("#tran").prop("disabled", true);
	            $("#IdOrdenCompra").val($ida);
	            $("#IdCentroCosto").val($cc);
	            $("#IdProveedor").val($prov);
	            $("#TotalCosto").val($saldo);
	            $("#IdRequerimiento").val($req);

	            $("#tbody_det").html("<tr align=center><td colspan=11><img src='../images/loader.gif'></td></tr>");
	            $.ajax({
	                type: "POST",
	                contentType: "application/json; charset=utf-8",
	                url: 'http://' + url + '/Services/Logistica/Almacen.svc/listarContratoDetalle',
	                data: '{"ocom":"' + $ida + '" ,"ccosto":"' + $cc + '" ,"empresa": "' + $("#id_empresa").val() + '" }',
	                dataType: "json",
	                success: function (response) {
	                    var customers = eval(response.d);
	                    var n = 1;
	                    var cu = ""; var cod = ""; var id_alm = ""; var id_um = "";
	                    $("#cux").val("");
	                    $("#cod_articulox").val("");



	                    $("#tbody_det").empty();
	                    $.each(customers, function () {

	                        cu += this.CU + ","; //cu += this.CU.toFixed(2) + ",";
	                        cod += this.Codigo + ",";
	                        id_alm += this.IdCentroCosto + ",";
	                        numeroitem += this.NumeroItemOrdenCompra + ",";
	                        id_um += this.Id_UM + ",";
	                        html += '<tr><td>' + n + '</td><td>' + this.Codigo + '</td><td>' + this.Descripcion + '</td>' + '<td>' + this.UM + '</td>' + '<td>' + this.Stock + '</td>' + '<td>' + this.CantSol + '<input id="solicitado' + n + '" type="hidden" style="width:60px;border-radius:5px;border:1px solid #ccc" value=' + this.CantSol + '  ></td>' + '<td align=center><input id="atendido' + n + '" name="atendido" type="text" style="width:60px;border-radius:5px;border:1px solid #ccc" value=' + this.CantSol + ' onchange=sol_ate("' + n + '") ></td>' + '<td> <input id="cu' + n + '" type="hidden" style="width:60px;border-radius:5px;border:1px solid #ccc" value=' + this.CU + '  >' + this.CU + '</td>' + '<td>' + (this.CU * this.CantSol) + '</td>' + '<td>' + this.Almacen + '</td></tr>';
	                        $('#tbody_det').append(html);

	                        n++;
	                    });

	                    $("#cux").val(cu);
	                    $("#cod_articulox").val(cod);
	                    $("#numeroitem").val(numeroitem);
	                    $("#almx").val(id_alm);
	                    $("#unix").val(id_um);

	                    $("#n").val(n - 1);
	                    $("#nc").val(n - 1);
	                    $("#tbody_det").html(html == "" ? " <tr align=center><td colspan=11>No se encontraron resultados </td></tr>" : html);



	                    if (html == "") { $("#guardar").hide(); }
	                    else {

	                        $("#guardar").show(); $(".pbrush").show(); $(".msj1").show(); $(".msj2").html($ida); $("#bloqueo2").show(); $(".msjprov").html("PROVEEDOR: " + $RazonSocial); $(".msjcc").html("CENTRO COSTO: " + $CentroCosto);
	                    }

	                },
	                error: function (a, b, c) {
	                    /*alert(a.responseText);
                        $("#results").html(a.responseText);*/
	                    window.location = "http://" + location.host;
	                }
	            });

	            return false;

	        } else if (v == 7) {
	            
	            $("#tabla_det .cabtransferencia").hide();
	            var $row = $(this).closest("tr");
	            $row.addClass('highlighted');
	            var $idguia = $row.find(".IdGuia").text();
	            //var $cc = $("#alm").text();
	            var html = "";
	            var ValidarTransferencia = $row.find(".TipoTransaccion").text();
	            var Entidad = $row.find(".Entidad").text();

	            $("#ValidarTransferencia").val(ValidarTransferencia); //COmo IDTransferencia
	            $("#IdProveedor").val($idguia); //COmo IDTransferencia
	            $("#IdTransferencia").val($idguia);
	            $("#IdCentroCosto").val($cc);
	            /*$("#tran").prop("disabled", true);
                $("#IdOrdenCompra").val($ida);
                $("#IdCentroCosto").val($cc);*/

	            if (Entidad == 'Municipal')
	                ent = '2'
	            else
	                ent = '5'

	            $("#tbody_det").html("<tr align=center><td colspan=11><img src='../images/loader.gif'></td></tr>");
	            $.ajax({
	                type: "POST",
	                contentType: "application/json; charset=utf-8",
	                url: 'http://' + url + '/Services/Logistica/Almacen.svc/listarTransferencia',
	                data: '{"ocom":"' + $idguia + '" ,"empresa": "' + $("#id_empresa").val() + '" ,"entidad": "' + ent + '"}',
	                dataType: "json",
	                success: function (response) {
	                    var customers = eval(response.d);
	                    var n = 1;
	                    var IdBienX = ""; var productoX = ""; var medidaX = ""; var CantX = ""; var id_um = "";
	                    //$("#cux").val("");
	                    //$("#cod_articulox").val("");

	                    $("#tbody_det").empty();
	                    $.each(customers, function () {

	                        IdBienX += this.IdBienServicio + ",";
	                        productoX += this.producto + ",";
	                        medidaX += this.medida + ",";
	                        CantX += this.Cantidad + ",";
	                        id_um += this.IdUnidadMedida + ",";

	                        if (ValidarTransferencia == "Recepcionado") {
	                            html += '<tr><td>' + n + '</td><td>' + this.IdBienServicio + '</td><td>' + this.producto + '</td>' + '<td>' + this.medida + '</td><td>' + this.Cantidad + '<input id="solicitado' + n + '" type="hidden"  value=' + this.Cantidad + '  ></td>' + '<td align=center>' + this.Cantidad + '</td><td>' + this.alamcen + '</td></tr>';
	                        } else {
	                            html += '<tr><td>' + n + '</td><td>' + this.IdBienServicio + '</td><td>' + this.producto + '</td>' + '<td>' + this.medida + '</td><td>' + this.Cantidad + '<input id="solicitado' + n + '" type="hidden"  value=' + this.Cantidad + '  ><input id="cu' + n + '" type="hidden"  value=' + this.CU + '  ></td>' + '<td align=center><input id="atendido' + n + '" name="atendido" type="text" style="width:60px;border-radius:5px;border:1px solid #ccc" value=' + this.Cantidad + ' onchange=verifica_cantidad("' + n + '") ></td><td>' + this.alamcen + '</td></tr>';
	                        }
	                        $('#tbody_det').append(html);

	                        n++;
	                    });

	                    $("#cod_articulox").val(IdBienX);
	                    //$("#cux").val(productoX);
	                    $("#unix").val(id_um);
	                    //$("#almx").val(CantX);

	                    $("#n").val(n - 1);
	                    $("#nc").val(n - 1);
	                    $("#tbody_det").html(html == "" ? " <tr align=center><td colspan=11>No se encontraron resultados </td></tr>" : html);

	                    //alert(html);

	                    if (html == "") { $("#guardar").hide(); }
	                    else {

	                        $("#guardar").show();
	                        $(".pbrush").show(); $(".msj1").show(); $(".msj2").html($ida); $("#bloqueo3").show();
	                    }

	                    if (ValidarTransferencia == "Recepcionado") {
	                        $("#guardar").hide();
	                    }

	                },
	                error: function (a, b, c) {
	                    /*alert(a.responseText);
                        $("#results").html(a.responseText);*/
	                    window.location = "http://" + location.host;
	                }
	            });

	            return false;

	        }
	    });


	    function verifica_cantidad(n) {

	        sol = $("#solicitado" + n).val() * 1;
	        aten = $("#atendido" + n).val() * 1;

	        $("#empresas").val($("#atendido" + n).val());

	        if (aten > sol) {
	            $("#atendido" + n).val(sol);
	        } else {
	            $("#atendido" + n).val(aten);
	        }


	    }

	    function permiso() {
	        url = location.host;
	        $.ajax({
	            type: "POST",
	            contentType: "application/json; charset=utf-8",
	            url: 'http://' + url + '/Services/Logistica/Almacen.svc/Permiso',
	            // data: '{"ocom":"' + $ida + '" ,"empresa": "' + $("#id_empresa").val() + '" }',
	            dataType: "json",
	            success: function (response) {
	                var customers = eval(response.d);
	                $.each(customers, function () {
	                    $('#' + this.Menu).css("display", "block");
	                });
	            },
	            error: function (a, b, c) {
	                /*alert(a.responseText);
                    $("#results").html(a.responseText);*/
	                window.location = "http://" + location.host;
	            }
	        });
	    }

	    $(document).on('click', '.asignar2', function (event) {

	        $('#tabla_req tr').removeClass('highlighted');
	        var v = $('#cond_tabla').val();
	        var id1, id2, id3, id4, id5, id6;

	        if (v == 3) {
	            event.stopPropagation();
	            $(this).closest('tr').find("input:not([class^=conta])").each(function () {
	                v1 = this.value;
	            });
	            var $row = $(this).closest("tr");
	            var html = "";

	            if ($("#alm").val() == "S") {
	                $("#guardar").hide();
	                alert("Seleccione un Almacen");

	            }
	            else {
	                if ($("#n").val() == '') {
	                    hr = 0;
	                    hrc = 0;
	                }
	                else {
	                    hr = $("#n").val();
	                    hrc = $("#nc").val();
	                }

	                $("#n").val(parseInt(hr) + 1);
	                $("#nc").val(parseInt(hrc) + 1);

	                $(this).closest('tr').find("input:not([class^=conta])").val('0');
	                var $ida = $row.find(".ida").text();
	                var $desa = $row.find(".desa").text();
	                var $uma = $row.find(".uma").text();
	                var $id_um = $row.find(".id_um").text();
	                var $StockActual = $row.find(".StockActual").text();
	                var $costoUnitario = $row.find(".costoUnitario").text();

	                if (($("#tran").val() == '05' && $("#id_empresa").val() == '2') || $("#id_empresa").val() == '4') {

	                    if ($("#contador").val() == '1') {
	                        $("#cod_articulox").val('');
	                        $("#almx").val('');
	                        $("#unix").val('');

	                    }

	                    /*  $("#n").val($("#contador").val());
                          $("#nc").val($("#contador").val());*/

	                    id1 = $("#almx").val() + "000002" + ",";
	                    $("#almx").val(id1);

	                    id2 = $("#cod_articulox").val() + $ida + ",";
	                    $("#cod_articulox").val(id2);

	                    if ($("#contador").val() < 10) {
	                        id3 = $("#item").val() + "00" + $("#contador").val() + ",";
	                        $("#item").val(id3);
	                    } else if ($("#contador").val() > 9 && $("#contador").val() < 100) {
	                        id3 = $("#item").val() + "0" + $("#contador").val() + ",";
	                        $("#item").val(id3);
	                    } else if ($("#contador").val() > 99) {
	                        id3 = $("#item").val() + $("#contador").val() + ",";
	                        $("#item").val(id3);
	                    }
	                    // id3 = $("#item").val() + ("000" + ($("#item").val())).slice(-3) + ",";


	                    id4 = $("#unix").val() + $id_um + ",";
	                    $("#unix").val(id4);

	                    id5 = $("#cux").val() + $costoUnitario + ",";
	                    $("#cux").val(id5);


	                }


	                $("#alm").prop("disabled", true);
	                $("#tran").prop("disabled", true);


	                if ($StockActual == '0')
	                    alert("El Artículo seleccionado no tiene stock");
	                else {
	                    var contador = $("#contador").val(); 178
	                    html = '<tr><td>' + $("#nc").val() + '</td><td><input type="hidden" id="cod_articulo' + $("#nc").val() + '" name="cod_articulo" value=' + $ida + ' >' + $ida + '</td><td>' + $desa + '</td>' + '<td><input type=hidden name="uni" id="uni' + $("#nc").val() + '" value=' + $id_um + '>' + $uma + '</td><td> <input type=text style="width:60px;border-radius:5px;border:1px solid #ccc;background:#eee"  id="stock' + $("#nc").val() + '" readonly value=' + $StockActual + '></td><td> 0 </td><td><input type=text onchange="subtot(' + $("#nc").val() + ')" value=1 name="atendido" id="atendido' + $("#nc").val() + '" style="width:60px;border-radius:5px;border:1px solid #ccc"  onkeypress="javascript:return validarNro(event)"></td><td><input readonly onchange="subtot(' + $("#nc").val() + ')" type=text id="cu' + $("#nc").val() + '" name="cu" value="' + $costoUnitario + '" style="width:60px;border-radius:5px;border:1px solid #ccc"  onkeypress="javascript:return validarNro(event)" ></td><td><input type=text value=0 name="subtotal[]" id="subtotal' + $("#nc").val() + '" style="width:60px;border-radius:5px;border:1px solid #ccc" disabled ></td><td>' + $("#alm option:selected").html() + '</td><td><span class="fa fa-close clsEliminarFila" ><span></td></tr>';
	                    $('#tbody_det').append(html);
	                    $("#contador").val(eval(contador) + 1);
	                }

	                $("#guardar").show(); return false;
	            }


	        }

	        else if (v == 2) {
	            var $row = $(this).closest("tr");
	            $row.addClass('highlighted');
	            var $ida = $row.find(".ida").text();
	            var $cc = $row.find(".cc").text();
	            var $prov = $row.find(".proveedor").text();
	            var $saldo = eval($row.find(".saldo").text());
	            var $req = $row.find(".req").text();
	            var html = "";

	            $("#tran").prop("disabled", true);
	            $("#IdOrdenCompra").val($ida);
	            $("#IdCentroCosto").val($cc);
	            $("#IdProveedor").val($prov);
	            $("#TotalCosto").val($saldo);
	            $("#IdRequerimiento").val($req);

	            $("#tbody_det").html("<tr align=center><td colspan=11><img src='../images/loader.gif'></td></tr>");
	            $.ajax({
	                type: "POST",
	                contentType: "application/json; charset=utf-8",
	                url: 'http://' + url + '/Services/Logistica/Almacen.svc/listarRequerimientoDetalle',
	                data: '{"idreq":"' + $ida + '" ,"empresa": "' + $("#id_empresa").val() + '" }',
	                dataType: "json",
	                success: function (response) {
	                    var customers = eval(response.d);
	                    var n = 1;
	                    var cu = ""; var cod = ""; var id_alm = ""; var id_um = "";
	                    $("#cux").val("");
	                    $("#cod_articulox").val("");



	                    $("#tbody_det").empty();
	                    $.each(customers, function () {

	                        cu += this.CU.toFixed(4) + ",";
	                        cod += this.Codigo + ",";
	                        id_alm += this.IdCentroCosto + ",";
	                        id_um += this.Id_UM + ",";
	                        html += '<tr><td>' + n + '</td><td>' + this.Codigo + '</td><td>' + this.Descripcion + '</td>' + '<td>' + this.UM + '</td>' + '<td>' + this.Stock + '</td>' + '<td>' + this.SaldoCantidad + '<input id="stock' + n + '" type="hidden" style="width:60px;border-radius:5px;border:1px solid #ccc" value=' + this.Stock + '  ><input id="solicitado' + n + '" type="hidden" style="width:60px;border-radius:5px;border:1px solid #ccc" value=' + this.CantSol + '  ></td>' + '<td align=center><input id="atendido' + n + '" name="atendido" type="text" style="width:60px;border-radius:5px;border:1px solid #ccc" value=0 onchange=sol_ate_s("' + n + '") ></td>' + '<td>' + this.CU.toFixed(4) + '</td>' + '<td>' + (this.CU * this.CantSol).toFixed(4) + '</td>' + '<td>' + this.Almacen + '</td></tr>';
	                        $('#tbody_det').append(html);

	                        n++;
	                    });

	                    $("#cux").val(cu);
	                    $("#cod_articulox").val(cod);
	                    $("#almx").val(id_alm);
	                    $("#unix").val(id_um);

	                    $("#n").val(n - 1);
	                    $("#nc").val(n - 1);
	                    $("#tbody_det").html(html == "" ? " <tr align=center><td colspan=11>No se encontraron resultados </td></tr>" : html);


	                    if (html == "") { $("#guardar").hide(); }
	                    else { $("#guardar").show(); $(".pbrush").show(); $("#bloqueo").show(); }

	                },
	                error: function (a, b, c) {
	                    /*alert(a.responseText);
                        $("#results").html(a.responseText);*/
	                    window.location = "http://" + location.host;
	                }
	            });

	            return false;

	        }

	        else if (v == 5) {
	            var $row = $(this).closest("tr");
	            $row.addClass('highlighted');
	            var $ida = $row.find(".ida").text();
	            var $cc = $row.find(".cc").text();
	            var $prov = $row.find(".proveedor").text();
	            var $saldo = eval($row.find(".saldo").text());
	            var $req = $row.find(".req").text();
	            var html = "";

	            $("#tran").prop("disabled", true);
	            $("#IdOrdenCompra").val($ida);
	            $("#IdCentroCosto").val($cc);
	            $("#IdProveedor").val($prov);
	            $("#TotalCosto").val($saldo);
	            $("#IdRequerimiento").val($req);

	            $("#tbody_det").html("<tr align=center><td colspan=11><img src='../images/loader.gif'></td></tr>");
	            $.ajax({
	                type: "POST",
	                contentType: "application/json; charset=utf-8",
	                url: 'http://' + url + '/Services/Logistica/Almacen.svc/listarOrdenCompraDetalle',
	                data: '{"ocom":"' + $ida + '" ,"empresa": "' + $("#id_empresa").val() + '" }',
	                dataType: "json",
	                success: function (response) {
	                    var customers = eval(response.d);
	                    var n = 1;
	                    var cu = ""; var cod = ""; var id_alm = ""; var id_um = "";
	                    $("#cux").val("");
	                    $("#cod_articulox").val("");



	                    $("#tbody_det").empty();
	                    $.each(customers, function () {

	                        cu += this.CU.toFixed(4) + ",";
	                        cod += this.Codigo + ",";
	                        id_alm += this.IdCentroCosto + ",";
	                        numeroitem += this.NumeroItemOrdenCompra + ",";
	                        id_um += this.Id_UM + ",";
	                        html += '<tr><td>' + n + '</td><td>' + this.Codigo + '</td><td>' + this.Descripcion + '</td>' + '<td>' + this.UM + '</td>' + '<td>' + this.Stock + '</td>' + '<td>' + this.CantSol + '<input id="solicitado' + n + '" type="hidden" style="width:60px;border-radius:5px;border:1px solid #ccc" value=' + this.CantSol + '  ></td>' + '<td align=center><input id="atendido' + n + '" name="atendido" type="text" style="width:60px;border-radius:5px;border:1px solid #ccc" value=' + this.CantSol + ' onchange=sol_ate("' + n + '") ></td>' + '<td>' + this.CU.toFixed(4) + '</td>' + '<td>' + (this.CU * this.CantSol).toFixed(4) + '</td>' + '<td>' + this.Almacen + '</td></tr>';
	                        $('#tbody_det').append(html);

	                        n++;
	                    });

	                    $("#cux").val(cu);
	                    $("#cod_articulox").val(cod);
	                    $("#almx").val(id_alm);
	                    $("#unix").val(id_um);
	                    $("#numeroitem").val(numeroitem);
	                    $("#n").val(n - 1);
	                    $("#tbody_det").html(html == "" ? " <tr align=center><td colspan=11>No se encontraron resultados </td></tr>" : html);



	                    if (html == "") { $("#guardar").hide(); }
	                    else { $("#guardar").show(); }

	                },
	                error: function (a, b, c) {
	                    /*alert(a.responseText);
                        $("#results").html(a.responseText);*/
	                    window.location = "http://" + location.host;
	                }
	            });

	            return false;

	        }
	    });

	    function checkear(v) {
	        if ($("#flag" + v).is(":checked")) {
	            $("#placa" + v).css("display", "inline");
	        }
	        else {
	            $("#placa" + v).css("display", "none");
	            $("#placa" + v).val('-');
	        }
	    }

	    $(document).on('click', '.clsEliminarFila', function () {

	        var $row = $(this).closest("tr");
	        var objCuerpo = $(this).parents().get(2);
	        if ($(objCuerpo).find('tr').length == 1) {
	            if (!confirm('Desea eliminar esta fila')) {
	                $("#contador").val('1');
	                return;
	            } $("#guardar").hide();
	            //$("#tbody_det").html('<tr ><td  colspan="11" align="center">No se encontraron resultados</td></tr>');
	        }
	        var objFila = $(this).parents().get(1);
	        $(objFila).remove();
	        vx2 = $row.find(".v2").text();
	        $("#bool" + vx2).val('1');
	        h = $("#n").val();
	        $("#n").val(parseInt(h) - 1);

	    });

	    $(document).on('click', '.clsEliminarFilaAdicRequer', function () {

	        var $row = $(this).closest("tr");
	        var objCuerpo = $(this).parents().get(2);
	        if ($(objCuerpo).find('tr').length == 1) {
	            if (!confirm('Desea eliminar esta fila')) {
	                $("#contadoradicordcomp").val('1');
	                return;
	            } $("#guardarordencompra").hide();
	            //$("#tbody_det").html('<tr ><td  colspan="11" align="center">No se encontraron resultados</td></tr>');
	        }
	        var objFila = $(this).parents().get(1);
	        $(objFila).remove();
	        vx2 = $row.find(".v2").text();
	        $("#bool" + vx2).val('1');
	        h = $("#n").val();
	        $("#n").val(parseInt(h) - 1);

	    });

	    /* $(document).on('click', '.clsEliminarFila', function () {
             var objCuerpo = $(this).parents().get(2);
             if ($(objCuerpo).find('tr').length == 1) {
                 if (!confirm('Desea eliminar esta fila')) {
 
                     $("#contador").val('1');
                     return;
                 } $("#guardar").hide(); //$("#tbody_det").html('<tr ><td  colspan="11" align="center">No se encontraron resultados</td></tr>');
             }
             var objFila = $(this).parents().get(1);
             $(objFila).remove();
             $("#n").val($("#n").val() - 1);
 
         });*/

   </script>
</body>
</html>