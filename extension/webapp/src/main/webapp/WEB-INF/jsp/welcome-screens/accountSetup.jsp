<%@ page import="org.exoplatform.platform.common.account.setup.web.PingBackServlet" %>
<%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<%
    /**
     * Copyright ( C ) 2012 eXo Platform SAS.
     *
     * This is free software; you can redistribute it and/or modify it
     * under the terms of the GNU Lesser General Public License as
     * published by the Free Software Foundation; either version 2.1 of
     * the License, or (at your option) any later version.
     *
     * This software is distributed in the hope that it will be useful,
     * but WITHOUT ANY WARRANTY; without even the implied warranty of
     * MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
     * Lesser General Public License for more details.
     *
     * You should have received a copy of the GNU Lesser General Public
     * License along with this software; if not, write to the Free
     * Software Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA
     * 02110-1301 USA, or see the FSF site: http://www.fsf.org.
     */
%>
<%@ page language="java" %>
<%
    String usernameRegExp = System.getProperty("gatein.validators.username.regexp");
    if(usernameRegExp==null) usernameRegExp="";
    String formatMsg = System.getProperty("gatein.validators.username.format.message");
    String usernameMinLength = System.getProperty("gatein.validators.username.length.min");
    String usernameMaxLength = System.getProperty("gatein.validators.username.length.max");
    int max=0;
    int min=0;
    if(usernameMaxLength!=null) {
        max = Integer.parseInt(usernameMaxLength);
    }
    if(usernameMinLength!=null) {
        min = Integer.parseInt(usernameMinLength);
    }
    String contextPath = request.getContextPath() ;
    String lang = request.getLocale().getLanguage();
    response.setCharacterEncoding("iso-8859-1");
    response.setContentType("text/html; charset=iso-8859-1");
%>

<c:set var="language" value="${not empty param.language ? param.language : not empty language ? language : pageContext.request.locale}" scope="session" />
<fmt:setLocale value="${language}" />
<fmt:setBundle basename="locale.portal.webui" />
<c:set var="lblUserName" scope="page">
    <fmt:message key="AccountSetup.label.user_Name" />
</c:set>
<c:set var="lblFirstName" scope="page">
    <fmt:message key="AccountSetup.label.first_Name" />
</c:set>
<c:set var="lblLastName" scope="page">
    <fmt:message key="AccountSetup.label.last_Name" />
</c:set>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="<%=lang%>">
<head>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="Content-Type" content="text/html; charset=iso-8859-1" />
    <link href="/platform-extension/css/welcome-screens/jquery.qtip.min.css" rel="stylesheet" type="text/css" />
    <link href="/eXoSkin/skin/css/platform/portlets/extensions/welcome-screens.css" rel="stylesheet" type="text/css" />

    <script type="text/javascript" src="/platform-extension/javascript/jquery-1.7.1.js"></script>
    <script type="text/javascript" src="/platform-extension/javascript/ie-placeholder.js"></script>
    <script type="text/javascript" src="/platform-extension/javascript/welcome-screens/welcomescreens.js"></script>

