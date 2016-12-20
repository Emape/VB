<%@ Page Language="VB" AutoEventWireup="false" CodeFile="MantenimientoTransporte.aspx.vb" Inherits="MantenimientoTransporte" %>
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
            Mantenimiento de Vehiculos
          </h1>
         
          <ol class="breadcrumb">
            <li><a href="#"><i class="fa fa-dashboard"></i> Transporte</a></li>
            <li><a href="#"> Documentos</a></li>
            <li class="active"> Mantenimiento</li>
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

                        <div class="col-xs-3">
                        </div>
				 </div>

<form id="mantenimientoInsert" class="form-horizontal" >	
    <input type="hidden" name="cod" id="cod" >
    <input type="hidden" name="xcod" id="xcod" >


<div class="modal fade" id="registrarModal" tabindex="-1" role="dialog" aria-labelledby="Login" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
               
                <h1 class="modal-title" style="font-size:18px;font-weight:bold">Registrar Mantenimiento</h1>
            
            
            <span style="float:right;margin-top:-28px">
                <span id="guardar" class="btn btn-primary" style="font-size:12px" >
                   <i class="fa fa-save"></i> Guardar
                </span>

                <span id="cancelar" data-dismiss="modal" aria-label="Close" class="btn btn-danger" style="font-size:12px" >
                   <i class="fa fa-close"></i> Cancelar
                </span>
                </span>
            </div>

            <div class="modal-body">                           
                             <div class="form-group">
                                <label class="col-lg-3 control-label">Descripción</label>
                                <div class="col-lg-5">
                                    <input type="text" class="form-control" name="descripcion" id="descripcion"/>
                                </div>
                            </div>

							
							<div class="form-group">
                                <label class="col-lg-3 control-label">Tipo</label>
                                <div class="col-lg-5">
                                    <select class="form-control" name="tipo" id="tipo">
                                        <option value=""> Seleccionar </option>
                                        <option value="1"> Mantenimiento Preventivo </option>
                                        <option value="2"> Mantenimiento Correctivo </option>
                                        <option value="3"> Revisión Técnica </option>
                                        <option value="4"> SOAT </option>
                                        <option value="5"> GLP </option>
								    </select>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-lg-3 control-label">Fecha Programada</label>
                                <div class="col-lg-5">
                                    <input type="text" class="form-control" name="fechaprogramada" id="fechaprogramada" readonly style="background:#ddd" />
                                </div>
                            </div>
							
							<div class="form-group">
                                <label class="col-lg-3 control-label">Fecha Pago</label>
                                <div class="col-lg-5">
                                  <input type="text" class="form-control" name="fechapago" id="fechapago"  readonly style="background:#ddd" />
                                </div>
                            </div>
							
							
							<div class="form-group">
                                <label class="col-lg-3 control-label">Presupuesto</label>
                                <div class="col-lg-5">
                                    <input type="text" class="form-control" name="presupuesto" id="presupuesto" />
                                </div>
                            </div>

                            
														
							<div class="form-group">
                                <label class="col-lg-3 control-label">Requerimiento</label>
                                <div class="col-lg-5">
                                    <input type="text" class="form-control" name="requerimiento" id="requerimiento"/>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-lg-3 control-label">RUC Proveedor</label>
                                <div class="col-lg-5">
                                    <input type="text" class="form-control" name="proveedor" id="proveedor"/>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-lg-3 control-label">Recurso</label>
                                <div class="col-lg-5">
                                    <select class="form-control" name="recurso" id="recurso">
                                        <option value=""> Seleccionar </option>
                                        <option value="1"> Empresarial </option>
                                        <option value="2"> Municipal </option>
                                        <option value="3"> Region </option>
                                        <option value="5"> SIAF </option>
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
                <div class="box-body pad table-responsive"   style="overflow:scroll;height:300px">
				
					
				
					
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
                      <th style="text-align:center;width:200px" >Área</th>
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

    <div class="row">
        <div class="col-md-12">
            <div class="box box-primary" style="height:350px">
                <div class="box-body pad table-responsive" style="overflow:scroll;height:350px;display:none">
                    
                        <ul class="nav nav-tabs">
                            <li class="active" id="tab1"><a data-toggle="tab" href="#" >Mantenimiento Preventivo</a></li>
                            <li id="tab2"><a data-toggle="tab" href="#" >Mantenimiento Correctivo</a></li>
                            <li id="tab3"><a data-toggle="tab" href="#">Revisión Técnica</a></li>
                            <li id="tab4"><a data-toggle="tab" href="#">SOAT</a></li>
                            <li id="tab5"><a data-toggle="tab" href="#">GLP</a></li>
                            <span style="float:right">
                            <span id="agregar" class="btn btn-success" title="Agregar" style="display:none;font-size:12px" data-toggle="modal" data-target="#registrarModal" onclick="limpiar()">
                                    <i class="fa fa-plus"></i> 
                            </span>	
                            <span id="modificar" class="btn btn-success" title="Modificar" style="font-size:12px;display:none" data-toggle="modal" data-target="#registrarModal" >
                                    <i class="fa fa-pencil"></i> 
                            </span>
                            <span id="anular" class="btn btn-danger" title="Anular" style="font-size:12px;display:none" data-toggle="modal" data-target="#eliminarModal" >
                                    <i class="fa fa-minus-circle"></i> 
                            </span>
                            </span>
                        </ul>
                      	
