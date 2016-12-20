<%@ Page Language="VB" AutoEventWireup="false" CodeFile="SolicitudTransporte.aspx.vb" Inherits="SolicitudTransporte" %>

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
    </style>


   <section class="content-header">
    
          <h1 style="font-size:18px;font-weight:bold">
            
              Solicitud de Transporte
          </h1>
         
          <ol class="breadcrumb">
            <li><a href="#"><i class="fa fa-dashboard"></i> Transporte</a></li>
            <li><a href="#">Documentos</a></li>
            <li class="active">Solictud</li>
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
                      <th style="text-align:center" >N. Solicitud</th>
                      <th style="text-align:center" >Gerencia </th>
                      <th style="text-align:center" > Fecha </th>
                      <th style="text-align:center" >Pasajeros </th>
                      <th style="text-align:center" >Origen </th>
                      <th style="text-align:center" >Destino </th>
                      <th style="text-align:center" >Hora Salida  </th>
                      <th style="text-align:center" >Tipo Solicitud </th>
                      <th style="text-align:center" >Prioridad </th>
                      <th style="text-align:center" >Vehiculo </th>
                      <th style="text-align:center" >Chofer </th>
                      <th style="text-align:center" >Estado </th>

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
               
                <h1 class="modal-title" style="font-size:18px;font-weight:bold">Registrar Solictud</h1>
            
            
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

                                <label class="col-lg-2 control-label">Pasajeros:</label>
                                <div class="col-lg-3">
                                   <input style="width:100%;" type="text" class="form-control" name="pasajero" id="pasajero"/>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-lg-2 control-label">Origen:</label>
                                <div class="col-lg-3">
                                   <input style="width:100%;" type="text" class="form-control" name="origen" id="origen" value="EMAPE" />
                                </div>
                                <label class="col-lg-2 control-label">Destino:</label>
                                <div class="col-lg-3">
                                    <input type="text" class="form-control" name="destino" id="destino"  />
                                </div>
                            </div>
							
								<div class="form-group" >
                                <label class="col-lg-2 control-label">Hora de Salida:</label>
                                <div class="col-lg-3">
                                   <input  type="text" class="form-control" name="hora" id="hora" maxlength="5" placeholder="12:00" />
                                </div>
                                <label class="col-lg-2 control-label">Tipo Solicitud:</label>
                                    <div class="col-lg-3">
                                <label><input type="checkbox" id="ida" checked> Ida</label><br>
                                <label><input type="checkbox" id="espera"> Espera</label><br>
                                <label><input type="checkbox" id="vuelta"> Vuelta</label><br>
                                        </div>
                            </div>
                      
                            <div class="form-group">
                                <label class="col-lg-2 control-label">Observación:</label>
                                <div class="col-lg-8">
                                   <textarea class="form-control" name="observacion" id="observacion" placeholder="Descripción del Servicio" ></textarea>
                                </div>
                                
                            </div>
                            <br>

                 <% If Session("transporte") = "1" Then%>
                            <div class="form-group">
                                <label class="col-lg-2 control-label">Vehiculo:</label>
                                <div class="col-lg-3">
                                   <select  class="form-control" name="vehiculo" id="vehiculo" >
										<option value="0"> Seleccionar </option> 
                                    </select>
                                </div>
                                <label class="col-lg-2 control-label">Chofer:</label>
                                <div class="col-lg-3">
                                    <select  class="form-control" name="chofer" id="chofer" >
										<option value="0"> Seleccionar </option> 
                                    </select>
                                </div>
                            </div>
							
								<div class="form-group" >
                                <label class="col-lg-2 control-label">Prioridad:</label>
                                <div class="col-lg-3">
                                    <select  class="form-control" name="prioridad" id="prioridad" >
										<option value="1"> Alta </option> 
										<option value="2" selected > Media </option> 
                                        <option value="3"> Baja </option>
                                    </select>
                                </div>
                                <label class="col-lg-2 control-label">Estado:</label>
                                <div class="col-lg-3">
                                    <select  class="form-control" name="estado" id="estado" >
										<option value="1"> En Proceso </option> 
										<option value="2"> Aprobado </option> 
                                        <option value="3"> Rechazado </option>
                                        <option value="4"> En Marcha </option>
                                        <option value="5"> Culminado </option>
                                        <option value="6"> Anulado </option>
                                    </select>
                                </div>
                            </div>
                 <% Else%>
                        <div class="form-group" style="display:none">
                                <label class="col-lg-2 control-label">Vehiculo:</label>
                                <div class="col-lg-3">
                                   <select  class="form-control" name="vehiculo" id="vehiculo" >
										<option value="0"> Seleccionar </option> 
                                    </select>
                                </div>
                                <label class="col-lg-2 control-label">Chofer:</label>
                                <div class="col-lg-3">
                                    <select  class="form-control" name="chofer" id="chofer" >
										<option value="0"> Seleccionar </option> 
                                    </select>
                                </div>
                            </div>
							
								<div class="form-group" style="display:none">
                                <label class="col-lg-2 control-label">Prioridad:</label>
                                <div class="col-lg-3">
                                    <select  class="form-control" name="prioridad" id="prioridad" >
										<option value="1"> Alta </option> 
										<option value="2" selected > Media </option> 
                                        <option value="3"> Baja </option>
                                    </select>
                                </div>
                                <label class="col-lg-2 control-label">Estado:</label>
                                <div class="col-lg-3">
                                    <select  class="form-control" name="estado" id="estado" >
										<option value="1"> En Proceso </option> 
										<option value="2"> Aprobado </option> 
                                        <option value="3"> Rechazado </option>
                                        <option value="4"> En Marcha </option>
                                        <option value="5"> Culminado </option>
                                        <option value="6"> Anulado </option>
                                    </select>
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
                    <p>¿Desea Eliminar la solicitud de Transporte  <span id="nro_sol"></span> ?</p>
              
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
        });



        function limpiar() {
            $("#modificar").hide();
            $("#anular").hide();

            $('#tablareg tr').removeClass('highlighted');
            $("#vehiculo").val("0");
            $("#chofer").val("0");
            $("#pasajero").val("");
            $("#origen").val("");
            $("#destino").val("");
            $("#hora").val("");
            $("#observacion").val("");
            $("#prioridad").val("2");
            $("#estado").val("1");

            $("#ida").prop('checked', true);
            $("#espera").prop('checked', false);
            $("#vuelta").prop('checked', false);

            $("#codigo").val("");

            var f = new Date();
            fechaactual = ('0' + f.getDate()).slice(-2).toString()
               + '/' + ('0' + (f.getMonth() + 1)).slice(-2).toString()
               + '/' + f.getFullYear().toString();

            $("#fecha").val(fechaactual);
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

                        html += "<option value="+this.pkChofer+">"+this.Chofer+"</option>";

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
                url: 'http://' + location.host + '/Services/Logistica/Transporte.svc/listarSolicitud',
                data: '{"mes":"' + $("#mes0").val() + '","anio":"' + $("#anio0").val() + '" }',
                dataType: "json",
                success: function (response) {
                    var customers = eval(response.d);
                    var html = "";
                    var xnro = 0;
                    $.each(customers, function () {
                        //<td> " + this.Estado + "</td>
                        html += "<tr id='fila" + xnro + "' class=getsum onclick=detalle_registro('" + this.IdSolicitud + "','" + xnro + "','" + this.NroSolicitud + "','" + this.Estado + "','" + $("#id_transporte").val() +
                            "') style='cursor:pointer'><td style='text-align:left'> " + "S"+pad(8,this.NroSolicitud)
                        + "</td><td style='text-align:left'> " + this.Descripcion + "</td><td > " + this.Fecha + "</td><td>" + this.Involucrado + "</td><td class='suministro'>" + this.Origen + "</td><td>" + this.Destino
                        + "</td><td  align=center>" + this.HoraSalida + "</td><td class='IdTipoCombustible'  align=center>";


                        ida = this.TipoSolicitud.substring(0, 1);
                        espera = this.TipoSolicitud.substring(1, 2);
                        vuelta = this.TipoSolicitud.substring(2, 3);

                        if (ida == '1') html += " Ida,"; else html += "";
                        if (espera == '1') html += " Espera,"; else html += "";
                        if (vuelta == '1') html += " Vuelta,"; else html += "";
                        html += "</td><td class='fechasum'  align=center >";
                        if (this.Prioridad == '1')
                            html += "Alta";
                        else if (this.Prioridad == '2')
                            html += "Media";
                        else if (this.Prioridad == '3')
                            html += "Baja";
                        html += "</td><td class='fechasum' align=center >" + this.IdPlaca + "</td><td class='fechasum'>" + this.IdChofer + " - " + this.Apellidos + " " + this.Nombres + "</td><td class='fechasum'  align=center>";
                        if (this.Estado == '1')
                            html += "En Proceso";
                        else if (this.Estado == '2')
                            html += "Aprobado";
                        else if (this.Estado == '3')
                            html += "Rechazado";
                        else if (this.Estado == '4')
                            html += "En Marcha";
                        else if (this.Estado == '5')
                            html += "Culminado";
                        else if (this.Estado == '6')
                            html += "Anulado";

                        html += "</td></tr>";
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
                url: 'http://' + location.host + '/Services/Logistica/Transporte.svc/obtenerSolicitud',
                data: '{"codigo":"' + $("#codigo").val() + '" }',
                dataType: "json",
                success: function (response) {
                    var customers = eval(response.d);
                    var html = "";
                    var xnro = 0;
                    $.each(customers, function () {
                        $("#fecha").val(this.Fecha);
                        $("#pasajero").val(this.Involucrado);
                        $("#origen").val(this.Origen);
                        $("#destino").val(this.Destino);
                        $("#hora").val(this.HoraSalida);
                        $("#observacion").val(this.Observacion);
                        $("#chofer").val(this.IdChofer);
                        $("#estado").val(this.Estado);
                        $("#prioridad").val(this.Prioridad);
                        $("#vehiculo").val(this.IdPlaca);

                        c1 = this.TipoSolicitud.substr(0, 1);
                        c2 = this.TipoSolicitud.substr(1, 1);
                        c3 = this.TipoSolicitud.substr(2, 1);
                        
                        if (c1 == 1) $("#ida").prop('checked', true); else $("#ida").prop('checked', false);
                        if (c2 == 1) $("#espera").prop('checked', true); else $("#espera").prop('checked', false);
                        if (c3 == 1) $("#vuelta").prop('checked', true); else $("#vuelta").prop('checked', false);

                    });

                    
                },
                error: function (a, b, c) {
                    alert(a.responseText);
                    $("#results").html(a.responseText);
                }
            });

        }

        function detalle_registro(ord, u, nrosol, estado,transporte) {
            limpiar();
            $('#tablareg tr').removeClass('highlighted');
            $("#fila" + u).addClass('highlighted');
            $("#nroreg").val(ord);

            if (estado != 1 && transporte != 1) {
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

                if ($("#pasajero").val() == "") {
                    alert("Ingrese a los pasajeros");
                }
                else if ($("#origen").val() == "") {
                    alert("Ingrese el Origen del Servicio");
                }
                else if ($("#destino").val() == "") {
                    alert("Ingrese el Destino del Servicio");
                }
                else if ($("#hora").val() == "") {
                    alert("Ingrese la Hora de Salida");
                }
                else {

                    if ($("#ida").is(':checked')) ida = 1; else ida = 0;
                    if ($("#espera").is(':checked')) espera = 1; else espera = 0;
                    if ($("#vuelta").is(':checked')) vuelta = 1; else vuelta = 0;

                    $.ajax({
                        url: 'http://' + location.host + '/Services/Logistica/Transporte.svc/RegistrarSolicitud',
                        type: 'POST',
                        contentType: "application/json; charset=utf-8",
                        data: '{"codigo": "' + $("#codigo").val() + '","pasajero": "' + $("#pasajero").val() + '","origen": "' + $("#origen").val() + '","destino": "' + $("#destino").val() + '","hora": "' + $("#hora").val() + '","tipo": "' + ida + espera + vuelta + '","observacion": "' + $("#observacion").val() + '","vehiculo": "' + $("#vehiculo").val() + '","chofer": "' + $("#chofer").val() + '","prioridad": "' + $("#prioridad").val() + '","estado": "' + $("#estado").val() + '" }',
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
                url: 'http://' + location.host + '/Services/Logistica/Transporte.svc/EliminarSolicitud',
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
