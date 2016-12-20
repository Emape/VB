<%@ Page Language="VB" AutoEventWireup="false" CodeFile="~/Home/Transferencia.aspx.vb" Inherits="Transferencia" %>

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
            Transferencia
    
          </h1>
          <ol class="breadcrumb">
            <li><a href="#"><i class="fa fa-dashboard"></i> Log&iacute;stica</a></li>
            <li><a href="#">Almacen</a></li>
            <li class="active">Trasferencia</li>
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
					 &nbsp;  Buscar : <input type="hidden" name="del_idguia" id="del_idguia">
                    <input type="hidden" name="del_idtipomovimientostock" id="del_idtipomovimientostock" value="I">                
					</div>
					</div>


					<div class="col-xs-2">
					<div class="dataTables_length">
					<input type=text name="search" id="search" aria-controls="tabla_inventario" class="form-control input-sm">
					</div>
					</div>

                        <div class="col-xs-1">
					<div class="dataTables_length">
						<img src="../images/ayuda.png" width="20px" style="cursor:pointer;margin-left:-20px;margin-top:5px" onclick="alert('Puede Buscar por todos los campos ...')">
                    </div>
					</div>

                        <div class="col-xs-3">
                        </div>
                        <div class="cols-xs-3" align="right" style="margin-right:32px;">
                        <div class="dataTables_length">
                        

               <form id="form1" runat="server">

                   <asp:TextBox style="display:none" name="cod_empresa" id="cod_empresa" runat="server" aria-controls="tabla_inventario" class="form-control input-sm" />
					
                        <asp:TextBox style="display:none" runat="server" id="txt_gi" />
                        <asp:Button style="display:none" ID="btn_gi" Text="Exportar" runat="server" OnClientClick="target = '_blank'" OnClick="Exportargi" />
                        <span class="btn btn-primary" title="Imprimir" id="imprimir" style="font-size:12px" onclick="imprimir_pdf()">
                            <i class="fa fa-print" ></i> &nbsp; IMPRIMIR
                        </span>
                        
                        &nbsp;
                        <span title="Anular" id="anular" class="btn btn-danger" style="font-size:12px" data-toggle="modal" data-target="#confirm-delete" >
                            <i  class="fa fa-minus-circle" ></i> &nbsp; ANULAR
                        </span>
          
                             &nbsp;
                        <span  title="Agregar" class="btn btn-success" style="font-size:12px" data-toggle="modal" data-target="#guiaiInsertModal" onclick="tabladatos(5)">
                            <i  class="fa fa-plus" ></i> &nbsp; AGREGAR
                        </span>


                        </form>
                        </div>
                        </div>


				 </div>
				  
				
                                                                  
<form id="guiaiInsert" class="form-horizontal">	
    <input type="hidden" name="accion" id="accion">
