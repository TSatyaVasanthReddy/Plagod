function openannouncement() {
	document.getElementById("announcement").style.display = "block";
}
function closeannouncement() {
	document.getElementById("announcement").style.display = "none";
}
function openassignment() {
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
	var x = document.getElementById("plagiarism");
	if(x.checked) {
		document.getElementById("plagiarismUrl").style.display="inline-block";
		document.getElementById("plagiarismUrl").required =true;
	}
	else {
		document.getElementById("plagiarismUrl").style.display="none";
		document.getElementById("plagiarismUrl").required =false;
	}
}
// function openreuse() {
// 	document.getElementById("announcement").style.display = "block";
// }
// function closereuse() {
// 	document.getElementById("announcement").style.display = "none";
// }