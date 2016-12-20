<%@ Page Language="VB" AutoEventWireup="false" CodeFile="OcurrenciaTransporte.aspx.vb" Inherits="OcurrenciaTransporte" %>


<style>
tr.highlighted td {
    background-color: rgb(102, 153, 204);
    color:#FFFFFF;
    
}
    th, td{
    border:1px solid #cfcfcf !important;
    font: normal 11px tahoma, arial,verdana;
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
     .td-sky-blue {
     background:#e8e9ff;
     }
    </style>


   <section class="content-header">
    
          <h1 style="font-size:18px;font-weight:bold">
            
              Ocurrencia de Vehiculos
          </h1>
         
          <ol class="breadcrumb">
            <li><a href="#"><i class="fa fa-dashboard"></i> Transporte</a></li>
            <li><a href="#">Documentos</a></li>
            <li class="active">Ocurrencia</li>
          </ol>
        </section>

        <!-- Main content -->
        <section class="content">
          
            <div class="row">
            <div class="col-md-12">

              <div class="box box-primary">
                <div class="box-header">
                 
				  


             <form id="form1" >
                       
                     <div class="row">
										
					<!--<div class="col-xs-2">
					<div class="dataTables_length">
					 &nbsp;  Fecha:  -->                                

					
					<!--</div>
					</div>-->


                        <div class="col-xs-2">
					<div class="dataTables_length">
					 &nbsp;  Buscar:                                  
                        
                        <input type="text" name="search" id="search" aria-controls="tabla_inventario" class="form-control input-sm">
					</div>
					</div>
                    
                        <div class="col-xs23">
                        </div>
                        <div class="cols-xs-1" align="right" style="margin-right:32px;">
                        <div class="dataTables_length">
                        <span title="Agregar" id="agregar" class="btn btn-primary" style="font-size: 12px; display: inline-block;" data-toggle="modal" data-target="#registroInsertModal" onclick="limpiar()">
                            <i class="fa fa-plus"></i> &nbsp; Agregar
                        </span>

                          <span title="Modificar" id="modificar" class="btn btn-warning" style="font-size: 12px; display: none;" data-toggle="modal" data-target="#registroInsertModal">
                            <i class="fa fa-pencil"></i> &nbsp; Modificar</span>

                            <span title="Anular" id="anular" class="btn btn-danger" style="font-size: 12px; display: none;" data-toggle="modal" data-target="#eliminarModal">
                            <i class="fa fa-minus-circle"></i> &nbsp; Eliminar</span>


                        </div>
                        </div>


				 </div>

		  </form>
				  
				  
				  
                </div>
                <div class="box-body pad table-responsive"   style="overflow:scroll;height:700px">
				
					
				
					
	         <table id="tablareg"  class="table table-bordered table-hover dataTable no-footer" role="grid" aria-describedby="tabla_inventario_info">
				  <thead>
                    <tr  class="cabecera">
                      <th style="text-align:center;width:40px" >N. </th>
                      <th style="text-align:center" colspan="6">Área Usuaria</th>
                      <th style="text-align:center" colspan="3">Transporte</th>
                    </tr>
                    <tr  class="cabecera">
                      <th style="text-align:center" >Registro </th>
                      <th style="text-align:center;width:100px" >N. Requerimiento</th>
                      <th style="text-align:center" >Gerencia </th>
                      <th style="text-align:center;width:80px" >Fecha </th>
                      <th style="text-align:center;width:80px" >Vehiculo </th>
                      <th style="text-align:center" >Descripción </th>
                      <th style="text-align:center;width:80px" >Estado </th>
                      <th style="text-align:center" >Comentario </th>
                      <th style="text-align:center;width:80px" >Evaluación </th>
                      <th style="text-align:center;width:80px" >Fecha </th>
                      
                    </tr>
					</thead>
                    
                   <tbody id="body_guia">
			        <tr ><td  colspan="12" align="center">No se encontraron resultados</td></tr>		
                  </table>

				  
                </div><!-- /.box -->
              </div>
            </div><!-- /.col -->
          </div><!-- ./row -->



        </section><!-- /.content -->
	 
<div class="modal fade" id="registroInsertModal" tabindex="-1" role="dialog" aria-labelledby="Login" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
               
                <h1 class="modal-title" style="font-size:18px;font-weight:bold">Registrar Ocurrencia</h1>
            
            
            <span style="float:right;margin-top:-28px">
                <span id="guardar" class="btn btn-primary" style="font-size: 12px; " >
                   <i class="fa fa-save"></i> &nbsp; GUARDAR
                </span>

                <span id="cancelar" data-dismiss="modal" aria-label="Close" class="btn btn-danger" style="font-size:12px">
                   <i class="fa fa-close"></i> &nbsp; CANCELAR
                </span>
                </span>
            

            
            </div>

            <div class="modal-body">
            
            <form id="Form" method="post" class="form-horizontal">
							<input type="hidden" name="codigo" id="codigo" >
                            <div class="form-group">

                                <label class="col-lg-2 control-label">Fecha:</label>
                                <div class="col-lg-3">
                                    <input disabled type="text" class="form-control" name="fecha" id="fecha" maxlength="8" />
                                </div>

                                <label class="col-lg-2 control-label">Vehículo:</label>
                                <div class="col-lg-3">
                                   <select  class="form-control" name="vehiculo" id="vehiculo" >
										<option value="0"> Seleccionar </option> 
                                    </select>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-lg-2 control-label"></label>
                                <div class="col-lg-3">
                                   
                                </div>
                                <label class="col-lg-2 control-label">Condición:</label>
                                <div class="col-lg-3">
                                    <select  class="form-control" name="condicion" id="condicion" >
										<option value="1"> Operativo </option> 
										<option value="2"> Inoperativo </option> 
                                    </select>
                                </div>
                            </div>
							
								
                      
                            <div class="form-group">
                                <label class="col-lg-2 control-label">Observación:</label>
                                <div class="col-lg-8">
                                   <textarea class="form-control" name="descripcion" id="descripcion" placeholder="Descripción de la Ocurrencia" ></textarea>
                                </div>
                                
                            </div>
                            <br>

                 <% If Session("transporte") = "1" Then%>
                            <div class="form-group">
                                <label class="col-lg-2 control-label">Fecha de Respuesta:</label>
                                <div class="col-lg-3">
                                  <input type="text" readonly style="background:#eee" class="form-control" name="fecha2" id="fecha2" maxlength="8" />
                                </div>
                                <label class="col-lg-2 control-label">Evaluación:</label>
                                <div class="col-lg-3">
                                    <select  class="form-control" name="evaluacion" id="evaluacion" >
										<option value="1"> En Proceso </option> 
										<option value="2"> Atendido </option> 
                                    </select>
                                </div>
                            </div>
							
                            <div class="form-group">
                                <label class="col-lg-2 control-label">Comentario:</label>
                                <div class="col-lg-8">
                                   <textarea class="form-control" name="comentario" id="comentario" placeholder="Respuesta de la Ocurrencia" ></textarea>
                                </div>
                                
                            </div>
                <% Else%>
                    <div class="form-group" style="display:none">
                                <label class="col-lg-2 control-label">Fecha:</label>
                                <div class="col-lg-3">
                                  <input type="text" class="form-control" name="fecha2" id="fecha2" maxlength="8" />
                                </div>
                                <label class="col-lg-2 control-label">Evaluación:</label>
                                <div class="col-lg-3">
                                    <select  class="form-control" name="evaluacion" id="evaluacion" >
										<option value="1"> En Proceso </option> 
										<option value="2"> Atendido </option> 
                                    </select>
                                </div>
                            </div>
							
                            <div class="form-group" style="display:none">
                                <label class="col-lg-2 control-label">Comentario:</label>
                                <div class="col-lg-8">
                                   <textarea class="form-control" name="comentario" id="comentario" placeholder="Respuesta de la Ocurrencia" ></textarea>
                                </div>
                                
                            </div>
					<% End If %>									
                    </form>
            </div>
        </div>
    </div>
</div>

         <div class="modal fade" id="eliminarModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
            
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title" id="myModalLabel">Eliminar Solicitud</h4>
                </div>
            
                <div class="modal-body">
                    <p>¿Desea Eliminar la Requerimiento de Transporte  <span id="nro_sol"></span> ?</p>
              
                    <p class="debug-url"></p>
                </div>
                
                <div class="modal-footer">
                    <button id="cerrar" type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
                    <a class="btn btn-danger btn-ok">Eliminar</a>
                </div>
            </div>
        </div>
    </div>

	<script src="../js/jquery.uitablefilter.js" ></script>
            
    <script type="text/javascript">

        $(document).ready(function () {
            listar_solicitud();
            listar_chofer();
            listar_vehiculo();

            theTable1 = $("#tablareg");

            $("#search").keyup(function () {
                $.uiTableFilter(theTable1, this.value);
                $("#imprimir").show();
            });

            var f = new Date();
            fechaactual = ('0' + f.getDate()).slice(-2).toString()
               + '/' + ('0' + (f.getMonth() + 1)).slice(-2).toString()
               + '/' + f.getFullYear().toString();

            $("#fecha").val(fechaactual);
            $("#fecha2").val(fechaactual);

            $("#fecha2").datepicker({
                format: "dd/mm/yyyy",
                todayHighlight: true,
                autoclose: true
            });

        });



        function limpiar() {
            $("#modificar").hide();
            $("#anular").hide();

            $('#tablareg tr').removeClass('highlighted');

            $("#vehiculo").val("0");
            $("#condicion").val("1");
            $("#descripcion").val("");
            $("#comentario").val("");
            $("#evaluacion").val("1");
            $("#fecha2").val("");

            $("#codigo").val("");

            var f = new Date();
            fechaactual = ('0' + f.getDate()).slice(-2).toString()
               + '/' + ('0' + (f.getMonth() + 1)).slice(-2).toString()
               + '/' + f.getFullYear().toString();

            $("#fecha").val(fechaactual);
            $("#fecha2").val(fechaactual);
        }

        $("#placa").keyup(function (event) {
            if ($("#placa").val().length > 6) { getPlaca(); }
        }).keydown(function (event) { if (event.which == 13) { event.preventDefault(); } });

        $("#chofer").keyup(function (event) {
            if ($("#chofer").val().length > 7) { getChofer() };
        }).keydown(function (event) { if (event.which == 13) { event.preventDefault(); } });

        function listar_chofer() {

            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                data: '{"estado": "A", }',
                url: 'http://' + location.host + '/Services/Logistica/Transporte.svc/listarChofer',
                dataType: "json",
                success: function (response) {
                    var customers = eval(response.d);
                    var html = "";
                    var xnro = 1;
                    $.each(customers, function () {

                        html += "<option value=" + this.pkChofer + ">" + this.Chofer + "</option>";

                        xnro++;
                    });

                    $("#chofer").append(html);
                },
                error: function (a, b, c) {
                    alert(a.responseText);
                    $("#results").html(a.responseText);
                }
            });

        }

        function listar_vehiculo() {
            url = document.url;
            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                data: '{"estado": "A", }',
                url: 'http://' + location.host + '/Services/Logistica/Transporte.svc/listarVehiculo',
                dataType: "json",
                success: function (response) {
                    var customers = eval(response.d);
                    var html = "";
                    var xnro = 1;
                    $.each(customers, function () {

                        html += "<option value='" + this.id + "' >" + this.IdPlaca + " </option>";
                        xnro++;
                    });

                    $("#vehiculo").append(html);

                },
                error: function (a, b, c) {
                    alert(a.responseText);
                    $("#results").html(a.responseText);
                }
            });

        }

        function pad(tam, num) {
            if (num.toString().length <= tam) return pad(tam, "0" + num)
            else return num;
        }

        function listar_solicitud() {
           
            $("#body_guia").html("<tr><td colspan=12><div align=center ><img src='../images/loader.gif'></div></td></tr>");
            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: 'http://' + location.host + '/Services/Logistica/Transporte.svc/listarOcurrencia',
                dataType: "json",
                success: function (response) {
                    var customers = eval(response.d);
                    var html = "";
                    var xnro = 0;
                    $.each(customers, function () {
                        //<td> " + this.Estado + "</td>
                        html += "<tr id='fila" + xnro + "' class=getsum onclick=detalle_registro('" + this.IdOcurrencia + "','" + xnro + "','" + this.NroRequerimiento + "','" + this.Evaluacion + "','" + $("#id_transporte").val() +
                            "') style='cursor:pointer'><td style='text-align:center'> " +  (xnro+1) + "</td><td style='text-align:center'> " + "R" + pad(8, this.NroRequerimiento)
                        + "</td><td style='text-align:left'> " + this.IdCentroCosto + "</td><td style='text-align:center'> " + this.Fecha + "</td><td style='text-align:center'>" + this.IdPlaca
                        + "</td><td class='IdTipoCombustible'  align=left>" + this.Descripcion + "</td><td class='fechasum'  align=center >";
                        if (this.Condicion == '1')
                            html += "Operativo";
                        else 
                            html += "Inoperativo";
                        html += "</td><td class='td-sky-blue' align=left >" + this.Comentario + "</td><td class='td-sky-blue' style='text-align:center'>";

                        if (this.Evaluacion == '1')
                            html += "En Proceso";
                        else
                            html += "Atendido";

                        html += "</td><td class='td-sky-blue'  align=center>" + this.Fecha2 + "</td></tr>";
                        
                        xnro++;
                    });

                    $("#body_guia").html(html == "" ? "<tr><td colspan='12'> <div align=center>No se encontraron resultados</div></td></tr>" : html);
                },
                error: function (a, b, c) {
                    alert(a.responseText);
                    $("#results").html(a.responseText);
                }
            });

        }


        function obtener_solicitud() {

            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: 'http://' + location.host + '/Services/Logistica/Transporte.svc/obtenerOcurrencia',
                data: '{"codigo":"' + $("#codigo").val() + '" }',
                dataType: "json",
                success: function (response) {
                    var customers = eval(response.d);
                    var html = "";
                    var xnro = 0;
                    $.each(customers, function () {

                        $("#vehiculo").val(this.Vehiculo);
                        $("#condicion").val(this.Condicion);
                        $("#descripcion").val(this.Descripcion);
                        $("#fecha2").val(this.Fecha);
                        $("#evaluacion").val(this.Evaluacion);
                        $("#comentario").val(this.Comentario);
                       

                    });


                },
                error: function (a, b, c) {
                    alert(a.responseText);
                    $("#results").html(a.responseText);
                }
            });

        }

        function detalle_registro(ord, u, nrosol, evaluacion, transporte) {
            limpiar();
            $('#tablareg tr').removeClass('highlighted');
            $("#fila" + u).addClass('highlighted');
            $("#nroreg").val(ord);

            if (evaluacion == 1 && transporte != 1) {
                $("#modificar").show();
                $("#anular").show();
            }
            else if (transporte == 1) {
                $("#modificar").show();
                $("#anular").show();
            }
            else {
                $("#modificar").hide();
                $("#anular").hide();
            }

            $("#codigo").val(ord);
            $("#nro_sol").html(nrosol);
            obtener_solicitud();

        }

        $("#guardar").click(function () {

            if ($("#vehiculo").val() == "0") {
                alert("Seleccione el Vehiculo");
            }
            else if ($("#descripcion").val() == "") {
                alert("Ingrese la descripcion de la ocurrencia");
            }
            else {

                $.ajax({
                    url: 'http://' + location.host + '/Services/Logistica/Transporte.svc/RegistrarOcurrencia',
                    type: 'POST',
                    contentType: "application/json; charset=utf-8",
                    data: '{"codigo": "' + $("#codigo").val() + '","vehiculo": "' + $("#vehiculo").val() + '","condicion": "' + $("#condicion").val() + '","descripcion": "' + $("#descripcion").val() + '","fecha2": "' + $("#fecha2").val() + '","evaluacion": "' + $("#evaluacion").val() + '","comentario": "' + $("#comentario").val() + '" }',
                    processData: false,
                    crossDomain: true,
                    dataType: "json",
                    success: function (data, textStatus, jqXHR) {
                        $("#cancelar").click();
                        alert("Se registró correctamente.")
                        listar_solicitud();
                        limpiar();
                    }
                });
            }

        });

        $(".btn-ok").click(function () {
            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: 'http://' + location.host + '/Services/Logistica/Transporte.svc/EliminarRequerimiento',
                data: '{"codigo": "' + $("#codigo").val() + '", }',
                dataType: "json",
                success: function (response) {

                    if (response.d == 1) {
                        alert("Se Eliminó correctamente");
                        $(".close").click();
                        listar_solicitud();
                    }
                    else {
                        alert("Error");
                    }

                },
                error: function (a) {
                    alert(a.responseText);
                }
            });
        });

    </script>