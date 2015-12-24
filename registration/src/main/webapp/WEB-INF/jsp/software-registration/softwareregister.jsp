<%--

    Copyright (C) 2009 eXo Platform SAS.

    This is free software; you can redistribute it and/or modify it
    under the terms of the GNU Lesser General Public License as
    published by the Free Software Foundation; either version 2.1 of
    the License, or (at your option) any later version.

    This software is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE. See the GNU
    Lesser General Public License for more details.

    You should have received a copy of the GNU Lesser General Public
    License along with this software; if not, write to the Free
    Software Foundation, Inc., 51 Franklin St, Fifth Floor, Boston, MA
    02110-1301 USA, or see the FSF site: http://www.fsf.org.

--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="org.exoplatform.platform.common.software.register.service.SoftwareRegistrationService" %>
<%@ page import="org.exoplatform.container.PortalContainer"%>
<%@ page import="org.exoplatform.portal.resource.SkinService" %>
<%
  String contextPath = request.getContextPath();
  response.setCharacterEncoding("UTF-8");
  response.setContentType("text/html; charset=UTF-8");
  SoftwareRegistrationService registrationService
          = PortalContainer.getCurrentInstance(session.getServletContext()).getComponentInstanceOfType(SoftwareRegistrationService.class);
  SkinService skinService = PortalContainer.getCurrentInstance(session.getServletContext()).getComponentInstanceOfType(SkinService.class);
  String cssPath = skinService.getSkin("portal/SoftwareRegistration", "Default").getCSSPath();
  boolean canSKip = registrationService.canSkipRegister();
  String registrationURL = (String)request.getAttribute("registrationURL");
  String notReachable = (String)session.getAttribute("notReachable");
  String errorCode = request.getParameter("error");
%>
<html>
<head>
  <%@include file="registrationPLFHead.jsp"%>
</head>
<body class="modal-open">
  <div class="UIPopupWindow uiPopup UIDragObject popupDarkStyle">
    <div class="popupHeader ClearFix">
        <span class="popupTitle center"><fmt:message key="<%=SoftwareRegisterViewServlet.PLF_REG_LABEL_REGISTER%>"/></span>
    </div>
    <div class="popupContent">
      <%@include file="PLFRegistrationIntro.jsp"%> 
      <% if(errorCode!=null){ %>
      <div class="alert alert-warning"><i class="uiIconWarning"></i><fmt:message key="<%=SoftwareRegisterViewServlet.PLF_REG_LABEL_WARNING_CANCEL%>"/> <a href="http://support.exoplatform.com"> <fmt:message key="<%=SoftwareRegisterViewServlet.PLF_REG_LABEL_SUPPORT%>"/></a></div>
      <%}%>
      <%if("true".equals(notReachable)){%>
        <div class="alert alert-error"><i class="uiIconError"></i><fmt:message key="<%=SoftwareRegisterViewServlet.PLF_REG_LABEL_WARNING_NOT_COMPLETE%>"/> <a href="http://support.exoplatform.com"> <fmt:message key="<%=SoftwareRegisterViewServlet.PLF_REG_LABEL_SUPPORT%>"/></a></div>
      <% session.removeAttribute("notReachable"); }%>
      <div class="signin-regis-title" style="display:none;"><strong><fmt:message key="<%=SoftwareRegisterViewServlet.PLF_REG_LABEL_SIGN_IN_REG%>"/></strong></div>
      <img src="/eXoSkin/skin/images/themes/default/platform/portlets/extensions/tribe1.png" class="img-responsive imgNoInternet" style="display: none;"/>
      <img src="/eXoSkin/skin/images/themes/default/platform/portlets/extensions/tribe2.png" class="img-responsive imgHasInternet" style="display: none;" />
      <div class="not-connected" style="display: none;">
        <div class="text-center"><strong><fmt:message key="<%=SoftwareRegisterViewServlet.PLF_REG_LABEL_ABOUT_THAT%>"/></strong></div>
        <div class="text-center"><fmt:message key="<%=SoftwareRegisterViewServlet.PLF_REG_LABEL_CANNOT_REACH%>"/></div>
      </div>
      <div class="signin-title"><strong><fmt:message key="<%=SoftwareRegisterViewServlet.PLF_REG_LABEL_SIGN_IN%>"/></strong></div>
      <div class="loading-text"></div>
      <div class="plf-registration">
        
        <form id="frmSoftwareRegistration" action="<%=contextPath+"/software-register-action"%>" method="post">
          
          <div class="uiAction" id="UIPortalLoginFormAction">
            <input class="btn" type="hidden" name="value" value="<%if("true".equals(notReachable)){%>notReachable<%}%>"/>
            <a class="registrationURL btn btn-primary" href="<%=registrationURL%>" style="display: none;" ><fmt:message key="<%=SoftwareRegisterViewServlet.PLF_REG_LABEL_REGISTER%>"/></a>
            <input class="btn btn-primary" type="button" name="btnContinue" value="<fmt:message key="<%=SoftwareRegisterViewServlet.PLF_REG_LABEL_CONTINUE_BTN%>"/>" disabled="disabled" />
            <input class="btn" type="button" name="btnSkip" value="<fmt:message key="<%=SoftwareRegisterViewServlet.PLF_REG_LABEL_SKIP_BTN%>"/>" <%if(!canSKip && !"true".equals(notReachable)){%>disabled="disabled"<%}%> />
          </div>
          
        </form>
      </div>

    </div>
  </div>
  
  
</body>
</html>
