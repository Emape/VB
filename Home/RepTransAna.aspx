<%@ Page Language="VB" AutoEventWireup="false" CodeFile="~/Home/RepTransAna.aspx.vb" Inherits="RepTransAna" %>    
<script type="text/javascript">

    $(function () {


    $('#container2').highcharts({
        data: {
            table: 'datatable2'
        },
        chart: {
            type: 'column'
        },
        title: {
            text: 'Km/gal. por Mes'
        },
        yAxis: {
            allowDecimals: false,
            title: {
                text: 'Km/gal'
            }
        },
        tooltip: {
            formatter: function () {
                return '<b>' + this.series.name + '</b><br/>' +
                    this.point.y + ' ' + this.point.name.toLowerCase();
            }
        }
    });

    });
    </script>

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
            
              Análisis Vehicular
</h1>
                     <span style="float: right;margin: 2px; margin-top: -25px;"> Placa: <input type=TextBox name="placa" id="placa" style="width:80px;display: inline;"  aria-controls="tabla_inventario" class="form-control input-sm" />


Mes/Año:
<select style="width:80px;    display: inline;"  name="mes" id="mes" aria-controls="tabla_inventario" class="form-control input-sm">
                            <option value ="01"> Enero </option>
                            <option value ="02"> Febrero </option>
                            <option value ="03"> Marzo </option>
                            <option value ="04"> Abril </option>
                            <option value ="05"> Mayo </option>
                            <option value ="06"> Junio </option>
                            <option value ="07"> Julio </option>
                            <option value ="08"> Agosto </option>
                            <option value ="09"> Setiembre </option>
                            <option value ="10"> Octubre </option>
                            <option value ="11"> Noviembre </option>
                            <option value ="12"> Diciembre </option >

                        </select>
					
                        <select style="width:70px;display: inline;"  name="anno" id="anno" aria-controls="tabla_inventario" class="form-control input-sm">
                            <option value ="2015"> 2015 </option>
                            <option selected value ="2016"> 2016 </option>
                            <option value ="2017"> 2017 </option>
                            <option value ="2018"> 2018 </option>
                            <option value ="2019"> 2019 </option>
                            <option value ="2020"> 2020 </option>
                           

                        </select>
                            <span title="imprimir" onclick="grafico();" id="imprimir" class="btn btn-success" style="font-size:12px;" >
                            <i  class="fa fa-eye" ></i>
                        </span>

                     </span> 
          

        </section>

        <!-- Main content -->
        <section class="content">
          
            <div class="row">
            <div class="col-md-12">

              <div class="box box-primary">
                <div class="box-header" style="height:802px">
                 
				  


 


                 <div id="container2" style="min-width: 310px; height: 400px; margin: 0 auto"></div>
<table id="datatable2" style="display:none">
    <thead>
        <tr>
            <th></th>
            <th>Distancia (Km.)</th>
            <th>Combustible (Gal.)</th>
        </tr>
    </thead>
    <tbody>
        <tr>
            <th>Enero</th>
            <td>3</td>
            <td>4</td>
        </tr>
        <tr>
            <th>Febrero</th>
            <td>2</td>
            <td>0</td>
        </tr>
        <tr>
            <th>Marzo</th>
            <td>5</td>
            <td>11</td>
        </tr>
        <tr>
            <th>Abril</th>
            <td>1</td>
            <td>1</td>
        </tr>
        <tr>
            <th>Mayo</th>
            <td>2</td>
            <td>4</td>
        </tr>
		        <tr>
            <th>Junio</th>
            <td>3</td>
            <td>4</td>
        </tr>
        <tr>
            <th>Julio</th>
            <td>2</td>
            <td>0</td>
        </tr>
        <tr>
            <th>Agosto</th>
            <td>5</td>
            <td>11</td>
        </tr>
        <tr>
            <th>Setiembre</th>
            <td>1</td>
            <td>1</td>
        </tr>
        <tr>
            <th>Octubre</th>
            <td>2</td>
            <td>4</td>
        </tr>
		        <tr>
            <th>Noviembre</th>
            <td>3</td>
            <td>4</td>
        </tr>
        <tr>
            <th>Diciembre</th>
            <td>2</td>
            <td>0</td>
        </tr>
    </tbody>
</table>
<div id="container" style="min-width: 310px; height: 400px; margin: 0 auto"></div>
<table id="datatable" style="display:none">
    <thead>
        <tr>
            <th></th>
            <th>Distancia (Km.)</th>
            <th>Combustible (Gal.)</th>
        </tr>
    </thead>
    <tbody id="body_dia">
    </tbody>
</table>


 
				  
				  
				  
                </div>
              
              </div>
            </div><!-- /.col -->
          </div><!-- ./row -->



        </section><!-- /.content -->
	<script src="../js/jquery.uitablefilter.js" ></script>
