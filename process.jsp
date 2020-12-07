<!DOCTYPE HTML>
<html>
<head>
    <title>Processing...</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta http-equiv="Refresh" CONTENT="0;URL= http://localhost:8080/jsp/">
</head>
<body>
        <%@ page contentType="text/html; charset=UTF-8" %>
        <%@ page import="java.sql.*" %>
        <%@ page import="java.sql.ResultSet" %>
        <%@ page import="java.sql.SQLException" %>
        <%@ page import="java.sql.Statement" %>
        <%@ page import="java.sql.Connection" %>
        <%@ page import="java.sql.DriverManager" %>
    <% 
        String strfname = request.getParameter("fname");
        String strlname = request.getParameter("lname");
        String strnote = request.getParameter("note");

        
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn =  DriverManager.getConnection("jdbc:mysql://localhost/guest" + "?user=root&password=");
        Statement stmt = conn.createStatement();

        int i=stmt.executeUpdate("INSERT INTO guest(fname,lname,note)VALUES('"+strfname+"','"+strlname+"','"+strnote+"')");
        out.println("Data is successfully inserted!");
    %>
</body>