<div class="modal fade" id="guiaiInsertModal" tabindex="-1" role="dialog" aria-labelledby="Login" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header" >
                
                <!---<button type="button" >
                    <span aria-hidden="true">&times;</span>
               
                     </button>-->

                

                <h1 class="modal-title" style="font-size:18px;font-weight:bold">Registrar Transferencia</h1>

                <span style="float:right;margin-top:-28px">
                <span id="guardar" class="btn btn-primary" style="font-size:12px" onclick="carga_submit()" >
                   <i class="fa fa-save"></i> &nbsp; GUARDAR
                </span>

                <span data-dismiss="modal" aria-label="Close" class="btn btn-danger" style="font-size:12px"  >
                   <i class="fa fa-close"></i> &nbsp; CANCELAR 
                </span>
                </span>

            </div>

            <div class="modal-body">
                        
							<input type="hidden" name="cond" id="cond" value=1>
                            <input type="hidden" name="contador" id="contador" value=1>
                           <input type="hidden" name="cond_tabla" id="cond_tabla" value=1>       
                      
                            <input id="guardar1" type="submit" class="btn btn-primary" value="Guardar" style="display:none"  >
				            <button style="display:none" id="cancelar" type="button" class="btn btn-default" data-dismiss="modal" >Cancelar</button>
                   
                            <div class="form-group">
                                
                                
                                
                                <label class="col-lg-1 control-label">Trans.</label>
                                <div class="col-lg-2">
                                   
                                    <input type="hidden" name="IdOrdenCompra" id="IdOrdenCompra" value="" > 
                                    <input type="hidden" name="IdCentroCosto" id="IdCentroCosto" value=""> 
                                    
                                    <input type="hidden" name="TotalCosto" id="TotalCosto" value="0" > 
                                    <input type="hidden" name="IdProveedor" id="IdProveedor" >
                                    <input type="hidden" name="IdRequerimiento" id="IdRequerimiento" >
                                    
                                    <input type="hidden" name="IdTipoMovimientoStock" id="IdTipoMovimientoStock" value="I" > 
                                    <input type="hidden" name="empresa" id="empresa" > 
                                                                        
                                    <input disabled style="width:100%;" type="text" class="form-control" name="nro" id="nro" />
                                    <input type="hidden" id="nro_guia" name="nro_guia" >
                                </div>
								
								 <label class="col-lg-1 control-label">Fecha</label>
                                <div class="col-lg-2">
                                     <input disabled style="width:100%;" type="text" class="form-control" name="fecha" id="fecha"/>
                                </div>
								
								
						 <label class="col-lg-1 control-label">Tipo Transf. </label>
                                <div class="col-lg-2">
                                   <select  class="form-control" name="tipotran" id="tipotran" >
                                        <option value="I"> Ingreso </option>
                                         <option value="S"> Salida </option>                                  
                                    </select>
                                </div>

                                 <label class="col-lg-1 control-label" >Almacen </label>
                                <div class="col-lg-2">
                                   <select  class="form-control" name="tipoalmacen" id="tipoalmacen" >
                                        <option value=""> Seleccionar </option>
                                       <option value="00"> GERENCIA DE MANTENIMIENTO </option>
                                                                        
                                    </select>
                                </div>

                                <!--
                                <label class="col-lg-1 control-label">Tipo<font color=white>_</font>Mov. </label>
                                <div class="col-lg-2">
                                    <select onchange="carga_tran();ver_alm()" class="form-control" name="tran" id="tran">
                                        <option value="S"> Seleccionar </option>
                                                                              
                                    </select>
                                </div>
								
								<label id="lalm" class="col-lg-1 control-label">Almac&eacute;n</label>
                                <div class="col-lg-2">
                                    <select class="form-control" name="alm" id="alm">
                                        <option value=""> Seleccionar </option>
                                                                     
                                    </select>
                                </div>-->
                            </div>


							<div class="form-group">
                                
                                <!--
                                <label class="col-lg-1 control-label">Detalle</label>
                                <div class="col-lg-3">
                                    <input  type="text" class="form-control" name="detalle" id="detalle"/>
                                </div>
                           
							
							<label id="letiqueta" class="col-lg-2 control-label">
                                  <span class="label label-success">Gu&iacute;a del Proveedor</span> 
                                </label>
								
                               <label id="lnump" class="col-lg-1 control-label">N&uacute;mero</label>
                                <div class="col-lg-2">
                                   <input style="border-color:#00a65a" type="text" class="form-control" name="nump" id="nump"/>
                                </div>
								
								<label id="lfechap" class="col-lg-1 control-label">Fecha</label>
                                <div class="col-lg-2">
                                    <input readonly style="border-color:#00a65a;background-color:#ffffff" type="text" class="form-control" name="fechap" id="fechap"/>
                                </div>-->
							
						 </div>
							
							
							
							<div class="form-group">
		<div id=capa style="height:330px;background-color:#efefef">					
		<div id="tab_prin" class="row" style="margin-left:10px;margin-right:10px;height:270px">
							
									
				<ul class="nav nav-tabs" id="myTab">
				<!--<li class="active" ><a href="#contrato">Contratos</a></li>
				<li><a href="#req">Requerimientos</a></li>-->
				<li id="liarticulo" class=""><a href="#articulo">Cat&aacute;logo de Art&iacute;culos</a></li>
				<!--<li><a href="#provee">Proveedores</a></li>-->
				<!--<li id="lioc" class=""><a href="#oc">Orden de Compra</a></li>-->
				<!--<li><a href="#obra">Devoluci�n de Obras</a></li>-->
				</ul>

		<div class="tab-content">

		  <div class="tab-pane" id="articulo">
			 <div class="col-md-12" style="height:280px">
              <div class="box box-primary">
                <div class="box-header"></div>
				<div class="col-lg-6"></div> <label class="col-lg-2 control-label">Descripci&oacute;n: </label>  <div class="col-lg-3"><input placeholder="Ingrese m&aacute;s de 5 caracteres" type="text" name="search_articulo" id="search_articulo" class="form-control"></div>
				<div class="col-lg-1">
				<a style="cursor:pointer" onclick="cargar_bienes()" class="btn btn-danger"><i class="fa fa-search"></i></a>
				</div>
                <div class="box-body pad table-responsive" style="height:230px">
					
					<table id="tabla_articulo" class="table table-bordered table-hover dataTable no-footer">
				  <thead>
                    <tr class="cabecera">
                      <th>Codigo </th><th>Descripci&oacute;n </th><th>Cantidad </th><th>U.M. </th>
					  </tr>
                   </thead>
				   <tbody id="tbody_articulo">
					 <tr><td  colspan="3" align="center">No se encontraron resultados</td></tr>
				   </tbody>
                  </table>
					 </div><!-- /.box -->
              </div>
            </div><!-- /.col -->
          </div>
		  <!--
            <div class="tab-pane" id="oc">
			 <div class="col-md-12" style="height:280px;position:relative">
                             
                              <div id="bloqueo2" style="display:none;position: absolute; z-index: 1; width: 97%; height: 291px; opacity: 0.4; cursor: not-allowed; background-color: #dfdfdf;"> </div>
                              
              <div class="box box-primary">
                <div class="box-header"></div>
				<div class="col-lg-8"></div> <label class="col-lg-1 control-label">Buscar:</label>  <div class="col-lg-3"><input type="text" name="search_oc" id="search_oc" class="form-control"></div>
				
                   
                <div class="box-body pad table-responsive" style="height:230px">
				
					<table id="tabla_oc" class="table table-bordered table-hover dataTable no-footer">
				  <thead>
                    <tr class="cabecera">
                      <th>N. O/C </th><th>Descripci&oacute;n </th><th>Fecha </th><th>Saldo </th>
					  </tr>
                   </thead>
				   <tbody id="tbody_oc">
					 <tr><td  colspan="4" align="center">No se encontraron resultados</td></tr>
				   </tbody>
                  </table>
						 </div>
					 
              </div>
            </div>
          </div>-->

					
					</div>
				
				</div>
						
					</div>
							
			<div class="row" style="margin-left:10px;margin-right:10px">
            <div class="col-md-12" style="height:280px">
              <div class="box box-primary">
                <div class="box-header">
                  
                  <h6 class="box-title"><small>Art&iacute;culos de Tranferencia de Ingreso</small> 
                      
                <span id="limpiaroc" class="btn btn-success pbrush" style="font-size:12px" >
                   <i  class="fa fa-paint-brush" ></i> &nbsp; Limpiar
                </span>
                      
                      <span class="msj1" style="font-size:12px"> <b>Orden de Compra N° <span class="msj2"></span></b></span>
                     
                      </h6>
                  
                </div>
                  <input type="hidden" name="n" id="n">
                  <input type="hidden" name="atendidox" id="atendidox">
                  <input type="hidden" name="item" id="item">
                  <input type="hidden" name="almx" id="almx">
                  <input type="hidden" name="cux" id="cux">
                  <input type="hidden" name="unix" id="unix">
                  <input type="hidden" name="cod_articulox" id="cod_articulox">
                  
                <div class="box-body pad table-responsive" style="height:230px">
					
                  <table id="tabla_det"  class="table table-bordered table-hover dataTable no-footer">
				  <thead>
                    <tr class="cabecera">
                      <th>IdOrdenServicio </th>
                      <th>Descripci&oacute;n </th>
                      <th>Cantidad </th>
                      <th>U.M. </th>
                      <!--<th>Stock </th>
		                <th>Solicitado </th>
                      <th>Atendido </th>
                      <th>C/U </th>
                      <th>SubTotal </th>
                      <th>Almac&eacute;n </th>-->
                      
                    </tr>
                   </thead>
				   <tbody id="tbody_det">
                               
				   </tbody>
                  </table>
				  
                </div><!-- /.box -->
              </div>
            </div><!-- /.col -->
          </div>				
							
							
						
                            </div>
		                
                   
            </div>
        </div>
    </div>
