<%@ page import="org.exoplatform.platform.common.software.register.UnlockService" %>
<%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="language" value="${not empty param.language ? param.language : not empty language ? language : pageContext.request.locale}" scope="session" />
<fmt:setLocale value="${language}" />
<fmt:setBundle basename="locale.platform.WelcomeScreen" />

<c:set var="rday" value="<%=UnlockService.getNbDaysBeforeExpiration()%>" />
<c:set var="outDated" value="<%=UnlockService.isOutdated()%>" />
<c:set var="css" value="backNotOutdated" />
<c:set var="msg" scope="page">
	<fmt:message key="UnlockTrial.label.day_left" />
</c:set>

<c:if test="outDated == true">
	<c:set var="css" value="backOutdated" />
	<c:set var="msg" scope="page">
		<fmt:message key="UnlockTrial.label.expired" />
	</c:set>
	<c:set var="rday" value="<%=UnlockService.getNbDaysAfterExpiration()%>" />
</c:if>

<c:set var="msg" value="${fn:replace(msg, '{0}', rday)}" />
<c:set var="unlockTrialLabelIdentifies" scope="page" >
	<fmt:message key="UnlockTrial.label.identifies"/>
</c:set>

<c:set var="lblContactUs" >
	<fmt:message key="UnlockTrial.label.contact_us" />
</c:set>
<c:set var="lblContactUs" value="${fn:replace(lblContactUs, '{0}', '<a href=\"mailto:info@exoplatform.com\">info@exoplatform.com</a>' )}" />

<%
    String contextPath = request.getContextPath() ;
%>


<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
	<head>
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<title><fmt:message key="UnlockTrial.label.welcome" /></title>
		<link rel="shortcut icon" type="image/x-icon"  href="<%=contextPath%>/favicon.ico" />	
		<link rel="stylesheet" type="text/css" href="/eXoSkin/skin/bootstrap/css/bootstrap.css"/>
		<link rel="stylesheet" type="text/css" href="/eXoSkin/skin/css/Core.css"/>
		<link rel="stylesheet" type="text/css" href="/eXoSkin/skin/css/platform/portlets/welcome-screens/unlockTrial.css"/>
		<script type="text/javascript" src="/platform-extension/javascript/jquery-1.7.1.js"></script>
		<script type="text/javascript" src="/eXoSkin/skin/bootstrap/js/bootstrap-tooltip.js"></script>
		<script type="text/javascript" src="/eXoSkin/skin/bootstrap/js/bootstrap-popover.js"></script>
		<script type='text/javascript'>
			function formValidation() {
				if(document.unlockForm.hashMD5.value!="")
					return true;
				else {
					document.getElementById("ERROR").style.display = "block";
					var elem = document.getElementById("KEYERROR");
					if (elem!=null) elem.style.display = "none";
					return false;
				}
			}
			function showPopover(element) {
				$(element).popover({template: '<div class="popover"><div class="arrow"></div><div class="inner"><h3 class="popover-title" style="display:none;"></h3><div class="popover-content"><p></p></div></div></div>'});
				$(element).popover('show');
			}
			function hidePopover(element) {
				$(element).popover('hide');
			}
		</script>
	</head>
	<body>
		<div class="backLight"></div>
		<div class="uiWelcomeBox">
			<div class="header">
				<div class="logo"><fmt:message key="UnlockTrial.label.unlock_evaluation" /></div>
			</div>
			<div class="content">
				<div class="${css}">
					<strong> ${msg}</strong>
				</div>
       <form action="<%=contextPath%>/trial" method="post" name="unlockForm" onsubmit="return formValidation();">
         <div class="product-label">
           <span> <fmt:message key="UnlockTrial.label.product_code"/> &#58;</span>
           <input type="text" class="Text" name="pc" value="<%=UnlockService.getProductCode() %>">
           <a data-toggle="popover" data-placement="top" data-content="${unlockTrialLabelIdentifies}" onmouseover="showPopover(this);" onmouseout="hidePopover(this);">
             <i class="uiIconQuestion uiIconLightGray"></i>
           </a>
         </div>
         <p>
           <strong><fmt:message key="UnlockTrial.label.you_must" /> </strong>
         </p>
         <div class="steps clearfix">
         	<div class="stepsNumber pull-left">1</div>
           <div class="rightCol firstItem"><strong><fmt:message key="UnlockTrial.label.pickup" /> </strong>
            <div class="center"><a target="_blank" class="btn btn-large btn-buy btn-primary" href="<%=UnlockService.getRegistrationFormUrl()%>?pc=<%=UnlockService.getProductCode()%>"><fmt:message key="UnlockTrial.label.buyBtn" /> </a></div>
           </div>
           
         </div>
         <div class="steps clearfix">
         	<div class="stepsNumber pull-left">2</div>
           <div class="rightCol">
             <strong><fmt:message key="UnlockTrial.label.unlock_key" /> </strong>
             <br />
             <div id="ERROR" class="alert alert-error" style="display: none;"><i class="uiIconError"></i><fmt:message key="UnlockTrial.label.mandatory" /> </div>
             <% if(request.getAttribute("errorMessage") != null && !request.getAttribute("errorMessage").toString().isEmpty()) {%>
		         <div id="KEYERROR" class="alert alert-error"><i class="uiIconError"></i><%=request.getAttribute("errorMessage").toString() %></div>
		       <% }%>
		     <button class="btn btn-primary btn-unlock"><fmt:message key="UnlockTrial.label.unlockBtn" /> </button>
             <span class="unlock-label"><fmt:message key="UnlockTrial.label.unlock_keyLabel"/> &#58;</span>
             <div class="form-input"><input class="Text" type="text" name="hashMD5" id="hashMD5"></div>
             
           </div>
           
         </div>
       </form>
			</div>

			<div class="bottom">
				<fmt:message key="UnlockTrial.label.question_about" /> <br />${lblContactUs}&nbsp;<a href="http://www.exoplatform.com" target="_blank">www.exoplatform.com</a>
			</div>
		</div>
	</body>
</html>
