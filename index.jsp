<!DOCTYPE HTML>
<html>
    <head>
        <title>Guest Book</title>
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta charset="utf8">
        <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">

    </head>
    <style>
        body{
            background-image:url("https://cdn5.vectorstock.com/i/1000x1000/40/74/exercise-book-paper-page-with-lines-vector-3674074.jpg");
            /*background-image:linear-gradient(to right,violet,blue,cyan,lightgreen,green);*/
            background-attachment:no-repeat;
            background-position: fixed;
            background-size:cover;
        }
        th{
            align:center;
        }
        h1{
            color:black;
            text-shadow: 2px 2px 2px violet, 4px 4px 4px blue, 6px 6px 6px cyan, 8px 8px 8px lightgreen, 10px 10px 10px green; 
        }
        h2{
            color:black;
        }
        h3{
            color:black;
        }
        h4{
            color:black;
        }
        h5{

        }
        h6{

        }
        h7{
            color:#F1C40F;
            text-shadow: 2px 2px white, 4px 4px black;
        }
        h8{
            color:#3498DB;
            text-shadow: 2px 2px white, 4px 4px black;
        }
        th{
            color:#FFFFFF;
            text-shadow: 2px 2px red, 4px 4px blue;
        }
    </style>
    <body>
        <%@ page contentType="text/html; charset=UTF-8" %>
        <%@ page import="java.sql.*" %>
        <%@ page import="java.sql.ResultSet" %>
        <%@ page import="java.sql.SQLException" %>
        <%@ page import="java.sql.Statement" %>
        <%@ page import="java.sql.Connection" %>
        <%@ page import="java.sql.DriverManager" %>
        <%@ page import="java.util.*" %>
        <%
        Class.forName("com.mysql.jdbc.Driver");
        Connection conn =  DriverManager.getConnection("jdbc:mysql://localhost/guest" + "?user=root&password=");
        Statement stmt = conn.createStatement();
        ResultSet result = stmt.executeQuery("Select * from guest");
        /*int i = stmt.executeUpdate();*/
        %>
        <h1 align="center">Guest Book</h1>
        <div class="container">
        <h2>Full fill your information for save to guestbook </h2>
        <br>
            <div class="col-sm">
            <form action="process.jsp" id="form1" method="POST">
                <label for="fname"><h3>First Name: &nbsp&nbsp&nbsp</h3></label>
                <input type="text" id="fname" name="fname" required><br>
                <label for="lname"><h3>Last Name: &nbsp&nbsp&nbsp&nbsp</h3></label>
                <input type="text" id="lname" name="lname" required><br>
                <label for="note"><h3>Write Note: &nbsp&nbsp&nbsp</h3></label>
                <textarea rows = "2" cols = "60" name="note" placeholder=" Input a memo here"></textarea><br>
                <button type="submit" class="btn btn-success btn-lg" role="button"><h7><b>Save</b></h7></button>
                <button type="reset" class="btn btn-danger btn-lg" role="button"><h8><b>Reset</b></h8></button>
            </form>
            </div>

        <h4>
          <%    
            out.println("<br>");
            out.println("Guest Name List</>");
            out.println("<br>");
            out.println("<br>");
          %>
        <table border="5" width="100%">
            <tr>
                <th bgcolor="black">No.</th>
                <th bgcolor="black">First Name</th>
                <th bgcolor="black">Last Name</th>
                <th bgcolor="black">Note</th>
            </tr>
            <% 
                while(result.next()){
               
            %>
            <tr>
                <td><% out.println(result.getString("id")); %></td>
                <td><% out.println(result.getString("fname")); %></td>
                <td><% out.println(result.getString("lname")); %></td>
                <td><% out.println(result.getString("note")); %></td>
            </tr>
            <% } %>
            <%-- <tr>
                <td style="width:150px"><% while(result.next()){ 
                    out.println(result.getString("id")+"<br>");} 
                    %></td>

                <td style="width:150px"><p><% while(result.next()){ 
                    out.println(result.getString("fname")+"<br>");}
                    %></p></td>

                <td style="width:300px"><% while(result.next()){ 
                    out.println(result.getString("lname")+"<br>");} 
                    %></td>

                <td style="width:600px"><% while(result.next()){ 
                    out.println(result.getString("note")+"<br>");} 
                    %></td>
            </tr> --%>
        </table>
        </h4>
        <!--div class="container">
            <div class="col-md">
                <% 
                    while (result.next()){
                        out.println(result.getString("id")+"<br>");
                    }
                %>
            </div>
            <div class="col-md">
            <%
                while (result.next()){
                    out.println(result.getString("fname")+"<br>");
                }
            %>
            </div>
            <div class="col-md">
            <%
                while (result.next()){
                    out.println(result.getString("lname")+"<br>");
                }
            %>
            <div class="col-md">
                <% 
                while (result.next()){
                    out.println(result.getString("note")+"<br>");
                }
                %>
            </div>
        </div-->
        <% 
        result.close();
        stmt.close();
        conn.close();
        %>
    </body>
</html>