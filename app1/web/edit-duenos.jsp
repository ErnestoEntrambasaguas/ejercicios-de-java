<%@include file="head.jsp" %>
    <div class="centered">
        <h1>Dueños</h1>
        
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
                                String sApellidos = request.getParameter("apellidos");
                                String sDni = request.getParameter("dni");
                                String sSexo = request.getParameter("sexo");
                                String sDireccion = request.getParameter("direccion");
                                String sTelefono = request.getParameter("telefono");
                                if(sId != null && sNombre != null && sApellidos != null && sDni != null && sSexo != null && sDireccion != null && sTelefono != null){
                                    if(sId != "" && sNombre != "" && sApellidos != "" && sDni != "" && sSexo != "" && sDireccion != "" && sTelefono != ""){
                                        String queryString = "UPDATE dueno SET nombre = ?, apellidos = ?, dni = ?, sexo = ?, direccion = ?, telefono = ? WHERE id_dueno= ? LIMIT 1";
                                        pstatement = conexion.prepareStatement(queryString);
                                        pstatement.setString(1, sNombre);
                                        pstatement.setString(2, sApellidos);
                                        pstatement.setString(3, sDni);
                                        pstatement.setInt(4, Integer.parseInt(sSexo));
                                        pstatement.setString(5, sDireccion);
                                        pstatement.setString(6, sTelefono);
                                        pstatement.setString(7, sId);
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
                                String nApellidos = request.getParameter("apellidos");
                                String nDni = request.getParameter("dni");
                                String nSexo = request.getParameter("sexo");
                                String nDireccion = request.getParameter("direccion");
                                String nTelefono = request.getParameter("telefono");
                                if(nNombre != null && nApellidos != null && nDni != null && nSexo != null && nDireccion != null && nTelefono != null){
                                    if(nNombre != "" && nApellidos != "" && nDni != "" && nSexo != "" && nDireccion != "" && nTelefono != ""){
                                        String queryString = "INSERT INTO dueno "
                                                + "(nombre, apellidos, dni, sexo, direccion, telefono) VALUES "
                                                + "(?,?,?,?,?,?)";
                                        pstatement = conexion.prepareStatement(queryString);
                                        pstatement.setString(1, nNombre);
                                        pstatement.setString(2,nApellidos);
                                        pstatement.setString(3, nDni);
                                        pstatement.setInt(4, Integer.parseInt(nSexo));
                                        pstatement.setString(5, nDireccion);
                                        pstatement.setString(6, nTelefono);
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
                                        String queryString = "DELETE FROM dueno WHERE id_dueno = ? LIMIT 1";
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
        ResultSet listado = s.executeQuery ("SELECT id_dueno,nombre,apellidos,dni,sexo,direccion,telefono "
                + "FROM dueno ORDER BY id_dueno desc");
        
        Map<Integer, String> sexoMap = new HashMap<Integer, String>();
        sexoMap.put(1, "Hombre");
        sexoMap.put(2, "Mujer");
        %>
        <table class="table-edition">
            <tr>
                <th>ID</th>
                <th>Nombre</th>
                <th>Apellidos</th>
                <th>DNI</th>
                <th>Sexo</th>
                <th>Dirección</th>
                <th>Teléfono</th>
            </tr>
            <!-- INSERTAR NUEVO -->
            <tr>
                <form method='post' action=''>
                    <td>Auto</td>
                    <td><input name='nombre' type='text' value='' required/></td>
                    <td><input name='apellidos' type='text' value='' required/></td>
                    <td><input name='dni' type='text' value='' required/></td>
                    <td><% out.println(createSelect(sexoMap,0,"sexo"));%></td>
                    <td><textarea name='direccion' required></textarea></td>
                    <td><input name='telefono' type='text' value='' required/></td>
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
            out.println("<tr class='row_editable masc-id-"+listado.getString("id_dueno")+"'>");
            out.println("<form method='post' action=''>");
            out.println("<td>"+listado.getString("id_dueno")+"<input name='id' type='hidden' value='"+listado.getString("id_dueno")+"' required/></td>");
            out.println("<td><span>"+listado.getString("nombre")+"</span><input name='nombre' type='text' value='"+listado.getString("nombre")+"' required/></td>");
            out.println("<td><span>"+listado.getString("apellidos")+"</span><input name='apellidos' type='text' value='"+listado.getString("apellidos")+"' required/></td>");
            out.println("<td><span>"+listado.getString("dni")+"</span><input name='dni' type='text' value='"+listado.getString("dni")+"' required/></td>");
            out.println("<td><span>"+sexoMap.get(listado.getInt("sexo"))+"</span>"+createSelect(sexoMap,listado.getInt("sexo"),"sexo")+"</td>");
            out.println("<td><span>"+listado.getString("direccion")+"</span><textarea name='direccion' required>"+listado.getString("direccion")+"</textarea></td>");
            out.println("<td><span>"+listado.getString("telefono")+"</span><input name='telefono' type='text' value='"+listado.getString("telefono")+"' required/></td>");
            %>
    <td>
        <input type="hidden" value="1" name="changeRow"/>
        <input class="edit-btn" type="button" onClick='changeField(<%=listado.getString("id_dueno")%>)' value="Editar">
        <input class="save-edit-btn" type="submit" value="Guardar">
    </td>
    </form>
    <td>
        <form method='post' action=''>
            <input type="hidden" value="<%out.println(listado.getString("id_dueno"));%>" name="id"/>
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