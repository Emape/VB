<%@ Page Language="VB" AutoEventWireup="false" EnableEventValidation="false"  CodeFile="~/Home/Locadorxgerencia.aspx.vb" Inherits="Locadorxgerencia" %>
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
            <li class="active">Asignación a Gerencia</li>
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
						
                      <div class="col-xs-2">
					<div class="dataTables_length">
					 &nbsp;  Gerencia : <br>
                       <asp:dropdownlist runat="server" name="gerencia" id="gerencia" aria-controls="tabla_inventario" class="form-control input-sm" onchange="listar();listar_departamento();" style="width:150px">
                           <asp:listitem value="0"> Todas </asp:listitem>
                       </asp:dropdownlist>
					</div>
					</div>
                         <div class="col-xs-2">
					<div class="dataTables_length">
					 &nbsp;  Departamento : <br>

                       <asp:dropdownlist runat="server" name="departamento" id="departamento" aria-controls="tabla_inventario" class="form-control input-sm" onchange="listar()" style="width:150px">
                            <asp:listitem value="0"> Todas </asp:listitem>
                       </asp:dropdownlist>
					</div>
					</div>
                         				
					<div class="col-xs-3">
					<div class="dataTables_length">
					 &nbsp;  Buscar : <br>
                    <input type=text name="search" id="search" aria-controls="tabla_inventario" class="form-control input-sm">
					</div>
					</div>


                        <div class="col-xs-2">
                        </div>
                        <div class="cols-xs-2" align="right" style="margin-right:20px">
                        <div class="dataTables_length">
                            
                            <span title="Modificar" id="modificar" class="btn btn-primary" style="font-size:12px" data-toggle="modal" data-target="#agregarModal">
                            <i  class="fa fa-random" ></i> &nbsp; Asignar
                            </span>
                            <span title="Eliminar" id="eliminar" class="btn btn-danger close1" style="font-size:12px" data-toggle="modal" data-target="#eliminarModal" >
                            <i  class="fa fa-minus-circle" ></i> &nbsp; Denegar
                            </span>
                           
                          
                            <asp:Button style="display:none" ID="btn_r1" Text="Exportar" runat="server" OnClientClick="target = '_blank'" OnClick="Exportar" />
                            <span title="imprimir" onclick="imprimir()" id="imprimir" class="btn btn-success" style="font-size:12px;" >
                            <i  class="fa fa-print" ></i> &nbsp; Imprimir
                        </span>
                            <asp:TextBox style="display:none" name="cod_empresa" id="cod_empresa" runat="server" aria-controls="tabla_inventario" class="form-control input-sm" />
                             <asp:TextBox style="display:none" value="0" name="tdepartamento" id="tdepartamento" runat="server" aria-controls="tabla_inventario" class="form-control input-sm" />
                             <asp:TextBox style="display:none" value="0" name="tgerencia" id="tgerencia" runat="server" aria-controls="tabla_inventario" class="form-control input-sm" />

                        <asp:dropdownlist runat=server name="tipo" id="tipo" style="height:33px;width:50px;border-radius:5px;" >
                                <asp:listitem value="0"> PDF </asp:listitem>
                                <asp:listitem value="1"> XLS </asp:listitem>
                          </asp:dropdownlist>
                        </div>
                        </div>


				 </div>
                       </form>
