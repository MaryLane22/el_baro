var contraseña;
var usuario;
var msj_campo1;
var msj_campo2;
var num=/0-9/;
var may=/A-Z/;

function validar(){

    usuario = document.getElementById("usuario").value;
    contraseña = document.getElementById("contrasena").value;
    msj_campo1= document.getElementById("falta_nombre");
    msj_campo2= document.getElementById("falta_contraseña");


    if(usuario == "" && contraseña == ""){
        $(".input").addClass("error");
        msj_campo1.style.visibility = 'visible';
        msj_campo2.style.visibility = 'visible';
    }
    else if(usuario =="" && contraseña != ""){
      $(".input#usuario").addClass("error");
      msj_campo1.style.visibility = 'visible';
      msj_campo2.style.visibility = 'hidden';

    }
    else if(usuario !="" && contraseña == ""){
      $(".input#contrasena").addClass("error");
      msj_campo1.style.visibility = 'hidden';
      msj_campo2.style.visibility = 'visible';

    }
    else
    {
      $("#forma").submit();
    }

}

function remove_class(){
    $(".input").removeClass("error");
    msj_campo1.style.visibility = 'hidden';
    msj_campo2.style.visibility = 'hidden';
}
