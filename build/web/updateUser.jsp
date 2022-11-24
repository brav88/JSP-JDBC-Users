<%-- 
    Document   : updateUser.jsp
    Created on : 23 nov. 2022, 19:07:26
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
            int txtIdn = Integer.parseInt(request.getParameter("txtId"));
            String txtName = request.getParameter("txtName");
            String txtLastName = request.getParameter("txtLastName");
            int txtPhone = Integer.parseInt(request.getParameter("txtPhone"));
            String txtEmail = request.getParameter("txtEmail");
            String txtAddress = request.getParameter("txtAddress");
        %>

        <%
            Class.forName("com.mysql.cj.jdbc.Driver");
            Connection connection = DriverManager.getConnection("jdbc:mysql://localhost/WebUsers", "root", "Admin$1234");
            Statement statement = connection.createStatement();

            String sql = "update users set Name = '" + txtName + 
                         "', LastName = '" + txtLastName + 
                         "', Phone = " + txtPhone + 
                         ", Email = '" + txtEmail + 
                         "', Address = '" + txtAddress + "'" +
                         " where id = " + txtIdn;

            statement.executeUpdate(sql);

            out.println("<script type='text/javascript'>alert('User updated');</script>");

            RequestDispatcher rd = request.getRequestDispatcher("/users.jsp");
            rd.include(request, response);
        %>
    </body>
</html>
