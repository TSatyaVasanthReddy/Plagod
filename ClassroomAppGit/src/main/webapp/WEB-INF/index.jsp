<%@ page isELIgnored="false" %>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri = "http://www.springframework.org/tags/form" prefix = "form"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<!doctype html>
<!--
  Material Design Lite
  Copyright 2015 Google Inc. All rights reserved.

  Licensed under the Apache License, Version 2.0 (the "License");
  you may not use this file except in compliance with the License.
  You may obtain a copy of the License at

      https://www.apache.org/licenses/LICENSE-2.0

  Unless required by applicable law or agreed to in writing, software
  distributed under the License is distributed on an "AS IS" BASIS,
  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
  See the License for the specific language governing permissions and
  limitations under the License
-->
<html lang="en">
  <head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="description" content="A front-end template that helps you build fast, modern mobile web apps.">
    <meta name="viewport" content="width=device-width, initial-scale=1.0, minimum-scale=1.0">
    <title>PlagoD</title>

    <!-- Add to homescreen for Chrome on Android -->
    <meta name="mobile-web-app-capable" content="yes">
    <spring:url value="/resources/android-desktop.png" var="androidImage"/>
    <spring:url value="/resources/ios-desktop.png" var="appleImage"/>
    <spring:url value="/resources/favicon.png" var="favicon"/>
    <spring:url value="https://fonts.googleapis.com/css?family=Roboto:regular,bold,italic,thin,light,bolditalic,black,medium&amp;lang=en" var="googleFont"/>
    <spring:url value="https://fonts.googleapis.com/icon?family=Material+Icons" var="googleMaterial"/>
    <spring:url value="https://code.getmdl.io/1.3.0/material.deep_purple-pink.min.css" var="materialPurple"/>
    <spring:url value="/resources/styles.css" var="styles"/>
    <spring:url value="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js" var="jQuery"/>
    <spring:url value="https://code.getmdl.io/1.3.0/material.min.js" var="materialJs"/>
    <spring:url value="/resources/posts.js" var="posts"/>

    <link rel="icon" sizes="192x192" href="${androidImage}">

    <!-- Add to homescreen for Safari on iOS -->
    <meta name="apple-mobile-web-app-capable" content="yes">
    <meta name="apple-mobile-web-app-status-bar-style" content="black">
    <meta name="apple-mobile-web-app-title" content="Material Design Lite">
    <link rel="apple-touch-icon-precomposed" href="${appleImage}">

    <!-- Tile icon for Win8 (144x144 + tile color) -->
    <meta name="msapplication-TileImage" content="images/touch/ms-touch-icon-144x144-precomposed.png">
    <meta name="msapplication-TileColor" content="#3372DF">

    <link rel="shortcut icon" href="${favicon}">

    <!-- SEO: If your mobile URL is different from the desktop URL, add a canonical link to the desktop page https://developers.google.com/webmasters/smartphone-sites/feature-phones -->
    <!--
    <link rel="canonical" href="http://www.example.com/">
    -->

    <link rel="stylesheet" href="${googleFont}">
    <link rel="stylesheet" href="${googleMaterial}">
    <link rel="stylesheet" href="${materialPurple}">
    <link rel="stylesheet" href="${styles}">
    <script type="text/javascript" src="${jQuery}"></script>
  </head>
  <body class="mdl-demo mdl-color--grey-100 mdl-color-text--grey-700 mdl-base">
    <div class="mdl-layout mdl-js-layout mdl-layout--fixed-header">
      <header class="mdl-layout__header mdl-layout__header--scroll mdl-color--primary">
        <div class="mdl-layout--large-screen-only mdl-layout__header-row">
        </div>
        <div class="mdl-layout--large-screen-only mdl-layout__header-row">
          <h3>Group-7 Google Classroom Anti-Plagiarism</h3>
        </div>
        <div class="mdl-layout--large-screen-only mdl-layout__header-row">
        </div>
        <div class="mdl-layout__tab-bar mdl-js-ripple-effect mdl-color--primary-dark">
          <a href="#overview" class="mdl-layout__tab is-active">Project</a>
          <a href="#features" class="mdl-layout__tab">Features</a>
          <a href="#team" class="mdl-layout__tab">Team</a>
          
        </div>
      </header>
      <main class="mdl-layout__content">

        <div class="mdl-layout__tab-panel is-active" id="overview">
          <c:forEach items="${coursevar}" var="course">
            <section class="section--center mdl-grid mdl-grid--no-spacing mdl-shadow--2dp">
              <div class="mdl-card mdl-cell mdl-cell--12-col-desktop mdl-cell--6-col-tablet mdl-cell--4-col-phone">
                <div class="mdl-card__supporting-text">
                  <!-- <h4>${course.getName}</h4> -->
                  <h4>${course.name}</h4>
                </div>
                <div class="mdl-card__actions">
                  <a href="${course.alternateLink}" class="mdl-button" target="_blank">Open in classroom</a>
                </div>
              </div>
              <button class="mdl-button mdl-js-button mdl-button--fab mdl-js-ripple-effect mdl-button--colored mdl-shadow--4dp mdl-color--accent" id="add" onclick="openassignment(${course.getId()},'ggg')">
                <i class="material-icons" role="presentation">add</i>
                <span class="visuallyhidden">Add</span>
              </button>
            </section>
          </c:forEach>
        </div>
        <div class="mdl-layout__tab-panel" id="features">
                  <section class="section--center mdl-grid mdl-grid--no-spacing">
                    <div class="mdl-cell mdl-cell--12-col">
                      <h4>Features</h4>
                        <p>
                        Plagiarism is rampant in todays world. Students take help from each other, and submit assignments, and hence circumvent their incumbent work. Also, Google Classroom has developed an awesome platform where all the classwork, projects, and quizzes/assignments can be managed very easily by the Professors, and can be easily accessed by the students. However, obviously, plagiarism still pervades on this platform. Our goal is to ensure that the degree of infringement of copyright is reduced, and so, we propose to add an extra layer of security to implement the same.
                        </p>
                        <ul class="toc">
                        <h4>Contents</h4>
                        <a href="#lorem1">Concept</a>
                        <a href="#lorem3">Implementation</a>
                      </ul>

                      <h5 id="lorem1">Concept</h5>
                      Follow-up assignment.
                      Some issues that have to tacked by the faculty are:
                      <ul>
                      <li>Would the set of questions asked in the follow-up test be the same for all students?</li>
                      <li>The time-limit should be set considering the type of questions being asked.</li>
                      <li>How would the combo-grading policy be? </li>
                      </ul>

                      <p>
                         The honest students would obviously have to spend extra time proving their integrity, but there seems to be no other way out.
                      </p>
                      <h5 id="lorem3">Implementation</h5>
