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
    <spring:url value="https://code.getmdl.io/1.3.0/material.min.js" var="materialJs"/>

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
      </header>
      <main class="mdl-layout__content">

        <div class="mdl-layout__tab-panel is-active" id="overview">
            <section class="section--center mdl-grid mdl-grid--no-spacing mdl-shadow--2dp">

              <div class="mdl-card mdl-cell mdl-cell--12-col-desktop mdl-cell--6-col-tablet mdl-cell--4-col-phone">
                <div class="mdl-card__supporting-text">
                  <!-- <h4>${course.getName}</h4> -->
                  <h4>"Sorry! Looks like you don't have proper permissions to post."</h4>
                </div>
                <div class="mdl-card__actions">
                  <a href="/testwebapp2/welcome" class="mdl-button">Go to Home</a>
                </div>
              </div>
            </section>
        </div>
      </main>
    </div>
    <script type="text/javascript" src="${materialJs}"></script>
  </body>
</html>