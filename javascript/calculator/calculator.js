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
