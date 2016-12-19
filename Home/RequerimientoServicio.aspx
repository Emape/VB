<%@ Page Language="VB" AutoEventWireup="false" CodeFile="~/Home/RequerimientoServicio.aspx.vb" Inherits="RequerimientoServicio" %>

<!--<style>
#tabla_guia thead, #tabla_guia tbody, #tabla_guia tr,#tabla_guia  td,#tabla_guia th { display: block; }

#tabla_guia tr:after {
    content: ' ';
    display: block;
    visibility: hidden;
    clear: both;
}

#tabla_guia thead th { 
    height: 20px;
    line-height: 30px;
    /*text-align: left;*/
}

#tabla_guia tbody {
    height: 345px;
    overflow-y: auto;
}

#tabla_guia2 tbody {
    height: 120px;
    overflow-y: auto;
}

#tabla_guia thead {
    /* fallback */
    /* minus scroll bar width */
    width: calc(100% - 17px);
}

#tabla_guia2 thead {
    /* fallback */
    width: 9%;
    /* minus scroll bar width */
    width: calc(100% - 17px);
}

#tabla_guia tbody { border-top: 2px solid black; }

#tabla_guia tbody td,#tabla_guia thead th {
    float: left;
	
}

#tabla_guia2 tbody td,#tabla_guia2 thead th {
    width: 9%;
    float: left;
	
}

#tabla_guia tbody td:last-child,#tabla_guia thead th:last-child {
    
}

#tabla_guia tbody td{
height:30px;
}

#tabla_guia2 tbody td{
height:30px;
}

#tabla_guia, #tabla_guia2{
font-size:12px !important;
}-->
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

	    .auto-style1
        {
            height: 19px;
        }

	</style>

   <section class="content-header">
    
          <h1 style="font-size:18px;font-weight:bold">
            Requerimiento de Locadores
    
          </h1>
         
          <ol class="breadcrumb">
            <li><a href="#"><i class="fa fa-dashboard"></i> Log&iacute;stica</a></li>
            <li><a href="#">Requerimiento</a></li>
            <li class="active">Locador</li>
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
					 &nbsp;  Buscar : <input type="hidden" id="del_idguia" >
                    <input type="hidden" name="del_idtipomovimientostock" value="I">     
                                   
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
					
                        <asp:TextBox style="display:none" runat="server" id="txt_req" />
                        <asp:Button style="display:none" ID="btn_req" Text="Exportar" OnClientClick="target = '_blank'" runat="server" OnClick="ExportarReq" />
                        <span class="btn btn-primary" title="Imprimir" id="imprimir" style="font-size:12px" onclick="imprimir_pdf()">
                            <i class="fa fa-print" ></i> &nbsp; IMPRIMIR
                        </span>
                        
                        &nbsp;
                        <span title="Anular" id="anular" class="btn btn-danger" style="font-size:12px" data-toggle="modal" data-target="#confirm-delete" >
                            <i  class="fa fa-minus-circle" ></i> &nbsp; ANULAR
                        </span>
                            &nbsp;
                        <span  title="Agregar" class="btn btn-success" style="font-size:12px" data-toggle="modal" data-target="#guiaiInsertModal" onclick="limpiar()">
                            <i  class="fa fa-plus" ></i> &nbsp; AGREGAR
                        </span>

                        </form>
                        </div>
                        </div>


				 </div>




<form id="guiaiInsert" class="form-horizontal" onKeypress="if(event.keyCode == 13) event.returnValue = false;" >	
    <input type="hidden" name="accion" id="accion" >
