<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Vehiculo.aspx.vb" Inherits="Home_Vehiculo" %>
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
/*
@import url(http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700,300italic,400italic);
.tabla {
  margin: 0 auto;
}
.tabla thead {
  cursor: pointer;
  background: rgba(0, 0, 0, .2);
}
.tabla thead tr th { 
  font-weight: bold;
  padding: 10px 20px;
}
.tabla thead tr th span { 
  padding-right: 20px;
  background-repeat: no-repeat;
  background-position: 100% 55%;
}
.tabla thead tr th.headerSortUp,
.tabla thead tr th.headerSortDown {
  background: rgba(0, 0, 0, .2);
}
.tabla thead tr th.headerSortUp span {
  background-image: url('http://tablesorter.com/themes/blue/asc.gif') !important;
}
.tabla thead tr th.headerSortDown span {
  background-image: url('http://tablesorter.com/themes/blue/desc.gif') !important;
}
.tabla tbody tr td {
  text-align: center;
  padding: 10px 20px;
}
.tabla tbody tr td.align-left {
  text-align: left;
}*/


	</style>

   <section class="content-header">
    
          <h1 style="font-size:18px;font-weight:bold">
            Vehiculos
          </h1>
         
          <ol class="breadcrumb">
            <li><a href="#"><i class="fa fa-dashboard"></i> Maestro</a></li>
            <li><a href="#">Transporte</a></li>
            <li class="active">Vehiculos</li>
          </ol>
        </section>

        <!-- Main content -->
        <section class="content">
          
            <div class="row">
            <div class="col-md-12">

              <div class="box box-primary">
                <div class="box-header">
                 
				  
                     <div class="row">
										
					<div class="col-xs-1">
					<div class="dataTables_length">
					 &nbsp;  Buscar : 
                    <input type="hidden" name="del_idtipomovimientostock" value="I">                
					</div>
					</div>


					<div class="col-xs-2">
					<div class="dataTables_length">
					<input type=text name="search" id="search" aria-controls="tabla_inventario" class="form-control input-sm">

                      
					</div>
					</div>

                         				<div class="col-xs-2">
					<div class="dataTables_length">
					
                        <select name="estado" id="estado" aria-controls="tabla_inventario" class="form-control input-sm" onchange="listar_vehiculo()">
                            <option value="A">Activo</option>
                            <option value="I">Inactivo</option>
                            </select>
					</div>
					</div>

                        <div class="col-xs-3">
                        </div>
                        <div class="cols-xs-3" align="right" style="margin-right:32px;">
                        <div class="dataTables_length">
                            <span title="Agregar" id="agregar" class="btn btn-primary" style="font-size:12px" data-toggle="modal" data-target="#agregarModal" onclick="limpiar()" >
                            <i  class="fa fa-plus" ></i>
                            </span>
                            <span title="Modificar" id="modificar" class="btn btn-primary" style="font-size:12px" data-toggle="modal" data-target="#agregarModal" >
                            <i  class="fa fa-pencil" ></i>
                            </span>
                            <span title="Eliminar" id="eliminar" class="btn btn-danger" style="font-size:12px" data-toggle="modal" data-target="#eliminarModal" >
                            <i  class="fa fa-minus-circle" ></i>
                            </span>
                            &nbsp;

                        </div>
                        </div>


				 </div>

<form id="vehiculoInsert" class="form-horizontal" >	
    <input type="hidden" name="cod" id="cod" >