<div class="tab-content">
  <div id="div1" class="tab-pane fade in active">
    <p>                    
        <table id="tabla_1" class="table table-bordered table-hover dataTable no-footer">
			        <thead>
                        <tr class="cabecera">
                            <th><b>N°</b> </th>
                            <th><b>Descripción</b> </th>
                            <th><b>Fecha Programada</b> </th>
                            <th><b>Fecha Pago</b> </th>
							<th><b>Presupuesto</b> </th>
                            <th><b>Requerimiento</b> </th>
                            <th><b>Proveedor</b> </th>
                            <th><b>Recurso</b> </th>
                        </tr>
                        </thead>
                        <tbody id="cuerpo_1"><tr><td colspan="9" align="center">No se encontraron resultados</td></tr></tbody>
        </table>	
    </p>
  </div>

<div id="div2" class="tab-pane fade">
    <p>                    
        <table id="tabla_2" class="table table-bordered table-hover dataTable no-footer">
			        <thead>
                        <tr class="cabecera">
                            <th><b>N°</b> </th>
                            <th><b>Descripción</b> </th>
                            <th><b>Fecha Programada</b> </th>
                            <th><b>Fecha Pago</b> </th>
							<th><b>Presupuesto</b> </th>
                            <th><b>Requerimiento</b> </th>
                            <th><b>Proveedor</b> </th>
                            <th><b>Recurso</b> </th>
                        </tr>
                        </thead>
                        <tbody id="cuerpo_2"><tr><td colspan="9" align="center">No se encontraron resultados</td></tr></tbody>
        </table>	
    </p>
  </div>

  <div id="div3" class="tab-pane fade">
 
    <p>
                <table id="table_3" class="table table-bordered table-hover dataTable no-footer">
			        <thead>
                        <tr class="cabecera">
                            <th><b>N°</b> </th>
                            <th><b>Descripción</b> </th>
                            <th><b>Fecha Programada</b> </th>
                            <th><b>Fecha Pago</b> </th>
							<th><b>Presupuesto</b> </th>
                            <th><b>Requerimiento</b> </th>
                            <th><b>Proveedor</b> </th>
                            <th><b>Recurso</b> </th>
                        </tr>
                        </thead>
                        <tbody id="cuerpo_3"><tr><td colspan="3" align="center">No se encontraron resultados</td></tr></tbody>
                </table>	
    </p>
  </div>
  <div id="div4" class="tab-pane fade">

    <p>                <table id="tabla_4" class="table table-bordered table-hover dataTable no-footer">
			        <thead>
                        <tr class="cabecera">
                            <th><b>N°</b> </th>
                            <th><b>Descripción</b> </th>
                            <th><b>Fecha Programada</b> </th>
                            <th><b>Fecha Pago</b> </th>
							<th><b>Presupuesto</b> </th>
                            <th><b>Requerimiento</b> </th>
                            <th><b>Proveedor</b> </th>
                            <th><b>Recurso</b> </th>
                        </tr>
                        </thead>
                        <tbody id="cuerpo_4"><tr><td colspan="3" align="center">No se encontraron resultados</td></tr></tbody>
                </table>	

    </p>
  </div>
  <div id="div5" class="tab-pane fade">
    <p>
                        <table id="tabla_5" class="table table-bordered table-hover dataTable no-footer">
			        <thead>
                        <tr class="cabecera">
                            <th><b>N°</b> </th>
                            <th><b>Descripción</b> </th>
                            <th><b>Fecha Programada</b> </th>
                            <th><b>Fecha Pago</b> </th>
							<th><b>Presupuesto</b> </th>
                            <th><b>Requerimiento</b> </th>
                            <th><b>Proveedor</b> </th>
                            <th><b>Recurso</b> </th>
                        </tr>
                        </thead>
                        <tbody id="cuerpo_5"><tr><td colspan="3" align="center">No se encontraron resultados</td></tr></tbody>
                </table>	
    </p>
  </div>
