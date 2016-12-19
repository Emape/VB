function teclaPresionada(e) 
{
      if (e.keyCode==13)
      {
         return false;
      }
} 

function numEntero(e) {
    tecla = (document.all) ? e.keyCode : e.which; // 2
    if (tecla==8) return true; // 3   tecla retroceso para borrar
    patron =/[0123456789]/; // 4
    //patron = /\d/; // Solo acepta números 
    te = String.fromCharCode(tecla); // 5
    return patron.test(te); // 6         
}

function numTelefono(e)
{
   tecla = (document.all) ? e.keyCode : e.which; // 2
   if (tecla==8) return true; // 3
   patron =/[-0123456789\s]/; // 4
   te = String.fromCharCode(tecla); // 5
   return patron.test(te); // 6         
}

function formatoNum(pNumero) {
   var nNum0 = document.getElementById('ctl00_ContentPlaceHolder1_'+pNumero).value;
   var nNum = String(nNum0).replace(/[,]/gi,'');
   if (!isNaN(nNum)) {
      var nNum1 = Math.round (nNum*100)/100;
      var strNum = String(nNum1).split(".");
      if (strNum.length==1) {
         var strDecimal = "";
      }
      else {
         var strDecimal = "." + strNum[1];
      }
      var strEntero = strNum[0];
      var nLen = strEntero.length;
      var strResultado = "";
      var nInicio = 3;
      while (nInicio<nLen) {     
         strResultado =  "," + strEntero.substring(nLen - nInicio,nLen - nInicio + 3) + strResultado;
         nInicio+=3;
      }
      strResultado = strEntero.substring(0,nLen-nInicio+3) + strResultado + strDecimal;
      document.getElementById('ctl00_ContentPlaceHolder1_'+pNumero).value = strResultado;
      return true; 
   }
}

function numDecimal(e) {
    tecla = (document.all) ? e.keyCode : e.which; // 2
    if (tecla==8) return true; // 3
    patron =/[.0123456789]/; // 4
    //patron=^\d\.\d{2,0}$;
    te = String.fromCharCode(tecla); // 5
    return patron.test(te); // 6         
}

function conMayuscula(pTexto) {
document.getElementById('ctl00_ContentPlaceHolder1_'+pTexto).value=document.getElementById('ctl00_ContentPlaceHolder1_'+pTexto).value.toUpperCase();
}

function validaFecha(pFecha) {
   // en el evento onblur
   // Procedimiento de Validacion
   var dFec =  document.getElementById('ctl00_ContentPlaceHolder1_'+pFecha).value;
   var errFec = '';
   var numDias = 0;
   var aFecha = dFec.split("/");
   if (aFecha.length==3) {
      var dia = aFecha[0];
      var mes = aFecha[1];
      var anno = aFecha[2];
      
      if ( !isNaN(dia) && !isNaN(mes) && !isNaN(anno) ) {
         if (mes>0 && mes<13) {
            if (mes==1 || mes==3 || mes==5 || mes==7 || mes==8 || mes==10 || mes==12) {
               numDias=31;
            }
            else {
               if (mes==2) {
                  if (anno%4==0) {
                     numDias=29;
                  }
                  else {
                     numDias=28;
                  }
               }
               else {
                  numDias=30;
               }
            }
            if (dia>0 && dia<numDias+1) {
               if (anno<1920) {
                  errFec = pFecha + ' - Ingrese un año mayor a 1920';
               }
            }
            else {
               errFec = pFecha + ' - Numero de Dia no es valido.';
            }
         }
         else {
            errFec = pFecha + ' - Numero de Mes no es valido.';
         }
      }
      else {
         errFec = pFecha + ' - El dia, mes o año ingresados no corresponden a una fecha valida';
      }
   }
   else {
      errFec = pFecha + ' - Formato de fecha incorrecto. Formato valido: dd/mm/yyyy';
   }
   if (errFec=='') {
      return true;
   }
   else {           
      document.getElementById('ctl00_ContentPlaceHolder1_'+pFecha).select();
      document.getElementById('ctl00_ContentPlaceHolder1_'+pFecha).focus();                  
      alert(errFec);
      return false;
   }   
   //return errFec;
} 