index.html
                      <p id="lorem4">
                      Google Classroom API:
                      Google provides all the Classroom features which were integrated in our software through its API. We replicated the Google Classroom environment, using some of the important features, like creating and posting an assignment, scheduling deadlines, etc.
                      </p>
                      <p id="lorem5">
                      Google Form API:
                      This API was used to provide the faculty with a link to a Google Form which he/she can schedule to be posted as the follow-up quiz once the main assignments deadline passes. This form, like the traditional Google Form would have all the varied options for the faculty to create a marked assignment test.
                      </p>
                      <p>
                      Spring MVC (Model-View-Controller) framework:
                      All the code has been written using this Framework.
                      The Model is the lowest level of the pattern which is responsible for maintaining data. It has the overview of what our software would look like.
                      The View covers the different aspects of what kinds of features and operations a user can access; for example, the student features would be exactly same as the normal Classroom software, but the faculty would have an extra feature of creating and scheduling the extra test.
                      And finally, the Controller is responsible for controlling the flow of the application execution. When you make a request (means request a page) to the MVC application, a controller is responsible for returning the response to that request.
                      Thus, overall, the MVC framework provides a modularised, easy-to-integrate milieu for UI/UX, development code, and other API services.
                      </p>
                      <p>
                      GitHub and Visual Studio Team Services:
                      All the code our team collated from each other, and then the final creation of a versioned, all-integrated software, was managed on GitHub, and Visual Studio.
                      </p>
                      <p>
                      Jetty and Maven:
                      Eclipse Jetty is a Java HTTP (Web) server and Java Servlet container which we used to host our software. Maven is the repository which has the necessary packages to manage the network and machine-to-machine communication for our software.
                      </p>

                    </div>
                  </section>
                </div>
                    <div class="mdl-layout__tab-panel" id="team">
                      <section class="section--center mdl-grid mdl-grid--no-spacing">
                        <div class="mdl-cell mdl-cell--12-col">
                            <h5 id="lorem3">Team @ IIT Hyderabad</h5>
                          <p>Vasanth Reddy <img src="images/vasanth.jpg"  height="126" width="126"> </p>
                          <p>Chinmay Chandak <img src="images/chinmay.jpg"  height="126" width="126"> </p>
                          <p>Vamshi Ratna Reddy <img src="images/vamshi.jpg"  height="126" width="126"> </p>
                          <p>Nagendra Sainath <img src="images/nagendra.jpg"  height="126" width="126"> </p>


                        </div>
                      </section>
                    </div>
      </main>
    </div>
    <div id="overlay"></div>
    <div class="fab">
      <form:form class='cntt-wrapper' method="post" action="/testwebapp2/formcheck" commandName="userData" novalidate="true">
        <div id="fab-hdr">
          <h3>Add Assignment</h3>
        </div>

        <div class="cntt">
          <form:input type="hidden" path="courseId" id="courseId"/>
          <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
            <form:input class="mdl-textfield__input" path="title" type="text" id="text1" required="true" />
            <label class="mdl-textfield__label" for="text2">Title</label>
          </div>

          <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
            <form:input class="mdl-textfield__input" path="instruction" type="text" id="text2" />
            <label class="mdl-textfield__label" for="text2">Instruction (optional)</label>
          </div>
          <div class="due-date">Due
            <form:input type="date" path="due" required="true"/>
            <form:input type="time" path="due_time" required="true"/>
          </div>
          <form:checkbox path="plagiarismCheck" id="plagiarismCheck" onclick="toogleplagiarism()"/>do you want plagiarism check?<br>
          <div class = "plagiarism" id="plagiarism">
          <!-- <form:input type="url" path="plagiarismUrl" id="plagiarismUrl"/> -->
          <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
            <form:input class="mdl-textfield__input" path="plagiarismUrl" type="url" id="plagiarismUrl"/>
            <label class="mdl-textfield__label" for="text2">Include URL</label>
          </div>
          <form:input type="date" path="plgDate" id="plgDate"/>
          <form:input type="time" path="plgTime" id="plgTime"/></div>
        </div>

        <div class="btn-wrapper">
          <button class="mdl-button mdl-js-button" id="cancel">Cancel</button>
          <button class="mdl-button mdl-js-button mdl-button--primary" id="submit">Submit</button>
        </div>

      </form:form>
    </div>
    <!-- <div id="assignment">
      <form class="assignment-form" method="post" action="testwebapp2/formcheck" commandName="userForm">
        <div class="form-header">
          <div class="card-type">
            <div class="work display-icon"></div>
          </div>
          <div class="form-name">Assignment</div>
          <div class="form-close display-icon" onclick="closeassignment()"></div>
        </div>
        <div class="class-assign-type">
          For <div class="class-name">sample test class</div>
        </div>
        <div class="form-details">
          <input type="hidden" name="courseId" id="courseId">
          <input type="text" path="title" placeholder="Title" required id="title">
          <input type="text" path="instruction" placeholder="Instructions (optional)" id="">
          <div class="due-date">Due<input type="date" name="due" required><input type="time" name="due_time" required></div>
          <div class="form-topic">Topic</div>
          <input type="checkbox" path="plagiarismCheck" id="plagiarismCheck" onclick="toogleplagiarism()">Do you want a plagiarism check?<br>
          <div class = "plagiarism" id="plagiarism"><input type="url" path="plagiarismUrl" id="plagiarismUrl">
          <input type="date" data-date="" data-date-format="DD MM YYYY" name="plgDate" id="plgDate"><input type="time" name="plgTime" id="plgTime"></div>
        </div>
        <div class="form-files">
          <div class="file-uploads"></div>
          <div class="form-actions"></div>
        </div>
        <button type="submit" class="mdl-button mdl-js-ripple-effect form-submit" name="submit">submit</button>
      </form>
    </div> -->
    <script type="text/javascript" src="${materialJs}"></script>
    <script type="text/javascript" src="${posts}"></script>
  </body>
</html>
