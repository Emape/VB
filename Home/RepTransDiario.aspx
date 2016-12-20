<%@ Page Language="VB" AutoEventWireup="false" CodeFile="~/Home/RepTransDiario.aspx.vb" Inherits="RepTransDiario" %>
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
            
              Reporte Diario
          </h1>
         
          <ol class="breadcrumb">
            <li><a href="#"><i class="fa fa-dashboard"></i> Transporte</a></li>
            <li><a href="#">Reporte</a></li>
            <li class="active">Diario</li>
          </ol>
        </section>

        <!-- Main content -->
        <section class="content">
          
            <div class="row">
            <div class="col-md-12">

              <div class="box box-primary">
                <div class="box-header">
                 
				  


             <form id="form1" runat="server">
                       
                     <div class="row">
										
					<!--<div class="col-xs-2">
					<div class="dataTables_length">
					 &nbsp;  Fecha:  -->                                

					<asp:TextBox name="search" id="search" runat="server" aria-controls="tabla_inventario" class="form-control input-sm" style="display:none" />
					<!--</div>
					</div>-->


                        <div class="col-xs-2">
					<div class="dataTables_length">
					 &nbsp;  Mes:                                  

					<asp:dropdownlist style="width:100px" runat="server" name="mes0" id="mes0" aria-controls="tabla_inventario" class="form-control input-sm" onchange="listar_combustible()">
                            <asp:listitem value ="1"> Enero </asp:listitem >
                            <asp:listitem value ="2"> Febrero </asp:listitem >
                            <asp:listitem value ="3"> Marzo </asp:listitem >
                            <asp:listitem value ="4"> Abril </asp:listitem >
                            <asp:listitem value ="5"> Mayo </asp:listitem >
                            <asp:listitem value ="6"> Junio </asp:listitem >
                            <asp:listitem value ="7"> Julio </asp:listitem >
                            <asp:listitem value ="8"> Agosto </asp:listitem >
                            <asp:listitem value ="9"> Setiembre </asp:listitem >
                            <asp:listitem value ="10"> Octubre </asp:listitem >
                            <asp:listitem value ="11"> Noviembre </asp:listitem >
                            <asp:listitem value ="12"> Diciembre </asp:listitem >

                        </asp:dropdownlist>
					</div>
					</div>
                    
                    <div class="col-xs-2">
					<div class="dataTables_length">
					 &nbsp;  Año:                                  

					         <asp:dropdownlist style="width:100px" runat="server" name="anio0" id="anio0" aria-controls="tabla_inventario" class="form-control input-sm"  onchange="listar_combustible()">
                            <asp:listitem value ="2015"> 2015 </asp:listitem >
                            <asp:listitem selected value ="2016"> 2016 </asp:listitem >
                            <asp:listitem value ="2017"> 2017 </asp:listitem >
                            <asp:listitem value ="2018"> 2018 </asp:listitem >
                            <asp:listitem value ="2019"> 2019 </asp:listitem >
                            <asp:listitem value ="2020"> 2020 </asp:listitem >
                           

                        </asp:dropdownlist>
					</div>
					</div>

                    <div class="col-xs-2">
					<div class="dataTables_length">
					 &nbsp;  Placa:                                  
					
					<asp:TextBox name="placas" id="placas" runat="server" aria-controls="tabla_inventario" class="form-control input-sm" />
					</div>
					</div>



                        <div class="col-xs23">
                        </div>
                        <div class="cols-xs-1" align="right" style="margin-right:32px;">
                        <div class="dataTables_length">
                        <span title="Agregar" id="agregar" class="btn btn-primary" style="font-size: 12px; display: inline-block;" data-toggle="modal" data-target="#registroInsertModal">
                            <i class="fa fa-plus"></i> &nbsp; Agregar
                        </span>


                            
                          <span title="Modificar" id="modificar" class="btn btn-warning" style="font-size: 12px; display: none;" data-toggle="modal" data-target="#registroUpdateModal">
                            <i class="fa fa-pencil"></i> &nbsp; Modificar</span>

                          <!--<span title="Imagen" id="image" class="btn btn-info" style="font-size: 12px; display: none;" data-toggle="modal" data-target="#registroUpdateModal">
                            <i class="fa fa-file-picture-o"></i> &nbsp; Imagen</span>-->

                         <asp:Button style="display:none" ID="btn_r1" Text="Exportar" runat="server" OnClick="Exportr1" />
                            <span title="imprimir" onclick="imprimir_excel()" id="imprimir" class="btn btn-success" style="font-size:12px;display:none" >
                            <i  class="fa fa-print" ></i> &nbsp; Imprimir
                        </span>
                            &nbsp;

                        </div>
                        </div>


				 </div>

		  </form>
				  
				  
				  
                </div>
                <div class="box-body pad table-responsive"   style="overflow:scroll;height:700px">
				
					
				
					
	         <table id="tablasum"  class="table table-bordered table-hover dataTable no-footer" role="grid" aria-describedby="tabla_inventario_info">
				  <thead>
                    <tr  class="cabecera">
                      
                      <th style="text-align:center" >DNI - Conductor </th>
                      <th style="text-align:center;width:50px" >Placa</th>
                      <th style="text-align:center" >Tipo </th>
                      <th style="text-align:center" >Kilometraje </th>
                      
                      <th style="text-align:center" >Combustible </th>
                      <th style="text-align:center" >Destino  </th>
                      <th style="text-align:center" >Observación </th>
                      <th style="text-align:center" >Fecha </th>
                        <th style="text-align:center" >Foto </th>
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
	 