function intCompensatorio() {
   // ingresado TEM //> se transforma en TEA y se pone en IntCompensatorio
   var otex = 'ctl00_ContentPlaceHolder1_';
   var interesMen=eval(document.getElementById(otex+'txtInteres').value.replace(',',''));
   document.getElementById(otex+'txtCompensatorio').value = Math.round ((Math.pow((1+interesMen/100),12) -1) * 10000)/100;
}

function netoDesembolso() {  
   // LLamarlo en el evento onchange del textbox
   var otex = 'ctl00_ContentPlaceHolder1_';
   var monto=eval(document.getElementById(otex+'txtMonto').value.replace(',','').replace('S/.','').replace('US$',''));
   var gn=eval(document.getElementById(otex+'txtGastoNotarial').value.replace(',',''));
   var cr=eval(document.getElementById(otex+'txtCentralRiesgo').value.replace(',',''));
   var og=eval(document.getElementById(otex+'txtOtroGasto').value.replace(',',''));
   var faa=eval(document.getElementById(otex+'txtFondoAutoAyuda').value.replace(',',''));
   var ac=eval(document.getElementById(otex+'txtAnalistaCredito').value.replace(',',''));
   var en=eval(document.getElementById(otex+'txtEncaje').value.replace(',',''));    	   
   var neto=monto-gn-cr-og-faa-ac-en;
   
   //var cNeto=neto.toString();
   //var intMiles=parseInt((cNeto.length)/3);
   //for (i=0;i<=intMiles;i++) {
   //
   //}
   
   document.getElementById(otex+'txtNeto').value = neto;
}

function validaDesembolso() {
   var otex = 'ctl00_ContentPlaceHolder1_';
   var errMen = '';
         
   var garantiaTotal=eval(document.getElementById(otex+'txtGarantiaDeOtro').value.replace(',',''));
   var garantiaMonto=eval(document.getElementById(otex+'txtMontoGarantiaOtro').value.replace(',',''));
   if (garantiaTotal < garantiaMonto) {
      errMen = 'El Monto garantia de otros NO puede ser mayor al Total Garantia de otros.\nModifique por favor';
      //errMen = '';
   }
   
   if (document.getElementById(otex+'txtFechaDesembolso').value=='') {
      errMen = 'Seleccione una Fecha para el Desembolso.';
   }
   else {
      var fDesm = document.getElementById(otex+'txtFechaDesembolso').value;
      var fPres = document.getElementById(otex+'txtFechaPrestamo').value;   
      fPres1 = fPres.substring(6,10)+fPres.substring(3,5)+fPres.substring(0,2);
      fDesm1 = fDesm.substring(6,10)+fDesm.substring(3,5)+fDesm.substring(0,2);
      if (fPres1>fDesm1) {
          errMen = 'La fecha de Desembolso tiene que ser mayor o igual a la fecha del registro del Prestamo.';
      }   
   }
   //if ( eval(document.getElementById(otex+'txtEncaje').value)>0 && document.getElementById(otex+'txtChequeEncaje').value=='' ) {
   //   errMen = 'Tiene que ingresar el numero de Cheque para el Encaje.';
   //}
   if (errMen=='') {
      return true;
   }
   else {
      alert(errMen);
      return false;
   }
} 

function validaPagoCuota() {
   var otex = 'ctl00_ContentPlaceHolder1_';
   var errMen = '';
   var nPago = document.getElementById(otex+'txtMonto').value.replace(',','');
   if ( isNaN(nPago) ) {
      errMen='Ingrese un Monto valido.';
   }
   else {
      if ( !(nPago>0) ) {
         errMen='El Monto de pago de la cuota debe ser mayor a cero.';
      }
   }    
   if (errMen=='') {
      return true;
   }
   else {
      alert(errMen);
      return false;
   }            
}

