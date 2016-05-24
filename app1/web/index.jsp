<%@include file="head.jsp" %>
    <div class="centered">
        <h1>Mascotas</h1>
        
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
        //Cojo todas las mascotas con su tipo y su dueño
        ResultSet listado = s.executeQuery ("SELECT m.id_mascota,m.nombre,m.raza,m.descripcion,m.dientes,d.id_dueno,t.nombre tipo,t.id_tipo,d.nombre dueno_nom,d.apellidos "
                + "FROM mascotas m INNER JOIN tipo_animal t ON t.id_tipo = m.tipo INNER JOIN dueno d ON d.id_dueno = m.dueno ORDER BY id_mascota desc");
        
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
        %>
        <table class="table-edition">
            <tr>
                <th>ID</th>
                <th>Nombre</th>
                <th>Tipo Animal</th>
                <th>Raza</th>
                <th>Dientes</th>
                <th>Descripcion</th>
                <th>Dueño</th>
            </tr>
            <!-- INSERTAR NUEVO -->
            <tr>
                <form method='post' action=''>
                    <td>Auto</td>
                    <td><input name='nombre' type='text' value='' required/></td>
                    <td><% out.println(createSelect(tiposMap,0,"tipo"));%></td>
                    <td><input name='raza' type='text' value='' required/></td>
                    <td><input name='dientes' type='number' min="1" value='1' required/></td>
                    <td><textarea name='descripcion' required></textarea></td>
                    <td><% out.println(createSelect(duenosMap,0,"dueno"));%></td>
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
            out.println("<tr class='row_editable masc-id-"+listado.getString("id_mascota")+"'>");
            out.println("<form method='post' action=''>");
            out.println("<td>"+listado.getString("id_mascota")+"<input name='id' type='hidden' value='"+listado.getString("id_mascota")+"' required/></td>");
            out.println("<td><span>"+listado.getString("nombre")+"</span><input name='nombre' type='text' value='"+listado.getString("nombre")+"' required/></td>");
            out.println("<td><span>"+listado.getString("tipo")+"</span>"+createSelect(tiposMap,listado.getInt("id_tipo"),"tipo")+"</td>");
            out.println("<td><span>"+listado.getString("raza")+"</span><input name='raza' type='text' value='"+listado.getString("raza")+"' required/></td>");
            out.println("<td><span>"+listado.getString("dientes")+"</span><input name='dientes' type='number' value='"+listado.getInt("dientes")+"' required/></td>");
            out.println("<td><span>"+listado.getString("descripcion")+"</span><textarea name='descripcion' required>"+listado.getString("descripcion")+"</textarea></td>");
            out.println("<td><span>"+listado.getString("dueno_nom")+" "+listado.getString("apellidos")+"</span>"+createSelect(duenosMap,listado.getInt("id_dueno"),"dueno")+"</td>");
            
            %>
    <td>
        <input type="hidden" value="1" name="changeRow"/>
        <input class="edit-btn" type="button" onClick='changeField(<%=listado.getString("id_mascota")%>)' value="Editar">
        <input class="save-edit-btn" type="submit" value="Guardar">
    </td>
    </form>
    <td>
        <form method='post' action=''>
            <input type="hidden" value="<%out.println(listado.getString("id_mascota"));%>" name="id"/>
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