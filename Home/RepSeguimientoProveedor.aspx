<%@ Page Language="VB" AutoEventWireup="false" CodeFile="~/Home/RepSeguimientoProveedor.aspx.vb" Inherits="RepSeguimientoProveedor" %>
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
            
              Reporte de Seguimiento al Proveedor
          </h1>
         
          <ol class="breadcrumb">
            <li><a href="#">Lógistica</a></li>
            <li><a href="#">Reporte</a></li>
            <li class="active">Seguimiento al Proveedor</li>
          </ol>
        </section>

        <!-- Main content -->
        <section class="content">
          
            <div class="row">
            <div class="col-md-12">

              <div class="box box-primary">
                <div class="box-header">
                 
				  


             <form id="form1" runat="server">

                 <br> 
                 <div class="row">
                     

                    <div class="col-xs-2" id="label_razon_social">
					<div class="dataTables_length" style="text-align:right">
					 &nbsp;  RUC/Razón Social: </div>
					</div>


					<div class="col-xs-6">
					<div class="dataTables_length">
                    <asp:TextBox style="display:none" name="cod_empresa" id="cod_empresa" runat="server" aria-controls="tabla_inventario" class="form-control input-sm" />

					<asp:TextBox name="descripcion" id="descripcion" runat="server" aria-controls="tabla_inventario" class="form-control input-sm" />
                    <asp:TextBox style="display:none" name="cod_ruc" id="cod_ruc" runat="server" aria-controls="tabla_inventario" class="form-control input-sm" />

					</div>
					</div>


                    <div class="col-xs-3" align="right" style="margin-right:32px;">
                        <div class="dataTables_length">
                    
                            <span title="Buscar" onclick="listar_proveedor()" id="Buscar" class="btn btn-primary" style="font-size:12px;" >
                            <i  class="fa fa-search" ></i> &nbsp; Buscar
                        </span>
                            &nbsp;

                         <asp:Button style="display:none" ID="btn_r1" Text="Exportar" runat="server" OnClientClick="target = '_blank'" OnClick="Imprimir" />
                            <span title="imprimir" onclick="imprimir()" id="imprimir" class="btn btn-success" style="font-size:12px;display:none" >
                            <i  class="fa fa-print" ></i> &nbsp; Imprimir
                        </span>

                                                  

                        </div>
                        </div>
                     <//div>

		  </form>
				  
				  
				  
                </div>
                <div class="box-body pad table-responsive"   style="overflow:scroll;height:680px">
				
					
				
					
	         <table id="tablaproveedor"  class="table table-bordered table-hover dataTable no-footer" role="grid" aria-describedby="tabla_inventario_info">
				  <thead>
                    <tr  class="cabecera">
                      
                      <th style="text-align:center;width:50px" ><b>Item </b></th>
                      <th style="text-align:center;width:150px" ><b>RUC </b></th>
                      <th style="text-align:center" ><b>Razón Social </b></th>
                   
                    </tr>
					</thead>
                    
                   <tbody id="body_proveedor">
			   <tr ><td  colspan="11" align="center">No se encontraron resultados</td></tr>		
                  </table>

				  
                </div><!-- /.box -->
              </div>
            </div><!-- /.col -->
          </div><!-- ./row -->



        </section><!-- /.content -->
	 
	<script src="../js/jquery.uitablefilter.js" ></script>
            
    <script type="text/javascript">

        function listar_proveedor() {
            if ($("#descripcion").val().trim() == "")
                alert("Ingrese Ruc o Razón Social");
            else {
                $("#imprimir").css("display", "none");
                url = document.url;
                $("#body_proveedor").html("<tr><td colspan=3><div align=center ><img src='../images/loader.gif'></div></td></tr>");
                $.ajax({
                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    url: 'http://' + location.host + '/Services/Logistica/Almacen.svc/listarProveedores',
                    data: '{"Proveedor": "%' + $("#descripcion").val() + '%","empresa": "' + $("#id_empresa").val() + '"}',
                    dataType: "json",
                    success: function (response) {
                        var customers = eval(response.d);
                        var html = "";
                        var xnro = 1;
                        $.each(customers, function () {

                            html += "<tr id='fila" + xnro + "' onclick=detalle('" + this.IdProveedor + "','" + xnro + "') style='cursor:pointer'><td style='text-align:center'>"
                                 + xnro + " </td><td style='text-align:center'>" + this.IdProveedor + " </td><td style='text-align:left'> " + this.RazonSocial + "</td> </tr>";
                            xnro++;
                        });
                        $("#body_proveedor").html(html == "" ? "<tr><td colspan='3'> <div align=center><br>No se encontraron resultados</div></td></tr>" : html);
                    },
                    error: function (a, b, c) {
                        alert(a.responseText);
                    }
                });
            }
        }

        function detalle(cod,u) {
            $('#tablaproveedor tr').removeClass('highlighted');
            $("#fila" + u).addClass('highlighted');
            $("#cod_ruc").val(cod);
            $("#imprimir").css("display","inline-block");
        }


        function imprimir() {
            if (window.location.pathname == '/') {
                alert("La url es incorrecta, intentalo nuevamente");
                window.location = "http://" + location.host + "/Home/Index.aspx";
            }
            else {
                $("#cod_empresa").val($("#id_empresa").val())
                $("#btn_r1").click();
            }
        }
</script>