<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Locadorxgerencia.aspx.vb" Inherits="Home_Locadorxgerencia" %>
<script src='../js/jquery.tablesorter.js' type='text/javascript'></script>
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
    th {
    cursor:pointer;
    }
	</style>

   <section class="content-header">
    
          <h1 style="font-size:18px;font-weight:bold">
              Locador por Gerencia
          </h1>
         
          <ol class="breadcrumb">
            <li><a href="#"><i class="fa fa-dashboard"></i> Maestro</a></li>
            <li><a href="#">Locador</a></li>
            <li class="active">Gerencia</li>
          </ol>
        </section>

        <!-- Main content -->
        <section class="content">
          
            <div class="row">
            <div class="col-md-12">

              <div class="box box-primary">
                <div class="box-header">
                 
				  
                     <div class="row">
										
					

                    <div class="col-xs-2">
					<div class="dataTables_length">
					    
                        Gerencia:<br>
                        <select name="gerencia" id="gerencia" aria-controls="tabla_inventario" class="form-control" onchange="listar_departamento()" style="width:150px">
                                <option value="0"> Todas </option>
                        </select>
                        </div>
					</div>
                        <div class="col-xs-2">
					<div class="dataTables_length">
                        Departamento:<br>
                        <select name="subgerencia" id="subgerencia" aria-controls="tabla_inventario" class="form-control" onchange="listar_proveedor()" style="width:150px">
                                <option value="0"> Todas </option>
                        </select>
					</div>
					</div>
                    <div class="col-xs-2">
					<div class="dataTables_length">
					 &nbsp;  Buscar : <br>
                      <input type=text name="search" id="search" aria-controls="tabla_inventario" class="form-control input-sm">
					</div>
					</div>
                        <div class="col-xs-3">
                        </div>
                        <div class="cols-xs-3" align="right" style="margin-right:32px;">
                        <div class="dataTables_length">
                                                      <span title="Agregar" id="agregar" class="btn btn-primary" style="font-size:12px" data-toggle="modal" data-target="#agregarModal" onclick="limpiar()" >
                            <i  class="fa fa-plus" ></i>
                            </span>
                            <span title="Modificar" id="modificar" class="btn btn-primary" style="font-size:12px" data-toggle="modal" data-target="#agregarModal">
                            <i  class="fa fa-pencil" ></i>
                            </span>
                            <span title="Eliminar" id="eliminar" class="btn btn-danger" style="font-size:12px" data-toggle="modal" data-target="#eliminarModal" >
                            <i  class="fa fa-minus-circle" ></i>
                            </span>


                        </div>
                        </div>


				 </div>

