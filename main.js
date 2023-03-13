var detailsList = document.querySelectorAll("details:not(#foo)");
  
  detailsList.forEach(function(details) {
    var summary = details.querySelector("summary");
    details.addEventListener("toggle", function() {
      if (details.open) {
        summary.textContent = "Show less...";
      } else {
        summary.textContent = "Show more...";
      }
    });
  });