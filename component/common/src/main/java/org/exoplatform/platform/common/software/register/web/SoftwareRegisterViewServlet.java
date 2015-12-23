package org.exoplatform.platform.common.software.register.web;

import org.exoplatform.platform.common.software.register.service.SoftwareRegistrationService;
import org.exoplatform.services.wcm.utils.WCMCoreUtils;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ResourceBundle;

/**
 * Created by The eXo Platform SEA
 * Author : eXoPlatform
 * toannh@exoplatform.com
 * On 9/28/15
 * Software register to Tribe
 */
public class SoftwareRegisterViewServlet extends HttpServlet {

  private static final long serialVersionUID = 1L;

  public static final String PLF_REG_LABEL_INTRO                =   "SoftwareRegister.label.intro";
  public static final String PLF_REG_LABEL_WARNING_CANCEL       =   "SoftwareRegister.label.warning_cancelled";
  public static final String PLF_REG_LABEL_WARNING_NOT_COMPLETE =   "SoftwareRegister.label.warning_not_complete";
  public static final String PLF_REG_LABEL_SUPPORT              =   "SoftwareRegister.label.support";
  public static final String PLF_REG_LABEL_SIGN_IN_REG          =   "SoftwareRegister.label.sign_in_regist";
  public static final String PLF_REG_LABEL_ABOUT_THAT           =   "SoftwareRegister.label.about_that";
  public static final String PLF_REG_LABEL_CANNOT_REACH         =   "SoftwareRegister.label.cannot_reach";
  public static final String PLF_REG_LABEL_SIGN_IN              =   "SoftwareRegister.label.sign_in";
  public static final String PLF_REG_LABEL_REGISTER             =   "SoftwareRegister.label.register";
  public static final String PLF_REG_LABEL_CONTINUE_BTN         =   "SoftwareRegister.label.continue";
  public static final String PLF_REG_LABEL_SKIP_BTN             =   "SoftwareRegister.label.skip";
  public static final String PLF_REG_LABEL_THANK                =   "SoftwareRegister.success.label.thanks";
  public static final String PLF_REG_LABEL_SUCCESS              =   "SoftwareRegister.success.label.successfully_registered";

  private final static String SR_JSP_RESOURCE = "/WEB-INF/jsp/software-registration/softwareregister.jsp";

  @Override
  protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    String registrationULR = SoftwareRegisterAuthViewServlet.getRegistrationURL(request);
    request.setAttribute("registrationURL", registrationULR);
    request.getSession().setAttribute("registrationURL", registrationULR);
    initResourceBundle(request);
    getServletContext().getRequestDispatcher(SR_JSP_RESOURCE).forward(request, response);
  }

  @Override
  protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    doPost(request, response);
  }

  /**
   * mapping resource bundle to request
   * @param request
   */
  private void initResourceBundle(HttpServletRequest request){
    ResourceBundle rb = ResourceBundle.getBundle("locale.platform.RegistrationPLF", request.getLocale());
    HttpSession session = request.getSession();
    session.setAttribute(PLF_REG_LABEL_INTRO, rb.getString(PLF_REG_LABEL_INTRO)
        .replace("{0}", "<a class=\"firstText\" href=\"https://community.exoplatform.com\" >eXo Tribe</a>"));
    session.setAttribute(PLF_REG_LABEL_WARNING_CANCEL, rb.getString(PLF_REG_LABEL_WARNING_CANCEL));
    session.setAttribute(PLF_REG_LABEL_WARNING_NOT_COMPLETE, rb.getString(PLF_REG_LABEL_WARNING_NOT_COMPLETE));
    session.setAttribute(PLF_REG_LABEL_SUPPORT, rb.getString(PLF_REG_LABEL_SUPPORT));
    session.setAttribute(PLF_REG_LABEL_SIGN_IN_REG, rb.getString(PLF_REG_LABEL_SIGN_IN_REG));
    session.setAttribute(PLF_REG_LABEL_ABOUT_THAT, rb.getString(PLF_REG_LABEL_ABOUT_THAT));
    session.setAttribute(PLF_REG_LABEL_CANNOT_REACH, rb.getString(PLF_REG_LABEL_CANNOT_REACH));
    session.setAttribute(PLF_REG_LABEL_SIGN_IN, rb.getString(PLF_REG_LABEL_SIGN_IN));
    session.setAttribute(PLF_REG_LABEL_REGISTER, rb.getString(PLF_REG_LABEL_REGISTER));
    session.setAttribute(PLF_REG_LABEL_CONTINUE_BTN, rb.getString(PLF_REG_LABEL_CONTINUE_BTN));
    session.setAttribute(PLF_REG_LABEL_SKIP_BTN, rb.getString(PLF_REG_LABEL_SKIP_BTN));
    session.setAttribute(PLF_REG_LABEL_THANK, rb.getString(PLF_REG_LABEL_THANK));
    session.setAttribute(PLF_REG_LABEL_SUCCESS, rb.getString(PLF_REG_LABEL_SUCCESS));
  }
}