<form id="choferInsert" class="form-horizontal" >	
<input type="hidden" name="cod" id="cod" >
<div class="modal fade" id="agregarModal" tabindex="-1" role="dialog" aria-labelledby="Login" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
               
                <h1 class="modal-title" style="font-size:18px;font-weight:bold">Registrar Conductor</h1>
            
            
            <span style="float:right;margin-top:-28px">
                <span id="guardar" class="btn btn-primary" style="font-size:12px" onclick="carga_submit()" >
                   <i class="fa fa-save"></i> 
                </span>

                <span id="cancelar" data-dismiss="modal" aria-label="Close" class="btn btn-danger" style="font-size:12px" >
                   <i class="fa fa-close"></i>
                </span>
                </span>
            

            
            </div>

            <div class="modal-body">                            
                             
                             <div class="form-group">
                                <label class="col-lg-3 control-label"  >DNI</label>
                                <div class="col-lg-5">
                                    <input type="text" class="form-control"  name="dni" id="dni"/>
                                </div>
                            </div>
							
							<div class="form-group">
                                <label class="col-lg-3 control-label">Apellidos</label>
                                <div class="col-lg-5">
                                 <input  type="text" class="form-control" name="apellido" id="apellido" />
                                </div>
                            </div>
							
							<div class="form-group">
                                <label class="col-lg-3 control-label">Nombres</label>
                                <div class="col-lg-5">
                                  <input  type="text" class="form-control" name="nombre" id="nombre" />
                                </div>
                            </div>
							
							
							<div class="form-group">
                                <label class="col-lg-3 control-label">Fecha Ingreso</label>
                                <div class="col-lg-5">
                                    <input readonly style="border-color:#00a65a;background-color:#ffffff" type="text" class="form-control" name="fi" id="fi"/>
                                </div>
                            </div>

                            
														
							<div class="form-group">
                                <label class="col-lg-3 control-label">Licencia Conducir</label>
                                <div class="col-lg-5">
                                    <input type="text" class="form-control" name="licencia" id="licencia"/>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-lg-3 control-label">Fecha de Expedición de Licencia Conducir</label>
                                <div class="col-lg-5">
                                  <input readonly style="border-color:#00a65a;background-color:#ffffff" type="text" class="form-control" name="fe" id="fe"/>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-lg-3 control-label">Fecha de Caducidad de Licencia Conducir</label>
                                <div class="col-lg-5">
                                  <input readonly style="border-color:#00a65a;background-color:#ffffff" type="text" class="form-control" name="fc" id="fc"/>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-lg-3 control-label">Categoria</label>
                                <div class="col-lg-5">
                                  <input type="text" class="form-control" name="categoria" id="categoria" />
                                </div>
                            </div>
                            <div class="form-group">
                                <label class="col-lg-3 control-label">Distribución</label>
                                <div class="col-lg-5">
                                  <select class="form-control" name="pool" id="pool" >
                                        <option value="0">Otros</option>
                                        <option value="1">Pool</option>
                                  </select>
                                </div>
                            </div>
                                 <div class="form-group">
                                <label class="col-lg-3 control-label">Área Origen</label>
                                <div class="col-lg-5">
                                  <select class="form-control" name="area" id="area" >
                                        <option value="0">Seleccionar</option> 
                                  </select>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-lg-3 control-label">Área Asignada</label>
                                <div class="col-lg-5">
                                  <select class="form-control" name="area2" id="area2" >
                                        <option value="0">Seleccionar</option> 
                                  </select>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-lg-3 control-label">Tipo Vehículo</label>
                                <div class="col-lg-5">
                                  <select class="form-control" name="TipoVehiculo" id="TipoVehiculo" >
                                      <option value="0">Seleccionar</option> 
                                      <option value="1">AUTOMOVIL</option> 
                                      <option value="2">BARREDORA</option> 
                                      <option value="3">CAMION</option> 
                                      <option value="4">CAMION TRACTOR</option> 
                                      <option value="5">CAMIONETA</option> 
                                      <option value="6">MINICARGADOR</option> 
                                      <option value="7">MOTO</option> 
                                      <option value="8">VOLQUETE</option> 
                                  </select>
                                </div>
                            </div>

                 <div class="form-group">
                                <label class="col-lg-3 control-label">Modalidad</label>
                                <div class="col-lg-5">
                                  <select class="form-control" name="modalidad" id="modalidad" >
                                        <option value="0">Seleccionar</option>
                                        <option value="1">Planilla</option>
                                      <option value="2">Locador</option>
                                  </select>
                                </div>
                            </div>
                  <br>
                
						
            </div>
        </div>
    </div>
