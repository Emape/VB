<%@ Page Language="VB" AutoEventWireup="false" CodeFile="Ordensuministro.aspx.vb" Inherits="Home_ordensuministro" %>

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

   <section class="content-header">
    
          <h1 style="font-size:18px;font-weight:bold">
            Orden de Suministro
          </h1>
         
          <ol class="breadcrumb">
            <li><a href="#"><i class="fa fa-dashboard"></i> Tranporte</a></li>
            <li><a href="#">Documentos</a></li>
            <li class="active">Orden de Sumnistro</li>
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
					 &nbsp;  Buscar : 
                    <input type="hidden" name="del_idtipomovimientostock" value="I">                

					<input type=text name="search" id="search" aria-controls="tabla_inventario" class="form-control input-sm">
					</div>
					</div>


                         
                        <div class="col-xs-2">
					<div class="dataTables_length">
					 &nbsp;  Mes:                                  

					<select style="width:100px" name="mes" id="mes" aria-controls="tabla_inventario" class="form-control input-sm" onchange="listar_combustible()">
                            <option value ="1"> Enero </option>
                            <option value ="2"> Febrero </option>
                            <option value ="3"> Marzo </option>
                            <option value ="4"> Abril </option>
                            <option value ="5"> Mayo </option>
                            <option value ="6"> Junio </option>
                            <option value ="7"> Julio </option>
                            <option value ="8"> Agosto </option>
                            <option value ="9"> Setiembre </option>
                            <option value ="10"> Octubre </option>
                            <option value ="11"> Noviembre </option>
                            <option value ="12"> Diciembre </option>

                        </select>
					</div>
					</div>

                                             <div class="col-xs-2">
					<div class="dataTables_length">
					 &nbsp;  Año :           
					
					<select onchange="listar_combustible()" style='width:80px'name="anno" id="anno" aria-controls="tabla_inventario" class="form-control input-sm">
                            <option value ="2015"> 2015 </option>
                            <option selected value="2016"> 2016 </option>
                            <option value ="2017"> 2017 </option>
                    </select>
					</div>
					</div>


                        <div class="col-xs-3">
                        </div>
                        <div class="cols-xs-3" align="right" style="margin-right:32px;">
                        <div class="dataTables_length">
                        
                            <span title="Suministro" id="suministro" class="btn btn-primary" style="font-size:12px" data-toggle="modal" data-target="#guiaiInsertModal" >
                            <i  class="fa fa-filter" ></i> &nbsp; Orden de Suministro
                        </span>
                            &nbsp;

                        </div>
                        </div>
				 </div>

<form id="combustibleInsert" class="form-horizontal" >	
    <input type="hidden" name="nroreg" id="nroreg" >
