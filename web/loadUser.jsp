<%-- 
    Document   : loadUser.jsp
    Created on : 23 nov. 2022, 18:56:45
    Author     : Samuel
--%>

<%@page import="java.sql.*"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-Zenh87qX5JnK2Jl0vWa8Ck2rdkQ2Bzep5IDxbcnCeuOxjzrPF/et3URy9Bv1WTRi" crossorigin="anonymous">
        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-OERcA2EqjJCMA+/3y+gxIOqMEjwtxJY7qPCqsdltbNJuaOe923+mo//f6V8Qbsw3" crossorigin="anonymous"></script>
        <title>Update user</title>
    </head>
    <body>
        <%
            int Id = Integer.parseInt(request.getParameter("Id"));
            Connection con = null;
            ResultSet resultset = null;

            try {
                Class.forName("com.mysql.cj.jdbc.Driver");
                con = DriverManager.getConnection("jdbc:mysql://localhost/WebUsers", "root", "Admin$1234");
                Statement statement = con.createStatement();
                resultset = statement.executeQuery("select * from users where Id=" + Id);
                resultset.next();
            } catch (Exception ex) {
                ex.printStackTrace();
            }
        %> 
        <div class="container" style="margin-top:2%">
            <div class="card">
                <div class="card-header">
                    Update user
                </div>
                <div class="card-body">
                    <form action="updateUser.jsp">            
                        <div class="form-floating mb-3">
                            <input value='<%=resultset.getInt("Id")%>' type="text" class="form-control" name="txtId" placeholder="Id" readonly>
                            <label>Id</label>
                        </div>
                        <div class="form-floating mb-3">
                            <input value='<%=resultset.getString("Name")%>' type="text" class="form-control" name="txtName" placeholder="Name">
                            <label>Name</label>
                        </div>
                        <div class="form-floating mb-3">
                            <input value='<%=resultset.getString("LastName")%>' type="text" class="form-control" name="txtLastName" placeholder="Last Name">
                            <label>Last Name</label>
                        </div>
                        <div class="form-floating mb-3">
                            <input value='<%=resultset.getString("Phone")%>' type="number" class="form-control" name="txtPhone" placeholder="Phone">
                            <label>Phone</label>
                        </div>
                        <div class="form-floating mb-3">
                            <input value='<%=resultset.getString("Email")%>' type="email" class="form-control" name="txtEmail" placeholder="Email">
                            <label>Email</label>
                        </div>
                        <div class="form-floating mb-3">
                            <input value='<%=resultset.getString("Address")%>' type="text" class="form-control" name="txtAddress" placeholder="Address">
                            <label>Address</label>
                        </div>
                        <div class="form-floating mb-3">
                            <button type="button" class="btn btn-primary" data-bs-toggle="modal" data-bs-target="#confirmUpdateModal">Update</button>
                            <button type="button" class="btn btn-danger" data-bs-toggle="modal" data-bs-target="#confirmDeleteModal">Delete</button>
                        </div>                          

                        <!-- Modal 1 -->
                        <div class="modal fade" id="confirmDeleteModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                            <div class="modal-dialog modal-dialog-centered">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="staticBackdropLabel">Delete user</h5>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body">
                                        ¿Do you really want to delete <%=resultset.getString("Name")%>?
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">No</button>
                                        <a class="btn btn-danger" href='deleteUser.jsp?Id=<%=resultset.getInt("Id")%>'>Yes, Delete!</a>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <!-- Modal 2 -->
                        <div class="modal fade" id="confirmUpdateModal" data-bs-backdrop="static" data-bs-keyboard="false" tabindex="-1" aria-labelledby="staticBackdropLabel" aria-hidden="true">
                            <div class="modal-dialog modal-dialog-centered">
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <h5 class="modal-title" id="staticBackdropLabel">Update user</h5>
                                        <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                                    </div>
                                    <div class="modal-body">
                                        ¿Do you really want to update <%=resultset.getString("Name")%>?
                                    </div>
                                    <div class="modal-footer">
                                        <button type="button" class="btn btn-secondary" data-bs-dismiss="modal">No</button>
                                        <button type="submit" class="btn btn-primary">Update</button> 
                                    </div>
                                </div>
                            </div>
                        </div>
                    </form>
                </div>
            </div>     
        </div> 
    </body>
</html>