<div class="modal fade" id="guiaiInsertModal" tabindex="-1" role="dialog" aria-labelledby="Login" aria-hidden="true">
    <div class="modal-dialog modal-lg">
        <div class="modal-content">
            <div class="modal-header">
               
                <h1 class="modal-title" style="font-size:18px;font-weight:bold">Registrar Requerimiento de Almacén</h1>
            
            
            <span style="float:right;margin-top:-28px">
                <span id="guardar" class="btn btn-primary" style="font-size:12px" onclick="carga_submit()" >
                   <i class="fa fa-save"></i> &nbsp; GUARDAR
                </span>

                <span id="cancelar" data-dismiss="modal" aria-label="Close" class="btn btn-danger" style="font-size:12px" >
                   <i class="fa fa-close"></i> &nbsp; CANCELAR
                </span>
                </span>
            

            
            </div>

            <div class="modal-body">
            
            
						
                                                        <input type="hidden" name="contador" id="contador" value=1>
                                                        
				
                                                         

                            <div class="form-group">
                                
                                
                                
                                <label class="col-lg-2 control-label" style="text-align: left;">N° Requerimiento</label>
                                <div class="col-lg-2">
                                   
                                   
                                    <input type="hidden" name="IdCentroCosto" id="IdCentroCosto" value="040000"> 
                                    
                                    
                                    <input type="hidden" name="TotalCosto" id="TotalCosto" value="0" > 
                                   
                                    <input type="hidden" name="empresa" id="empresa" > 
                                                                        
                                    <input disabled style="width:100%;" type="text" class="form-control" name="nro" id="nro" /><input type="hidden" id="nro_guia" name="nro_guia" >
                                </div>
								
								 <label class="col-lg-1 control-label">Fecha</label>
                                <div class="col-lg-2">
                                     <input disabled style="width:100%;" type="text" class="form-control" name="fecha" id="fecha"/>
                                </div>
								
				
								
								<label class="col-lg-2 control-label">Memorandum</label>
                                <div class="col-lg-3">
                               
                                        <input  type="text" class="form-control" name="memo" id="memo"/>
                                                                     
                                   
                                </div>
                            </div>
							<div class="form-group">
                                <label class="col-lg-1 control-label">Concepto</label>
                                <div class="col-lg-11">
                                    <input  type="text" class="form-control" name="concepto" id="concepto"/>
                                </div>
						 </div>
							
							
							
							<div class="form-group">
		<div style="height:270px">					
		<div id="tab_prin" class="row" style="margin-left:10px;margin-right:10px;height:270px">
							
							
            
					
				<ul class="nav nav-tabs" id="myTab">
				<!--<li class="active" ><a href="#contrato">Contratos</a></li>-->
				<!--<li id="lireq" class=""><a href="#req">Requerimientos</a></li>-->
				<li ><a id="e_articulo" href="#articulo">Catálogo de Artículos</a></li>
				<!--<li><a href="#provee">Proveedores</a></li>-->
				<!--<li id="lioc" class=""><a href="#oc">Orden de Compra</a></li>-->
				<!--<li><a href="#obra">Devoluci n de Obras</a></li>-->
				</ul>

		<div class="tab-content">
		
			<!--<div class="tab-pane active" id="contrato">
			 <div class="col-md-12" style="height:280px">
              <div class="box box-primary">
                <div class="box-header"></div>
                <div class="box-body pad table-responsive" style="height:230px">
					<div id="tabla1"></div>
					 </div>
              </div>
            </div>
          </div>
		-->  
		
		  
		  <div class="tab-pane" id="articulo">
			 <div class="col-md-12" style="height:280px">
              <div class="box box-primary">
                <div class="box-header"></div>
				<div class="col-lg-8"></div> <label class="col-lg-1 control-label">Buscar:</label>  <div class="col-lg-3"><input type="text" name="search_req" id="search_req" class="form-control"></div>
				
                                <br><br>
				
                <div class="box-body pad table-responsive" style="height:230px">
					
					<table id="tabla_articulo" class="table table-bordered table-hover dataTable no-footer">
				  <thead>
                    <tr class="cabecera">
                      <th class="auto-style1">Codigo </th><th class="auto-style1">Descripci&oacute;n </th><th class="auto-style1">U.M. </th><th class="auto-style1">Stock </th><th class="auto-style1">Reserva </th><th class="auto-style1">Disponible </th><th class="auto-style1">C.U. </th>
					  </tr>
                   </thead>
				   <tbody id="tbody_req">
					 <tr><td  colspan="3" align="center">No se encontraron resultados</td></tr>
				   </tbody>
                  </table>
					 </div><!-- /.box -->
              </div>
            </div><!-- /.col -->
          </div>
		  
		 <!-- <div class="tab-pane" id="provee">
			 <div class="col-md-12" style="height:280px">
              <div class="box box-primary">
                <div class="box-header"></div>
                <div class="box-body pad table-responsive" style="height:230px">
					<div id="tabla4"></div>
					 </div>
              </div>
            </div>
          </div>-->
		  <div class="tab-pane" id="oc">
			 <div class="col-md-12" style="height:280px">
              <div class="box box-primary">
                <div class="box-header"></div>
				<div class="col-lg-8"></div> <label class="col-lg-1 control-label">Buscar:</label>  <div class="col-lg-3"><input type="text" name="search_oc" id="search_oc" class="form-control"></div>
				
                                <br><br>
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
		 </div><!-- /.box -->
              </div>
            </div><!-- /.col -->
          </div>

					
					</div>
				
				</div>
						
					</div>
				  
               
							
			<div class="row" style="margin-left:10px;margin-right:10px">
            <div class="col-md-12" style="height:280px">
              <div class="box box-primary">
                <div class="box-header">
                  
                  <h6 class="box-title"><small>Artículos de Requerimiento de Almacén</small></h6>
                </div>
                  <input type="hidden" name="n" id="n">
                  <input type="hidden" name="atendidox" id="atendidox">
                  <input type="hidden" name="almx" id="almx">
                  <input type="hidden" name="cux" id="cux">
                  <input type="hidden" name="placax" id="placax">
                  <input type="hidden" name="unix" id="unix">
                  <input type="hidden" name="cod_articulox" id="cod_articulox">
                  
                <div class="box-body pad table-responsive" style="overflow:scroll;height:230px">
					
                  <table id="tabla_det"  class="table table-bordered table-hover dataTable no-footer">
				  <thead>
                    <tr class="cabecera">
                     
                      <th>Código </th>
                      <th>Descripción </th>
                      <th>U.M. </th>
                      <th>C.U. </th>
		      <th>Disponible </th>
                      <th>Cantidad </th>
                      <th>Subtotal </th>
                        <th >Transporte </th>
                      
                    </tr>
                   </thead>
				   <tbody id="tbody_det">
                                      <tr id="tbody_det_sel"><td  colspan="11" align="center">No se encontraron resultados</td></tr>
             
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
                <div class="box-body pad table-responsive"   style="overflow:scroll;height:350px">
				
					
				
					
	         <table  id="tabla_guia" class="table table-bordered table-hover dataTable no-footer" role="grid" aria-describedby="tabla_inventario_info">
				  <thead>
                    <tr  class="cabecera">
                      <th style="width:100px;text-align:center" ><B>N. Requerimiento</B> </th>
                      <th style="width:100px;text-align:center" ><B>Fecha</B> </th>
                      <th style="width:700px;text-align:center" ><B>Concepto</B> </th>
                      <!-- <th width="10px">Estado </th>-->
                    </tr>
					</thead>
                    
                   <tbody id="body_guia">
			   <tr ><td  colspan="11" align="center">No se encontraron resultados</td></tr>		
                  </table>

				  
                </div><!-- /.box -->
              </div>
            </div><!-- /.col -->
          </div><!-- ./row -->

		  <div class="row">
            <div class="col-md-12">
              <div class="box box-primary">
                <div class="box-header">
                  
                  <h6 class="box-title"><small><B>Detalle de Guía</B></small></h6>
                </div>
                <div class="box-body pad table-responsive" style="overflow:scroll;height:300px">
					
                  <table id="tabla_guia2" class="table table-bordered table-hover dataTable no-footer">
				  <thead>
                    <tr class="cabecera">
                      <th style="width:30px"><b>Item</b> </th>
                      <th style="width:90px"><b>Código</b> </th>
                      <th style="width:620px"><b>Descripción</b> </th>
                      <th style="width:70px"><b>Unidad</b> </th>
                      <th style="width:60px"><b>Cantidad</b> </th>
                     
                    </tr>
                   </thead>
				   <tbody id="body_guia2">
					  <tr><td colspan=5 align=center>No se encontraron resultados</td></tr>
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
                    <p>¿Desea Eliminar el Requerimiento de Almacen N°  <span id="name_guia"></span> ?</p>
              
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
            if (window.location.pathname == '/') {
                alert("La url es incorrecta, intentalo nuevamente");
                window.location = "http://" + location.host + "/Home/Index.aspx";
            }
            else {
                $("#cod_empresa").val($("#id_empresa").val())
                $("#btn_req").click();
            }
        }

        $(document).ready(function () {
            url = location.host;

            //Obtener transacciones
            tabla(3);
            $("#anular").hide();
            $("#imprimir").hide();
            $("#empresa").val($("#id_empresa").val());
            $("#guardar").hide();
            $("#alm").css("display", "none");

            $("#lalm").css("display", "none");
            $("#arti").addClass("hide");
            $("#ordcom").addClass("hide");

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


            listar_guiai();

            theTable = $("#tabla_articulo");
            $("#search_req").keyup(function () {
                $.uiTableFilter(theTable, this.value);
            });

            theTable1 = $("#tabla_guia");
            $("#search").keyup(function () {
                $.uiTableFilter(theTable1, this.value);
            });



        });

        $('.btn-ok').click(function (e) {
            req = $("#del_idguia").val();

            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: 'http://' + url + '/Services/Logistica/Almacen.svc/anularRequerimientoAlmacen',
                data: '{"empresa": "' + $("#id_empresa").val() + '","req": "' + req + '" }',
                dataType: "json",
                success: function (response) {
                    listar_guiai();
                    $("#cerrar").click();
                    $("#anular").hide();
                    $("#imprimir").hide();
                },
                error: function (a, b, c) {
                    /*alert(a.responseText);
                    $("#results").html(a.responseText);*/
                    window.location = "http://"+url+"/login/Index.aspx";
                }
            });
        });

        $('.fa-print').click(function (e) {
            req = $("#del_idguia").val();

            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: '',
                data: '{"IdRequerimiento": "' + req + '","empresa": "' + $("#id_empresa").val() + '"}',
                dataType: "json",
                success: function (response) {
                    listar_guiai();
                    //$("#cerrar").click();
                    //$("#anular").hide();
                    //$("#imprimir").hide();
                },
                error: function (a, b, c) {
                    /*alert(a.responseText);
                    $("#results").html(a.responseText);*/
                    window.location = "http://" + url + "/login/Index.aspx";
                }
            });
        });




        function listar_guiai() {

            $("#body_guia").html("<tr><td colspan=3><div align=center ><img src='../images/loader.gif'></div></td></tr>");
            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: 'http://' + url + '/Services/Logistica/Almacen.svc/listarRequerimiento',
                data: '{"empresa": "' + $("#id_empresa").val() + '", "TipoReq": "02", "CC": "040000"}',
                dataType: "json",
                success: function (response) {
                    var customers = eval(response.d);
                    var html = "";
                    var xnro = 0;
                    $.each(customers, function () {

                        //<td> " + this.Estado + "</td>
                        html += "<tr id='fila" + xnro + "' onclick=detalle_guia('" + this.IdRequerimiento + "','" + xnro + "') style='cursor:pointer'><td style='width:100px;text-align:center'>" + this.IdRequerimiento + " </td><td style='width:100px;text-align:center'> " + this.Fecha + "</td><td style='width:700px'> " +
						this.Descripcion + "</td></tr>";
                        xnro++;
                    });

                    $("#body_guia").html(html == "" ? "<tr><td colspan='5'> <div align=center>No se encontraron resultados</div></td></tr>" : html);
                },
                error: function (a, b, c) {
                    /*alert(a.responseText);
                    $("#results").html(a.responseText);*/
                    window.location = "http://" + url + "/login/Index.aspx";
                }
            });

        }
        function tabla(tabla) {

            $("#tbody_req").html("<tr align=center><td colspan=7><img src='../images/loader.gif'></td></tr>");

            $.ajax({
                type: "POST",
                contentType: "application/json",
                url: 'http://' + url + '/Services/Logistica/Almacen.svc/listarAlmacenStock',
                data: '{"IdAlmacen": "000002","empresa": "' + $("#id_empresa").val() + '" }',
                dataType: "json",
                success: function (response) {
                    var customers = eval(response.d);
                    var html = ""; x = 1;


                    $.each(customers, function () {
                        $("#art_detalle").val(this.Detalle);
                        $("#art_um").val(this.UM);
                        html += "<tr style='cursor:pointer' class='asignar_reqalm'><td style='display:none'> <input type=text class=bool id='bool" + x + "' value='1' ><input type=text class=conta id='conta" + x + "' value='" + x + "' ></td><td class='ida'>" + this.Codigo + "</td><td class='desa'>" + this.Detalle + "</td><td class='uma'>" + this.UM + "</td><td class='stocka'>" + this.Stock + "</td><td class='reservaa'>" + this.Reserva + "</td><td class='disponiblea'>" + this.Disponible + "</td><td class='costoa'>" + parseFloat(this.Costo).toFixed(2) + "</td><td style='display:none' class='id_um'>" + this.Id_UM + "</td></tr>";
                        x++;
                    });
                    $("#tbody_req").html(html == "" ? "<tr><td colspan=7 align=center>No se encontraron resultados</td></tr>" : html);

                },
                error: function (a) {
                    /*alert(a.responseText);
                    $("#results").html(a.responseText);*/
                    window.location = "http://" + url + "/login/Index.aspx";
                }
            });
        }
        function carga_tran() {
            if ($("#tran").val() == "00")
                tabla(2);
        }

        function detalle_guia(req, u) {


            $('#tabla_guia tr').removeClass('highlighted');
            $("#fila" + u).addClass('highlighted');

            $("#name_guia").html(req);
            $("#txt_req").val(req);
            $("#del_idguia").val(req);
            $("#anular").show();
            $("#imprimir").show();

            $("#body_guia2").html("<tr><td colspan='5'><div align=center ><img src='../images/loader.gif'></div></td></tr>");
            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: 'http://' + url + '/Services/Logistica/Almacen.svc/ObtenerRequerimientoDetalle',
                data: '{"idreq":"' + req + '","empresa": "' + $("#id_empresa").val() + '" }',
                dataType: "json",
                success: function (response) {
                    var customers = eval(response.d);
                    var html = "";

                    $.each(customers, function () {

                        //<td> " + this.Estado + "</td>
                        html += "<tr><td style='width:30px'>" + this.Item + " </td><td style='width:90px'> " + this.Codigo + "</td><td style='width:620px'> " + this.Descripcion + "</td><td style='width:70px'> " + this.UM + "</td><td style='width:60px'> " + parseFloat(this.Cantidad).toFixed(2) + "</td></tr>";

                    });

                    $("#body_guia2").html(html == "" ? " <tr><td colspan='5'><div align=center>No se encontraron resultados </div></td></tr>" : html);
                },
                error: function (a) {
                    /*alert(a.responseText);
                    $("#results").html(a.responseText);*/
                    window.location = "http://" + url + "/login/Index.aspx";
                }
            });
        }

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
            $("#e_articulo").click();
            $("#TotalCosto").val("0");

            $("#n").val("");
            $("#atendidox").val("");
            $("#almx").val("");

            $("#cux").val("");
            $("#placax").val("");
            $("#unix").val("");
            $("#cod_articulox").val("");
            $("#memo").val("");
            $("#concepto").val("");
            $("#guardar").hide();

            $("#lalm").css("display", "none");

            $("#tran").prop("disabled", false);
            $("#tran option[value='S']").attr("selected", true);
            $("#alm").prop("disabled", false); $("#lalm").prop("disabled", false);
            $("#alm option[value='S']").attr("selected", true);
            $("#alm").hide();
            $("#tbody_det").html('');

            tabla(3);

        }

        function subtot(u) {
            var subtotal = $('#cantidad' + u).val() * $('#cu' + u).val();
            $('#subtotal' + u).val(parseFloat(subtotal).toFixed(2));
            $("#TotalCosto").val(parseFloat(subtotal).toFixed(2));
        }



        function sol_ate(u) {
            if (eval($('#disponible' + u).val()) < eval($('#cantidad' + u).val())) {
                $('#cantidad' + u).val($('#disponible' + u).val());
            }

        }

        $("#guiaiInsert").submit(function (event) {


            if ($("#concepto").val() == "") {
                alert("Debe ingresar el concepto");
                $("#concepto").focus();
            }

            else {

                txtcantidad = '';
                $(".cantidad").each(
                    function (index, value) {
                        if (txtcantidad == '')
                            txtcantidad = eval($(this).val());
                        else
                            txtcantidad = txtcantidad + ',' + eval($(this).val());
                    }
                );

                txtunidad = '';
                $(".uni").each(
                    function (index, value) {
                        if (txtunidad == '')
                            txtunidad = $(this).val();
                        else
                            txtunidad = txtunidad + ',' + $(this).val();
                    }
                );


                txtcu = '';
                $(".cu").each(
                    function (index, value) {
                        if (txtcu == '')
                            txtcu = $(this).val();
                        else
                            txtcu = txtcu + ',' + $(this).val();
                    }
                );

                txtplaca = '';
                $(".placa").each(
                    function (index, value) {
                        if (txtplaca == '')
                            txtplaca = $(this).val();
                        else
                            txtplaca = txtplaca + ',' + $(this).val();
                    }
                );

                txtarti = '';
                $(".codart").each(
                    function (index, value) {
                        if (txtarti == '')
                            txtarti = $(this).val();
                        else
                            txtarti = txtarti + ',' + $(this).val();
                    }
                );

                txtsub = 0;
                $(".subtotal").each(
                    function (index, value) {
                        txtsub = eval(txtsub) + eval($(this).val());
                    }
                );


                $("#cod_articulox").val(txtarti);
                $("#atendidox").val(txtcantidad);
                $("#unix").val(txtunidad);
                $("#cux").val(txtcu);
                $("#placax").val(txtplaca);
                $("#TotalCosto").val(txtsub);

                var ary = $("#guiaiInsert").serializeArray();
                var obj = {};
                for (var a = 0; a < ary.length; a++)
                    obj[ary[a].name] = ary[a].value;



                $.ajax({
                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    url: 'http://' + url + '/Services/Logistica/Almacen.svc/InsertarCabeceraRequerimientoAlmacen',
                    data: JSON.stringify(obj),
                    dataType: "json",
                    success: function (response) {

                        if (response.d.substr(0, 1) == 0) {
                            alert(response.d);
                            $("#cancelar").click();
                            listar_guiai();
                            limpiar();

                        }
                        else {
                            alert(response.d);
                            /*$("#results").html(a.responseText);
                            window.location = "http://" + url + "/login/Index.aspx";*/
                        }

                    },
                    error: function (a) {
                        alert(a.responseText);
                        /*$("#results").html(a.responseText);
                        window.location = "http://" + url + "/login/Index.aspx";*/
                    }
                });



            }
            event.preventDefault();
        });





    </script>