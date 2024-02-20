function show_tools() {
    document.getElementById('tools').style.display ='block';
    document.getElementById('fix_issues').style.display ='none';
}

function show_fix_issues() {
    document.getElementById('tools').style.display ='none';
    document.getElementById('fix_issues').style.display ='block';
}

function calculate() {
    var size = document.getElementById("Size").value;
    var speed = document.getElementById("Speed").value * 8;

    var result = document.getElementById("Result");

    var seconds = (8192 / (speed * 1024) * (size * 1024))
    var hours = (Math.floor(seconds / 3600) + " Hours");
    var minutes = (Math.floor(seconds / 60 % 60) + " Minutes");

    result.textContent = "≈ " + hours + " " + minutes;
}