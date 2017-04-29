<!DOCTYPE html>
<html>
<head>
	<meta charset="utf-8">
	<meta name="viewport" content="initial-scale=1.0,minimum-scale=1.0,maximum-scale=1.0, user-scalable=0,width=device-width">
	<title>Class Name</title>
	<link rel="stylesheet" type="text/css" href="stream.css">
	<link rel="stylesheet" type="text/css" href="themes/red.css">

	<link href="https://fonts.googleapis.com/css?family=Roboto:300,400,500" rel="stylesheet" type="text/css">
	<link href="https://fonts.googleapis.com/css?family=Amatic+SC:700&amp;subset=latin,vietnamese,latin-ext,cyrillic,greek,cyrillic-ext,greek-ext" rel="stylesheet" type="text/css">
	<link href="https://fonts.googleapis.com/css?family=Product+Sans" rel="stylesheet" type="text/css">
	<script type="text/javascript" src="postings.js"></script>
</head>
<body>
	<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
	<nav class="nav_tab" role="navigation">
		<div class="nav-icon"></div>
		<div class="email_id"></div>
	</nav>
	<div class="main">
		<div class="headers">
			<div class="TIB" style="background-image: url(https://lh5.googleusercontent.com/-4rBKomUQ4KQ/VN0osh8ymNI/AAAAAAAAAXk/yvR8PJRLJyA/w984-h209-no/26_insect.jpg); background-position: left top; background-repeat: no-repeat;">
				<div class="dark-overlay"></div>
				<div class="header-content">
					<h1 class="title">
					<em>${course.getTitle}</em>
					</h1>
					<div class="list-Teachers">
						<c:forEach items="${cousre.teachers}" var="teacher">
							<div class="teacher">
								<div class="details">
									<img src="${teacher.ImageSrc}" class="teacher-image">
									<div class="teacher-name">${teacher.name}</div>
								</div>
							</div>
						</c:forEach>
					</div>
				</div>

				<div class="header-actions">
					<div class="hdas">Select theme</div>
					<div class="hdas">Upload photo</div>
				</div>
			</div>
			<div class="tabs" role="list">
				<div class="tab-details" role=listitems>
					<a href="/stream.html" class="cmntdet strm ac">Stream</a>
				</div>
				<div class="tab-details" role=listitems>
					<a href="/students.html" class="cmntdet stnds nac">Students</a>
				</div>
				<div class="tab-details" role=listitems>
					<a href="/about.html" class="cmntdet abt nac">About</a>
				</div>
			</div>	
		</div>
		<div class = "contents">
			<aside>
				<div class="oneweekwork">
					<div class="asidecards">
						<div class="owwcontents">
							<div class="nowork">
								<span class="nowork1">No work due soon</span>
								<span class="nowork2">Woohooo, no work due soon!</span>
							</div>
							<h2 class="workdue">Due Monday</h2>
							<div class="upcomingassingment">
								<a href="assignment link" class="ucalink">Assingnment Name</a>
							</div>
							<h2 class="workdue">Due Monday</h2>
							<div class="upcomingassingment">
								<a href="assignment link" class="ucalink">Assingnment Name</a>
							</div>
							<div class="viewallassignments">
								<a href="viewall" class="vaalink">View all</a>
							</div>
						</div>
					</div>
				</div>
				<div class="topics">
					<div class="asidecards"></div>
				</div>
				<div class="stream">
					<div class="asidecards"></div>
				</div>
				<div class="topics">
					<div class="asidecards"></div>
				</div>
			</aside>
			<div class="cards">
				<c:forEach items="cousre.posts" var="post">
					<div class="card">
						<div class ="card-contents">
							<c:choose>
								<c:when test="${post.isquestion}">
								<div class="card-header">
									<div class="card-type">
										<div class="display-icon question"></div>
									</div>
									<img src ="${post.ownerImage}" class="author-image">
									<div class="author-details">
										<div class="author-name common">${post.ownerImage}</div>
										<span class="dates common">
											<span class="date">${<post class="dateAdded">`</post>}</span>
											<span class="delete"> – Deleted</span>
										</span>
									</div>
									<div class="cards-contols">
										
									</div>
								</div>
								<div class="card-info">
									<div class="about-card">
										<div class="card-instr">
											<div class="card-deadline">${post.deadline}</div>
											<a class="assgn-link" href="assignment">${post.title}</a>
											<div>${post.instruction}</div>
										</div>
									</div>
								</div>
								</c:when>
								<c:when test="${post.isassigment}">
								<div class="card-header">
									<div class="card-type">
										<div class="display-icon work"></div>
									</div>
									<img src ="${post.ownerImage}" class="author-image">
									<div class="author-details">
										<div class="author-name common">${post.ownerImage}</div>
										<span class="dates common">
											<span class="date">${<post class="dateAdded">`</post>}</span>
											<span class="delete"> – Deleted</span>
										</span>
									</div>
									<div class="cards-contols">
										
									</div>
								</div>
								<div class="card-info">
									<div class="about-card">
										<div class="card-instr">
											<div class="card-deadline">${post.deadline}</div>
											<a class="assgn-link" href="assignment">${post.title}</a>
											<div>${post.instruction}</div>
										</div>
									</div>
								</div>
								</c:when>
								<c:otherwise>
								<div class="card-header">
									<img src ="${post.ownerImage}" class="author-image">
									<div class="author-details">
										<div class="author-name common">${post.ownerImage}</div>
										<span class="dates common">
											<span class="date">${<post class="dateAdded">`</post>}</span>
											<span class="delete"> – Deleted</span>
										</span>
									</div>
									<div class="cards-contols">
										
									</div>
								</div>
								<div class="card-info">
									<div class="about-card">
										<div class="card-instr">
											<div class="card-deadline">${post.deadline}</div>
											<a class="assgn-link" href="assignment">${post.title}</a>
											<div>${post.instruction}</div>
										</div>
									</div>
								</div>
								</c:otherwise>
							</c:choose>
						</div>
						<div class="card-comments">
							<h1> Comments </h1>
						</div>
					</div>
				</c:forEach>
			</div>
			<div class="newpost">
				<div class="post">
					<div class="reuse">
						<div class="post-content">Reuse post</div>
						<div class="reuse-icon post-btn" onclick="openreuse()">
							<div class="display-icon"></div>
						</div>
					</div>
					<div class="new-question">
						<div class="post-content">Create question</div>
						<div class="question-icon post-btn" onclick="openquestion()">
							<div class="display-icon"></div>
						</div>
					</div>
					<div class="assignment">
						<div class="post-content">Create assignment</div>
						<div class="assignment-icon post-btn" onclick="openassignment()">
							<div class="display-icon"></div>
						</div>
					</div>
					<div class="announcement">
						<div class="post-content">Create announcement</div>
						<div class="announcement-icon post-btn" onclick="openannouncement()">
							<div class="display-icon"></div>
						</div>
					</div>
				</div>
				<div class="new">
					<div class="display-icon"></div>
				</div>
			</div>
		</div>
	</div>
	<div id="assignment">
		<form class="assignment-form" method="post" action="url">
			<div class="form-header">
				<div class="card-type">
					<div class="work display-icon"></div>
				</div>
				<div class="form-name">Assignment</div>
				<div class="form-close display-icon" onclick="closeassignment()"></div>
			</div>
			<div class="class-assign-type">
				For 
				<div class="class-name">sample test class</div>
			</div>
			<div class="form-details">
				<input type="text" name="title" placeholder="Title" required>
				<input type="text" name="instruction" placeholder="Instruction (optional)">
				<div class="due-date">Due<input type="date" name="due"></div>
				<div class="form-topic">Topic</div>
				<input type="checkbox" name="plagiarism" id="plagiarism" onclick="toogleplagiarism()">do you want plagiarism check?<br>
				<input type="url" name="plagiarismUrl" id="plagiarismUrl">
			</div>
			<div class="form-files">
				<div class="file-uploads"></div>
				<div class="form-actions"></div>
			</div>
			<input type="submit" name="submit">
		</form>
	</div>
</body>
</html>