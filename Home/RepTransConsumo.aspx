<%@ Page Language="VB" AutoEventWireup="false" CodeFile="~/Home/RepTransConsumo.aspx.vb" Inherits="RepTransConsumo" %>

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
            
              Reporte de Kilometraje y Combustible
          </h1>
         
          <ol class="breadcrumb">
            <li><a href="#"><i class="fa fa-dashboard"></i> Transporte</a></li>
            <li><a href="#">Reporte</a></li>
            <li class="active">Kilometraje y Combustible</li>
          </ol>
        </section>

        <!-- Main content -->
        <section class="content">
          
            <div class="row">
            <div class="col-md-12">

              <div class="box box-primary">
                <div class="box-header" style="height:780px">
                 
				  


             <form id="form1" runat="server">
                       

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
                 <!--<div class="row">		
                     <div class="col-xs-3">
                         </div>		
					<div class="col-xs-2">
					<div class="dataTables_length">
					 &nbsp;  Placa:              
					</div>
					</div>
					<div class="col-xs-3">
					<div class="dataTables_length">
					<asp:TextBox name="placa" id="placa" runat="server" aria-controls="tabla_inventario" class="form-control input-sm" />

					</div>
					</div>
				 </div>    <br>   -->    
                 <div class="row">		
                     <div class="col-xs-3">
                         </div>		
					<div class="col-xs-2">
					<div class="dataTables_length">
					 &nbsp;  Fecha Inicio:              
					</div>
					</div>
					<div class="col-xs-3">
					<div class="dataTables_length">
					<asp:TextBox name="ini" id="ini" runat="server" aria-controls="tabla_inventario" class="form-control input-sm" />

					</div>
					</div>
				 </div>
                 <br>
                 <div class="row">				
					<div class="col-xs-3">
                         </div>		
					<div class="col-xs-2">
					<div class="dataTables_length">
					 &nbsp;  Fecha Fin:              
					</div>
					</div>
					<div class="col-xs-3">
					<div class="dataTables_length">
					<asp:TextBox name="fin" id="fin" runat="server" aria-controls="tabla_inventario" class="form-control input-sm" />

					</div>
					</div>
				 </div>
                 <br>
                 <div class="row">				
					<div class="col-xs-3">
                         </div>		
					<div class="col-xs-2">
					<div class="dataTables_length">
					 &nbsp;  Criterio:              
					</div>
					</div>
					<div class="col-xs-3">
					<div class="dataTables_length">
                        <asp:dropdownlist style="width:230px" runat="server" name="cri" id="cri" aria-controls="tabla_inventario" class="form-control input-sm">
                            <asp:listitem value ="1"> Kilometros Recorridos </asp:listitem >
                            <asp:listitem value ="2"> Combustible Consumido </asp:listitem >
                            <asp:listitem value ="3"> Resumen Vehicular de Kilometraje y Combustible </asp:listitem >
                            <asp:listitem value ="4"> Resumen por Vehiculo </asp:listitem >
                            <asp:listitem value ="5"> Resumen por Areas </asp:listitem >
                            <asp:listitem value ="6"> Resumen de Ingresos y Salidas </asp:listitem >
                        </asp:dropdownlist>
					    
                    </div>
					</div>
				 </div>
                 <br>
   
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
					<asp:Button style="display:none" ID="btn_r1" Text="Exportar" runat="server" OnClick="Exportr1" />
                            <span title="imprimir" onclick="imprimir_excel()" id="imprimir" class="btn btn-success" style="font-size:12px;" >
                            <i  class="fa fa-file-excel-o" ></i> &nbsp; Exportar
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
	 
	<script src="../js/jquery.uitablefilter.js" ></script>
            
    <script type="text/javascript">
        function imprimir_excel() {

            if ($('#ini').val() == '')
                alert("Ingresar Fecha Inicial");
            else if ($('#fin').val() == '')
                alert("Ingresar Fecha Final");
            else
            $("#btn_r1").click();

        }

        $(document).ready(function () {


            $("#suministro").hide();

            $("#ini").datepicker({
                format: "dd/mm/yyyy",
                todayHighlight: true,
                autoclose: true
            });

            $("#fin").datepicker({
                format: "dd/mm/yyyy",
                todayHighlight: true,
                autoclose: true
            });

         

            var f = new Date();

            fechaactual = ('0' + f.getDate()).slice(-2).toString()
               + '/' + ('0' + (f.getMonth() + 1)).slice(-2).toString()
               + '/' + f.getFullYear().toString();

            $("#fecha").val(fechaactual);


            theTable1 = $("#tablasum");

            $("#search").change(function () {
                $.uiTableFilter(theTable1, this.value);

                $("#imprimir").show();

            });


        });




    </script>
