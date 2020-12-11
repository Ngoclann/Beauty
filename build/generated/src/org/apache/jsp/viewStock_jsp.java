package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.util.ArrayList;
import entity.Product;
import model.ProductDAO;
import entity.ProductType;
import java.util.List;
import java.util.List;
import model.ProductTypeDAO;

public final class viewStock_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.ArrayList<String>(1);
    _jspx_dependants.add("/part/icon.html");
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
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>Stocks</title>\n");
      out.write("        <link rel=\"stylesheet\" href=\"css/admin.css\">\n");
      out.write("        <link href=\"https://fonts.googleapis.com/css?family=Anton&display=swap\" rel=\"stylesheet\">\n");
      out.write("        <link rel=\"stylesheet\" href=\"https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css\"\n");
      out.write("              integrity=\"sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh\" crossorigin=\"anonymous\">\n");
      out.write("        <script src=\"https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/js/bootstrap.min.js\"\n");
      out.write("                integrity=\"sha384-wfSDF2E50Y2D1uUdj0O3uMBJnjuUD4Ih7YwaYd1iqfktj0Uod8GCExl3Og8ifwB6\"\n");
      out.write("        crossorigin=\"anonymous\"></script>\n");
      out.write("        ");
      out.write("\n");
      out.write("<link rel=\"apple-touch-icon\" sizes=\"180x180\" href=\"../img/apple-touch-icon.png\">\n");
      out.write("<link rel=\"icon\" type=\"image/png\" sizes=\"32x32\" href=\"../img/favicon-32x32.png\">\n");
      out.write("<link rel=\"icon\" type=\"image/png\" sizes=\"16x16\" href=\"../img/favicon-16x16.png\">\n");
      out.write("<link rel=\"manifest\" href=\"../img/site.webmanifest\">\n");
      out.write("<link rel=\"mask-icon\" href=\"img/safari-pinned-tab.svg\" color=\"#5bbad5\">\n");
      out.write("<meta name=\"msapplication-TileColor\" content=\"#da532c\">\n");
      out.write("<meta name=\"theme-color\" content=\"#ffffff\">");
      out.write("\n");
      out.write("        <script src=\"https://kit.fontawesome.com/b99e675b6e.js\"></script>\n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("        ");

            if (session.getAttribute("admin") == null) {
        
      out.write("\n");
      out.write("        <div id=\"alert\" class=\"alert\">\n");
      out.write("            <span class=\"closebtn\" onclick=\"this.parentElement.style.display = 'none';\">&times;</span>\n");
      out.write("            <strong>Sorry!</strong> You don't have permission to view this site 😢\n");
      out.write("        </div> \n");
      out.write("        ");
  } else {
      out.write("\n");
      out.write("        <div class=\"wrapper\">\n");
      out.write("            <div class=\"sidebar\">\n");
      out.write("                <h4>L-Beauty</h4>\n");
      out.write("                <ul>\n");
      out.write("                    <li><a href=\"viewStock\">View Stocks</a></li>\n");
      out.write("                    <li><a href=\"viewOrder.jsp\">View Orders</a></li>\n");
      out.write("                </ul>\n");
      out.write("                <div class=\"social_media\">\n");
      out.write("                    <a href=\"logoutAdmin\">Log-out</a>\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("            ");

                ProductTypeDAO ptdb = new ProductTypeDAO();
                ProductDAO pdb = new ProductDAO();
                List<Product> listAll = pdb.getAllProducts();
                int noOfPros = listAll.size();
                int noOfAlbs = pdb.getProductStock("alb");
                int noOfBags = pdb.getProductStock("bag");
                int noOfBuns = pdb.getProductStock("bun");
                int noOfBans = pdb.getProductStock("ban");
                int noOfClos = pdb.getProductStock("clo");
                int noOfHats = pdb.getProductStock("hat");
                int noOfLis = pdb.getProductStock("li");
                List<ProductType> typeList = ptdb.getAllTypes();
                String typeN = (String) request.getAttribute("typeN");
            
      out.write("\n");
      out.write("            <div class=\"main_content\">\n");
      out.write("                <div class=\"header\">View Stock</div>\n");
      out.write("\n");
      out.write("                <div class=\"info\">\n");
      out.write("                    <div>\n");
      out.write("                        <table class=\"table table-sm\" id=\"sumTable\">\n");
      out.write("                            <thead>\n");
      out.write("                                <tr>\n");
      out.write("                                    ");
 
                                    for(ProductType type : typeList){
                                    
      out.write("\n");
      out.write("                                    <th scope=\"col\">");
      out.print(type.getTname());
      out.write("</th>\n");
      out.write("                                    ");
 } 
      out.write("\n");
      out.write("                                </tr>\n");
      out.write("                            </thead>\n");
      out.write("                            <tbody>\n");
      out.write("                                <tr>\n");
      out.write("                                ");
 
                                for(ProductType type2 : typeList){
                                    String typeid = type2.getTypeid();
                                
      out.write("\n");
      out.write("                                \n");
      out.write("                                    <td>");
      out.print(pdb.getProductStock(typeid));
      out.write("</td>\n");
      out.write("                                \n");
      out.write("                                ");
 } 
      out.write("\n");
      out.write("                                </tr>\n");
      out.write("                            </tbody>\n");
      out.write("                        </table>\n");
      out.write("                        <div class=\"sumup\">\n");
      out.write("                            <h3>Total Product: ");
      out.print(noOfPros);
      out.write("</h3>\n");
      out.write("                        </div>\n");
      out.write("                    </div>\n");
      out.write("                    <form action=\"viewStock\" method=\"post\" id=\"f1\" >\n");
      out.write("                        <div class=\"product-type\" id=\"#product-type\">\n");
      out.write("                            <div>\n");
      out.write("                                <select name=\"productType\" onchange=\"f1.submit()\">\n");
      out.write("                                    <option value=\"all\">--All--</option>\n");
      out.write("                                    ");

                                        for (ProductType pt : typeList) {
                                    
      out.write("\n");
      out.write("                                    <option value=\"");
      out.print(pt.getTname());
      out.write("\" >");
      out.print(pt.getTname());
      out.write("</option>\n");
      out.write("                                    ");
 } 
      out.write("\n");
      out.write("                                </select>\n");
      out.write("                            </div>\n");
      out.write("                        </div>\n");
      out.write("                        <div class=\"addnew\">\n");
      out.write("                            <input type=\"button\" value=\"Add Product\" onclick=\"location.href = 'newProduct.jsp';\">\n");
      out.write("                        </div>\n");
      out.write("                        <div class=\"product-info\">\n");
      out.write("                            <table class=\"table\">\n");
      out.write("                                <thead class=\"thead-dark\">\n");
      out.write("                                    <tr>\n");
      out.write("                                        <th scope=\"col\">ID</th>\n");
      out.write("                                        <th scope=\"col\">Product Name</th>\n");
      out.write("                                        <th scope=\"col\">Type</th>\n");
      out.write("                                        <th scope=\"col\">Artist</th>\n");
      out.write("                                        <th scope=\"col\">image</th>\n");
      out.write("                                        <th scope=\"col\">Price</th>\n");
      out.write("                                        <th scope=\"col\">Stock</th>\n");
      out.write("                                        <th scope=\"col\"></th>\n");
      out.write("                                        <th scope=\"col\"></th>\n");
      out.write("                                    </tr>\n");
      out.write("                                </thead>\n");
      out.write("                                <tbody>\n");
      out.write("                                    ");

                                        List<Product> pList = (ArrayList<Product>) request.getAttribute("pList");
                                        for (Product p : pList) {
                                    
      out.write("\n");
      out.write("                                    <tr>\n");
      out.write("                                        <td>");
      out.print( p.getPid());
      out.write("</td>\n");
      out.write("                                        <td>");
      out.print( p.getPname());
      out.write("</td>\n");
      out.write("                                        <td>");
      out.print(p.getTypeid());
      out.write("</td>\n");
      out.write("                                        <td>");
      out.print(p.getBrandid());
      out.write("</td>\n");
      out.write("                                        <td><img class=\"zoom\" src=\"");
      out.print(p.getImage());
      out.write("\"></td>\n");
      out.write("                                        <td>");
      out.print(p.getPrice());
      out.write("</td>\n");
      out.write("                                        <td>");
      out.print(p.getStock());
      out.write("</td>\n");
      out.write("                                        <td><input type=\"button\" class=\"edit-btn\" onclick=\"location.href = 'edit?pid=");
      out.print( p.getPid());
      out.write("'\" value=\"Edit\"></td>\n");
      out.write("                                        <td><input type=\"button\" class=\"remove-btn\" onclick=\"location.href = 'remove?pid=");
      out.print( p.getPid());
      out.write("'\" value=\"Remove\"></td>\n");
      out.write("                                    </tr>\n");
      out.write("                                    ");
 } 
      out.write("\n");
      out.write("                                </tbody>\n");
      out.write("                            </table>\n");
      out.write("                        </div>\n");
      out.write("                    </form>\n");
      out.write("\n");
      out.write("                </div>\n");
      out.write("            </div>\n");
      out.write("        </div>\n");
      out.write("        ");
 }
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
