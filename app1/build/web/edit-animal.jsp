<%@include file="head.jsp" %>
    <div class="centered">
        <h1>Tipo de Animal</h1>
        
        <%
            String changeRow = request.getParameter("changeRow");
            if(changeRow != null){
                int operation = Integer.parseInt(changeRow);
                %>
                <p class="edition-result">
                    <%
                        PreparedStatement pstatement = null;
                        switch(operation){
                            case 1:
                                String sId = request.getParameter("id");
                                String sNombre = request.getParameter("nombre");
                                if(sId != null && sNombre != null){
                                    if(sId != "" && sNombre != ""){
                                        String queryString = "UPDATE tipo_animal SET nombre = ? WHERE id_tipo= ?";
                                        pstatement = conexion.prepareStatement(queryString);
                                        pstatement.setString(1, sNombre);
                                        pstatement.setInt(2, Integer.parseInt(sId));
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
                                out.println("el elemento es: "+nNombre);
                                if(nNombre != null){
                                    if(nNombre != ""){
                                        String queryString = "INSERT INTO tipo_animal "
                                                + "(nombre) VALUES "
                                                + "(?)";
                                        pstatement = conexion.prepareStatement(queryString);
                                        pstatement.setString(1, nNombre);
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
                                        String queryString = "DELETE FROM tipo_animal WHERE id_tipo = ? LIMIT 1";
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
                        if(pstatement !=null){
                            pstatement.close();
                        }
                    %>
                </p>
                <%
            }
        %>
        
        <%
        Statement s = conexion.createStatement();
        //Cojo todos los tipos de animales
        ResultSet listado = s.executeQuery ("SELECT id_tipo, nombre "
                + "FROM tipo_animal ORDER BY id_tipo desc");
        %>
        <table class="table-edition">
            <tr>
                <th>ID</th>
                <th>Tipo de animal</th>
            </tr>
            <!-- INSERTAR NUEVO -->
            <tr>
                <form method='post' action=''>
                    <td>Auto</td>
                    <td><input name='nombre' type='text' value='' required/></td>
                    <td>
                        <input type="hidden" value="2" name="changeRow"/>
                        <input type="submit" value="Añadir Nuevo">
                    </td>
                </form>
            </tr>
        <%
        while (listado.next()) {
            %>
            <%
            out.println("<tr class='row_editable masc-id-"+listado.getString("id_tipo")+"'>");
            out.println("<form method='post' action=''>");
            out.println("<td>"+listado.getString("id_tipo")+"<input name='id' type='hidden' value='"+listado.getString("id_tipo")+"' required/></td>");
            out.println("<td><span>"+listado.getString("nombre")+"</span><input name='nombre' type='text' value='"+listado.getString("nombre")+"' required/></td>");
            
            %>
    <td>
        <input type="hidden" value="1" name="changeRow"/>
        <input class="edit-btn" type="button" onClick='changeField(<%=listado.getString("id_tipo")%>)' value="Editar">
        <input class="save-edit-btn" type="submit" value="Guardar">
    </td>
    </form>
    <td>
        <form method='post' action=''>
            <input type="hidden" value="<%out.println(listado.getString("id_tipo"));%>" name="id"/>
            <input type="hidden" value="3" name="changeRow"/>
            <input class="remove-btn" type="submit" value="Eliminar">
        </form>
    </td>
</tr>
<%
} // while
%>
</table>
    </div>
    </body>
</html>
<%
    conexion.close();
%>