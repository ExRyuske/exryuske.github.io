function calculate() {
    var size = document.getElementById("Size").value;
    var speed = document.getElementById("Speed").value * 8;
    var result = document.getElementById("ResultCalculator");
    
    var seconds = (8192 / (speed * 1024) * (size * 1024))
    var hours = (Math.floor(seconds / 3600) + " Hours");
    var minutes = (Math.floor(seconds / 60 % 60) + " Minutes");

    result.textContent = "≈ " + hours + " " + minutes;
}

function generate() {
    var min = document.getElementById("Min").value;
    var max = document.getElementById("Max").value;
    var result = document.getElementById("ResultGenerator");

    result.textContent = Math.ceil(Math.random() * (max - min + 1) + min);
}