</div>
</form>				  
				  
				  
				  
                </div>
                <div class="box-body pad table-responsive"   style="overflow:scroll;height:700px">
				
					
				
					
	         <table id="tabla"  class="table table-bordered table-hover dataTable no-footer tablesorter" role="grid" aria-describedby="tabla_inventario_info">
				  <thead>
                    <tr  class="cabecera">
                      <th style="text-align:center" >N° </th>
                      <th style="text-align:center" >Departamento </th>
                      <th style="text-align:center" >RUC </th>
                      <th style="text-align:center" >Locador</th>
                      <th style="text-align:center" >Tipo </th>
                      <th style="text-align:center" >Función </th>
                      <th style="text-align:center" >Sueldo </th>
                      <th style="text-align:center" >Orden </th>
                      <th style="text-align:center" >Fecha</th>
                      <th style="text-align:center" >Importe</th>
                      <th style="text-align:center" >Saldo</th>
                    </tr>


					</thead>
                    
                   <tbody id="body">
			   <tr ><td  colspan="11" align="center">No se encontraron resultados</td></tr>		
                  </table>

				  
                </div><!-- /.box -->
              </div>
            </div><!-- /.col -->
          </div><!-- ./row -->

         <div class="modal fade" id="eliminarModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
            
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title" id="myModalLabel">Eliminar Conductor</h4>
                </div>
            
                <div class="modal-body">
                    <p>¿Desea Eliminar el Conductor con N° DNI  <span id="nro_dni"></span> ?</p>
              
                    <p class="debug-url"></p>
                </div>
                
                <div class="modal-footer">
                    <button id="cerrar" type="button" class="btn btn-default" data-dismiss="modal">Cancelar</button>
                    <a class="btn btn-danger btn-ok">Eliminar</a>
                </div>
            </div>
        </div>
    </div>

        </section><!-- /.content -->
	 
	<script src="../js/jquery.uitablefilter.js" ></script>
            
    <script type="text/javascript">
        function carga_submit() {
            $("#choferInsert").submit();
        }

        $(document).ready(function () {
            //Obtener transacciones
            $("#modificar").hide();
            $("#eliminar").hide();

           listar();

            theTable = $("#tabla");
            $("#search").keyup(function () {
                $.uiTableFilter(theTable, this.value);
            });

            listar_gerencia();
        });


        function listar_gerencia() {
            url = document.url;
            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: 'http://' + location.host + '/Services/Maestro.svc/listarGerencia',
                data: '{"empresa": "' + $("#id_empresa").val() + '"}',
                dataType: "json",
                success: function (response) {
                    var customers = eval(response.d);
                    var html = "<option value='' selected> Todas </option>";

                    $.each(customers, function () {
                        html += "<option value='" + this.IdCentroCosto + "'  >" + this.DescripcionCorta + "</option>";
                    });
                    $("#gerencia").html(html == "" ? "" : html);
                },
                error: function (a, b, c) {
                    alert(a.responseText);
                    $("#results").html(a.responseText);
                }
            });

        }

        function listar_departamento() {
            url = document.url;
            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: 'http://' + location.host + '/Services/Maestro.svc/listarDepartamento',
                data: '{"gerencia": "' + $("#gerencia").val() + '","empresa": "' + $("#id_empresa").val() + '"}',
                dataType: "json",
                success: function (response) {
                    var customers = eval(response.d);
                    var html = "<option value='' selected> Todas </option>";
                    $.each(customers, function () {
                        html += "<option value='" + this.IdCentroCosto + "'  >" + this.DescripcionCorta + "</option>";
                    });
                    $("#subgerencia").html(html == "" ? "" : html);
                },
                error: function (a, b, c) {
                    alert(a.responseText);
                    $("#results").html(a.responseText);
                }
            });
        }


        function listar() {

            $("#body_guia").html("<tr><td colspan=11><div align=center ><img src='../images/loader.gif'></div></td></tr>");
            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                data: '{"gerencia": "' + $("#gerencia").val() + '","departamento": "' + $("#subgerencia").val() + '" }',
                url: 'http://' + location.host + '/Services/Maestro.svc/listarLocadorArea',
                dataType: "json",
                success: function (response) {
                    var customers = eval(response.d);
                    var html = "";
                    var xnro = 1;
                    $.each(customers, function () {

                        html += "<tr id='fila" + xnro +
                        "'  onclick=detalle('" + this.pkChofer + "','" + this.IdChofer + "','" + xnro + "') style='cursor:pointer'><td style='text-align:center'>" + xnro + " </td><td style='text-align:center'>" + this.IdChofer + " </td><td style='text-align:left'> " + this.Chofer + "</td><td style='text-align:center'> " +
						this.FechaIngreso + "</td><td  style='text-align:center' >" + this.LicenciaConducir + "</td><td class='suministro' style='text-align:center'>" + this.FechaExpedicion + "</td><td style='text-align:center'>" + this.FechaCaducidad + "</td><td style='text-align:center' class='cantidadsum'>" + this.Categoria + "</td><td style='text-align:center' class='pool'>" + pool + "</td><td style='text-align:left' class='area'>" + area + "</td><td style='text-align:left' class='area2'>" + area2 + "</td><td class='area2'>" + veh + "</td> </tr>";
                        xnro++;
                    });

                    $("#body").html(html == "" ? "<tr><td colspan='11'> <div align=center>No se encontraron resultados</div></td></tr>" : html);
                    $("table").tablesorter();
                },
                error: function (a, b, c) {
                    alert(a.responseText);
                    $("#results").html(a.responseText);
                }
            });

        }























      

        function detalle(pk, u, tipo) {
            $('#tablasum tr').removeClass('highlighted');
            $("#fila" + u).addClass('highlighted');
            $("#cod").val(pk);
            $("#nro_dni").html(cod);
            $("#modificar").show();
            $("#eliminar").show();
            obtener_chofer();
           $("#dni").prop("disabled",true)
        }

        function limpiar() {
            $('#tablasum tr').removeClass('highlighted');
            $("#dni").val("");
            $("#apellido").val("");
            $("#nombre").val("");

            var f = new Date();

            fechaactual = ('0' + f.getDate()).slice(-2).toString()
               + '/' + ('0' + (f.getMonth() + 1)).slice(-2).toString()
               + '/' + f.getFullYear().toString();

            $("#fi").val(fechaactual);
            $("#fe").val(fechaactual);
            $("#fc").val(fechaactual);
            $("#licencia").val("");

            $("#categoria").val("");
            $("#area").val("");
            $("#area2").val("");
            $("#TipoVehiculo").val("0");
            $("#modalidad").val("0");
            $("#dni").prop("disabled",false)
        }





        $("#choferInsert").submit(function (event) {

            if ($("#dni").val() == "")
                alert("Ingrese el N° de DNI");

            else if ($("#apellido").val() == "S")
                alert("Ingrese el Apellido");

            else if ($("#nombre").val() == "")
                alert("Ingrese el Nombre");

            else {
                var ary = $("#choferInsert").serializeArray();
                var obj = {};
                for (var a = 0; a < ary.length; a++)
                    obj[ary[a].name] = ary[a].value;
                $.ajax({
                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    url: 'http://' + location.host + '/Services/Logistica/Transporte.svc/AgregarChofer',
                    data: JSON.stringify(obj),
                    dataType: "json",
                    success: function (response) {

                        if (response.d == 1) {
                            alert("Se registro correctamente");
                            $("#cancelar").click();
                            listar_chofer();
                        }
                        else {
                            alert("Error");
                        }

                    },
                    error: function (a) {
                        alert(a.responseText);
                        $("#results").html(a.responseText);
                    }
                });



            }
            event.preventDefault();

        });

        $(".btn-ok").click(function () {
            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: 'http://' + location.host + '/Services/Logistica/Transporte.svc/EliminarChofer',
                data: '{"dni": "' + $("#cod").val() + '", }',
                dataType: "json",
                success: function (response) {

                    if (response.d == 1) {
                        alert("Se Eliminó correctamente");
                        $(".close").click();
                        listar_chofer();
                    }
                    else {
                        alert("Error");
                    }

                },
                error: function (a) {
                    alert(a.responseText);
                    //$("#results").html(a.responseText);
                }
            });
        });

    </script>
