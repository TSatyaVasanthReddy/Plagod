function openannouncement() {
	document.getElementById("announcement").style.display = "block";
}
function closeannouncement() {
	document.getElementById("announcement").style.display = "none";
}
function openassignment(courseId) {
	//document.getElementById("courseId").value=courseId;
	console.log(courseId);
	document.getElementById("assignment").style.display = "block";
}
function closeassignment() {
	document.getElementById("assignment").style.display = "none";
}
function openquestion() {
	document.getElementById("question").style.display = "block";
}
function closequestion() {
	document.getElementById("question").style.display = "none";
}
function toogleplagiarism() {
	var x = document.getElementById("plagiarismCheck");
	if(x.checked) {
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
	}
}
// function openreuse() {
// 	document.getElementById("announcement").style.display = "block";
// }
// function closereuse() {
// 	document.getElementById("announcement").style.display = "none";
// }