function validaCrono(montoFinanciar,interesMes,cuotaMes) {
   var otex = 'ctl00_ContentPlaceHolder1_';
   if ( document.getElementById(otex+montoFinanciar).value * document.getElementById(otex+interesMes).value /100 > document.getElementById(otex+cuotaMes).value ) {
      alert('Error: El interes mensual del prestamo es mayor a la cuota fija mensual.');
      return false;
   }
   else {
      return true;
   }  
} 

function validaContrato() {
   var otex = 'ctl00_ContentPlaceHolder1_';
   var nError = 1;
   var nError1 = 1;
   if (validaFecha('txtFechaBuenaPro')) {
      if (validaFecha('txtFechaSuscripcion')) {
         if (validaFecha('txtFechaInicio')) {
            if (validaFecha('txtFechaFin')) {
               if (validaFecha('txtFechaDoc')) {
                  if (document.getElementById(otex+'txtDocSustentatorio').value=='') {
                     document.getElementById(otex+'txtDocSustentatorio').focus();
                     alert('Ingrese Número de documento sustentatorio.');
                  }
                  else {
                     if (document.getElementById(otex+'lblIdProveedor').innerHTML =='') {
                        alert('Proveedor no ingresado.');
                     }
                     else {
                        nError = 0;
                     }
                  }
               }
            }
         }
      }
   }
   if (nError == 0) {
      return true;
   }
   else {
      return false;
   }
}

function validaSolicitud() {
   var otex = 'ctl00_ContentPlaceHolder1_';
   var nError = 1;
   if (validaFecha('txtFechaDoc')) {
      if (document.getElementById(otex+'txtSerie').value=='') {
         document.getElementById(otex+'txtSerie').focus();
         document.getElementById(otex+'txtSerie').select();
         alert('Ingrese la Serie del documento.');               
      } else {
         if (document.getElementById(otex+'txtIdDocumento').value=='') {
            document.getElementById(otex+'txtIdDocumento').focus();
            document.getElementById(otex+'txtIdDocumento').select();
            alert('Ingrese el número del documento');                                 
         } else
            nError = 0;
         }
      }
   }
   if (nError == 0) {
      return true;
   }
   else {
      return false;
   }
}

function valorParamUrl( paraName ){ 
var regexS = "[\\?&]"+paraName+"=([^&#]*)"; 
var regex = new RegExp ( regexS ); 
var tmpURL = window.location.href; 
var results = regex.exec( tmpURL ); 
if( results == null ) 
   return""; 
else 
   return results[1]; 
} 

// document.title = 'Titulo de pagina'  -- para poner el titulo de la pagina

//function validaContratoDetalle() {
//   var otex = 'ctl00_ContentPlaceHolder1_';
//   var nMonto = document.getElementById(otex+'txtMonto').replace(',','');
//   var nPorcentaje = document.getElementById(otex+'txtPorcentaje').replace(',','');
//   var nTurno = document.getElementById(otex+'txtTurno').replace(',','');
//   var nHora = document.getElementById(otex+'txtHora').replace(',','');
//   var cMen = '';
//   if document.getElementById(otex+'txtCodigo2').value = '' {
//      cMen = 'Seleccione un Servicio.';
//      document.getElementById(otex+'txtCodigo2').focus();
//   }
//   else {
//      if ( isNaN(nMonto) ) {
//         cMen = 'Ingrese un Monto valido.';
//         document.getElementById(otex+'txtMonto').focus();      
//      }
//      else {
//         if ( isNaN(nPorcentaje) ) {
//            cMen = 'Ingrese un Porcentaje valido.';
//            document.getElementById(otex+'txtPorcentaje').focus();
//         }
//         else {
//            if ( isNaN(nTurno) ) {
//               cMen = 'Ingrese un Monto de Turno valido.';
//               document.getElementById(otex+'txtTurno').focus();
//            }
//            else {
//               if ( isNaN(nHora) ) {
//                  cMen = 'Ingrese un Monto por Hora valido.';
//                  document.getElementById(otex+'txtHora').focus();      
//               }
//               else {
//                     
//               }
//            }            
//         }
//      }
//   }
//   if (cMen=='') {
//      return true;
//   }
//   else {
//      alert(cMen);
//      return false;
//   }            
//}

