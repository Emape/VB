<%@ Page Language="VB" AutoEventWireup="false" CodeFile="RepProcesoSeleccion.aspx.vb" Inherits="Home_RepProcesoSeleccion" %>
<style>
tr.highlighted td {
    background-color: rgb(102, 153, 204);
    color:#FFFFFF;
    
}
    th, td{
    border:1px solid #cfcfcf !important;
    font: normal 11px tahoma, arial,verdana;
    }

    .spantxt {
        line-height: 50px;
    }
.cabecera{
cursor:default;zoom:1;padding:0;
background-image:none;
background-color:#c5c5c5;
background-image:-webkit-gradient(linear,50% 0%,50% 100%,color-stop(0%,#f9f9f9),color-stop(100%,#e3e4e6));
background-image:-webkit-linear-gradient(top,#f9f9f9,#e3e4e6);
background-image:-moz-linear-gradient(top,#f9f9f9,#e3e4e6);
background-image:-o-linear-gradient(top,#f9f9f9,#e3e4e6);
background-image:-ms-linear-gradient(top,#f9f9f9,#e3e4e6);
background-image:linear-gradient(top,#f9f9f9,#e3e4e6);
}

	</style>

 <style>
	body{
	font-size:12px !important;
	}
        /*css process modal -  processing-modal*/
        .modal-static { 
            position: fixed;
            top: 50% !important; 
            left: 50% !important; 
            margin-top: -100px;  
            margin-left: -150px; 
            overflow: visible !important;
        }
        .modal-static,
        .modal-static .modal-dialog,
        .modal-static .modal-content {
            width: 300px; 
            height: 90px; 
        }
        .modal-static .modal-dialog,
        .modal-static .modal-content {
            padding: 0 !important; 
            margin: 0 !important;
        }
        .modal-static .modal-content .icon {
        }
        .modal-text{
            text-align:center;
            font-family:Cambria;
            font-weight:bold;
            font-size:medium;
        }
    </style>


   <section class="content-header">
    
          <h1 style="font-size:18px;font-weight:bold">
            
              Reporte Proceso de Selección
          </h1>
         
          <ol class="breadcrumb">
            <li><a href="#"><i class="fa fa-dashboard"></i> Logística</a></li>
            <li><a href="#">Reporte</a></li>
            <li class="active">Proceso de Selección</li>
          </ol>
        </section>

        <!-- Main content -->
        <section class="content">
          
            <div class="row">
            <div class="col-md-12">

              <div class="box box-primary">
                <div class="box-header">

             <form id="form1" action="#" method="post">
                     <div class="row">
                    <div class="col-xs-2 col-md-1 col-lg-1">
					<div class="dataTables_length">
					 &nbsp;  Número:                                  
					</div>
					</div>
					<div class="col-xs-2 col-md-2 col-lg-2">
					<div class="dataTables_length">
					<input type="text" name="orden" id="orden"  aria-controls="tabla_inventario" class="form-control input-sm" />
					</div>
					</div>
                    
                    <div class="col-xs-2 col-md-1 col-lg-1">
					<div class="dataTables_length">
					 &nbsp;  Objeto:                                  
					</div>
					</div>
					<div class="col-xs-2 col-md-3 col-lg-3">
					<div class="dataTables_length">
					<input type="text" name="objeto" id="objeto"  aria-controls="tabla_inventario" class="form-control input-sm" />
					</div>
					</div>

                    <div class="col-xs-1 col-md-1 col-lg-1">
					<div class="dataTables_length">
                        <span class="btn btn-primary" onclick="listar()"><i class="fa fa-search"></i></span>
					</div>
					</div>

 <div class="col-xs-1 col-md-1 col-lg-1">
					<div class="dataTables_length">
                        <span title="Calendario" id="calendario" class="btn btn-success" style="font-size: 12px; display: none;" data-toggle="modal" data-target="#verCalendario">
                            <i class="fa fa-calendar"></i> &nbsp; Calendario</span>
					</div>
					</div>
                                                   
				 </div>
                 

		  </form>
                </div>
                <div class="box-body pad table-responsive"   style="overflow:scroll;height:700px">
	         <table id="tabla"  class="table table-bordered table-hover dataTable no-footer" role="grid" aria-describedby="tabla_inventario_info">
				  <thead>
                    <tr  class="cabecera">
                      
                      <th style="text-align:center" >N. </th>
                      <th style="text-align:center" >Tipo </th>
                      <th style="text-align:center" >Clasificación</th>
                      <th style="text-align:center" >Número</th>
                      <th style="text-align:center" >Fecha</th>
                      <th style="text-align:center" >Objeto </th>
                    </tr>
					</thead>
                    
                   <tbody id="body_guia">
			   <tr ><td  colspan="11" align="center">No se encontraron resultados</td></tr>		
                  </table>

				  
                </div><!-- /.box -->
              </div>
            </div><!-- /.col -->
          </div><!-- ./row -->
        </section><!-- /.content -->

<div class="modal fade" id="verCalendario" tabindex="-1" role="dialog" aria-labelledby="Login" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button id=Button1 type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title"><b>Proceso de Seleccion N° <span id="txtNro"></span></b> </h4>
                                         
                                   <span id="txtObjeto"></span>
                        
            </div>

            <div class="modal-body">
            
            <form id="Form2" name="Form" method="post" class="form-horizontal">
                            <div class="form-group">
                                <label class="col-lg-2 control-label">Convocatoria</label>
                                <div class="col-lg-3">
                                  <span id="txtfecha1" class="spantxt"></span>
                                </div>

                                <label class="col-lg-2 control-label">Evaluación Propuesta</label>
                                <div class="col-lg-3">
                                   <span id="txtfecha2" class="spantxt"></span>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-lg-2 control-label">Registro Participantes</label>
                                <div class="col-lg-3">
                                   <span id="txtfecha3" class="spantxt"></span>
                                </div>
                                <label class="col-lg-2 control-label">Calificación Propuesta</label>
                                <div class="col-lg-3">
                                    <span id="txtfecha4" class="spantxt"></span>
                                </div>
                            </div>

							<div class="form-group" >
                                <label class="col-lg-2 control-label">Consultas y Observaciones</label>
                                <div class="col-lg-3">
                                   <span id="txtfecha5" class="spantxt"></span>
                                </div>
                                <label class="col-lg-2 control-label">Otorgamiento Buena Pro</label>
                                <div class="col-lg-3">
                                    <span id="txtfecha6" class="spantxt"></span>
                                </div>
                            </div>

	
							<div class="form-group">
                                <label class="col-lg-2 control-label"> Absolución Consulta y Obs. </label>
                                <div class="col-lg-3">
                                   <span id="txtfecha7" class="spantxt"></span>
								    </div>
                                                                <label class="col-lg-2 control-label"> Consentimiento Buena Pro </label>
                                <div class="col-lg-3">
                                   <span id="txtfecha8" class="spantxt"></span>
								    </div>
                            </div>
							
							
							<div class="form-group">
                                <label class="col-lg-2 control-label">Integración de Bases</label>
                                <div class="col-lg-3">
                                   <span id="txtfecha9" class="spantxt"></span>
                                </div>
                                                        <label class="col-lg-2 control-label">Citación Firma Contrato</label>
                                <div class="col-lg-3">
                                   <span id="txtfecha10" class="spantxt"></span>
                                </div>
                            </div>
														<div class="form-group">
                                <label class="col-lg-2 control-label">Presentación Propuesta </label>
                                <div class="col-lg-3">
                                  <span id="txtfecha11" class="spantxt"></span>
								    </div>
                                                                <label class="col-lg-2 control-label"> Suscripción Contrato </label>
                                <div class="col-lg-3">
                                   <span id="txtfecha12" class="spantxt"></span>
								    </div>
                            </div>
							
					
                    </form>
            </div>
        </div>
    </div>
</div>

	<script src="../js/jquery.uitablefilter.js" ></script>
            
    <script type="text/javascript">
        $(document).ready(function () {
            listar();

            $("#orden").keypress(function (e) {
                if (e.which == 13) {
                    // Acciones a realizar, por ej: enviar formulario.
                    listar();
                    return false;
                }
            });

            $("#objeto").keypress(function (e) {
                if (e.which == 13) {
                    // Acciones a realizar, por ej: enviar formulario.
                    listar();
                    return false;
                }
            });
        });

        function listar() {
            $("#calendario").hide();
            $("#body_guia").html("<tr><td colspan=9><div align=center ><img src='../images/loader.gif'></div></td></tr>");
            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: 'http://' + location.host + '/Services/Logistica/Almacen.svc/listarProcesoSeleccion',
                data: '{"empresa": "' + $("#id_empresa").val() + '","nro": "' + $("#orden").val() + '","objeto": "' + $("#objeto").val() + '"}',
                dataType: "json",
                success: function (response) {
                    var customers = eval(response.d);
                    var html = "";
                    var xnro = 1;
                    $.each(customers, function () {
                        html += "<tr id='fila" + xnro + "' class=getsum  style='cursor:pointer' onclick='detalle(" + this.IdProcesoSeleccion + "," + xnro + ")' ><td style='text-align:center;'>"
                        + xnro + " </td><td style='text-align:left;'>" + this.DescripTipo + "</td><td style='text-align:left'> " + this.DescripClasificacion + "</td><td style='text-align:center;'> " +
						this.IdProcesoSeleccion + "</td><td style='text-align:center;'>" + this.FechaProcesoSeleccion + "</td><td style='text-align:left;'>" + this.Objeto + "</td><td style='text-align:center;display:none'>" + this.FechaConvocatoria + "</td><td style='text-align:center;display:none'>" + this.InicioVenta + "</td><td style='text-align:center;display:none'>" + this.FinVenta + "</td><td style='text-align:center;display:none'>" + this.FechaObservacionIni + "</td><td style='text-align:center;display:none'>" + this.FechaObservacionFin + "</td><td style='text-align:center;display:none'>" + this.FechaAbsolucion + "</td><td style='text-align:center;display:none'>" + this.FechaIntegracionBase + "</td><td style='text-align:center;display:none'>" + this.FechaPresentacionPropuesta + "</td><td style='text-align:center;display:none'>" + this.EvaluacionIni + "</td><td style='text-align:center;display:none'>" + this.EvaluacionFin + "</td><td style='text-align:center;display:none'>" + this.FechaCalificacionPropuesta + "</td><td style='text-align:center;display:none'>" + this.FechaBuenaPro + "</td><td style='text-align:center;display:none'>" + this.ConsentimientoBuenaPro + "</td><td style='text-align:center;display:none'>" + this.CitacionParaFirma + "</td><td style='text-align:center;display:none'>" + this.FirmaContratoIni + "</td><td style='text-align:center;display:none'>" + this.FirmaContratoFin + "</td>";
                        
                        html += "</tr>";
                        xnro++;
                    });


                    $("#body_guia").html(html == "" ? "<tr><td colspan='8'> <div align=center>No se encontraron resultados</div></td></tr>" : html);
                },
                error: function (a, b, c) {
                    alert(a.responseText);
                    $("#results").html(a.responseText);
                }
            });

        }

        function detalle(nro,  u) {
            $('#tabla tr').removeClass('highlighted');
            $("#fila" + u).addClass('highlighted');
            $("#calendario").show();

            $("#txtNro").html(document.getElementById('fila' + u).getElementsByTagName('td')[3].innerHTML);
            $("#txtObjeto").html(document.getElementById('fila' + u).getElementsByTagName('td')[5].innerHTML);

            $("#txtfecha1").html(document.getElementById('fila' + u).getElementsByTagName('td')[6].innerHTML);
            $("#txtfecha3").html(document.getElementById('fila' + u).getElementsByTagName('td')[7].innerHTML + " - " + document.getElementById('fila' + u).getElementsByTagName('td')[8].innerHTML);
            $("#txtfecha5").html(document.getElementById('fila' + u).getElementsByTagName('td')[9].innerHTML + " - " + document.getElementById('fila' + u).getElementsByTagName('td')[10].innerHTML);
            $("#txtfecha7").html(document.getElementById('fila' + u).getElementsByTagName('td')[11].innerHTML);
            $("#txtfecha9").html(document.getElementById('fila' + u).getElementsByTagName('td')[12].innerHTML);
            $("#txtfecha11").html(document.getElementById('fila' + u).getElementsByTagName('td')[13].innerHTML);
            $("#txtfecha2").html(document.getElementById('fila' + u).getElementsByTagName('td')[14].innerHTML + " - " + document.getElementById('fila' + u).getElementsByTagName('td')[15].innerHTML);
            $("#txtfecha4").html(document.getElementById('fila' + u).getElementsByTagName('td')[16].innerHTML);
            $("#txtfecha6").html(document.getElementById('fila' + u).getElementsByTagName('td')[17].innerHTML);
            $("#txtfecha8").html(document.getElementById('fila' + u).getElementsByTagName('td')[18].innerHTML);
            $("#txtfecha10").html(document.getElementById('fila' + u).getElementsByTagName('td')[19].innerHTML);
            $("#txtfecha12").html(document.getElementById('fila' + u).getElementsByTagName('td')[20].innerHTML + " - " + document.getElementById('fila' + u).getElementsByTagName('td')[21].innerHTML);
        }

    </script>
