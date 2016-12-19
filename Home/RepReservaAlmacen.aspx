<%@ Page Language="VB" AutoEventWireup="false" CodeFile="~/Home/RepReservaAlmacen.aspx.vb" Inherits="RepReservaAlmacen" %>

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
            
              Reporte de Reserva de Almacén
          </h1>
         
          <ol class="breadcrumb">
            <li><a href="#"><i class="fa fa-dashboard"></i> Almacén</a></li>
            <li><a href="#">Reporte</a></li>
            <li class="active">Reserva de Almacén</li>
          </ol>
        </section>

        <!-- Main content -->
        <section class="content">
          
            <div class="row">
            <div class="col-md-12">

              <div class="box box-primary">
                <div class="box-header" style="height:780px">
                 
				  


             <form id="form1" runat="server">
                       
                 <asp:TextBox style="display:none" name="cod_empresa" id="cod_empresa" runat="server" aria-controls="tabla_inventario" class="form-control input-sm" />
                     <div class="row">
										
					<div class="col-xs-1">
					<div class="dataTables_length">
					 &nbsp; <b> </b> 
                                 
					</div>
					</div>


					<div class="col-xs-2">
					<div class="dataTables_length">
					
					</div>
					</div>

                        <div class="col-xs-3">
                        </div>
                        <div class="cols-xs-3" align="right" style="margin-right:32px;">
                        <div class="dataTables_length">
                         

                        </div>
                        </div>


				 </div>
                 

                 <br>
                 <div class="row">				
					<div class="col-xs-3">
                         </div>		
					<div class="col-xs-2">
					<div class="dataTables_length">
					 &nbsp;  Bien/Servicio Inicial:              
					</div>
					</div>
					<div class="col-xs-3">
					<div class="dataTables_length">
             
                        <asp:TextBox name="idbienservicioinicial" id="idbienservicioinicial" runat="server" aria-controls="tabla_inventario" class="form-control input-sm" />
					    
                    </div>
					</div>
				 </div>
                 <br>

                                  <div class="row">				
					<div class="col-xs-3">
                         </div>		
					<div class="col-xs-2">
					<div class="dataTables_length">
					 &nbsp;  Bien/Servicio Final:              
					</div>
					</div>
					<div class="col-xs-3">
					<div class="dataTables_length">
             
                        <asp:TextBox name="idbienserviciofinal" id="idbienserviciofinal" runat="server" aria-controls="tabla_inventario" class="form-control input-sm" />
					    
                    </div>
					</div>
				 </div>
                 <br>
                 <div class="row">				
					<div class="col-xs-3">
                         </div>		
					<div class="col-xs-2">
					<div class="dataTables_length">
					 &nbsp;             
					</div>
					</div>
					<div class="col-xs-3">
					<div class="dataTables_length">
					<asp:Button style="display:none" ID="btn_r1" Text="Exportar" runat="server" OnClientClick="target = '_blank'" OnClick="Imprimir" />
                            <span title="imprimir" onclick="imprimir_excel()" id="imprimir" class="btn btn-success" style="font-size:12px;" >
                            <i  class="fa fa-print" ></i> &nbsp; Imprimir
                        </span>
                            &nbsp;
					</div>
					</div>
				 </div>
		  </form>
                </div>        
              </div>
            </div><!-- /.col -->
          </div><!-- ./row -->



        </section><!-- /.content -->
            
    <script type="text/javascript">
        function imprimir_excel() {
            $("#cod_empresa").val($("#id_empresa").val())

            if ($("#idbienservicioinicial").val()=="") {
                alert("Ingrese el Codigo de Bien/Servicio Inicial");
            }
            else if ($("#idbienserviciofinal").val()=="") {
                alert("Ingrese el Codigo de Bien/Servicio Final");
            }
            else
            $("#btn_r1").click();

        }
    </script>