function openHijoPopUp(nTabla,cCodigo,cNombre) {
  //__doPostBack('txtCodigo1.enable=true','');
  //__doPostBack('txtCodigo2.enable=true','');
 var otexC = 'ctl00_ContentPlaceHolder1_txtCodigo';
 var otexN = 'ctl00_ContentPlaceHolder1_txtNombre';

//alert('\'Buscar1.aspx?dTabla=' + nTabla + '&?Codigo=' + escape(cCodigo) + '&?Nombre=' + escape(cNombre) + '\',null,\'dialogHeight:300px;dialogWidth:1100px;status:no;\'');

var Result=window.showModalDialog('Buscar1.aspx?dTabla=' + nTabla + '&?Codigo=' + escape(cCodigo) + '&?Nombre=' + escape(cNombre) + '\'',null,'dialogHeight:570px;dialogWidth:780px;status:no;'); 
//var Result=window.showModalDialog('Buscar1.aspx?dTabla=' + nTabla + '&?Codigo=' + escape(cCodigo) + '&?Nombre=' + escape(cNombre) + '\'',null,'resizable:yes;status:no;'); 
 
 if (Result==null) {
    alert('No eligio ningún elemento.');
 }
 else {
    document.getElementById(otexC+ + nTabla).value = Result[0];
    document.getElementById(otexN+ + nTabla).value = Result[1];     
 }
/*
 if (nTabla==1) {
     __doPostBack('txtCodigo1.enable=false','');
 }
 else {
    __doPostBack('txtCodigo2.enable=false',''); 
 }
*/
 
 }

/*
function cerrarHijoPopUp() {
    //var pepe = new Array(document.getElementById("txtCodigo").value, document.getElementById("txtNombre").value);
    
    //---------------- codigo ok
    //var pepe = new Array();
    //pepe[0]='aaaaa';
    //pepe[1]='bbbbbb';
    //window.returnValue = pepe;
    // ----------------------------
    //window.returnValue = 'document.getElementById("txtCodigo").value,document.getElementById("txtNombre").value'; 
    
    
    //var otex = 'ctl00_ContentPlaceHolder1_';
    //var vReturnValue = new Object();
    //vReturnValue.codigo = 'AAAAAAAAAAAAA';
    //vReturnValue.nombre = 'BBBBBBBBBBBBBBBBBBB';
    //window.returnValue = vReturnValue;
    
    //vReturnValue.codigo = document.getElementById("txtCodigo").value; 
    //vReturnValue.nombre = document.getElementById("txtNombre").value;        
    //self.close();
    //window.close();
    
    //window.returnValue = windowReturnValue; 
    
    alert('Cerrado ok');
}
*/

function comparaFechas(pFecha1,pFecha2) {
   var dFec1 =  document.getElementById('ctl00_ContentPlaceHolder1_'+pFecha1).value;
   var dFec2 =  document.getElementById('ctl00_ContentPlaceHolder1_'+pFecha2).value;
   cFec1 = dFec1.substring(6,10)+dFec1.substring(3,5)+dFec1.substring(0,2);
   cFec2 = dFec2.substring(6,10)+dFec2.substring(3,5)+dFec2.substring(0,2);
   if (cFec2<cFec1) {
       alert('La fecha ' + dFec1 + ' No puede ser mayor a la fecha ' + dFec2);
       return false;
   }
   else {
      alert('Entra aqui');
      return true;
   }
   
/*   
   if (nError = 0) {
       if (comparaFechas('txtFechaDoc','txtFechaBuenaPro')) {
          if (comparaFechas('txtFechaBuenaPro','txtFechaSuscripcion')) {
             if (comparaFechas('txtFechaSuscripcion','txtFechaInicio')) {
                if (comparaFechas('txtFechaInicio','txtFechaFin')) {
                  nError1 = 0;
                }
             }
          }
       }
       if (nError1 = 0) {
          return true;
       }
       else {
          return false;
       }
   }
   else {
      return false;
   }
   
*/
      
}
