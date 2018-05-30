function vregistro(){

    num = document.getElementById("num").value;
    nom = document.getElementById("nom").value;
    usu = document.getElementById("usu").value;
    pas = document.getElementById("pas").value;
    pasc = document.getElementById("pasc").value;
    car = document.getElementById("car").value;
    sem = document.getElementById("sem").value;

//pas.length <8 || pas != pasc || !pas.match(/[a-zA-Z0-9][a-zA-Z0-9]+/)
if(num == "" || nom == "" || usu == "" || pas == ""|| car == "" || sem== "" || pasc == ""){

    swal("Campos faltantes", "Por favor, introduzca la informacion en todos campos", "warning");
          }

else if(num != "" && nom != "" && usu != "" && pas != ""&& car != "" && sem != "" && pasc != "") {


         swal("Registro exitoso!", "Inicia sesión con tu usuario y conntraseña creados!", "success");
    

}
else {

  swal("Error", "Lo sentimos, hubo un error interno", "warning");


}

}
