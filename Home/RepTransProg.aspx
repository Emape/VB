<%@ Page Language="VB" AutoEventWireup="false" CodeFile="~/Home/RepTransProg.aspx.vb" Inherits="RepTransProg" %>
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
            
              Reporte de Programación Mensual
          </h1>
         
          <ol class="breadcrumb">
            <li><a href="#"><i class="fa fa-dashboard"></i> Transporte</a></li>
            <li><a href="#">Reporte</a></li>
            <li class="active">Programación Mensual</li>
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
                  <div class="row">		
                     <div class="col-xs-3">
                         </div>		
					<div class="col-xs-2">
					<div class="dataTables_length">
					 &nbsp;  Mes:              
					</div>
					</div>
					<div class="col-xs-3">
					<div class="dataTables_length">
					<asp:dropdownlist style="width:230px" runat="server" name="mes" id="mes" aria-controls="tabla_inventario" class="form-control input-sm">
                            <asp:listitem value ="01"> Enero </asp:listitem >
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
				 </div>
                 <br>
      
                 <div class="row">				
					<div class="col-xs-3">
                         </div>		
					<div class="col-xs-2">
					<div class="dataTables_length">
					 &nbsp;  Año:              
					</div>
					</div>
					<div class="col-xs-3">
					<div class="dataTables_length">
                        <asp:dropdownlist style="width:230px" runat="server" name="anno" id="anno" aria-controls="tabla_inventario" class="form-control input-sm">
                            <asp:listitem value ="2015"> 2015 </asp:listitem >
                            <asp:listitem selected value ="2016"> 2016 </asp:listitem >
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
					<asp:Button style="display:none" ID="btn_r1" Text="Exportar" runat="server" OnClick="Exportr1" />
                            <span title="imprimir" onclick="imprimir_excel()" id="imprimir" class="btn btn-success" style="font-size:12px;" >
                            <i  class="fa fa-file-excel-o" ></i> &nbsp; Exportar
                        </span>

                        <span title="imprimir" onclick="cierre()" id="btn_r2" class="btn btn-success" style="font-size:12px;display:none" >
                            <i  class="fa fa-file-excel-o" ></i> &nbsp; Cierre
                        </span>

                            &nbsp;
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
					
                        <div id="div_load"></div>

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
            cierre();

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

        function cierre() {
            $("#div_load").html("<div  ><img src='../images/loader.gif'></div>");
            $.ajax({
                type: "POST",
                contentType: "application/json; charset=utf-8",
                url: 'http://isis:88/Services/Logistica/Transporte.svc/Cierre',
                data: '{"mes": "' + $("#mes").val() + '","anno": "' + $("#anno").val() + '"}',
                dataType: "json",
                success: function (response) {
                    $("#btn_r1").click();
                    $("#div_load").html("");
                },
                error: function (a, b, c) {
                    alert(a.responseText);
                    $("#results").html(a.responseText);
                }
            });
        }


    </script>
