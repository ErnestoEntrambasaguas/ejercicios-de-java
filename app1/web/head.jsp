<%@page import="java.sql.Statement"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%!
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
%>
<%

Class.forName("com.mysql.jdbc.Driver");
Connection conexion = DriverManager.getConnection("jdbc:mysql://localhost/progra","root", "");
        
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Edición de Mascotas</title>
        <link rel="stylesheet" href="css/style.css" />
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/2.2.3/jquery.min.js"></script>
        <script type="application/javascript" src="js/scripts.js"></script>
    
    </head>
    <body>
    <nav>
        <ul>
            <li><a href="index.jsp">Mascotas</a></li>
            <li><a href="edit-animal.jsp">Tipo animal</a></li>
            <li><a href="edit-duenos.jsp">Dueños</a></li>
        </ul>

    </nav>