<div class="modal fade" id="registroInsertModal" tabindex="-1" role="dialog" aria-labelledby="Login" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button id=cerrar type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title">Registrar Movimiento</h4>
            </div>

            <div class="modal-body">
            
            <form id="Form" name=="Form" method="post" action="./controller/c_inventario.php" class="form-horizontal">
							<input type="hidden" name="cond" id="cond" value=1>

							<input type="hidden" name="completo" id="completo" >
							<div class="form-group">
                                
                                <div class="col-lg-12" align=center>
								<div id="imagen">
								
								</div>
                                   
								   
								   </div>
                                
                            </div>
							<br>

                                                        <div class="form-group">
                                <label class="col-lg-2 control-label">Fecha</label>
                                <div class="col-lg-3">
                                   <input readonly style="width:100%;background-color:#eee" type="text" class="form-control" name="fec" id="fec"/>
                                </div>
                                
                            </div>

                            <div class="form-group">
                                <label class="col-lg-2 control-label">Código</label>
                                <div class="col-lg-3">
                                   <input disabled style="width:100%;" type="text" class="form-control" name="cod" id="cod"/>
                                </div>
                                <label class="col-lg-2 control-label">Placa</label>
                                <div class="col-lg-3">
                                    <input type="text" class="form-control" name="placa" id="placa" maxlength="8" />
                                </div>
                            </div>
							
							<div class="form-group">
                                
                                <div class="col-lg-12">
                                  <div id="msgplaca"></div>
                                </div>
                               </div>
                      
							
							<div id="p1"  style="display:none">
							<div class="form-group" >
                                <label class="col-lg-2 control-label">Chofer</label>
                                <div class="col-lg-3">
                                   <input  type="text" class="form-control" name="chofer" id="chofer" maxlength="8" />
                                </div>
                                <label class="col-lg-2 control-label">Tipo</label>
                                <div class="col-lg-3">
                                    <select  onchange="cargar_p2()" class="form-control" name="tipo" id="tipo" >
                                        <option value="0" selected="selected" > Seleccionar </option>  
										<option value="1"> Ingreso </option> 
										<option value="2"> Salida </option> 
                                    </select>
                                </div>
                            </div>
							
							<div class="form-group">
                                
                                <div class="col-lg-12">
                                  <div id="msgchofer"></div>
                                </div>
                               </div>
							   
							   
							   
                            </div>
							
							<div id="p2" class="form-group" style="display:none;margin:2px">
							<div class="form-group">
                                <label class="col-lg-2 control-label"> Kilometraje <input onclick="chkx()" type="checkbox"  name="chk" id="chk"/></label>
                                <div class="col-lg-3">
                                   <input  type="text" class="form-control" name="kilometraje" id="kilometraje"/>
								   <input  type="hidden" class="form-control" name="maximo" id="maximo"/>
								    </div>
                                
                            </div>
							
							
							<div class="form-group">
                                <label class="col-lg-2 control-label">Combustible</label>
                                <div class="col-lg-3">
                                   <select  class="form-control" name="combustible" id="combustible">
                                        <option value="0"> Seleccionar </option>  
										<option value="1"> Menos 1/4 </option> 
										<option value="2"> 1/4 </option> 
										<option value="3"> 1/2 </option> 
										<option value="4"> 3/4 </option> 
										<option value="5"> Mas 3/4 </option> 
                                    </select>
                                </div>
                                
                                <div class="col-lg-3">
                                   <input type="hidden" class="form-control" name="km" id="km" value=0 />
                                </div>
                            </div>
							
							<div class="form-group">
                                <label class="col-lg-2 control-label">Origen/Destino</label>
                                <div class="col-lg-8">
                                   <input type="text" class="form-control" name="destino" id="destino"/>
                                </div>
                               
                            </div>
							
							<div class="form-group">
                                <label class="col-lg-2 control-label">Observación</label>
                                <div class="col-lg-8">
                                   <input type="text" class="form-control" name="detalle" id="detalle"/>
                                </div>
                               
                            </div>
							
							
							
							
							
							<br>
					
		
						
														                 
                        <div class="form-group">
                            <div class="col-lg-9 col-lg-offset-4">
                                <input id="editar" onclick="registrar()" type=button class="btn btn-primary" value="Guardar" >

								
                            </div>
                        </div></div>
                    </form>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="registroUpdateModal" tabindex="-1" role="dialog" aria-labelledby="Login" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
                <button id=Button1 type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
                <h4 class="modal-title">Editar Movimiento</h4>
            </div>

            <div class="modal-body">
            
            <form id="Form2" name=="Form" method="post" class="form-horizontal">

							<div class="form-group">
                                
                                <div class="col-lg-12" align=center>
								<div id="Div1">
								
								</div>
                                   
								   
								   </div>
                                
                            </div>
							<br>

                            <div class="form-group">
                                <label class="col-lg-2 control-label">Fecha</label>
                                <div class="col-lg-3">
                                   <input readonly style="width:100%;background-color:#eee" type="text" class="form-control" name="ufec" id="ufec"/>
                                </div>
                                 <label class="col-lg-2 control-label">Solicitud</label>
                                <div class="col-lg-3">
                                    <select class="form-control" name="solicitud" id="solicitud" >
                                        <option value="0">Seleccionar</option>
                                    </select>
                                </div>
                            </div>

                            <div class="form-group">
                                <label class="col-lg-2 control-label">Código</label>
                                <div class="col-lg-3">
                                   <input readonly style="width:100%;background-color:#eee" type="text" class="form-control" name="ucod" id="ucod"/>
                                </div>
                                <label class="col-lg-2 control-label">Placa</label>
                                <div class="col-lg-3">
                                    <input type="text" class="form-control" name="uplaca" id="uplaca" maxlength="8" />
                                </div>
                            </div>
							
							<div class="form-group">
                                
                                <div class="col-lg-12">
                                  <div id="Div2"></div>
                                </div>
                               </div>
                      
							
							<div id="Div3"  style="">
							<div class="form-group" >
                                <label class="col-lg-2 control-label">Chofer</label>
                                <div class="col-lg-3">
                                   <input  type="text" class="form-control" name="uchofer" id="uchofer" maxlength="8" />
                                </div>
                                <label class="col-lg-2 control-label">Tipo</label>
                                <div class="col-lg-3">
                                    <select class="form-control" name="utipo" id="utipo" >
                                        <option value="0"> Seleccionar </option>  
										<option value="1"> Ingreso </option> 
										<option value="2"> Salida </option> 
                                    </select>
                                </div>
                            </div>
							
							<div class="form-group">
                                
                                <div class="col-lg-12">
                                  <div id="Div4"></div>
                                </div>
                               </div>
							   
							   
							   
                            </div>
							
							<div id="Div5" class="form-group" style="margin:2px">
							<div class="form-group">
                                <label class="col-lg-2 control-label"> Kilometraje </label>
                                <div class="col-lg-3">
                                   <input  type="text" class="form-control" name="ukilometraje" id="ukilometraje"/>
								   <input  type="hidden" class="form-control" name="umaximo" id="umaximo"/>
								    </div>
                                
                            </div>
							
							
							<div class="form-group">
                                <label class="col-lg-2 control-label">Combustible</label>
                                <div class="col-lg-3">
                                   <select  class="form-control" name="ucombustible" id="ucombustible">
                                        <option value="0"> Seleccionar </option>  
										<option value="1"> Menos 1/4 </option> 
										<option value="2"> 1/4 </option> 
										<option value="3"> 1/2 </option> 
										<option value="4"> 3/4 </option> 
										<option value="5"> Mas 3/4 </option> 
                                    </select>
                                </div>
                                
                                <div class="col-lg-3">
                                   <input type="hidden" class="form-control" name="ukm" id="ukm" value=0 />
                                </div>
                            </div>
							
							<div class="form-group">
                                <label class="col-lg-2 control-label">Origen/Destino</label>
                                <div class="col-lg-8">
                                   <input type="text" class="form-control" name="udestino" id="udestino"/>
                                </div>
                               
                            </div>
							
							<div class="form-group">
                                <label class="col-lg-2 control-label">Observación</label>
                                <div class="col-lg-8">
                                   <input type="text" class="form-control" name="udetalle" id="udetalle"/>
                                </div>
                               
                            </div>
							<br>
							 <div class="form-group">
                                <label class="col-lg-2 control-label">Documentación:</label>
                                <div class="col-lg-3">
                                <label><input type="checkbox" id="d1" checked=""> Licencia</label><br>
                                <label><input type="checkbox" id="d2" checked=""> SOAT</label><br>
                                <label><input type="checkbox" id="d3" checked=""> Tarjeta de Propiedad</label><br>
                                <label><input type="checkbox" id="d4" checked=""> Revisión Técnica</label><br>
                                <label><input type="checkbox" id="d5" checked=""> Certificado GAS</label><br>
                                        </div>
                                 <label class="col-lg-2 control-label">Accesorios:</label>
                                <div class="col-lg-3">
                                <label><input type="checkbox" id="a1" checked=""> Gata</label><br>
                                <label><input type="checkbox" id="a2" checked=""> Llanta Repuesto</label><br>
                                <label><input type="checkbox" id="a3" checked=""> Llave Ruedas</label><br>
                                <label><input type="checkbox" id="a4" checked=""> Extintor</label><br>
                                <label><input type="checkbox" id="a5" checked=""> Botiquin</label><br>
                                <label><input type="checkbox" id="a6" checked=""> Triangulo Seguridad</label><br>
                                        </div>
                            </div>
							<br>
                            <div class="form-group">
                                <label class="col-lg-2 control-label">Revisión Mínima:</label>
                                <div class="col-lg-3">
                                <label><input type="checkbox" id="r1" checked=""> Refrigerante</label><br>
                                <label><input type="checkbox" id="r2" checked=""> Agua Bateria</label><br>
                                <label><input type="checkbox" id="r3" checked=""> Nivel Aceite</label><br>
                                <label><input type="checkbox" id="r4" checked=""> Odometro</label><br>
                                <label><input type="checkbox" id="r5" checked=""> Indicador de Aceite</label><br>
                                <label><input type="checkbox" id="r6" checked=""> Combustible</label><br>
                                <label><input type="checkbox" id="r7" checked=""> Temperatura</label><br>
                                        </div>
                                 <label class="col-lg-2 control-label"></label>
                                <div class="col-lg-3">
                                <label><input type="checkbox" id="r8" checked=""> Luz Estacionamiento</label><br>
                                <label><input type="checkbox" id="r9" checked=""> Luces Faros Alta</label><br>
                                <label><input type="checkbox" id="r10" checked=""> Luces Faro Baja</label><br>
                                <label><input type="checkbox" id="r11" checked=""> Luces Freno</label><br>
                                <label><input type="checkbox" id="r12" checked=""> Luces Placa</label><br>
                                <label><input type="checkbox" id="r13" checked=""> Luces Direccion</label><br>
                                <label><input type="checkbox" id="r14" checked=""> Presión Llantas</label><br>
                                        </div>
                            </div>
							
							
							<br>
					
		
						
														                 
                        <div class="form-group">
                            <div class="col-lg-9 col-lg-offset-4">
                                <input id="Button2" onclick="uregistrar()" type=button class="btn btn-primary" value="Guardar" >

								
                            </div>
                        </div></div>
                    </form>
            </div>
        </div>
    </div>
