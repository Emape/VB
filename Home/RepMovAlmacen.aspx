<%@ Page Language="VB" AutoEventWireup="false" CodeFile="~/Home/RepMovAlmacen.aspx.vb" Inherits="RepMovAlmacen" %>
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
            
              Reporte de Movimientos de Almacén
          </h1>
         
          <ol class="breadcrumb">
            <li><a href="#"><i class="fa fa-dashboard"></i> Almacén</a></li>
            <li><a href="#">Reporte</a></li>
            <li class="active">Movimientos de Almacén</li>
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
                 
                 <div class="row">		
                     <div class="col-xs-3">
                         </div>		
					<div class="col-xs-2">
					<div class="dataTables_length">
					 &nbsp;  Mov. Almacén:              
					</div>
					</div>
					<div class="col-xs-3">
					<div class="dataTables_length">
					<asp:RadioButton checked GroupName="grupo1" name="mov" id="mov1" runat="server" aria-controls="tabla_inventario"  /> Ingresos &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:RadioButton GroupName="grupo1" name="mov" id="mov2" runat="server" aria-controls="tabla_inventario"  /> Salidas 

					</div>
					</div>
				 </div>
                 <br>
                 <div class="row">				
					<div class="col-xs-3">
                         </div>		
					<div class="col-xs-2">
					<div class="dataTables_length">
					 &nbsp;  Tipo Reporte:              
					</div>
					</div>
					<div class="col-xs-3">
					<div class="dataTables_length">
					<asp:RadioButton checked GroupName="grupo2" name="tip" id="tip1" runat="server" aria-controls="tabla_inventario"  /> Por Periodo &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                    <asp:RadioButton GroupName="grupo2" name="tip" id="tip2" runat="server" aria-controls="tabla_inventario"  /> Por Transacción 

					</div>
					</div>
				 </div>
                 <br>
                 <div class="row">				
					<div class="col-xs-3">
                         </div>		
					<div class="col-xs-2">
					<div class="dataTables_length">
					 &nbsp;  Fecha:              
					</div>
					</div>
					<div class="col-xs-3">
					<div class="dataTables_length">
                        <asp:dropdownlist style="width:230px" runat="server" name="mes" id="mes" aria-controls="tabla_inventario" class="form-control input-sm">
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
                        <br>
                        <asp:dropdownlist style="width:230px" runat="server" name="anno" id="anno" aria-controls="tabla_inventario" class="form-control input-sm">
                            <asp:listitem selected value ="2015"> 2015 </asp:listitem >
                            <asp:listitem value ="2016"> 2016 </asp:listitem >
                            <asp:listitem value ="2017"> 2017 </asp:listitem >
                            <asp:listitem value ="2018"> 2018 </asp:listitem >
                            <asp:listitem value ="2019"> 2019 </asp:listitem >
                            <asp:listitem value ="2020"> 2020 </asp:listitem >
                           
                        </asp:dropdownlist>
					    
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

