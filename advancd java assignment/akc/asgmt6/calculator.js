function input(ch){
    var display = document.getElementById('display');
    display.innerText = display.innerText + ch;
}

function backspace(){
    var display = document.getElementById('display');
    if (display.innerText){
       display.innerText = display.innerText.slice(0, -1);
    }
}

function clear_sc(){
    var display = document.getElementById('display');
    display.innerText = "";
}

function calculate(){
    var res = [];
    var answer;
    var display = document.getElementById('display');

    if(document.getElementById("display").innerText.includes("+")){
    	res = document.getElementById("display").innerText.split('+');
    	display.innerText = parseInt(res[0]) + parseInt(res[1]);
    }
    
    else if(document.getElementById("display").innerText.includes("-")){
        res = document.getElementById("display").innerText.split('-');
        display.innerText = parseInt(res[0]) - parseInt(res[1]);
    }
    
    else if(document.getElementById("display").innerText.includes("/")){
        res = document.getElementById("display").innerText.split('/');
        display.innerText = parseInt(res[0]) / parseInt(res[1]);
    }
    
    else{
        res = document.getElementById("display").innerText.split('*');
        display.innerText = parseInt(res[0]) * parseInt(res[1]);
    }
}
