<%-- 
    Document   : insertUser.jsp
    Created on : 23 nov. 2022, 18:18:56
    Author     : Samuel
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Create user</title>
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
            Statement statement2 = connection.createStatement();
            ResultSet resultSet = statement.executeQuery("select * from users where Email = '" + txtEmail + "'");

            if (resultSet.next()) {
                out.println("<script type='text/javascript'>alert('User already created');</script>");
            } else {
                String sql = "insert into users (Id, Name, LastName, Phone, Email, Address) "
                        + "values (" + txtIdn + ", '" + txtName + "', '" + txtLastName + "', " + txtPhone + ", '" + txtEmail + "', '" + txtAddress + "')";

                statement2.executeUpdate(sql);

                out.println("<script type='text/javascript'>alert('User created');</script>");
            }

            RequestDispatcher rd = request.getRequestDispatcher("/users.jsp");
            rd.include(request, response);
        %>
    </body>
</html>