<script>
      /*  function imprimir_excel() {
            cierre();

        }

        $(document).ready(function () {


            $("#suministro").hide();

          


            theTable1 = $("#tablasum");

            $("#search").change(function () {
                $.uiTableFilter(theTable1, this.value);

                $("#imprimir").show();

            });


        });
*/
        function grafico() {
            //$("#div_load").html("<div  ><img src='../images/loader.gif'></div>");

            if ($("#placa").val() == "") {
                alert("Ingrese el N. Placa");
            }
            else {
                $.ajax({
                    type: "POST",
                    contentType: "application/json; charset=utf-8",
                    url: 'http://isis:88/Services/Logistica/Transporte.svc/graficoDia',
                    data: '{"mes": "' + $("#mes").val() + '","anno": "' + $("#anno").val() + '","placa": "' + $("#placa").val() + '"}',
                    dataType: "json",
                    success: function (response) {
                        var customers = eval(response.d);
                        var html = "";
                        var xnro = 0;
                        $.each(customers, function () {
                            //<td> " + this.Estado + "</td>
                            html += "<tr><th>Dia1</th><td>"+this.Dist1+"</td><td>"+this.Cant1+"</td></tr> <tr><th>Dia2</th><td>"+this.Dist2+"</td><td>"+this.Cant2+"</td></tr><tr><th>Dia3</th><td>"+this.Dist3+"</td><td>"+this.Cant3+"</td></tr> <tr><th>Dia4</th><td>"+this.Dist4+"</td><td>"+this.Cant4+"</td></tr><tr><th>Dia5</th><td>"+this.Dist5+"</td><td>"+this.Cant5+"</td></tr> <tr><th>Dia6</th><td>"+this.Dist6+"</td><td>"+this.Cant6+"</td></tr><tr><th>Dia7</th><td>"+this.Dist7+"</td><td>"+this.Cant7+"</td></tr> <tr><th>Dia8</th><td>"+this.Dist8+"</td><td>"+this.Cant8+"</td></tr><tr><th>Dia9</th><td>"+this.Dist9+"</td><td>"+this.Cant9+"</td></tr> <tr><th>Dia10</th><td>"+this.Dist10+"</td><td>"+this.Cant10+"</td></tr><tr><th>Dia11</th><td>"+this.Dist11+"</td><td>"+this.Cant11+"</td></tr> <tr><th>Dia12</th><td>"+this.Dist12+"</td><td>"+this.Cant12+"</td></tr><tr><th>Dia13</th><td>"+this.Dist13+"</td><td>"+this.Cant13+"</td></tr> <tr><th>Dia14</th><td>"+this.Dist14+"</td><td>"+this.Cant14+"</td></tr><tr><th>Dia15</th><td>"+this.Dist15+"</td><td>"+this.Cant15+"</td></tr> <tr><th>Dia16</th><td>"+this.Dist16+"</td><td>"+this.Cant16+"</td></tr><tr><th>Dia17</th><td>"+this.Dist17+"</td><td>"+this.Cant17+"</td></tr> <tr><th>Dia18</th><td>"+this.Dist18+"</td><td>"+this.Cant18+"</td></tr><tr><th>Dia19</th><td>"+this.Dist19+"</td><td>"+this.Cant19+"</td></tr> <tr><th>Dia20</th><td>"+this.Dist20+"</td><td>"+this.Cant20+"</td></tr><tr><th>Dia21</th><td>"+this.Dist21+"</td><td>"+this.Cant21+"</td></tr> <tr><th>Dia22</th><td>"+this.Dist22+"</td><td>"+this.Cant22+"</td></tr><tr><th>Dia23</th><td>"+this.Dist23+"</td><td>"+this.Cant23+"</td></tr> <tr><th>Dia24</th><td>"+this.Dist24+"</td><td>"+this.Cant24+"</td></tr><tr><th>Dia25</th><td>"+this.Dist25+"</td><td>"+this.Cant25+"</td></tr> <tr><th>Dia26</th><td>"+this.Dist26+"</td><td>"+this.Cant26+"</td></tr><tr><th>Dia27</th><td>"+this.Dist27+"</td><td>"+this.Cant27+"</td></tr> <tr><th>Dia28</th><td>"+this.Dist28+"</td><td>"+this.Cant28+"</td></tr><tr><th>Dia29</th><td>"+this.Dist29+"</td><td>"+this.Cant29+"</td></tr> <tr><th>Dia30</th><td>"+this.Dist30+"</td><td>"+this.Cant30+"</td></tr><tr><th>Dia31</th><td>"+this.Dist31+"</td><td>"+this.Cant31+"</td></tr>";
                            xnro++;
                        });

                        $("#body_dia").html(html == "" ? " <td  colspan=3 align=center><br><div align=center>No se encontraron resultados</div><br></td>" : html);

                        $('#container').highcharts({
                            data: {
                                table: 'datatable'
                            },
                            chart: {
                                type: 'column'
                            },
                            title: {
                                text: 'Km/gal. por Dia'
                            },
                            yAxis: {
                                allowDecimals: false,
                                title: {
                                    text: 'Km/gal'
                                }
                            },
                            tooltip: {
                                formatter: function () {
                                    return '<b>' + this.series.name + '</b><br/>' +
                                        this.point.y + ' ' + this.point.name.toLowerCase();
                                }
                            }
                        });



                    },
                    error: function (a, b, c) {
                        alert(a.responseText);
                        $("#results").html(a.responseText);
                    }


                });
            }
        }
        

    </script>