</div>
</form>				  
				  
				  
				  
             </div>
             <div class="box-body pad table-responsive" style="overflow:scroll;height:350px" >
			 <table  id="tabla_guia" class="table table-bordered table-hover dataTable no-footer" role="grid" aria-describedby="tabla_inventario_info">
				  <thead>
                    <tr  class="cabecera">
                      <th ><b>N. Transferencia </b></th>
                      <th ><b>Fec. Transferencia </b></th>
                      <th ><b>Origen </b></th>
                      <th ><b>Destino </b></th>
                      <th ><b>Tipo Transferencia </b></th>
                      <th ><b>Observacion </b></th>
          
                    </tr>
				  </thead>
                    
                   <tbody id="body_guia">
			        <tr ><td  colspan="11" align="center">No se encontraron resultados</td></tr>	
                   </tbody>	
             </table>
            </div><!-- /.box -->
              </div>
            </div><!-- /.col -->
          </div><!-- ./row -->

		  <div class="row">
            <div class="col-md-12">
              <div class="box box-primary">
                <div class="box-header">
                  
                  <h6 class="box-title"><small>Detalle de la Transferencia</small></h6>
                </div>
                <div class="box-body pad table-responsive" style="overflow:scroll;height:300px">
					
                  <table id="tabla_guia2" class="table table-bordered table-hover dataTable no-footer">
				  <thead>
                    <tr class=cabecera>
                      <th ><b>Item</b> </th>
                      <th><b>Descripci&oacute;n</b> </th>
                      <th><b>C&oacute;digo</b> </th>
                      <th><b>Bien</b> </th>
                      <th><b>Medida</b> </th>
                      <th><b>Cantidad</b> </th>
                
                    
                    </tr>
                   </thead>
				   <tbody id="body_guia2">
					 <tr><td colspan=9 align=center>No se encontraron resultados</td></tr>
				   </tbody>
                  </table>
				  
                </div><!-- /.box -->
              </div>
            </div><!-- /.col -->
          </div><!-- ./row -->
		    <div class="modal fade" id="confirm-delete" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
            <div class="modal-content">
            
                <div class="modal-header">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title" id="myModalLabel">Eliminar Guía</h4>
                </div>
            
                <div class="modal-body">
                    <p>¿Desea Eliminar la Guía de Ingreso N°  <span id="name_guia"></span> ?</p>
              
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
            $("#guiaiInsert").submit();
        }

        function imprimir_pdf() {
            $("#cod_empresa").val($("#id_empresa").val())
            $("#btn_gi").click();

        }
         
        $(document).ready(function () {
            //Obtener transacciones

            $(".pbrush").hide();
            $("#msj1").hide();
            $("#anular").hide();
            $("#imprimir").hide();
            $("#empresa").val($("#id_empresa").val());
            $("#guardar").hide();
            $("#alm").css("display", "none");
            $("#nump").css("display", "none");
            $("#fechap").css("display", "none");
            $("#tab_prin").css("display", "none");
            $("#lalm").css("display", "none");
            $("#lnump").css("display", "none");
            $("#lfechap").css("display", "none");
            $("#letiqueta").css("display", "none");
            $("#arti").addClass("hide");
            $("#ordcom").addClass("hide");

            $("#fechap").datepicker({
                format: "dd/mm/yyyy",
                todayHighlight: true,
                autoclose: true
            });

            $("#atendido").on('keyup', function () {
                subtot();
            }).keyup();

            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: 'http://isis:88/Services/Logistica/Transferencia.svc/listarTransaccion',
                data: '{"IdTipoMovimientoStock": "' + "S" + '","empresa": "' + $("#id_empresa").val() + '"}',
                dataType: "json",
                success: function (response) {
                    var customers = eval(response.d);
                    var html = "<option value='S' selected> Seleccionar </option>";

                    $.each(customers, function () {

                        //<td> " + this.Estado + "</td>
                        html += "<option value='" + this.IdTran + "'  >" + this.DetalleTran + "</option>";

                    });
                    $("#tran").html(html == "" ? "" : html);
                },
                error: function (a, b, c) {
                    alert(a.responseText);
                    $("#results").html(a.responseText);
                }
            });

            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: 'http://isis:88/Services/Logistica/Almacen.svc/listarAlmacen',
                data: '{"empresa": "' + $("#id_empresa").val() + '"}',
                dataType: "json",
                success: function (response) {
                    var customers = eval(response.d);
                    var html = "<option value='S' selected> Seleccionar </option>";

                    $.each(customers, function () {

                        //<td> " + this.Estado + "</td>
                        html += "<option value='" + this.IdAlm + "' title='" + this.CC + "' >" + this.DetalleAlm + "</option>";

                    });
                    $("#alm").html(html == "" ? "" : html);
                },
                error: function (a, b, c) {
                    alert(a.responseText);
                    $("#results").html(a.responseText);
                }
            });



            var f = new Date();

            fechaactual = ('0' + f.getDate()).slice(-2).toString()
               + '/' + ('0' + (f.getMonth() + 1)).slice(-2).toString()
               + '/' + f.getFullYear().toString();

            $("#fecha").val(fechaactual);


            listar_guiai();

            theTable = $("#tabla_guia");
            $("#search").keyup(function () {
                $.uiTableFilter(theTable, this.value);
            });

            theTableoc = $("#tabla_oc");
            $("#search_oc").keyup(function () {
                $.uiTableFilter(theTableoc, this.value);
            });

        });

        $('.btn-ok').click(function (e) {
            idguia = $("#del_idguia").val();
            tipo = $("#del_idtipomovimientostock").val();

            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: 'http://isis:88/Services/Logistica/Almacen.svc/anularGuiai',
                data: '{"empresa": "' + $("#id_empresa").val() + '","idguia": "' + idguia + '","tipo": "' + tipo + '", }',
                dataType: "json",
                success: function (response) {

                    listar_guiai();
                    $("#cerrar").click();
                    $("#anular").hide();
                    $("#imprimir").hide();
                },
                error: function (a, b, c) {
                    alert(a.responseText);
                    $("#results").html(a.responseText);
                }
            });
        });

       function listar_guiai() {

            $("#body_guia").html("<tr><td colspan=10><div align=center ><img src='../images/loader.gif'></div></td></tr>");
            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: 'http://isis:88/Services/Logistica/Transferencia.svc/listarGuia',
                data: '{"empresa": "' + $("#id_empresa").val() + '", "IdTipoMovimientoStock": "' + "I" + '"}',
                dataType: "json",
                success: function (response) {
                    var customers = eval(response.d);
                    var html = "";
                    var xnro = 0;
                    $.each(customers, function () {
                        //<td> " + this.Estado + "</td>
                        html += "<tr id='fila" + xnro + "' onclick=detalle_guia('" + this.IdGuia + "','" + xnro + "') style='cursor:pointer'><td>" + this.IdGuia + " </td><td> " + this.FechaGuia + "</td><td> " +
						this.IdProveedor + "</td><td> " + this.Proveedor.substr(0, 30) + "</td><td> " + this.IdOrdenCompra + "</td><td> " +
						this.IdRequerimiento + "</td><td> " + this.GuiaProveedor + "</td><td> " + this.FechaGuiaProveedor + "</td><td> " +
						this.DescripTransaccion + "</td><td> " + parseFloat(this.Total).toFixed(2) + "</td></tr>";
                        xnro++;
                    });

                    $("#body_guia").html(html == "" ? " <td  colspan=11 align=center><br><div align=center>No se encontraron resultados</div><br></td>" : html);
                },
                error: function (a, b, c) {
                    alert(a.responseText);
                    $("#results").html(a.responseText);
                }
            });

        }
   
       function limpiarTransferencia() {
           $("#tbody_det").empty();
       }


       function tabladatos(tabla) {
           
           $("#tbody_det").empty();
           $("#msj1").hide();
           $("#tab_prin").css("display", "block");
           $("#liarticulo").addClass("active");
           $("#liarticulo").addClass("show");
           $("#articulo").addClass("active");
           
           $.ajax({
               
               type: "POST",
               contentType: "application/json",
               url: 'http://isis:88/Services/Logistica/Transferencia.svc/listarBienServicio',
               data: '{"Tabla":"' + tabla + '","TipoMov":"I","Detalle": "' + $("#search_articulo").val() + '","TipoTran": "' + $("#tran").val() + '","IdCentroCosto": "' + $("#alm").val() + '","empresa": "' + $("#id_empresa").val() + '" }',
               dataType: "json",
                success: function (response) {
                   var customers = eval(response.d);
                   var html = "";

                   if (tabla == 5) {

                       $("#cond_tabla").val(tabla);
                       $.each(customers, function () {
                           $("#art_detalle").val(this.Descripcion);
                           $("#art_um").val(this.IdBienServicio);
                           html += "<tr style='cursor:pointer' class='asignando'><td class='ida'>" + this.IdBienServicio + "</td><td class='desa'>" + this.Descripcion + "</td><td class='uma'>" + this.StockActual + "</td><td  class='id_um'>" + this.undMedida + "</td></tr>";

                       });

                       $("#tbody_articulo").html(html == "" ? "<tr><td colspan=3 align=center>No se encontraron resultados</td></tr>" : html);

                   } else if (tabla == 3) {
                       $("#cond_tabla").val(tabla);
                       $.each(customers, function () {
                           $("#art_detalle").val(this.Detalle);
                           $("#art_um").val(this.UM);
                           html += "<tr style='cursor:pointer' class='asignar'><td class='ida'>" + this.IdBienServicio + "</td><td class='desa'>" + this.Descripcion + "</td><td class='uma'>" + this.StockActual + "</td><td  class='id_um'>" + this.undMedida + "</td></tr>";

                       });

                       $("#tbody_articulo").html(html == "" ? "<tr><td colspan=3 align=center>No se encontraron resultados</td></tr>" : html);


                   }

               },
               error: function (a, b, c) {
                   alert(a.responseText);
                   $("#results").html(a.responseText);
               }

           });

       }

        function tabla(tabla) {


            if (tabla == 5)
                $("#tbody_oc").html("<tr align=center><td colspan=4><img src='../images/loader.gif'></td></tr>");
            else if (tabla == 3)
                $("#tbody_articulo").html("<tr align=center><td colspan=3><img src='../images/loader.gif'></td></tr>");

            $.ajax({
                type: "POST",
                contentType: "application/json",
                url: 'http://isis:88/Services/Logistica/Almacen.svc/listarTipoTransaccion',
                data: '{"Tabla":"' + tabla + '","TipoMov":"I","Detalle": "' + $("#search_articulo").val() + '","TipoTran": "' + $("#tran").val() + '","IdCentroCosto": "' + $("#alm").val() + '","empresa": "' + $("#id_empresa").val() + '" }',
                dataType: "json",
                success: function (response) {
                    var customers = eval(response.d);
                    var html = "";

                    if (tabla == 1) {
                        html += "<table class='table table-bordered table-hover dataTable no-footer'><thead><tr>";
                        html += "<th>Contrato </th><th>Clase </th><th>Gerencia </th><th>Objeto </th><th>Fecha </th></tr></thead><tbody>";
                        $.each(customers, function () {
                            html += "<tr><td>" + this.IdContrato + "</td><td>" + this.IdCentroCosto + "</td><td>" + this.Objeto + "</td><td>" + this.FechaContrato + "</td><td>" + this.Pendiente + "</td></tr>";
                        });
                        html += "</tbody></table>";
                        $("#tabla1").html(html == "" ? "" : html);
                    }
                    else if (tabla == 2) {
                        html += "<table class='table table-bordered table-hover dataTable no-footer'><thead><tr>";
                        html += "<th>Requerimiento </th><th>Descripcion </th><th>Fecha </th><th>Saldo Total </th><th>Estado </th>";
                        $.each(customers, function () {
                            html += "<td>" + this.IdRequerimiento + "</td><td>" + this.Descripcion + "</td><td>" + this.FechaRequerimiento + "</td><td>" + this.SaldoSubTotal + "</td>";
                        });
                        $("#tabla2").html(html == "" ? "" : html);
                    }
                    else if (tabla == 3) {

                        $("#cond_tabla").val(tabla);
                        $.each(customers, function () {
                            $("#art_detalle").val(this.Detalle);
                            $("#art_um").val(this.UM);
                            html += "<tr style='cursor:pointer' class='asignar'><td class='ida'>" + this.Codigo + "</td><td class='desa'>" + this.Detalle + "</td><td class='uma'>" + this.UM + "</td><td style='display:none' class='id_um'>" + this.Id_UM + "</td></tr>";

                        });

                        $("#tbody_articulo").html(html == "" ? "<tr><td colspan=3 align=center>No se encontraron resultados</td></tr>" : html);
                    }
                    else if (tabla == 4) {
                        html += "<table class='table table-bordered table-hover dataTable no-footer'><thead><tr>";
                        html += "<th>C&oacute;digo </th><th>Raz&oacute;n Social </th><th>RUC </th>";
                    }
                    else if (tabla == 5) {
                        $("#cond_tabla").val(tabla);
                        $.each(customers, function () {
                            html += "<tr style='cursor:pointer' class='asignar'><td class=ida>" + this.Id + "</td><td class=desa>" + this.Detalle + "</td><td>" + this.Fecha + "</td><td class=saldo>" + parseFloat(this.Subtotal).toFixed(2) + "</td><td style='display:none' class=proveedor>" + this.Proveedor + "</td><td style='display:none' class=cc>" + this.CC + "</td><td style='display:none' class=req>" + this.Requerimiento + "</td></tr>";
                        });

                        $("#tbody_oc").html(html == "" ? "<tr><td colspan=3 align=center>No se encontraron resultados</td></tr>" : html);
                    }


                },
                error: function (a, b, c) {
                    alert(a.responseText);
                    $("#results").html(a.responseText);
                }
            });
        }

        function carga_tran() {
            if ($("#tran").val() == "00")
                tabla(5);
        }

        function cargar_articulo() {
            if ($("#search_articulo").val().length >= 5) {
                if ($("#tran").val() == "08" || $("#tran").val() == "10" || $("#tran").val() == "11")
                    tabla(3);
                $("#TotalCosto").val("0");
            }
            else
                alert("El contenido de Búsqueda debe ser mayor o igual a 5 caracteres");

        }

        function cargar_bienes() {
                   tabladatos(3);
        }

        function ver_alm() {
            if ($("#tran").val() == "S") {
                $("#tab_prin").css("display", "none");
                $("#alm").css("display", "none"); $("#lalm").css("display", "none");
            }
            else if ($("#tran").val() == "00") {

                $("#nump").css("display", "block");
                $("#fechap").css("display", "block");
                $("#lnump").css("display", "block");
                $("#lfechap").css("display", "block");
                $("#letiqueta").css("display", "block");

                $("#tab_prin").css("display", "block");
                $("#lioc").addClass("active");
                $("#liarticulo").removeClass("active");

                $("#lioc").removeClass("hide");
                $("#lioc").addClass("show");

                $("#liarticulo").removeClass("show");
                $("#liarticulo").addClass("hide");


                $("#oc").addClass("active");
                $("#articulo").removeClass("active");
                $("#alm").css("display", "none"); $("#lalm").css("display", "none");
            }
            else if ($("#tran").val() == "08" || $("#tran").val() == "10" || $("#tran").val() == "11") {

                $("#nump").css("display", "none");
                $("#fechap").css("display", "none");
                $("#lnump").css("display", "none");
                $("#lfechap").css("display", "none");
                $("#letiqueta").css("display", "none");

                $("#cond_tabla").val(3);
                $("#tab_prin").css("display", "block");
                $("#liarticulo").addClass("active");
                $("#lioc").removeClass("active");
                $("#articulo").addClass("active");

                $("#liarticulo").removeClass("hide");
                $("#liarticulo").addClass("show");

                $("#lioc").removeClass("show");
                $("#lioc").addClass("hide");

                $("#oc").removeClass("active");
                $("#alm").css("display", "block"); $("#lalm").css("display", "block");
            }

            else {
                $("#tab_prin").css("display", "block");
                $("#alm").css("display", "block"); $("#lalm").css("display", "block");
            }
        }

        function detalle_guia(guia, u) {


            $('#tabla_guia tr').removeClass('highlighted');
            $("#fila" + u).addClass('highlighted');

            $("#name_guia").html(guia);
            $("#txt_gi").val(guia);
            $("#del_idguia").val(guia);
            $("#anular").show();
            $("#imprimir").show();

            $("#body_guia2").html("<tr><td colspan=9><div align=center ><img src='../images/loader.gif'></div></td></tr>");
            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: 'http://isis:88/Services/Logistica/Almacen.svc/listarGuiaDetallei',
                data: '{"IdTipoMovimientoStock":"' + "I" + '","guia":"' + guia + '","empresa": "' + $("#id_empresa").val() + '" }',
                dataType: "json",
                success: function (response) {
                    var customers = eval(response.d);
                    var html = "";

                    $.each(customers, function () {

                        //<td> " + this.Estado + "</td>
                        html += "<tr><td>" + this.Item + " </td><td> " + this.CC + "</td><td> " +
						this.Detalle + "</td><td> " + this.Codigo + "</td><td> " + this.Bien + "</td><td> " +
						this.Medida + "</td><td> " + parseFloat(this.Costo).toFixed(2) + "</td><td> " + this.Cantidad + "</td><td> " +
						parseFloat(this.Total).toFixed(2) + "</td></tr>";


                    });

                    $("#body_guia2").html(html == "" ? " <div align=center><br>No se encontraron resultados </div>" : html);
                },
                error: function (a, b, c) {
                    alert(a.responseText);
                    $("#results").html(a.responseText);
                }
            });
        }

        $(document).on('click', '.clsEliminarFila', function () {
            var objCuerpo = $(this).parents().get(2);
            if ($(objCuerpo).find('tr').length == 1) {
                if (!confirm('Desea eliminar esta fila')) {

                    $("#contador").val('1');
                    return;
                } $("#guardar").hide(); $("#tbody_det").html('<tr ><td  colspan="11" align="center">No se encontraron resultados</td></tr>');
            }
            var objFila = $(this).parents().get(1);
            $(objFila).remove();

        });


       
        $(document).on('click', '.asignando', function () {

            var $row = $(this).closest("tr");

            var $ida = $row.find(".ida").text();
            var $desa = $row.find(".desa").text();
            var $uma = $row.find(".uma").text();
            var $id_um = $row.find(".id_um").text();

            html = '<tr><td>' + $ida + '</td><td>' + $desa + '</td><td>' + $uma + '</td><td>' + $id_um + '</td></tr>';
           $('#tbody_det').append(html);
       

        });


        $(document).on('click', '.asignar', function () {
            $('#tabla_oc tr').removeClass('highlighted');
            var v = $('#cond_tabla').val();

            if (v == 3) {
                $("#tbody_det").empty();
                
                var $row = $(this).closest("tr");
                var html = "";


                if ($("#alm").val() == "S") {
                    $("#guardar").hide();
                    alert("Seleccione un Almacen");

                }
                else {
                    $("#tbody_det_sel").html("");
                    var $ida = $row.find(".ida").text();
                    var $desa = $row.find(".desa").text();
                    var $uma = $row.find(".uma").text();
                    var $id_um = $row.find(".id_um").text();

                    $("#alm").prop("disabled", true);
                    $("#tran").prop("disabled", true);
                    var contador = $("#contador").val();

                    html = '<tr><td>' + $("#contador").val() + '</td><td><input type="hidden" name="cod_articulo" value=' + $ida + ' >' + $ida + '</td><td>' + $desa + '</td>' + '<td><input type=hidden name="uni" id="uni" value=' + $id_um + '>' + $uma + '</td><td> 0 </td><td> 0 </td><td><input type=text onchange="subtot(' + $("#contador").val() + ')" value=1 name="atendido" id="atendido' + $("#contador").val() + '" style="width:60px;border-radius:5px;border:1px solid #ccc"  onkeypress="javascript:return validarNro(event)"></td><td><input onchange="subtot(' + $("#contador").val() + ')" type=text id="cu' + $("#contador").val() + '" name="cu" value=0 style="width:60px;border-radius:5px;border:1px solid #ccc"  onkeypress="javascript:return validarNro(event)" ></td><td><input type=text value=0 name="subtotal[]" id="subtotal' + $("#contador").val() + '" style="width:60px;border-radius:5px;border:1px solid #ccc" disabled ></td><td>' + $("#alm option:selected").html() + '</td>' + '</tr>';
                    $('#tbody_det').append(html);
                    $("#contador").val(eval(contador) + 1);
                    $("#guardar").show(); return false;


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
                    url: 'http://isis:88/Services/Logistica/Almacen.svc/listarOrdenCompraDetalle',
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

                            cu += this.CU.toFixed(2) + ",";
                            cod += this.Codigo + ",";
                            id_alm += this.IdCentroCosto + ",";
                            id_um += this.Id_UM + ",";
                            html += '<tr><td>' + n + '</td><td>' + this.Codigo + '</td><td>' + this.Descripcion + '</td>' + '<td>' + this.UM + '</td>' + '<td>' + this.Stock + '</td>' + '<td>' + this.CantSol + '<input id="solicitado' + n + '" type="hidden" style="width:60px;border-radius:5px;border:1px solid #ccc" value=' + this.CantSol + '  ></td>' + '<td align=center><input id="atendido' + n + '" name="atendido" type="text" style="width:60px;border-radius:5px;border:1px solid #ccc" value=' + this.CantSol + ' onchange=sol_ate("' + n + '") ></td>' + '<td>' + this.CU.toFixed(2) + '</td>' + '<td>' + (this.CU * this.CantSol).toFixed(2) + '</td>' + '<td>' + this.Almacen + '</td></tr>';
                            $('#tbody_det').append(html);

                            n++;
                        });

                        $("#cux").val(cu);
                        $("#cod_articulox").val(cod);
                        $("#almx").val(id_alm);
                        $("#unix").val(id_um);

                        $("#n").val(n - 1);
                        $("#tbody_det").html(html == "" ? " <tr align=center><td colspan=11>No se encontraron resultados </td></tr>" : html);



                        if (html == "") { $("#guardar").hide(); }
                        else {
                            
                            $("#guardar").show(); $(".pbrush").show(); $(".msj1").show(); $(".msj2").html($ida); $("#bloqueo2").show();
                        }

                    },
                    error: function (a, b, c) {
                        alert(a.responseText);
                        $("#results").html(a.responseText);
                    }
                });

                return false;

            }
        });
 
        $('#myTab a').click(function (e) {
            e.preventDefault();
            $(this).tab('show');
        });

        $('#moreTabs a').click(function (e) {
            e.preventDefault();
            $(this).tab('show');
        });

        (function ($) {
            // Test for making sure event are maintained
            $('.js-alert-test').click(function () {
                alert('Button Clicked: Event was maintained');
            });
            //fakewaffle.responsiveTabs( [ 'xs', 'sm' ] );
        })(jQuery);

        function limpiar() {

           
            $("#tabla_oc").attr("disabled", "disabled");

            $("#IdOrdenCompra").val("");
            $("#IdCentroCosto").val("");
            $("#IdProveedor").val("");
            $("#bloqueo2").hide();
            $("#TotalCosto").val("0");
            $("#IdRequerimiento").val("");

            $("#lalm").css("display", "none");
            $("#detalle").val("");
            $("#nump").val("");
            $("#guardar").hide();
            $(".pbrush").hide();

            $(".msj1").hide();
            $("#fechap").val("");
            $("#tran").prop("disabled", false);
            $("#tran option[value='S']").attr("selected", true);
            $("#alm").prop("disabled", false); $("#lalm").prop("disabled", false);
            $("#alm option[value='S']").attr("selected", true);
            $("#alm").hide();
            $("#tbody_det").html('<tr id="tbody_det_sel"><td  colspan="11" align="center">No se encontraron resultados</td></tr>');
            $("#tab_prin").css("display", "none");

        }

        $("#limpiaroc").click(function () {
            $(".pbrush").hide();
            $("#tbody_det").html('<tr id="tbody_det_sel"><td  colspan="11" align="center">No se encontraron resultados</td></tr>');
            $(".msj1").hide();
            $("#guardar").hide();
            $("#bloqueo2").hide();
            $('#tabla_oc tr').removeClass('highlighted');
        });

        function subtot(u) {
            var subtotal = $('#atendido' + u).val() * $('#cu' + u).val();
            $('#subtotal' + u).val(parseFloat(subtotal).toFixed(2));
            $("#TotalCosto").val(subtotal);
        }

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

        function sol_ate(u) {
            if (eval($('#atendido' + u).val()) > eval($('#solicitado' + u).val())) {
                $('#atendido' + u).val($('#solicitado' + u).val());
            }

        }

        $("#guiaiInsert").submit(function (event) {
            if ($("#detalle").val() == '') {
                alert("Ingrese Detalle");
                $("#detalle").focus();
            }
            else if ($("#tran").val() == "00" && $("#nump").val() == "") {
                alert("Ingrese Número de Guía del Proveedor");
            }
            else if ($("#tran").val() == "00" && $("#fechap").val() == "") {
                alert("Ingrese Fecha de Guía del Proveedor");
            }
            else {
                if ($("#tran").val() == "00")
                    $("#accion").val(5);
                else
                    $("#accion").val(3)

                $("#atendidox").empty();
                $("#item").empty();


                n = $("#n").val();
                cad_atendido = "";
                cad_item = "";

                for (i = 1; i <= n; i++) {
                    cad_atendido += $("#atendido" + i).val() + ",";
                    cad_item += ("000" + (eval(i))).slice(-3) + ",";
                }

                $("#atendidox").val(cad_atendido);
                $("#item").val(cad_item);

                $("#tran").prop("disabled", false);
                $("#alm").prop("disabled", false);
                // $("#nro").prop("disabled",false);

                var ary = $("#guiaiInsert").serializeArray();
                var obj = {};
                for (var a = 0; a < ary.length; a++)
                    obj[ary[a].name] = ary[a].value;

                $.ajax({
                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    url: 'http://isis:88/Services/Logistica/Almacen.svc/InsertarCabeceraGuia',
                    data: JSON.stringify(obj),
                    dataType: "json",
                    success: function (response) {

                        if (response.d == 1) {
                            alert("La Guía de Ingreso se guardó correctamente");
                            $("#cancelar").click();
                            listar_guiai();
                            limpiar();
                        }
                        else {
                            alert("Error");
                        }

                    },
                    error: function (a, b, c) {
                        alert(a.responseText);
                        $("#results").html(a.responseText);
                    }
                });
            }

            event.preventDefault();
        });


        


    </script>