<div class="modal fade" id="agregarModal" tabindex="-1" role="dialog" aria-labelledby="Login" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
               
                <h1 class="modal-title" style="font-size:18px;font-weight:bold">Registrar Vehículos</h1>
            
            
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
                                <label class="col-lg-3 control-label">Placa</label>
                                <div class="col-lg-5">
                                    <input type="text" class="form-control" name="placa" id="placa"/>
                                </div>
                            </div>

							
							<div class="form-group">
                                <label class="col-lg-3 control-label">Recurso</label>
                                <div class="col-lg-5">
                                    <select class="form-control" name="recurso" id="recurso">
                                        <option value=""> Seleccionar </option>
                                        <option value="1"> Empresarial </option>
                                        <option value="2"> Municipal </option>
								    </select>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-lg-3 control-label">Marca</label>
                                <div class="col-lg-5">
                                    <select class="form-control" name="marca" id="marca">
                                        <option value=""> Seleccionar </option>
								    </select>
                                </div>
                            </div>
							
							<div class="form-group">
                                <label class="col-lg-3 control-label">Modelo</label>
                                <div class="col-lg-5">
                                  <input  type="text" class="form-control" name="modelo" id="modelo" />
                                </div>
                            </div>
							
							
							<div class="form-group">
                                <label class="col-lg-3 control-label">Año</label>
                                <div class="col-lg-5">
                                    <input type="text" class="form-control" name="anno" id="anno" />
                                </div>
                            </div>

                            
														
							<div class="form-group">
                                <label class="col-lg-3 control-label">Alquilado</label>
                                <div class="col-lg-5">
                                    <input type="checkbox" name="alquilado" id="alquilado" onclick="flag()" />
                                    <input type="hidden" name="txtalquilado" id="txtalquilado" value="N" />
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-lg-3 control-label">Color</label>
                                <div class="col-lg-5">
                                    <input type="text" class="form-control" name="color" id="color"/>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-lg-3 control-label">Capacidad</label>
                                <div class="col-lg-5">
                                    <input type="text" class="form-control" name="capacidad" id="capacidad"/>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-lg-3 control-label">Combustible</label>
                                <div class="col-lg-5">
                                    <select class="form-control" name="combustible" id="combustible">
                                        <option value=""> Seleccionar </option>
                                         <option value="D2"> D2 </option>
                                        <option value="G-95"> G-95 </option>
                                         <option value="G-90"> G-90 </option>
                                        <option value="DUAL (G-90)"> DUAL (G-90) </option>

								    </select>
                                </div>
                            </div>

                             <div class="form-group">
                                <label class="col-lg-3 control-label">Área</label>
                                <div class="col-lg-5">
                                  <select class="form-control" name="area" id="area" >
                                        <option value="0">Seleccionar</option> 
                                  </select>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-lg-3 control-label">Area Alternativa</label>
                                <div class="col-lg-5">
                                  <input type="text" class="form-control" name="area2" id="area2">
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
				
					
				
					
	         <table id="tablasum"  class="table table-bordered table-hover dataTable no-footer tablesorter" role="grid" aria-describedby="tabla_inventario_info">
				  <thead>
                    <tr  class="cabecera">
                      <th style="text-align:center" >N°</th>
                      <th style="text-align:center" >Placa </th>
                      <th style="text-align:center" >Recurso </th>
                      <th style="text-align:center" >Marca </th>
                      <th style="text-align:center" >Modelo </th>
                      <th style="text-align:center" >Año de Vehiculo </th>
                      <th style="text-align:center" >Alquilado</th>
                      <th style="text-align:center" >Color </th>
                      <th style="text-align:center" >Capacidad</th>
                      <th style="text-align:center" >Combustible </th>
                      <th style="text-align:center" >Área</th>
                      <!-- <th width="10px">Estado </th>-->
                    </tr>
					</thead>
                    
                   <tbody id="body_guia">
			   <tr ><td  colspan="10" align="center">No se encontraron resultados</td></tr>		
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
                    <h4 class="modal-title" id="myModalLabel">Eliminar Vehiculo</h4>
                </div>
            
                <div class="modal-body">
                    <p>¿Desea Eliminar el vehiculo <!--con N° de placa  <span id="nro_placa"></span>-->?</p>
              
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
        function flag() {
            
        }
        function carga_submit() {
            $("#vehiculoInsert").submit();
        }

        $(document).ready(function () {
            //Obtener transacciones
            listar_cc();
            $("#alquilado").on('change', function () {
                if ($(this).is(':checked')) {
                    $("#txtalquilado").val("S");
                } else {
                    $("#txtalquilado").val("N");
                }
            });

            listar_marca();
            $("#modificar").hide();
            $("#eliminar").hide();

            $("#fechap").datepicker({
                format: "dd/mm/yyyy",
                todayHighlight: true,
                autoclose: true
            });

            $("input").on('keyup', function () {
                subtot();
            }).keyup();


            var f = new Date();

            fechaactual = ('0' + f.getDate()).slice(-2).toString()
               + '/' + ('0' + (f.getMonth() + 1)).slice(-2).toString()
               + '/' + f.getFullYear().toString();

            $("#fecha").val(fechaactual);


            listar_vehiculo();

            theTable = $("#tabla_articulo");
            $("#search_req").keyup(function () {
                $.uiTableFilter(theTable, this.value);
            });

            theTable1 = $("#tablasum");
            $("#search").keyup(function () {
                $.uiTableFilter(theTable1, this.value);
            });



        });


        function listar_marca() {
            url = document.url;
            $("#body_guia").html("<tr><td colspan=10><div align=center ><img src='../images/loader.gif'></div></td></tr>");
            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: 'http://' + location.host + '/Services/Logistica/Transporte.svc/listarMarca',
                dataType: "json",
                success: function (response) {
                    var customers = eval(response.d);
                    var html = "<option value='' selected> Seleccionar </option>";

                    $.each(customers, function () {

                        //<td> " + this.Estado + "</td>
                        html += "<option value='" + this.IdMarca + "'  >" + this.Descripcion + "</option>";

                    });
                    $("#marca").html(html == "" ? "" : html);
                },
                error: function (a, b, c) {
                    alert(a.responseText);
                    $("#results").html(a.responseText);
                }
            });

        }

        function listar_vehiculo() {
            url = document.url;
            $("#body_guia").html("<tr><td colspan=11><div align=center ><img src='../images/loader.gif'></div></td></tr>");
            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                data: '{"estado": "' + $("#estado").val() + '", }',
                url: 'http://' + location.host + '/Services/Logistica/Transporte.svc/listarVehiculo',
                dataType: "json",
                success: function (response) {
                    var customers = eval(response.d);
                    var html = "";
                    var xnro = 1;
                    $.each(customers, function () {
                        if (this.IdRecurso == '1')
                            recurso = "Empresarial";
                        else if (this.IdRecurso == '2')
                            recurso = "Municipal";
                        else
                            recurso = "";
                        if (this.Area == null) area = ""; else area = this.Area;
                        html += "<tr id='fila" + xnro +
                        "'  onclick=detalle_vehiculo('" + this.id + "','" + xnro + "') style='cursor:pointer'><td style='text-align:center'>"
                        + xnro + " </td><td style='text-align:center'>"
                        + this.IdPlaca + " </td><td style='text-align:left'> " + recurso + "</td><td > " +
						this.IdMarca + "</td><td class='suministro'>" + this.Modelo + "</td><td style='text-align:center'>" + this.AnnoVehiculo + "</td><td style='text-align:center' class='cantidadsum'>" + this.FlagAlquilado + "</td><td style='text-align:center' >" + this.Color + "</td><td style='text-align:center'>" + this.CapacidadTanque + "</td><td style='text-align:center'>" + this.TipoCombustible + "</td><td style='text-align:center'>" + area + "</td> </tr>";
                        xnro++;
                    });

                    $("#body_guia").html(html == "" ? "<tr><td colspan='11'> <div align=center><br>No se encontraron resultados</div></td></tr>" : html);

                    $("table").tablesorter();
                },
                error: function (a, b, c) {
                    alert(a.responseText);
                    $("#results").html(a.responseText);
                }
            });

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
            $("#categoria").val("0");
        }

        function detalle_vehiculo(cod, u) {
            $('#tablasum tr').removeClass('highlighted');
            $("#fila" + u).addClass('highlighted');
            $("#nro_placa").html(cod);
            $("#cod").val(cod);
            $("#modificar").show();
            $("#eliminar").show();
            obtener_vehiculo();
        }

        function obtener_vehiculo() {
            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: 'http://' + location.host + '/Services/Logistica/Transporte.svc/obtenerVehiculo',
                data: '{"placa": "' + $("#cod").val() + '", }',
                dataType: "json",
                success: function (response) {
                    var customers = eval(response.d);
                    var html = "";
                    var xnro = 1;
                    $.each(customers, function () {
                        $("#placa").val(this.IdPlaca);
                        $('#recurso > option[value="' + this.IdRecurso + '"]').attr('selected', 'selected');
                        $('#marca > option[value="' + this.IdMarca + '"]').attr('selected', 'selected');
                        $("#modelo").val(this.Modelo);
                        $("#anno").val(this.AnnoVehiculo); 
                        $('#area > option[value="' + $.trim(this.Area) + '"]').attr('selected', 'selected');
                        $("#area2").val(this.Area2);
                        $("#txtalquilado").val(this.FlagAlquilado);

                        if (this.FlagAlquilado == 'N')
                            $("#alquilado").prop("checked", false);
                        else
                            $("#alquilado").prop("checked", true);

                        $("#color").val(this.Color);
                        $("#capacidad").val(this.CapacidadTanque);
                        $('#combustible > option[value="' + this.TipoCombustible + '"]').attr('selected', 'selected');

                    });
                },
                error: function (a, b, c) {
                    alert(a.responseText);
                    $("#results").html(a.responseText);
                }
            });

        }

        function listar_cc() {
            url = document.url;
            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: 'http://' + location.host + '/Services/Logistica/Transporte.svc/listarCC',
                dataType: "json",
                success: function (response) {
                    var customers = eval(response.d);
                    var html = "<option value='' selected> Seleccionar </option>";

                    $.each(customers, function () {

                        //<td> " + this.Estado + "</td>
                        html += "<option value='" + this.IdCentroCosto + "'  >" + this.Descripcion + "</option>";

                    });
                    $("#area").html(html == "" ? "" : html);
                },
                error: function (a, b, c) {
                    alert(a.responseText);
                    $("#results").html(a.responseText);
                }
            });

        }
        function subtot(u) {
            var subtotal = $('#cantidad' + u).val() * $('#cu' + u).val();
            $('#subtotal' + u).val(parseFloat(subtotal).toFixed(2));
            $("#TotalCosto").val(parseFloat(subtotal).toFixed(2));
        }

        $("#vehiculoInsert").submit(function (event) {

            if ($("#placa").val() == "")
                alert("Ingrese el N° de placa");

            else if ($("#recurso").val() == "")
                alert("Seleccione el Recurso");

            else if ($("#marca").val() == "")
                alert("Seleccione la Marca");

            else if ($("#combustible").val() == "")
                alert("Seleccione el combustible");

            else {
                var ary = $("#vehiculoInsert").serializeArray();
                var obj = {};
                for (var a = 0; a < ary.length; a++)
                    obj[ary[a].name] = ary[a].value;
                $.ajax({
                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    url: 'http://' + location.host + '/Services/Logistica/Transporte.svc/AgregarVehiculo',
                    data: JSON.stringify(obj),
                    dataType: "json",
                    success: function (response) {

                        if (response.d == 1) {
                            alert("Se registro correctamente");
                            $("#cancelar").click();
                            listar_vehiculo();
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
                url: 'http://' + location.host + '/Services/Logistica/Transporte.svc/eliminarVehiculo',
                data: '{"placa": "' + $("#cod").val() + '", }',
                dataType: "json",
                success: function (response) {

                    if (response.d == 1) {
                        alert("Se Eliminó correctamente");
                        $(".close").click();
                        listar_vehiculo();
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