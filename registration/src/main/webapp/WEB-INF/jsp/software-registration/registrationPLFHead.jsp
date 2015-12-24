<%@ page import="org.exoplatform.platform.common.software.register.web.SoftwareRegisterViewServlet" %>
<%@ taglib prefix="fn"  uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c"   uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="language" value="${not empty param.language ? param.language : not empty language ? language : pageContext.request.locale}" scope="session" />
<fmt:setLocale value="${language}" />
<fmt:setBundle basename="locale.platform.RegistrationPLF" />

<title><fmt:message key="<%=SoftwareRegisterViewServlet.PLF_REG_LABEL_REGISTER%>" /> </title>
<meta content="text/html; charset=UTF-8" http-equiv="Content-Type">
<meta content="width=device-width, initial-scale=1.0" name="viewport">
<link href="<%=cssPath%>" rel="stylesheet" type="text/css"/>
<script type="text/javascript" src="/platform-extension/javascript/jquery-1.7.1.js"></script>
<script type="text/javascript" src="/registrationPLF/javascript/registration/software-registration.js"></script>