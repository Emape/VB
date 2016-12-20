<%@ Page Language="VB" AutoEventWireup="false" CodeFile="~/Home/RepKardex.aspx.vb" Inherits="RepKardex" %>
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
            
              Reporte de Kardex
          </h1>
         
          <ol class="breadcrumb">
            <li><a href="#">Almacén</a></li>
            <li><a href="#">Reporte</a></li>
            <li class="active">Kardex</li>
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
										


					<div class="col-xs-1">
					<div class="dataTables_length" style="text-align:right">
					 &nbsp;  Periodo: </div>
					</div>


					<div class="col-xs-1">
					<div class="dataTables_length">
					 <asp:dropdownlist style="width:80px" runat="server" name="mesx" id="mesx" aria-controls="tabla_inventario" class="form-control input-sm">
                            <asp:listitem selected value ="01"> Enero </asp:listitem >
                            <asp:listitem value ="02"> Febrero </asp:listitem >
                            <asp:listitem value ="03"> Marzo </asp:listitem >
                            <asp:listitem value ="04"> Abril </asp:listitem >
                            <asp:listitem value ="05"> Mayo </asp:listitem >
                            <asp:listitem value ="06"> Junio </asp:listitem >
                            <asp:listitem value ="07"> Julio </asp:listitem >
                            <asp:listitem value ="08"> Agosto </asp:listitem >
                            <asp:listitem value ="09"> Setiembre </asp:listitem >
                            <asp:listitem value ="10"> Octubre </asp:listitem >
                            <asp:listitem value ="11"> Noviembre </asp:listitem >
                            <asp:listitem value ="12"> Diciembre </asp:listitem >
                        </asp:dropdownlist>
                        
                        </div>
                             </div>


                         <div class="col-xs-1">
					<div class="dataTables_length" align="right">
                        HASTA
                        </div>
                             </div>


                         <div class="col-xs-1">
					<div class="dataTables_length">
                        <asp:dropdownlist style="width:80px" runat="server" name="mesy" id="mesy" aria-controls="tabla_inventario" class="form-control input-sm">
                            <asp:listitem value ="01"> Enero </asp:listitem >
                            <asp:listitem value ="02"> Febrero </asp:listitem >
                            <asp:listitem value ="03"> Marzo </asp:listitem >
                            <asp:listitem value ="04"> Abril </asp:listitem >
                            <asp:listitem value ="05"> Mayo </asp:listitem >
                            <asp:listitem value ="06"> Junio </asp:listitem >
                            <asp:listitem selected value ="07"> Julio </asp:listitem >
                            <asp:listitem value ="08"> Agosto </asp:listitem >
                            <asp:listitem value ="09"> Setiembre </asp:listitem >
                            <asp:listitem value ="10"> Octubre </asp:listitem >
                            <asp:listitem value ="11"> Noviembre </asp:listitem >
                            <asp:listitem value ="12"> Diciembre </asp:listitem >
                        </asp:dropdownlist>
                        </div>
                             </div>
                        <div class="col-xs-1">
					<div class="dataTables_length">
                        <asp:dropdownlist style="width:80px" runat="server" name="annox" id="annox" aria-controls="tabla_inventario" class="form-control input-sm">
                            <asp:listitem value ="2015"> 2015 </asp:listitem >
                            <asp:listitem selected value ="2016"> 2016 </asp:listitem >
                            <asp:listitem value ="2017"> 2017 </asp:listitem >
                            <asp:listitem value ="2018"> 2018 </asp:listitem >
                            <asp:listitem value ="2019"> 2019 </asp:listitem >
                            <asp:listitem value ="2020"> 2020 </asp:listitem >
                           
                        </asp:dropdownlist>
					    
					</div>
					</div>
                    



					<!--<div class="col-xs-2">
					<div class="dataTables_length">
					<asp:TextBox name="fechafin" id="fechafin" runat="server" aria-controls="tabla_inventario" class="form-control input-sm" />

					</div>
					</div>-->









                    <div class="col-xs-1">
					<div class="dataTables_length" style="text-align:right">
					 &nbsp;  Almacén: </div>
					</div>


					<div class="col-xs-2">
					<div class="dataTables_length">
					<select style="width:150px" onchange="p_alm()"  name="selalmacen" id="selalmacen" aria-controls="tabla_inventario" class="form-control input-sm">
                                                 
                        </select>
					</div>
					</div>

                    <div class="col-xs-3">
					<div class="dataTables_length">

					<label><asp:Textbox id="almacen" name="almacen" runat="server" value="" style="display:none"/></label>
                    <label><asp:CheckBox id="stock" name="stock" runat="server"/> Con Stock &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;</label>
                    <label><asp:CheckBox id="valor" name="valor" runat="server"/> Valorizado &nbsp; &nbsp;&nbsp;&nbsp;&nbsp;</label>
                    <label><asp:CheckBox id="excel" name="excel" runat="server"/> Excel   </label>
                    </div>
					</div>

                  



				 </div>
                 <br> 
                 <div class="row">
                     

                         <div class="col-xs-1" id="label_articulo">
					<div class="dataTables_length" style="text-align:right">
					 &nbsp;  Artículo: </div>
					</div>


					<div class="col-xs-6">
					<div class="dataTables_length">
                    <asp:TextBox style="display:none" name="cod_empresa" id="cod_empresa" runat="server" aria-controls="tabla_inventario" class="form-control input-sm" />
					<asp:TextBox name="articulo" id="articulo" runat="server" aria-controls="tabla_inventario" class="form-control input-sm" />
                    <asp:TextBox style="display:none" name="cod_articulo" id="cod_articulo" runat="server" aria-controls="tabla_inventario" class="form-control input-sm" />

					</div>
					</div>
                    <div class="col-xs-4" align="right" style="margin-right:32px;">
                        <div class="dataTables_length">
                    
                            <span title="Buscar" onclick="listar()" id="Buscar" class="btn btn-primary" style="font-size:12px;" >
                            <i  class="fa fa-search" ></i> &nbsp; Buscar
                        </span>
                            &nbsp;
                             <span title="Limpiar" onclick="limpiar()" id="limpiar" class="btn btn-danger" style="font-size:12px;" >
                            <i  class="fa fa-paint-brush" ></i> &nbsp; Limpiar
                        </span>
                            &nbsp;

                         <asp:Button style="display:none" ID="btn_r1" Text="Exportar" runat="server" OnClientClick="target = '_blank'" OnClick="Imprimir" />
                            <span title="imprimir" onclick="imprimir()" id="imprimir" class="btn btn-success" style="font-size:12px;" >
                            <i  class="fa fa-print" ></i> &nbsp; Imprimir
                        </span>

                                                  

                        </div>
                        </div>
                     <//div>

		  </form>
				  
				  
				  
                </div>
                <div class="box-body pad table-responsive"   style="overflow:scroll;height:680px">
				
					
				
					
	         <table id="tablasum"  class="table table-bordered table-hover dataTable no-footer" role="grid" aria-describedby="tabla_inventario_info">
				  <thead>
                    <tr  class="cabecera">
                      
                      <th style="text-align:center" ><b>Código </b></th>
                      <th style="text-align:center;width:50px" ><b>U.M. </b></th>
                      <th style="text-align:center" ><b>Descripción </b></th>
                   
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
        function imprimir() {
            if (window.location.pathname == '/') {
                alert("La url es incorrecta, intentalo nuevamente");
                window.location = "http://" + location.host + "/Home/Index.aspx";
            }
            else {
                $("#cod_empresa").val($("#id_empresa").val())

                if ($("#mesx").val() == "")
                    alert("Ingrese Fecha Inicial");
                else if ($("#mesy").val() == "")
                    alert("Ingrese Fecha Final");
                else if ($("#selalmacen").val() == "")
                    alert("Seleccione un Almacen");
                else if ($("#mesx").val() > $("#mesy").val())
                    alert("La Fecha Final debe ser mayor a la Fecha Inicial");
                else
                    $("#btn_r1").click();
            }
        }
        function limpiar() {
            $("#articulo").val("");
            $("#cod_articulo").val("");
            $("#body_guia").html("<tr><td colspan='5'> <div align=center><br>No se encontraron resultados</div></td></tr>");
        }
        function p_alm() {
            $("#almacen").val($("#selalmacen").val());
        }

        $(document).ready(function () {
            url = location.host;
            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: 'http://' + url + '/Services/Logistica/Almacen.svc/listarAlmacen',
                data: '{"empresa": "' + $("#id_empresa").val() + '"}',
                dataType: "json",
                success: function (response) {
                    var customers = eval(response.d);
                    var html = "<option value =''> Seleccionar </option >";

                    $.each(customers, function () {

                        //<td> " + this.Estado + "</td>
                        html += "<option value ='" + this.IdAlm + "'> " + this.DetalleAlm + "</option >";

                    });
                    $("#selalmacen").html(html == "" ? "" : html);
                },
                error: function (a, b, c) {
                    alert(a.responseText);
                    $("#results").html(a.responseText);
                }
            });

            $("#fechaini,#fechafin").datepicker({
                format: "dd/mm/yyyy",
                todayHighlight: true,
                autoclose: true
            });

            var f = new Date();

            fechaactual = ('0' + f.getDate()).slice(-2).toString()
               + '/' + ('0' + (f.getMonth() + 1)).slice(-2).toString()
               + '/' + f.getFullYear().toString();

            $("#fechaini").val(fechaactual);
            $("#fechafin").val(fechaactual);



            theTable1 = $("#tablasum");

            $("#articulo").keyup(function () {
                $.uiTableFilter(theTable1, this.value);
            });

            $("#tip").change(function () {
                if ($("#tip").val() != "0") {
                    if ($("#tip").val() == "4" || $("#tip").val() == "5") {
                        $("#Buscar").show(); $("#label_articulo").show(); $("#articulo").show();
                        $("#tablasum").show();
                    }
                    else {
                        $("#Buscar").hide(); $("#label_articulo").hide(); $("#articulo").hide();
                        $("#tablasum").hide();
                        $("#cod_articulo").val("");
                        $('#tablasum tr').removeClass('highlighted');

                    }
                    $("#imprimir").show();
                } else
                    $("#imprimir").hide();
            });
        });

        function listar() {
            if ($("#articulo").val().length < 6)
                alert("Ingrese más de 6 caracteres en el Artículo");
            else {
                $("#body_guia").html("<tr><td colspan=9><div align=center ><img src='../images/loader.gif'></div></td></tr>");
                $.ajax({
                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    url: 'http://' + url + '/Services/Logistica/Almacen.svc/listarBienServicio',
                    data: '{"articulo": "' + $("#articulo").val() + '","empresa": "' + $("#id_empresa").val() + '" }',
                    dataType: "json",
                    success: function (response) {
                        var customers = eval(response.d);
                        var html = "";
                        var xnro = 0;
                        $.each(customers, function () {
                            //<td> " + this.Estado + "</td>
                            html += "<tr id='fila" + xnro +
                            "' onclick=detalle_guia('" + this.Codigo + "','" + this.Codigo + "','" + xnro + "') style='cursor:pointer'><td style='text-align:center;'>"
                            + this.Codigo + " </td><td style='text-align:left'> " + this.UM + "</td><td > " +
                            this.Detalle + "</td></tr>";
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
        }



        function detalle_guia(cod, des, u) {
            $('#tablasum tr').removeClass('highlighted');
            $("#fila" + u).addClass('highlighted');
            $("#cod_articulo").val(des);

        }

</script>