<form id="asignar" class="form-horizontal" >	
<input type="hidden" name="cod" id="cod" >
<div class="modal fade" id="agregarModal" tabindex="-1" role="dialog" aria-labelledby="Login" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-content">
            <div class="modal-header">
               
                <h1 class="modal-title" style="font-size:18px;font-weight:bold">Asignar Gerencia</h1>
            
            
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
                                <label class="col-lg-3 control-label"  >RUC</label>
                                <div class="col-lg-5">
                                    <span  id="xruc" ></span>
                                    <input type="hidden" id="xempresa" name="xempresa">
                                </div>
                            </div>
							
                 <div class="form-group">
                                <label class="col-lg-3 control-label">Departamento</label>
                                <div class="col-lg-5">
                                  <select class="form-control" name="xdepartamento" id="xdepartamento" >
                                        <option value="0"> Seleccionar </option>
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
                      <th style="text-align:center" >Locador </th>
                      <th style="text-align:center" >Tipo </th>
                      <th style="text-align:center" >Función </th>
                      <th style="text-align:center" >Sueldo </th>
                      <th style="text-align:center" >Orden </th>
                      <th style="text-align:center" >Fecha </th>
                      <th style="text-align:center" >Importe </th>
                      <th style="text-align:center" >Saldo </th>
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
                    <h4 class="modal-title" id="myModalLabel">Eliminar Asignación</h4>
                </div>
            
                <div class="modal-body">
                    <p>¿Desea Eliminar la Asignación con N° RUC  <span id="nro"></span> ?</p>
              
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
            $("#asignar").submit();
        }

        function imprimir() {
            if (window.location.pathname == '/') {
                alert("La url es incorrecta, intentalo nuevamente");
                window.location = "http://" + location.host + "/Home/Index.aspx";
            }
            else {
                $("#cod_empresa").val($("#id_empresa").val());
                $("#tgerencia").val($("#gerencia").val())
                $("#tdepartamento").val($("#departamento").val())
                    $("#btn_r1").click();
            }
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
            listar_xdepartamento()
        });



        function listar_gerencia() {
            url = document.url;
            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: 'http://' + location.host + '/Services/Maestro.svc/listarGerencia',
                data: '{"empresa": "' + $("#id_empresa").val() + '" }',
                dataType: "json",
                success: function (response) {
                    var customers = eval(response.d);
                    var html = "<option value='0'> Todas </option>";
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
            var gerencia = $("#gerencia").val();
            url = document.url;
            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: 'http://' + location.host + '/Services/Maestro.svc/listarDepartamento',
                data: '{"gerencia": "' + gerencia + '","empresa": "' + $("#id_empresa").val() + '" }',
                dataType: "json",
                success: function (response) {
                    var customers = eval(response.d);
                    var html = "<option value='0'> Todas </option>";
                    $.each(customers, function () {
                        html += "<option value='" + this.IdCentroCosto + "'  >" + this.DescripcionCorta + "</option>";
                    });
                    $("#departamento").html(html == "" ? "" : html);
                },
                error: function (a, b, c) {
                    alert(a.responseText);
                    $("#results").html(a.responseText);
                }
            });
        }

        function listar_xdepartamento() {
            var gerencia = $("#gerencia").val();
            url = document.url;
            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: 'http://' + location.host + '/Services/Maestro.svc/listarDepartamento',
                data: '{"gerencia": "0","empresa": "' + $("#id_empresa").val() + '" }',
                dataType: "json",
                success: function (response) {
                    var customers = eval(response.d);
                    var html = "<option value='0' selected> Seleccionar </option>";
                    $.each(customers, function () {
                        html += "<option value='" + this.IdCentroCosto + "'  >" + this.DescripcionCorta + "</option>";
                    });
                    $("#xdepartamento").html(html == "" ? "" : html);
                },
                error: function (a, b, c) {
                    alert(a.responseText);
                    $("#results").html(a.responseText);
                }
            });
        }

        function listar() {
            var gerencia = $("#gerencia").val();
            var departamento = $("#departamento").val();
            $("#body").html("<tr><td colspan=11><div align=center ><img src='../images/loader.gif'></div></td></tr>");
            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                data: '{"gerencia": "' + gerencia + '","departamento": "' + departamento + '","empresa": "' + $("#id_empresa").val() + '" }',
                url: 'http://' + location.host + '/Services/Maestro.svc/listarLocadorArea',
                dataType: "json",
                success: function (response) {
                    var customers = eval(response.d);
                    var html = "";
                    var xnro = 1;
                    $.each(customers, function () {
                       
                        if (this.DescripCC == "") {
                            des = 0;
                        }
                        else {
                            des = 1;
                        }

                        html += "<tr id='fila" + xnro + "'  onclick=detalle('" + this.IdProveedor + "','" + xnro + "','"+des+"')" +
                                " style='cursor:pointer'><td style='text-align:center'>" + xnro + " </td><td style='text-align:left'>" + this.DescripCC +
                                " </td><td style='text-align:left'>" + this.IdProveedor + "</td><td style='text-align:left'> " + this.Razonsocial +
                                " </td><td  style='text-align:left'>" + this.DescripLocadorTipo + "</td><td class='suministro' style='text-align:left'>" +
                                this.Tarea + "</td><td style='text-align:right'>" + this.Importe.toFixed(2) +
                                " </td><td style='text-align:center' >" + this.IdOrdenCompra + "</td><td style='text-align:center' >" + this.FechaOrdenCompra +
                                " </td><td style='text-align:right' >" + this.ValorVenta.toFixed(2) + "</td><td style='text-align:right'>" + this.Saldo.toFixed(2) + "</td> </tr>";

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

        function detalle(cod, u, des) {
            $('#tabla tr').removeClass('highlighted');
            $("#fila" + u).addClass('highlighted');
            $("#cod").val(cod);
            $("#nro").html(cod);
            $("#xruc").html(cod);
            $("#xempresa").val($("#id_empresa").val());
            //$("#modificar").show();
            //$("#eliminar").show();

            if (des == "0") {
                $("#modificar").show();
                $("#eliminar").hide();
            }
            else {
                $("#modificar").hide();
                $("#eliminar").show();
            }
            //obtener_chofer();
        }

        $(".btn-ok").click(function () {
            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: 'http://' + location.host + '/Services/Maestro.svc/EliminarAsignacionGerencia',
                data: '{"ruc": "' + $("#cod").val() + '","empresa": "' + $("#id_empresa").val() + '"}',
                dataType: "json",
                success: function (response) {
                    if (response.d.substr(0, 1) == 0) {
                        alert(response.d);
                        $(".close").click();
                        listar();
                        limpiar();
                    }
                    else {
                        alert(response.d);
                    }
                },
                error: function (a) {
                    alert(a.responseText);
                }
            });
        });


        function limpiar() {
            $('#tabla tr').removeClass('highlighted');
            $("#cod").val("");
            $("#modificar").hide();
            $("#eliminar").hide();
        }

        $("#asignar").submit(function (event) {

            if ($("#xdepartamento").val() == "0")
                alert("Seleccione el departamento");
            else {
                var ary = $("#asignar").serializeArray();
                var obj = {};
                for (var a = 0; a < ary.length; a++)
                    obj[ary[a].name] = ary[a].value;
                $.ajax({
                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    url: 'http://' + location.host + '/Services/Maestro.svc/AsignarGerencia',
                    data: JSON.stringify(obj),
                    dataType: "json",
                    success: function (response) {
                        if (response.d.substr(0, 1) == 0) {
                            alert(response.d);
                            $(".close1").click();
                            listar();
                            limpiar();
                        }
                        else {
                            alert(response.d);
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
