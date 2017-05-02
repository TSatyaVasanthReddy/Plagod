<%@ page isELIgnored="false" %>
  <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
  <%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
    <%@taglib uri = "http://www.springframework.org/tags/form" prefix = "form"%>
      <!DOCTYPE html>
      <html>
        <head>
          <title>
          </title>
          <spring:url value="/resources/stream.css" var="streamcss" />
          <spring:url value="/resources/postings.js" var="postingjs" />
          <spring:url value="/resources/red.css" var="redcss" />

          <link rel="stylesheet" type="text/css" href="${streamcss}">
          <link rel="stylesheet" type="text/css" href="${redcss}">
          <script type="text/javascript" src="${postingjs}">
          </script>
        </head>
        <body>
          <button value="course add assinment" onclick="openassignment('course_id')">course add assignment
          </button>
          <c:forEach items="${coursevar}" var="course">
          <p>${course}</p>
          <br/>
          <br/>
          </c:forEach>
          <div id="assignment">
            <form:form class="assignment-form" method="post" action="/testwebapp2/formcheck" commandName="userData" novalidate="true">
              <div class="form-header">
                <div class="card-type">
                  <div class="work display-icon">
                  </div>
                </div>
                <div class="form-name">Assignment
                </div>
                <div class="form-close display-icon" onclick="closeassignment()">
                </div>
              </div>
              <div class="class-assign-type">
                For
                <div class="class-name">sample test class
                </div>
              </div>
              <div class="form-details">
                <form:input type="text" path="title" placeholder="Title" id="title" required="true"/>
                <form:input type="text" path="instruction" placeholder="Instruction (optional)"/>
                <div class="due-date">Due
                  <form:input type="date" path="due" required="true"/>
                  <form:input type="time" path="due_time" required="true"/>
                </div>
                <div class="form-topic">Topic
                </div>
                <form:checkbox path="plagiarismCheck" id="plagiarismCheck" onclick="toogleplagiarism()"/>do you want plagiarism check?
                <br>
                <div class = "plagiarism" id="plagiarism">
                  <form:input type="url" path="plagiarismUrl" id="plagiarismUrl"/>
                  <form:input type="date" path="plgDate" required="true"/>
                  <form:input type="time" path="plgTime" required="true"/>
                </div>
              </div>
              <div class="form-files">
                <div class="file-uploads">
                </div>
                <div class="form-actions">
                </div>
              </div>
              <input type="submit" name="submit" value="submit">
            </form:form>
          </div>
        </body>
      </html>