<div class="modal fade" id="guiaiInsertModal" tabindex="-1" role="dialog" aria-labelledby="Login" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
               
                <h1 class="modal-title" style="font-size:18px;font-weight:bold">Registrar Orden de Suministro</h1>
            
            
            <span style="float:right;margin-top:-28px">
                <span id="guardar" class="btn btn-primary" style="font-size:12px" onclick="carga_submit()" >
                   <i class="fa fa-save"></i> &nbsp; Guardar
                </span>

                <span id="cancelar" data-dismiss="modal" aria-label="Close" class="btn btn-danger" style="font-size:12px" >
                   <i class="fa fa-close"></i> &nbsp; Cancelar
                </span>
                </span>
            

            
            </div>

            <div class="modal-body">
          
                        		
                             <div class="form-group">
                                <label class="col-lg-3 control-label">N° de Registro</label>
                                <div class="col-lg-5">
                                    <span style="font-size:14px;font-weight:bold" id="name_guia"></span>
                                     </div>
                            </div>
                             
                             
                             <div class="form-group">
                                <label class="col-lg-3 control-label">N° Orden de Suministro</label>
                                <div class="col-lg-5">
                                    <input type="text" class="form-control" name="osuministro" id="osuministro"/>
                                </div>
                            </div>
							
							<div class="form-group">
                                <label class="col-lg-3 control-label">Tipo Combustible</label>
                                <div class="col-lg-5">
                                    <select class="form-control" name="tipo" id="tipo">
                                        <option value=""> Seleccionar </option>
								    </select>
                                </div>
                            </div>
							
							<div class="form-group">
                                <label class="col-lg-3 control-label">Fecha Suministro</label>
                                <div class="col-lg-5">
                                  <input readonly style="border-color:#00a65a;background-color:#ffffff" type="text" class="form-control" name="fechap" id="fechap"/>
                                </div>
                            </div>
							
							
							<div class="form-group">
                                <label class="col-lg-3 control-label">Cantidad (Gal)</label>
                                <div class="col-lg-5">
                                    <input type="text" class="form-control" name="cantidadg" id="cantidadg"/>
                                </div>
                            </div>

                            
														
							<div class="form-group">
                                <label class="col-lg-3 control-label">Importe Entregado</label>
                                <div class="col-lg-5">
                                    <input type="text" class="form-control" name="importe" id="importe"/>
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
				
					
				
					
	         <table id="tablasum"  class="table table-bordered table-hover dataTable no-footer" role="grid" aria-describedby="tabla_inventario_info">
				  <thead>
                    <tr  class="cabecera">
                      <th style="text-align:center" >N° Registro</th>
                      <th style="text-align:center" >DNI - Conductor </th>
                      <th style="text-align:center" >Placa </th>
                      <th style="text-align:center" >Fecha de Salida </th>
                      <th style="text-align:center" >N° Suministro  </th>
                      <th style="text-align:center" >Tipo Combustible </th>
                      <th style="text-align:center" >Cantidad (Gal) </th>
                      <th style="text-align:center" >Importe (s/.)</th>
                      <th style="text-align:center" >Fecha de Suministro </th>
                      <th style="text-align:center" >Imagen </th>
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
	 
	<script src="../js/jquery.uitablefilter.js" ></script>
            
    <script type="text/javascript">
        function carga_submit() {
            $("#combustibleInsert").submit();
        }

        $(document).ready(function () {
            //Obtener transacciones
            $("#suministro").hide();
           
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


            listar_combustible();
            listar_tipo_combustible();

            theTable = $("#tabla_articulo");
            $("#search_req").keyup(function () {
                $.uiTableFilter(theTable, this.value);
            });

            theTable1 = $("#tablasum");
            $("#search").keyup(function () {
                $.uiTableFilter(theTable1, this.value);
            });



        });



        function listar_combustible() {

            $("#body_guia").html("<tr><td colspan=10><div align=center ><img src='../images/loader.gif'></div></td></tr>");
            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: 'http://isis:88/Services/Logistica/Transporte.svc/listarCombustible',
                data: '{"anno": "' + $("#anno").val() + '","mes": "' + $("#mes").val() + '"}',
                dataType: "json",
                success: function (response) {
                    var customers = eval(response.d);
                    var html = "";
                    var xnro = 0;
                    $.each(customers, function () {
                        //<td> " + this.Estado + "</td>
                        html += "<tr id='fila" + xnro +
                        "' class=getsum onclick=detalle_guia('" + this.Idmc + "','" + xnro + "') style='cursor:pointer'><td style='text-align:center'>"
                        + this.Idmc + " </td><td style='text-align:left'> " + this.Chofer + "</td><td > " +
						this.Placa + "</td><td>" + this.Fecha + "</td><td class='suministro'>" + this.Suministro + "</td><td>" + this.TipoCombustible + "</td><td style='text-align:right' class='cantidadsum'>" + this.CantidadSum + "</td><td style='text-align:right' class='importesum'>" + this.ImporteSum + "</td><td class='fechasum'>" + this.FechaSum + "</td><td class='IdTipoCombustible' style='display:none'>" + this.IdTipoCombustible + "</td> ";
                        
                        if (this.IdFoto != "")
                            html += "<td ><a class='fancybox-effects-a' href='http://172.16.10.83/VB/Container/" + this.IdFoto + "' ><span title='Imagen' id='image' class='btn btn-primary' style='font-size: 12px;' ><i class='fa fa-file-picture-o'></i> </span></a></td>";
                        else
                            html += "<td ></td >";
                        html += "</tr>";
                        xnro++;
                    });

                    $("#body_guia").html(html == "" ? "<tr><td colspan='10'> <div align=center><br>No se encontraron resultados</div></td></tr>" : html);
                },
                error: function (a, b, c) {
                    alert(a.responseText);
                    $("#results").html(a.responseText);
                }
            });

        }

        function listar_tipo_combustible() {

            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: 'http://isis:88/Services/Logistica/Transporte.svc/listarTipoCombustible',
                dataType: "json",
                success: function (response) {
                    var customers = eval(response.d);
                    var html = "<option value='S' selected> Seleccionar </option>";

                    $.each(customers, function () {
                        html += "<option value='" + this.IdTipoCombustible + "'  >" + this.Descripcion + "</option>";
                    });
                    $("#tipo").html(html == "" ? "" : html);
                },
                error: function (a, b, c) {
                    alert(a.responseText);
                    $("#results").html(a.responseText);
                }
            });

        }

        function detalle_guia(ord, u) {
            $('#tablasum tr').removeClass('highlighted');
            $("#fila" + u).addClass('highlighted');
            $("#name_guia").html(ord);
            $("#txt_req").val(ord);
            $("#nroreg").val(ord);
            $("#suministro").show();
            $("#imprimir").show();


            
        }

        function subtot(u) {
            var subtotal = $('#cantidad' + u).val() * $('#cu' + u).val();
            $('#subtotal' + u).val(parseFloat(subtotal).toFixed(2));
            $("#TotalCosto").val(parseFloat(subtotal).toFixed(2));
        }

        $("#combustibleInsert").submit(function (event) {

            if ($("#osuministro").val() == "")
                alert("Ingrese el N° de Orden de Suministro");

            else if ($("#tipo").val() == "S")
                alert("Seleccione el Tipo de Combustible");

            else if ($("#fechap").val() == "")
                alert("Ingrese la fecha de suministro");

            else if ($("#cantidadg").val() == "")
                alert("Ingrese la cantidad");

            else if ($("#importe").val() == "")
                alert("Ingrese el importe");


            else {
                var ary = $("#combustibleInsert").serializeArray();
                var obj = {};
                for (var a = 0; a < ary.length; a++)
                    obj[ary[a].name] = ary[a].value;
                $.ajax({
                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    url: 'http://isis:88/Services/Logistica/Transporte.svc/EditarSuministro',
                    data: JSON.stringify(obj),
                    dataType: "json",
                    success: function (response) {

                        if (response.d == 1) {
                            alert("Se registro correctamente");
                            $("#cancelar").click();
                            listar_combustible();
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

    </script>