</head>
<div class="backLight"></div>
<div class="uiWelcomeBox" id="AccountSetup1"  >
    <div class="header"><fmt:message key="AccountSetup.label.header" /> </div>
    <div class="content form-horizontal" id="AccountSetup">
        <h5><fmt:message key="AccountSetup.label.create_account" /> </h5>
        <p class="desc"><fmt:message key="AccountSetup.label.primary_user" /> </p>
        <form name="tcForm" action="<%= contextPath + "/accountSetupAction"%>" method="post">
            <div class="control-group" id ="usernameId">
                <label class="control-label"><fmt:message key="AccountSetup.label.userName" />:</label>
                <div class="controls">
                    <input type="text" name="username" id="userNameAccount" placeholder="${lblUserName}" class="inputFieldLarge"/>
                    <input type="hidden" id="usernameRegExpid" value="<%=usernameRegExp%>"/>
                    <input type="hidden" id="formatMsgid" value="<%=formatMsg%>"/>
                    <input type="hidden" id="usernameMaxLengthid" value="<%=max%>"/>
                    <input type="hidden" id="usernameMinLengthid" value="<%=min%>"/>
                </div>
            </div>
            <div class="control-group" id="fullnameId">
                <label class="control-label"><fmt:message key="AccountSetup.label.full_Name" /> :</label>
                <div class="controls">
                    <input type="text" name="firstNameAccount" id="firstNameAccount" placeholder="${lblFirstName}" class="inputFieldMedium"/>
                    <input type="text" name="lastNameAccount" id="lastNameAccount" placeholder="${lblLastName}" class="inputFieldMedium" />
                </div>
            </div>
            <div class="control-group" id="emailId">
                <label class="control-label"><fmt:message key="AccountSetup.label.email"/> :</label>
                <div class="controls"><input type="text" name="emailAccount" id="emailAccount" class="inputFieldLarge" /></div>
            </div>
            <div class="control-group" id="passwordId">
                <label class="control-label"><fmt:message key="AccountSetup.label.password" /> :</label>
                <div class="controls">
                    <input type="password" name="password" id="userPasswordAccount" class="inputFieldMini" />
                    <span class="confirmLabel"><fmt:message key="AccountSetup.label.confirm" />:</span>
                    <input type="password" name="confirmUserPasswordAccount" id="confirmUserPasswordAccount" class="inputFieldMini" />
                </div>
            </div>

            <h5><fmt:message key="AccountSetup.label.addmin_password" /></h5>
            <p class="desc"><fmt:message key="AccountSetup.label.login_root" /></p>
            <div class="control-group" id="adminUsernameId">
                <label class="control-label"><fmt:message key="AccountSetup.label.userName" />:</label>
                <div class="controls"><input type="text" name="adminFirstName" id="adminFirstName" placeholder="root" readonly="readonly" class="inputFieldLarge disable" /></div>
            </div>
            <div class="control-group" id="adminPasswordId">
                <label class="control-label"><fmt:message key="AccountSetup.label.password" />:</label>
                <div class="controls">
                    <input type="password" name="adminPassword" id="adminPassword" class="inputFieldMini" />
                    <span class="confirmLabel"><fmt:message key="AccountSetup.label.confirm" />:</span>
                    <input type="password" name="confirmAdminPassword" id="confirmAdminPassword" class="inputFieldMini" />
                </div>
            </div>
    </div>
    <!-- Please do not make it Button it may cause blocker problem -->
    <div class="bottom">
        <button class="btn btn-primary" id="continueButton" onclick="WelcomeScreens.exit();return false;"><fmt:message key="AccountSetup.label.submit"/></button>
        <button class="btn" name="setupbutton" value="skipform"><fmt:message key="AccountSetup.label.skip" /></button>
    </div>
</div>
</div>
<div>
    <!--	<div class="backLight"></div>    -->
    <div class="uiWelcomeBox" id="Greetings" style="display: none">
        <div class="header"><fmt:message key="AccountSetup.label.greetings"/></div>
        <div class="content form-horizontal" id="AccountSetup">
            <p>
                <strong><fmt:message key="AccountSetup.label.almost_done"/></strong>,
                <fmt:message key="AccountSetup.label.add_your_colleagues"/>
            </p>
            <div class="screenShot"><a href="javascript:void(0);"><img src="/eXoSkin/skin/images/themes/default/platform/portlets/extensions/greetingSS.png" alt="" width="404" height="172"/></a></div>
        </div>
        <div class="bottom"><button name="setupbutton" value="submitform" class="btn btn-primary"><fmt:message key="AccountSetup.label.start" /></button></div>
    </div>
</div>
</form>
<% 	if(!PingBackServlet.isLandingPageDisplayed()){ %>
<iframe src="<%=PingBackServlet.getPingBackUrl()%>" style="display:none;" id="pingBackUrlFrame" onload="setFormDisplayed()"></iframe>
<iframe src="about:blank" style="display:none;" id="pingBackUrlActivation"></iframe>
<script>
    function setFormDisplayed() {
        var pingBackUrlActivationElement = document.getElementById("pingBackUrlActivation");
        pingBackUrlActivationElement.src="/platform-extension/PingBackServlet";
    }
</script>
<% }
%>
</html>
