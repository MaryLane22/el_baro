
function calcular(){
    var pesos=0;
    var total=0;
    pesos= document.getElementById("money").value;

    total = pesos/10;


    document.getElementById("totl").value = total;
    //document.getElementById("demo").innerHTML = total;
    document.getElementById("continuarconversion").style.visibility="visible";


    var rand = Math.floor(Math.random() * 2000000) + 1000000;
    document.getElementById("c_e").value =  rand;


}

function mostrarpaso2(){
    document.getElementById("paso1").style.visibility="hidden";
    document.getElementById("paso2").style.visibility="visible";
    document.getElementById("continuarconversion").style.visibility="hidden";
}


function mostrarpaso2_visa(){

  alert("nel perro");
    document.getElementById("paso1_visa").style.visibility="hidden";
    document.getElementById("paso2_visa").style.visibility="visible";
    document.getElementById("continuarconversion").style.visibility="hidden";



}