</div>
                </div><!-- /.box -->
            </div>
        </div><!-- /.col -->
    </div>

     <div class="modal fade" id="eliminarModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
            
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title" id="myModalLabel">Eliminar Registro</h4>
                </div>
            
                <div class="modal-body">
                    <p>¿Desea Eliminar el Registro?</p>
              
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
        $(document).ready(function () {
            $("#tab1").click(function () {
                $("#tab1").addClass("active");
                $("#tab2").removeClass("active");
                $("#tab3").removeClass("active");
                $("#tab4").removeClass("active");
                $("#tab5").removeClass("active");

                $("#div1").addClass("in active");
                $("#div2").removeClass("in active");
                $("#div3").removeClass("in active");
                $("#div4").removeClass("in active");
                $("#div5").removeClass("in active");
            });

            $("#tab2").click(function () {
                $("#tab2").addClass("active");
                $("#tab1").removeClass("active");
                $("#tab3").removeClass("active");
                $("#tab4").removeClass("active");
                $("#tab5").removeClass("active");

                $("#div2").addClass("in active");
                $("#div1").removeClass("in active");
                $("#div3").removeClass("in active");
                $("#div4").removeClass("in active");
                $("#div5").removeClass("in active");
            });

            $("#tab3").click(function () {
                $("#tab3").addClass("active");
                $("#tab1").removeClass("active");
                $("#tab2").removeClass("active");
                $("#tab4").removeClass("active");
                $("#tab5").removeClass("active");

                $("#div3").addClass("in active");
                $("#div1").removeClass("in active");
                $("#div2").removeClass("in active");
                $("#div4").removeClass("in active");
                $("#div5").removeClass("in active");
            });

            $("#tab4").click(function () {
                $("#tab4").addClass("active");
                $("#tab1").removeClass("active");
                $("#tab2").removeClass("active");
                $("#tab3").removeClass("active");
                $("#tab5").removeClass("active");

                $("#div4").addClass("in active");
                $("#div1").removeClass("in active");
                $("#div2").removeClass("in active");
                $("#div3").removeClass("in active");
                $("#div5").removeClass("in active");
            });

            $("#tab5").click(function () {
                $("#tab5").addClass("active");
                $("#tab1").removeClass("active");
                $("#tab2").removeClass("active");
                $("#tab3").removeClass("active");
                $("#tab4").removeClass("active");

                $("#div5").addClass("in active");
                $("#div1").removeClass("in active");
                $("#div2").removeClass("in active");
                $("#div3").removeClass("in active");
                $("#div4").removeClass("in active");
            });

            $("#fechaprogramada").datepicker({
                format: "dd/mm/yyyy",
                todayHighlight: true,
                autoclose: true
            });

            $("#fechapago").datepicker({
                format: "dd/mm/yyyy",
                todayHighlight: true,
                autoclose: true
            });

            var f = new Date();

            fechaactual = ('0' + f.getDate()).slice(-2).toString()
               + '/' + ('0' + (f.getMonth() + 1)).slice(-2).toString()
               + '/' + f.getFullYear().toString();

            $("#fechaprogramada").val(fechaactual);
            $("#fechapago").val(fechaactual);

            listar_vehiculo();

            theTable1 = $("#tablasum");
            $("#search").keyup(function () {
                $.uiTableFilter(theTable1, this.value);
            });
        });

        function listar_vehiculo() {
            url = document.url;
            $("#body_guia").html("<tr><td colspan=11><div align=center ><img src='../images/loader.gif'></div></td></tr>");
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

        function detalle_vehiculo(cod, u) {
            $('#tablasum tr').removeClass('highlighted');
            $("#cod").val(cod);
            $("#fila" + u).addClass('highlighted');
            $("#agregar").show();
            $("#modificar").hide();
            $("#anular").hide();
            $(".table-responsive").show();
            listar_mantenimiento();
        }

        function listar_mantenimiento() {
            url = document.url;
            var html1 = ""; var html2 = ""; var html3 = ""; var html4 = ""; var html5 = "";
            var conta1 = 1; var conta2 = 1; var conta3 = 1; var conta4 = 1; var conta5 = 1;
            $("#cuerpo_1").html("<tr><td colspan=9><div align=center ><img src='../images/loader.gif'></div></td></tr>");
            $("#cuerpo_2").html("<tr><td colspan=9><div align=center ><img src='../images/loader.gif'></div></td></tr>");
            $("#cuerpo_3").html("<tr><td colspan=9><div align=center ><img src='../images/loader.gif'></div></td></tr>");
            $("#cuerpo_4").html("<tr><td colspan=9><div align=center ><img src='../images/loader.gif'></div></td></tr>");
            $("#cuerpo_5").html("<tr><td colspan=9><div align=center ><img src='../images/loader.gif'></div></td></tr>");
            var xnro=0;
            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: 'http://' + location.host + '/Services/Logistica/Transporte.svc/listarMantenimiento',
                data: '{"codigo": "' + $("#cod").val() + '" }',
                dataType: "json",
                success: function (response) {
                    var customers = eval(response.d);
                    $.each(customers, function () {

                        if (this.Recurso == '1')
                            recurso = "Empresarial";
                        else if (this.Recurso == '2')
                            recurso = "Municipal";
                        else if (this.Recurso == '3')
                            recurso = "Regional";
                        else if (this.Recurso == '5')
                            recurso = "SIAF";
                        else
                            recurso = "";

                        if (this.Tipo == '1') {
                            html1 += "<tr id='filad" + xnro + "' onclick=detalle_mantto('" + this.IdMantto + "','" + xnro + "') style='cursor:pointer'><td> " + conta1 + "</td><td> " + this.Descripcion + "</td><td> " + this.FechaProgramada + "</td><td> " + this.FechaPago + "</td><td> S/. " + this.Presupuesto.toFixed(2) + "</td><td> " + this.Requerimiento + "</td><td> " + this.Proveedor + "</td><td> " + recurso + "</td></tr>";
                            conta1++;
                        }
                        if (this.Tipo == '2') {
                            html2 += "<tr id='filad" + xnro + "'  onclick=detalle_mantto('" + this.IdMantto + "','" + xnro + "') style='cursor:pointer'><td> " + conta2 + "</td><td> " + this.Descripcion + "</td><td> " + this.FechaProgramada + "</td><td> " + this.FechaPago + "</td><td> S/. " + this.Presupuesto.toFixed(2) + "</td><td> " + this.Requerimiento + "</td><td> " + this.Proveedor + "</td><td> " + recurso + "</td></tr>";
                            conta2++;
                        }
                        if (this.Tipo == '3') {
                            html3 += "<tr id='filad" + xnro + "'  onclick=detalle_mantto('" + this.IdMantto + "','" + xnro + "') style='cursor:pointer'><td> " + conta3 + "</td><td> " + this.Descripcion + "</td><td> " + this.FechaProgramada + "</td><td> " + this.FechaPago + "</td><td> S/. " + this.Presupuesto.toFixed(2) + "</td><td> " + this.Requerimiento + "</td><td> " + this.Proveedor + "</td><td> " + recurso + "</td></tr>";
                            conta3++;
                        }
                        if (this.Tipo == '4') {
                            html4 += "<tr id='filad" + xnro + "'  onclick=detalle_mantto('" + this.IdMantto + "','" + xnro + "') style='cursor:pointer'><td> " + conta4 + "</td><td> " + this.Descripcion + "</td><td> " + this.FechaProgramada + "</td><td> " + this.FechaPago + "</td><td> S/. " + this.Presupuesto.toFixed(2) + "</td><td> " + this.Requerimiento + "</td><td> " + this.Proveedor + "</td><td> " + recurso + "</td></tr>";
                            conta4++;
                        }
                        if (this.Tipo == '5') {
                            html5 += "<tr id='filad" + xnro + "'  onclick=detalle_mantto('" + this.IdMantto + "','" + xnro + "') style='cursor:pointer'><td> " + conta5 + "</td><td> " + this.Descripcion + "</td><td> " + this.FechaProgramada + "</td><td> " + this.FechaPago + "</td><td> S/. " + this.Presupuesto.toFixed(2) + "</td><td> " + this.Requerimiento + "</td><td> " + this.Proveedor + "</td><td> " + recurso + "</td></tr>";
                            conta5++;
                        }
                        xnro++;
                    });
                    $("#cuerpo_1").html(html1 == "" ? "" : html1);
                    $("#cuerpo_2").html(html2 == "" ? "" : html2);
                    $("#cuerpo_3").html(html3 == "" ? "" : html3);
                    $("#cuerpo_4").html(html4 == "" ? "" : html4);
                    $("#cuerpo_5").html(html5 == "" ? "" : html5);
                },
                error: function (a, b, c) {
                    alert(a.responseText);
                    $("#results").html(a.responseText);
                }
            });

        }

        function detalle_mantto(cod, u) {
            $('#tabla_1 tr,#tabla_2 tr,#tabla_3 tr,#tabla_4 tr,#tabla_5 tr').removeClass('highlighted');
            $("#filad" + u).addClass('highlighted');
            $("#modificar").show();
            $("#anular").show();
            $("#xcod").val(cod);

            obtener_mantenimiento();
        }

        $(".btn-ok").click(function () {
            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: 'http://' + location.host + '/Services/Logistica/Transporte.svc/eliminarMantenimiento',
                data: '{"codigo": "' + $("#xcod").val() + '" }',
                dataType: "json",
                success: function (response) {

                    if (response.d == 1) {
                        alert("Se Eliminó correctamente");
                        $(".close").click();
                        listar_mantenimiento();
                        limpiar();
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

        function obtener_mantenimiento() {
            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: 'http://' + location.host + '/Services/Logistica/Transporte.svc/obtenerMantenimiento',
                data: '{"codigo": "' + $("#xcod").val() + '", }',
                dataType: "json",
                success: function (response) {
                    var customers = eval(response.d);
                    var html = "";
                    var xnro = 1;
                    $.each(customers, function () {
                        $("#descripcion").val(this.Descripcion);
                        $('#recurso').val(this.Recurso);
                        $('#tipo').val(this.Tipo);
                        $("#fechaprogramada").val(this.FechaProgramada);
                        $("#fechapago").val(this.FechaPago);
                        $("#presupuesto").val(this.Presupuesto);
                        $("#requerimiento").val(this.Requerimiento);
                        $("#proveedor").val(this.Proveedor);
                    });
                },
                error: function (a, b, c) {
                    alert(a.responseText);
                    $("#results").html(a.responseText);
                }
            });

        }
        function limpiar() {
            $('#cuerpo_1 tr').removeClass('highlighted');
            $('#cuerpo_2 tr').removeClass('highlighted');
            $('#cuerpo_3 tr').removeClass('highlighted');
            $('#cuerpo_4 tr').removeClass('highlighted');
            $('#cuerpo_5 tr').removeClass('highlighted');

            $("#descripcion").val("");
            $("#tipo").val("");
            $("#xcod").val("");
           
            var f = new Date();

            fechaactual = ('0' + f.getDate()).slice(-2).toString()
               + '/' + ('0' + (f.getMonth() + 1)).slice(-2).toString()
               + '/' + f.getFullYear().toString();

            $("#fechaprogramada").val(fechaactual);
            $("#fechapago").val(fechaactual);

            $("#presupuesto").val("");
            $("#requerimiento").val("");
            $("#proveedor").val("");
            $("#recurso").val("");

            $("#modificar").hide();
            $("#anular").hide();
        }


        $('#guardar').click(function (e) {
            if ($("#descripcion").val() == "")
                alert("Ingrese Descripción");

            else if ($("#tipo").val() == "")
                alert("Seleccione Tipo");

            else if ($("#recurso").val() == "")
                alert("Seleccione Recurso");

            else {
                var ary = $("#mantenimientoInsert").serializeArray();
                var obj = {};
                for (var a = 0; a < ary.length; a++)
                    obj[ary[a].name] = ary[a].value;
                $.ajax({
                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    url: 'http://' + location.host + '/Services/Logistica/Transporte.svc/RegistrarMantenimiento',
                    data: JSON.stringify(obj),
                    dataType: "json",
                    success: function (response) {

                        if (response.d == 1) {
                            alert("Se registro correctamente");
                            $("#cancelar").click();
                            listar_mantenimiento();
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
        });

    </script>

