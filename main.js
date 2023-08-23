function show_about_me() {
    document.getElementById('About_me').style.display ='block';
    document.getElementById('Tools').style.display ='none';
    document.getElementById('Fix_issues').style.display ='none';
}

function show_tools() {
    document.getElementById('About_me').style.display ='none';
    document.getElementById('Tools').style.display ='block';
    document.getElementById('Fix_issues').style.display ='none';
}

function show_fix_issues() {
    document.getElementById('About_me').style.display ='none';
    document.getElementById('Tools').style.display ='none';
    document.getElementById('Fix_issues').style.display ='block';
}

function calculate() {
    var size = document.getElementById("Size").value;
    var speed = document.getElementById("Speed").value * 8;

    var result = document.getElementById("Result");

    var seconds = (8192 / (speed * 1024) * (size * 1024) * 1.05)
    var hours = (Math.round(seconds / 3600) + " Hours");
    var minutes = (Math.round(seconds / 60 % 60) + " Minutes");

    result.textContent = "≈ " + hours + " " + minutes;
}