</div>





	<script src="../js/jquery.uitablefilter.js" ></script>
            
    <script type="text/javascript">

        $("#placa").keyup(function (event) {
            if ($("#placa").val().length > 6) { getPlaca(); }
        }).keydown(function (event) { if (event.which == 13) { event.preventDefault(); } });

        $("#chofer").keyup(function (event) {
            if ($("#chofer").val().length > 7) { getChofer() };
        }).keydown(function (event) { if (event.which == 13) { event.preventDefault(); } });


        function getPlaca() {
            if ($("#placa").val() == "") {
                alert("Ingrese un número de Placa");
            }
            else {
                $.ajax({
                    url: 'http://' + location.host + '/Services/Service.svc/getPlaca',
                    type: 'POST',
                    contentType: "application/json; charset=utf-8",
                    data: '{"prefix":"' + $("#placa").val() + '" }',
                    processData: false,
                    crossDomain: true,
                    dataType: "json",
                    success: function (response) {
                        var customers = eval(response.d);
                        var html = "";
                        $.each(customers, function () {
                            $("#p1").css("display", "block");
                            if (this.Marca) marca = this.Marca; else marca = "Sin Marca";
                            if (this.Modelo) modelo = this.Modelo; else modelo = "Sin Modelo";
                            if (this.Color) color = this.Color; else color = "Sin Color";
                            $("#maximo").val(this.Max);
                            html += "<div align=center><span class='label label-success'> " + marca + " - " + modelo + " - " + color + "</span></div>";
                        });

                        if (html != "") {
                            $('#placa').prop("disabled", true);
                            $("#chofer").focus();
                        }

                        $("#msgplaca").html(html == "" ? " <div align=center><span class='label label-danger'>No existe la placa </span></div>" : html);


                    },
                    error: function (a, b, c) {
                        alert(a.responseText);
                    }
                });
            }
        }

        function chkx() {
            if ($('#chk').is(':checked')) {
                $('#kilometraje').prop("disabled", false);
            }
            else {
                $('#kilometraje').prop("disabled", true);

            }
        }

        function cargar_p2() {
            if ($("#tipo").val() != 0) {
                $("#p2").css("display", "block");

                if ($("#tipo").val() == 1) {
                    $("#chk").prop("checked", true);
                    $('#kilometraje').prop("disabled", false);
                    $("#kilometraje").val("");
                    $("#des").html("Procedencia");
                }
                else if ($("#tipo").val() == 2) {
                    $('#kilometraje').prop("disabled", true);
                    $("#chk").prop("checked", false);
                    $("#kilometraje").val($("#maximo").val());
                    $("#des").html("Destino");
                }


            }
            else

                $("#p2").css("display", "none");
        }

        function registrar() {
            if ($("#placa").val() == "") {
                alert("Ingrese un número de Placa");
            }
            else if ($("#chofer").val() == "") {
                alert("Ingrese un codigo del Chofer");
            }
            else if ($("#tipo").val() == "0") {
                alert("Seleccione un tipo");
            }
            else if ($("#kilometraje").val() == "") {
                alert("Ingrese el Kilometraje");
            }

            else if ($("#combustible").val() == "0") {
                alert("Seleccione la cantidad del Combustible");
            }
            else {
                var user = localStorage.getItem('IdUsuario');

                if ($("#chk").is(':checked'))
                    chk = 1;
                else
                    chk = 0;


                $.ajax({
                    url: 'http://' + location.host + '/Services/Service.svc/InsPic2',
                    type: 'POST',
                    contentType: "application/json; charset=utf-8",
                    data: '{"placa": "' + $("#placa").val() + '","chofer": "' + $("#chofer").val() + '","fec": "' + $("#fec").val() + '","tipo": "' + $("#tipo").val() + '","kilometraje": "' + $("#kilometraje").val() + '","km": "' + $("#km").val() + '","destino": "' + $("#destino").val() + '","detalle": "' + $("#detalle").val() + '","combustible": "' + $("#combustible").val() + '","chk": "' + chk + '" }',
                    processData: false,
                    crossDomain: true,
                    dataType: "json",
                    success: function (data, textStatus, jqXHR) {
                        $("#cerrar").click();
                        alert("Se registró correctamente.")
                        listar_combustible();
                        $("#cod").empty();
                        $("#placa").empty();
                        $("#chofer").empty();
                        $("#kilometraje").empty();

                        $("#detalle").empty();
                    }
                });
            }
        }

        function uregistrar() {
            if ($("#uplaca").val() == "") {
                alert("Ingrese un número de Placa");
            }
            else if ($("#uchofer").val() == "") {
                alert("Ingrese un codigo del Chofer");
            }
            else if ($("#utipo").val() == "0") {
                alert("Seleccione un tipo");
            }
            else if ($("#ukilometraje").val() == "") {
                alert("Ingrese el Kilometraje");
            }

            else if ($("#ucombustible").val() == "0") {
                alert("Seleccione la cantidad del Combustible");
            }
            else {
                var user = localStorage.getItem('IdUsuario');

                var documentacion = '';
                var accesorio = '';
                var revision = '';

                if ($("#chk").is(':checked'))
                    chk = 1;
                else
                    chk = 0;

                if ($("#d1").is(':checked')) documentacion += '1'; else documentacion += '0';
                if ($("#d2").is(':checked')) documentacion += '1'; else documentacion += '0';
                if ($("#d3").is(':checked')) documentacion += '1'; else documentacion += '0';
                if ($("#d4").is(':checked')) documentacion += '1'; else documentacion += '0';
                if ($("#d5").is(':checked')) documentacion += '1'; else documentacion += '0';

                if ($("#a1").is(':checked')) accesorio += '1'; else accesorio += '0';
                if ($("#a2").is(':checked')) accesorio += '1'; else accesorio += '0';
                if ($("#a3").is(':checked')) accesorio += '1'; else accesorio += '0';
                if ($("#a4").is(':checked')) accesorio += '1'; else accesorio += '0';
                if ($("#a5").is(':checked')) accesorio += '1'; else accesorio += '0';
                if ($("#a6").is(':checked')) accesorio += '1'; else accesorio += '0';

                if ($("#r1").is(':checked')) revision += '1'; else revision += '0';
                if ($("#r2").is(':checked')) revision += '1'; else revision += '0';
                if ($("#r3").is(':checked')) revision += '1'; else revision += '0';
                if ($("#r4").is(':checked')) revision += '1'; else revision += '0';
                if ($("#r5").is(':checked')) revision += '1'; else revision += '0';
                if ($("#r6").is(':checked')) revision += '1'; else revision += '0';
                if ($("#r7").is(':checked')) revision += '1'; else revision += '0';
                if ($("#r8").is(':checked')) revision += '1'; else revision += '0';
                if ($("#r9").is(':checked')) revision += '1'; else revision += '0';
                if ($("#r10").is(':checked')) revision += '1'; else revision += '0';
                if ($("#r11").is(':checked')) revision += '1'; else revision += '0';
                if ($("#r12").is(':checked')) revision += '1'; else revision += '0';
                if ($("#r13").is(':checked')) revision += '1'; else revision += '0';
                if ($("#r14").is(':checked')) revision += '1'; else revision += '0';

                $.ajax({
                    url: 'http://' + location.host + '/Services/Service.svc/EditPic2',
                    type: 'POST',
                    contentType: "application/json; charset=utf-8",
                    data: '{"cod": "' + $("#ucod").val() + '","placa": "' + $("#uplaca").val() + '","chofer": "' + $("#uchofer").val() + '","tipo": "' + $("#utipo").val() + '","kilometraje": "' + $("#ukilometraje").val() + '","destino": "' + $("#udestino").val() + '","detalle": "' + $("#udetalle").val() + '","combustible": "' + $("#ucombustible").val() + '","fec": "' + $("#ufec").val() + '","documentacion": "' + documentacion + '","accesorio": "' + accesorio + '","revision": "' + revision + '" }',
                    processData: false,
                    crossDomain: true,
                    dataType: "json",
                    success: function (data, textStatus, jqXHR) {
                        $("#Button1").click();
                        alert("Se registró correctamente.")
                        listar_combustible();
                        $("#ucod").empty();
                        $("#uplaca").empty();
                        $("#uchofer").empty();
                        $("#ukilometraje").empty();
                        $("#modificar").hide();
                        $("#udetalle").empty();
                    }
                });
            }
        }

        function getChofer() {
            if ($("#chofer").val() == "") {
                alert("Ingrese un código de Chofer");
            }
            else {
                $.ajax({
                    url: 'http://' + location.host + '/Services/Service.svc/getChofer',
                    type: 'POST',
                    contentType: "application/json; charset=utf-8",
                    data: '{"prefix":"' + $("#chofer").val() + '" }',
                    processData: false,
                    crossDomain: true,
                    dataType: "json",
                    success: function (response) {
                        var customers = eval(response.d);
                        var html = "";
                        $.each(customers, function () {
                            $("#completo").val(this.Apellidos + " " + this.Nombres);
                            html += "<div align=center><span class='label label-success'> " + this.Apellidos + ", " + this.Nombres + "</span></div>";
                        });
                        if (html != "") {
                            $('#chofer').prop("disabled", true);
                            $('#tipo').prop("disabled", false);
                        }
                        else {
                            $('#tipo').prop("disabled", true);
                        }

                        $("#msgchofer").html(html == "" ? " <div align=center><span class='label label-danger'>No existe el conductor </span></div>" : html);
                    },
                    error: function (a, b, c) {
                        alert(a.responseText);
                    }
                });
            }
        }

        function imprimir_excel() {

            $("#btn_r1").click();

        }

        $(document).ready(function () {

           
            listar_combustible();

            $("#suministro").hide();

            $("#search").datepicker({
                format: "dd/mm/yyyy",
                todayHighlight: true,
                autoclose: true
            });


            $("#fec").datepicker({
                format: "dd/mm/yyyy",
                todayHighlight: true,
                autoclose: true
            });


            $("#ufec").datepicker({
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
            $("#fec").val(fechaactual);

            theTable1 = $("#tablasum");

            $("#search").change(function () {
                $.uiTableFilter(theTable1, this.value);
                $("#imprimir").show();
            });



            $("#placas").keyup(function () {
                $.uiTableFilter(theTable1, this.value);
            });



            $("#imprimir").show();

      

        });







        function listar_combustible() {

            $("#body_guia").html("<tr><td colspan=9><div align=center ><img src='../images/loader.gif'></div></td></tr>");
            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: 'http://' + location.host + '/Services/Logistica/Transporte.svc/listarDiario',
                data: '{"mes":"' + $("#mes0").val() + '","anio":"' + $("#anio0").val() + '" }',
                dataType: "json",
                success: function (response) {
                    var customers = eval(response.d);
                    var html = "";
                    var xnro = 0;
                    $.each(customers, function () {



                        //<td> " + this.Estado + "</td>
                        html += "<tr id='fila" + xnro +
                        "' class=getsum onclick=detalle_guia('" + this.Idmc + "','" + this.Suministro + "','" + xnro + "') style='cursor:pointer'><td style='text-align:center;display:none'>"
                        + this.Idmc + " </td><td style='text-align:left'> " + this.Chofer + "</td><td > " +
						this.Placa + "</td><td>" + this.Tipo + "</td><td class='suministro'>" + this.Kilometraje + "</td><td>" + this.Combustible + "</td><td>" + this.Destino + "</td><td class='IdTipoCombustible' >" + this.Descripcion + "</td><td class='fechasum'>" + this.Fecha + "</td>";
                        if (this.IdFoto != "")
                            html += "<td ><a class='fancybox-effects-a' href='http://172.16.10.83/VB/Container/" + this.IdFoto + "' ><span title='Imagen' id='image' class='btn btn-primary' style='font-size: 12px;' ><i class='fa fa-file-picture-o'></i> </span></a></td>";
                        else
                            html += "<td ></td >";
                        html += "</tr>";
                        xnro++;
                    });

                    $("#body_guia").html(html == "" ? "<tr><td colspan='5'> <div align=center><br>No se encontraron resultados</div></td></tr>" : html);
                },
                error: function (a, b, c) {
                    alert(a.responseText);
                    $("#results").html(a.responseText);
                }
            });

        }



        function detalle_guia(ord, sum, u) {
            $('#tablasum tr').removeClass('highlighted');
            $("#fila" + u).addClass('highlighted');
            $("#name_guia").html(sum);
            $("#txt_req").val(ord);
            $("#nroreg").val(ord);
            $("#suministro").show();
            $("#modificar").show();
            listar_solicitud();
            obtener_movimiento(ord);
        }

        function subtot(u) {
            var subtotal = $('#cantidad' + u).val() * $('#cu' + u).val();
            $('#subtotal' + u).val(parseFloat(subtotal).toFixed(2));
            $("#TotalCosto").val(parseFloat(subtotal).toFixed(2));
        }

        function obtener_movimiento(ord) {
            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: 'http://' + location.host + '/Services/Logistica/Transporte.svc/getReg',
                data: '{"prefix": "' + ord + '"}',
                dataType: "json",
                success: function (response) {
                    var customers = eval(response.d);
                    var html = "";
                    var xnro = 0;
                    $.each(customers, function () {

                        d1 = this.documentacion.substring(0, 1); if (d1 == 1) $("#d1").prop("checked", true); else $("#d1").prop("checked", false);
                        d2 = this.documentacion.substring(1, 2); if (d2 == 1) $("#d2").prop("checked", true); else $("#d2").prop("checked", false);
                        d3 = this.documentacion.substring(2, 3); if (d3 == 1) $("#d3").prop("checked", true); else $("#d3").prop("checked", false);
                        d4 = this.documentacion.substring(3, 4); if (d4 == 1) $("#d4").prop("checked", true); else $("#d4").prop("checked", false);
                        d5 = this.documentacion.substring(4, 5); if (d5 == 1) $("#d5").prop("checked", true); else $("#d5").prop("checked", false);

                        a1 = this.accesorio.substring(0, 1); if (a1 == 1) $("#a1").prop("checked", true); else $("#a1").prop("checked", false);
                        a2 = this.accesorio.substring(1, 2); if (a2 == 1) $("#a2").prop("checked", true); else $("#a2").prop("checked", false);
                        a3 = this.accesorio.substring(2, 3); if (a3 == 1) $("#a3").prop("checked", true); else $("#a3").prop("checked", false);
                        a4 = this.accesorio.substring(3, 4); if (a4 == 1) $("#a4").prop("checked", true); else $("#a4").prop("checked", false);
                        a5 = this.accesorio.substring(4, 5); if (a5 == 1) $("#a5").prop("checked", true); else $("#a5").prop("checked", false);
                        a6 = this.accesorio.substring(5, 6); if (a6 == 1) $("#a6").prop("checked", true); else $("#a6").prop("checked", false);

                        r1 = this.revision.substring(0, 1); if (r1 == 1) $("#r1").prop("checked", true); else $("#r1").prop("checked", false);
                        r2 = this.revision.substring(1, 2); if (r2 == 1) $("#r2").prop("checked", true); else $("#r2").prop("checked", false);
                        r3 = this.revision.substring(2, 3); if (r3 == 1) $("#r3").prop("checked", true); else $("#r3").prop("checked", false);
                        r4 = this.revision.substring(3, 4); if (r4 == 1) $("#r4").prop("checked", true); else $("#r4").prop("checked", false);
                        r5 = this.revision.substring(4, 5); if (r5 == 1) $("#r5").prop("checked", true); else $("#r5").prop("checked", false);
                        r6 = this.revision.substring(5, 6); if (r6 == 1) $("#r6").prop("checked", true); else $("#r6").prop("checked", false);
                        r7 = this.revision.substring(6, 7); if (r7 == 1) $("#r7").prop("checked", true); else $("#r7").prop("checked", false);
                        r8 = this.revision.substring(7, 8); if (r8 == 1) $("#r8").prop("checked", true); else $("#r8").prop("checked", false);
                        r9 = this.revision.substring(8, 9); if (r9 == 1) $("#r9").prop("checked", true); else $("#r9").prop("checked", false);
                        r10 = this.revision.substring(9, 10); if (r10 == 1) $("#r10").prop("checked", true); else $("#r10").prop("checked", false);
                        r11 = this.revision.substring(10, 11); if (r11 == 1) $("#r11").prop("checked", true); else $("#r11").prop("checked", false);
                        r12 = this.revision.substring(11, 12); if (r12 == 1) $("#r12").prop("checked", true); else $("#r12").prop("checked", false);
                        r13 = this.revision.substring(12, 13); if (r13 == 1) $("#r13").prop("checked", true); else $("#r13").prop("checked", false);
                        r14 = this.revision.substring(13, 14); if (r14 == 1) $("#r14").prop("checked", true); else $("#r14").prop("checked", false);

                        $("#ufec").val(this.Fecha);
                        $("#ucod").val(this.Codigo);
                        $("#uplaca").val(this.Placa);
                        $("#uchofer").val(this.Chofer);
                        $("#utipo").val(this.Tipo);
                        $("#ukilometraje").val(this.Kilometraje);
                        $("#ucombustible").val(this.Combustible);

                        $("#udestino").val(this.Destino);
                        $("#udetalle").val(this.Detalle);

                    });

                  
                },
                error: function (a, b, c) {
                    alert(a.responseText);
                    $("#results").html(a.responseText);
                }
            });
        }


        function listar_solicitud() {

            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: 'http://' + location.host + '/Services/Logistica/Transporte.svc/listarSolicitud',
                dataType: "json",
                success: function (response) {
                    var customers = eval(response.d);
                    var html = "";
                    var xnro = 1;
                    $.each(customers, function () {

                        html += "<option value=" + this.IdSolicitud + ">" + this.NroSolicitud + "</option>";

                    });

                    $("#solicitud").append(html);
                   
                },
                error: function (a, b, c) {
                    alert(a.responseText);
                    $("#results").html(a.responseText);
                }
            });

        }

    </script>
