package org.apache.jsp;

import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.jsp.*;
import java.sql.Statement;
import java.sql.ResultSet;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.Connection;
import java.util.*;

public final class index_jsp extends org.apache.jasper.runtime.HttpJspBase
    implements org.apache.jasper.runtime.JspSourceDependent {


public String createSelect(Map<Integer,String> theHash,int selected,String name){
    String returned = "<select name='"+name+"' required>";
    for (Map.Entry<Integer, String> entry : theHash.entrySet()) {
        
        returned += "<option ";
        if(selected == entry.getKey()){
            returned += "selected ";
        }
        returned += "value='"+entry.getKey()+"'>"+entry.getValue()+"</option>";
    }
    returned += "</select>";
    return returned;
}

  private static final JspFactory _jspxFactory = JspFactory.getDefaultFactory();

  private static java.util.List<String> _jspx_dependants;

  static {
    _jspx_dependants = new java.util.ArrayList<String>(1);
    _jspx_dependants.add("/head.jsp");
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
      response.setContentType("text/html");
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
      out.write('\n');


Class.forName("com.mysql.jdbc.Driver");
Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost/progra","root", "");
        

      out.write("\n");
      out.write("<!DOCTYPE html>\n");
      out.write("<html>\n");
      out.write("    <head>\n");
      out.write("        <meta http-equiv=\"Content-Type\" content=\"text/html; charset=UTF-8\">\n");
      out.write("        <title>Edición de Mascotas</title>\n");
      out.write("        <link rel=\"stylesheet\" href=\"css/style.css\" />\n");
      out.write("        <script src=\"https://ajax.googleapis.com/ajax/libs/jquery/2.2.3/jquery.min.js\"></script>\n");
      out.write("        <script type=\"application/javascript\" src=\"js/scripts.js\"></script>\n");
      out.write("    \n");
      out.write("    </head>\n");
      out.write("    <body>\n");
      out.write("    <nav>\n");
      out.write("        <ul>\n");
      out.write("            <li><a href=\"index.jsp\">Mascotas</a></li>\n");
      out.write("            <li><a href=\"edit-animal.jsp\">Tipo animal</a></li>\n");
      out.write("            <li><a href=\"edit-duenos.jsp\">Dueños</a></li>\n");
      out.write("        </ul>\n");
      out.write("\n");
      out.write("    </nav>");
      out.write("\n");
      out.write("    <div class=\"centered\">\n");
      out.write("        <h1>Mascotas</h1>\n");
      out.write("        \n");
      out.write("        ");

            String changeRow = request.getParameter("changeRow");
            if(changeRow != null){
                int operation = Integer.parseInt(changeRow);
                
      out.write("\n");
      out.write("                <p class=\"edition-result\">\n");
      out.write("                    ");

                        PreparedStatement pstatement = null;
                        switch(operation){
                            case 1:
                                String sId = request.getParameter("id");
                                String sNombre = request.getParameter("nombre");
                                String sTipo = request.getParameter("tipo");
                                String sRaza = request.getParameter("raza");
                                String sDientes = request.getParameter("dientes");
                                String sDescripcion = request.getParameter("descripcion");
                                String sDueno = request.getParameter("dueno");
                                if(sId != null && sNombre != null && sTipo != null && sRaza != null && sDientes != null && sDescripcion != null && sDueno != null){
                                    if(sId != "" && sNombre != "" && sTipo != "" && sRaza != "" && sDientes != "" && sDescripcion != "" && sDueno != ""){
                                        String queryString = "UPDATE mascotas SET nombre = ?, tipo = ?, raza = ?, dueno = ?, descripcion = ?, dientes = ? WHERE id_mascota= ?";
                                        pstatement = conexion.prepareStatement(queryString);
                                        pstatement.setString(1, sNombre);
                                        pstatement.setInt(2, Integer.parseInt(sTipo));
                                        pstatement.setString(3, sRaza);
                                        pstatement.setInt(4, Integer.parseInt(sDueno));
                                        pstatement.setString(5, sDescripcion);
                                        pstatement.setInt(6, Integer.parseInt(sDientes));
                                        pstatement.setInt(7, Integer.parseInt(sId));
                                        int updateQuery = pstatement.executeUpdate();
                                        if (updateQuery != 0) {
                                            out.println("Se ha editado el elemento correctamente");
                                        }else{
                                            out.println("Ha habido un error al guardar");
                                        }
                                    }else{
                                        out.println("Todos los campos son obligatorios");
                                    }
                                }else{
                                    out.println("Todos los campos son obligatorios");
                                }
                            break;
                            case 2:
                                String nNombre = request.getParameter("nombre");
                                String nTipo = request.getParameter("tipo");
                                String nRaza = request.getParameter("raza");
                                String nDientes = request.getParameter("dientes");
                                String nDescripcion = request.getParameter("descripcion");
                                String nDueno = request.getParameter("dueno");
                                out.println("el elemento es: "+nNombre);
                                if(nNombre != null && nTipo != null && nRaza != null && nDientes != null && nDescripcion != null && nDueno != null){
                                    if(nNombre != "" && nTipo != "" && nRaza != "" && nDientes != "" && nDescripcion != "" && nDueno != ""){
                                        String queryString = "INSERT INTO mascotas "
                                                + "(nombre, tipo, raza, dueno, descripcion, dientes) VALUES "
                                                + "(?,?,?,?,?,?)";
                                        pstatement = conexion.prepareStatement(queryString);
                                        pstatement.setString(1, nNombre);
                                        pstatement.setInt(2, Integer.parseInt(nTipo));
                                        pstatement.setString(3, nRaza);
                                        pstatement.setInt(4, Integer.parseInt(nDueno));
                                        pstatement.setString(5, nDescripcion);
                                        pstatement.setInt(6, Integer.parseInt(nDientes));
                                        int updateQuery = pstatement.executeUpdate();
                                        if (updateQuery != 0) {
                                            out.println("Se ha añadido el elemento correctamente");
                                        }else{
                                            out.println("Ha habido un error al guardar");
                                        }
                                    }else{
                                        out.println("Todos los campos son obligatorios");
                                    }
                                }else{
                                    out.println("Todos los campos son obligatorios");
                                }
                            break;
                            case 3:
                                String dId = request.getParameter("id");
                                if(dId != null){
                                    if(dId != ""){
                                        String queryString = "DELETE FROM mascotas WHERE id_mascota = ? LIMIT 1";
                                        pstatement = conexion.prepareStatement(queryString);
                                        pstatement.setString(1, dId);
                                        int updateQuery = pstatement.executeUpdate();
                                        if (updateQuery != 0) {
                                            out.println("Se ha eliminado correctamente el elemento");
                                        }else{
                                            out.println("Ha habido un error al eliminar");
                                        }
                                    }else{
                                        out.println("Ha habido un error");
                                    }
                                }else{
                                    out.println("Ha habido un error");
                                }
                            break;
                            default:
                                out.println("Ha habido un error");
                        }
                        pstatement.close();
                    
      out.write("\n");
      out.write("                </p>\n");
      out.write("                ");

            }
        
      out.write("\n");
      out.write("        \n");
      out.write("        ");

        Statement s = conexion.createStatement();
        //Cojo todas las mascotas con su tipo y su dueño
        ResultSet listado = s.executeQuery ("SELECT m.id_mascota,m.nombre,m.raza,m.descripcion,m.dientes,d.id_dueno,t.nombre tipo,t.id_tipo,d.nombre dueno_nom,d.apellidos "
                + "FROM mascotas m LEFT JOIN tipo_animal t ON t.id_tipo = m.tipo LEFT JOIN dueno d ON d.id_dueno = m.dueno ORDER BY id_mascota desc");
        
        //Cojo todos los dueños
        Statement sDuenos = conexion.createStatement();
        ResultSet duenos = sDuenos.executeQuery ("SELECT nombre,apellidos,id_dueno "
                + "FROM dueno ORDER BY id_dueno desc");
        //Guardo el resultado para poder reutilizarlo de forma sencilla
        Map<Integer, String> duenosMap = new HashMap<Integer, String>();
        while (duenos.next()) {
            duenosMap.put(duenos.getInt("id_dueno"), duenos.getString("nombre")+" "+duenos.getString("apellidos"));
        }
        
        //Cojo todos los tipos
        Statement sTipo = conexion.createStatement();
        ResultSet tiposAnimal = sTipo.executeQuery ("SELECT id_tipo,nombre "
                + "FROM tipo_animal ORDER BY id_tipo desc");
        //Guardo el resultado para poder reutilizarlo de forma sencilla
        Map<Integer, String> tiposMap = new HashMap<Integer, String>();
        while (tiposAnimal.next()) {
            tiposMap.put(tiposAnimal.getInt("id_tipo"), tiposAnimal.getString("nombre"));
        }
        
      out.write("\n");
      out.write("        <table class=\"table-edition\">\n");
      out.write("            <tr>\n");
      out.write("                <th>ID</th>\n");
      out.write("                <th>Nombre</th>\n");
      out.write("                <th>Tipo Animal</th>\n");
      out.write("                <th>Raza</th>\n");
      out.write("                <th>Dientes</th>\n");
      out.write("                <th>Descripcion</th>\n");
      out.write("                <th>Dueño</th>\n");
      out.write("            </tr>\n");
      out.write("            <!-- INSERTAR NUEVO -->\n");
      out.write("            <tr>\n");
      out.write("                <form method='post' action=''>\n");
      out.write("                    <td>Auto</td>\n");
      out.write("                    <td><input name='nombre' type='text' value='' required/></td>\n");
      out.write("                    <td>");
 out.println(createSelect(tiposMap,0,"tipo"));
      out.write("</td>\n");
      out.write("                    <td><input name='raza' type='text' value='' required/></td>\n");
      out.write("                    <td><input name='dientes' type='number' min=\"1\" value='1' required/></td>\n");
      out.write("                    <td><textarea name='descripcion' required></textarea></td>\n");
      out.write("                    <td>");
 out.println(createSelect(duenosMap,0,"dueno"));
      out.write("</td>\n");
      out.write("                    <td>\n");
      out.write("                        <input type=\"hidden\" value=\"2\" name=\"changeRow\"/>\n");
      out.write("                        <input type=\"submit\" value=\"Añadir Nuevo\">\n");
      out.write("                    </td>\n");
      out.write("                </form>\n");
      out.write("            </tr>\n");
      out.write("        ");

        while (listado.next()) {
            
      out.write("\n");
      out.write("            ");

            out.println("<tr class='row_editable masc-id-"+listado.getString("id_mascota")+"'>");
            out.println("<form method='post' action=''>");
            out.println("<td>"+listado.getString("id_mascota")+"<input name='id' type='hidden' value='"+listado.getString("id_mascota")+"' required/></td>");
            out.println("<td><span>"+listado.getString("nombre")+"</span><input name='nombre' type='text' value='"+listado.getString("nombre")+"' required/></td>");
            out.println("<td><span>"+listado.getString("tipo")+"</span>"+createSelect(tiposMap,listado.getInt("id_tipo"),"tipo")+"</td>");
            out.println("<td><span>"+listado.getString("raza")+"</span><input name='raza' type='text' value='"+listado.getString("raza")+"' required/></td>");
            out.println("<td><span>"+listado.getString("dientes")+"</span><input name='dientes' type='number' value='"+listado.getInt("dientes")+"' required/></td>");
            out.println("<td><span>"+listado.getString("descripcion")+"</span><textarea name='descripcion' required>"+listado.getString("descripcion")+"</textarea></td>");
            out.println("<td><span>"+listado.getString("dueno_nom")+" "+listado.getString("apellidos")+"</span>"+createSelect(duenosMap,listado.getInt("id_dueno"),"dueno")+"</td>");
            
            
      out.write("\n");
      out.write("    <td>\n");
      out.write("        <input type=\"hidden\" value=\"1\" name=\"changeRow\"/>\n");
      out.write("        <input class=\"edit-btn\" type=\"button\" onClick='changeField(");
      out.print(listado.getString("id_mascota"));
      out.write(")' value=\"Editar\">\n");
      out.write("        <input class=\"save-edit-btn\" type=\"submit\" value=\"Guardar\">\n");
      out.write("    </td>\n");
      out.write("    </form>\n");
      out.write("    <td>\n");
      out.write("        <form method='post' action=''>\n");
      out.write("            <input type=\"hidden\" value=\"");
out.println(listado.getString("id_mascota"));
      out.write("\" name=\"id\"/>\n");
      out.write("            <input type=\"hidden\" value=\"3\" name=\"changeRow\"/>\n");
      out.write("            <input class=\"remove-btn\" type=\"submit\" value=\"Eliminar\">\n");
      out.write("        </form>\n");
      out.write("    </td>\n");
      out.write("</tr>\n");

} // while

      out.write("\n");
      out.write("</table>\n");
      out.write("    </div>\n");
      out.write("    </body>\n");
      out.write("</html>\n");

    conexion.close();

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
