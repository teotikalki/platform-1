<%@ page import="org.exoplatform.platform.common.software.register.web.SoftwareRegisterViewServlet" %>
<div class="intro" >
	<c:set var="intro" scope="page">
		<fmt:message key="<%=SoftwareRegisterViewServlet.PLF_REG_LABEL_INTRO%>"/>
	</c:set>
	<c:set var="intro" value="${fn:replace(intro, '{0}', '<a class=\"firstText\" href=\"https://community.exoplatform.com\" >eXo Tribe</a>')}" />
	${intro}
</div>