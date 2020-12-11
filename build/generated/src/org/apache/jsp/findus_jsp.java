package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.ArrayList;
import entity.Item;
import entity.Cart;

public final class findus_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.ArrayList<String>(1);
    _jspx_dependants.add("/part/footer.html");
  }

  private org.glassfish.jsp.api.ResourceInjector _jspx_resourceInjector;

  public java.util.List<String> getDependants() {
    return _jspx_dependants;
  }

  public void _jspService(HttpServletRequest request, HttpServletResponse response)
        throws java.io.IOException, ServletException {

    PageContext pageContext = null;
    HttpSession session = null;
    ServletContext application = null;
    ServletConfig config = null;
    JspWriter out = null;
    Object page = this;
    JspWriter _jspx_out = null;
    PageContext _jspx_page_context = null;

    try {
      response.setContentType("text/html;charset=UTF-8");
      pageContext = _jspxFactory.getPageContext(this, request, response,
      			null, true, 8192, true);
      _jspx_page_context = pageContext;
      application = pageContext.getServletContext();
      config = pageContext.getServletConfig();
      session = pageContext.getSession();
      out = pageContext.getOut();
      _jspx_out = out;
      _jspx_resourceInjector = (org.glassfish.jsp.api.ResourceInjector) application.getAttribute("com.sun.appserv.jsp.resource.injector");

      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>Find us</title>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        <nav>\n");
      out.write("            <ul class=\"menu\">\n");
      out.write("                <li class=\"logo\"><a href=\"index.jsp\"><img src=\"img/logo.png\" alt=\"\"></a></li>\n");
      out.write("                <li class=\"item\"><a href=\"index.jsp\">Home</a></li>\n");
      out.write("                <li class=\"item\"><a href=\"discovery.jsp\">Discovery</a></li>\n");
      out.write("                <li class=\"item\"><a href=\"findus.jsp\">Find us</a></li>\n");
      out.write("                <li class=\"item\"><a href=\"getMerch\">Shop</a></li>\n");
      out.write("                    ");

                        if (session.getAttribute("visitor") == null) {
                    
      out.write("\n");
      out.write("                <li class=\"item button\"><a href=\"login.jsp\">Log In</a></li>\n");
      out.write("                <li class=\"item button secondary\"><a href=\"signup.jsp\">Sign Up</a></li>\n");
      out.write("                <li class=\"item cart\"><a href=\"\" onclick=\"noticeLogin()\"><i class=\"fas fa-shopping-cart\"></i></a></li>\n");
      out.write("                        ");
 } else {
                            Object obj = session.getAttribute("cart");
                            int noOfItems = 0;
                            if (obj != null) {
                                Cart cart = (Cart) obj;
                                ArrayList<Item> list = (ArrayList<Item>) cart.getItems();
                                noOfItems = list.size();
                            }
                        
      out.write("\n");
      out.write("                <li class=\"item\" id=\"user\"><a href=\"\"><i class=\"fas fa-user\"></i>");
      out.write((java.lang.String) org.apache.jasper.runtime.PageContextImpl.evaluateExpression("${sessionScope.visitor.username}", java.lang.String.class, (PageContext)_jspx_page_context, null));
      out.write("</a></li>\n");
      out.write("                <li class=\"item button secondary\"><a href=\"logout\">Log Out</a></li>\n");
      out.write("                <li class=\"item cart\"><a href=\"cart.jsp\"><i class=\"fas fa-shopping-cart\"></i>(");
      out.print(noOfItems);
      out.write(")</a></li>\n");
      out.write("                    ");
 }
      out.write("\n");
      out.write("                <li class=\"toggle\"><span class=\"bars\"></span></li>\n");
      out.write("            </ul>\n");
      out.write("        </nav>\n");
      out.write("\n");
      out.write("        <iframe src=\"https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d3724.4823308941677!2d105.52509761476313!3d21.013378286006777!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x313454b32ca5086d%3A0xa3c62e29d8ab37e4!2zVHLGsOG7nW5nIMSQ4bqhaSBo4buNYyBGUFQgSMOgIE7hu5lp!5e0!3m2!1svi!2s!4v1595266443487!5m2!1svi!2s\" \n");
      out.write("                width=\"600\" height=\"450\" frameborder=\"0\" style=\"border:0;\" allowfullscreen=\"\" aria-hidden=\"false\" tabindex=\"0\"></iframe>\n");
      out.write("            ");
      out.write("<footer id=\"footer\">\n");
      out.write("        <div class=\"footer-top\">\n");
      out.write("            <div class=\"container\">\n");
      out.write("                <div class=\"row\">\n");
      out.write("                    <div class=\"col-lg-4 col-md-6 footer-info\">\n");
      out.write("                        <h3>L-BEAUTY</h3>\n");
      out.write("                        <p> <strong>Everything has beauty, but not everyone sees it.</strong>\n");
      out.write("                        </p>\n");
      out.write("                    </div>\n");
      out.write("                    <div class=\"col-lg-2 col-md-6 footer-links\">\n");
      out.write("                        <h4>ALSO VISITING</h4>\n");
      out.write("                        <ul>\n");
      out.write("                            <li><a href=\"https://www.taylorswift.com/\"\n");
      out.write("                                    target=\"blank\"><strong>Taylor Swift</strong></a></li>\n");
      out.write("                            <li><a href=\"https://www.youtube.com/c/PONYMakeup\"\n");
      out.write("                                    target=\"blank\"><strong>PONY Syndrome</strong></a></li>\n");
      out.write("                            <li><a href=\"https://www.elle.vn/\"\n");
      out.write("                                    target=\"blank\"><strong>ELLE</strong></a></li>\n");
      out.write("                            <li><a href=\"https://www.youtube.com/channel/UCaW8triXbACrcmfj3cUCZ9w\"\n");
      out.write("                                    target=\"blank\"><strong>Chau Bui Official</strong></a></li>\n");
      out.write("                        </ul>\n");
      out.write("                    </div>\n");
      out.write("                    <div class=\"col-lg-3 col-md-6 footer-contact\">\n");
      out.write("                        <h4>Contact me</h4>\n");
      out.write("                        <p>\n");
      out.write("                            <strong>Email: </strong> junebride09.02@gmail.com <br>\n");
      out.write("                            <strong>Phonenumber: </strong>0985086002 <br>\n");
      out.write("\n");
      out.write("                        </p>\n");
      out.write("                        <div class=\"social-links\">\n");
      out.write("                            <a href=\"https://www.facebook.com/ngoclann22/\" target=\"blank\"><i\n");
      out.write("                                    class=\"fab fa-facebook\"></i></a>\n");
      out.write("                            <a href=\"https://www.instagram.com/meow_bubble/\" target=\"blank\"><i\n");
      out.write("                                    class=\"fab fa-instagram\"></i></a>\n");
      out.write("                            <a href=\"https://twitter.com/TriLy9\" target=\"blank\"><i\n");
      out.write("                                    class=\"fab fa-twitter\" ></i></a>\n");
      out.write("                            <a href=\"https://www.youtube.com/channel/UC6gp1ymmcB2MVZGLuXy_VEQ\" target=\"blank\"><i\n");
      out.write("                                    class=\"fab fa-youtube\"></i></a>\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("                    <div class=\"col-lg-3 col-md-6 footer-newsletter\">\n");
      out.write("                        <h4>Newsletter</h4>\n");
      out.write("                        <p> Updating day by day...\n");
      out.write("                        </p>\n");
      out.write("                    </div>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("            <div class=\"container\">\n");
      out.write("                <div class=\"copyright\">\n");
      out.write("                    &copy; Copyright <strong>L-BEAUTY</strong>. All rights reserved\n");
      out.write("                </div>\n");
      out.write("                <div class=\"credits\">\n");
      out.write("                    Powered by <b>Ngoc Lan</b>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("    </footer>");
      out.write("\n");
      out.write("    </body>\n");
      out.write("</html>\n");
    } catch (Throwable t) {
      if (!(t instanceof SkipPageException)){
        out = _jspx_out;
        if (out != null && out.getBufferSize() != 0)
          out.clearBuffer();
        if (_jspx_page_context != null) _jspx_page_context.handlePageException(t);
        else throw new ServletException(t);
      }
    } finally {
      _jspxFactory.releasePageContext(_jspx_page_context);
    }
  }
}
