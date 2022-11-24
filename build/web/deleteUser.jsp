<%-- 
    Document   : deleteUser.jsp
    Created on : 23 nov. 2022, 19:11:49
    Author     : Samuel
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            int txtIdn = Integer.parseInt(request.getParameter("Id"));
        %>

        <%
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection connection = DriverManager.getConnection("jdbc:mysql://localhost/WebUsers", "root", "Admin$1234");
            Statement statement = connection.createStatement();

            String sql = "delete from users where Id = " + txtIdn;

            statement.executeUpdate(sql);

            out.println("<script type='text/javascript'>alert('User deleted');</script>");

            RequestDispatcher rd = request.getRequestDispatcher("/users.jsp");
            rd.include(request, response);
        %>
    </body>
</html>
