function openassignment(courseId,courseName) {
  document.getElementById("courseId").value=courseId;
  console.log(courseId,courseName);
  $(".fab-hdr h3").text("Add Assignment "+courseName);
  // document.getElementById("assignment").style.display = "block";
  fab.click();
}
function closeassignment() {
  document.getElementById("assignment").style.display = "none";
}
//Variables
var overlay = $("#overlay"),
  fab = $(".fab"),
  cancel = $("#cancel"),
  submit = $("#submit");
function toogleplagiarism() {
  var x = document.getElementById("plagiarismCheck");
  if(x.checked) {
    fab.css("height",'450px');
    document.getElementById("plagiarism").style.display="inline-block";
    document.getElementById("plagiarismUrl").required =true;
    document.getElementById("plgDate").required =true;
    document.getElementById("plgTime").required =true;
  }
  else {
    document.getElementById("plagiarism").style.display="none";
    document.getElementById("plagiarismUrl").required =false;
    document.getElementById("plgDate").required =true;
    document.getElementById("plgTime").required =true;
    fab.css("height","");
  }
}


// var element=document.createElement("")
//fab click
fab.on("click", openFAB);
overlay.on("click", closeFAB);
cancel.on("click", closeFAB);

function openFAB(event) {
  // if (event) event.preventDefault();
  fab.addClass("active");
  overlay.addClass("dark-overlay");
  toogleplagiarism();
}

function closeFAB(event) {
  if (event) {
    event.preventDefault();
    event.stopImmediatePropagation();
  }
  fab.css("height","");
  fab.removeClass("active");
  overlay.removeClass("dark-overlay");
}