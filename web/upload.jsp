<%-- 
    Document   : upload.jsp
    Created on : 9 nov. 2022, 16:54:31
    Author     : Samuel
--%>

<%@page import="org.apache.tomcat.util.http.fileupload.servlet.ServletRequestContext"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Iterator"%>
<%@page import="org.apache.tomcat.util.http.fileupload.FileItem"%>
<%@page import="org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload"%>
<%@page import="org.apache.tomcat.util.http.fileupload.disk.DiskFileItemFactory"%>
<%@page import="java.io.File"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            File file;
            String filePath = "C:/Users/Samuel/Documents/NetBeansProjects/JSP-JDBC/img/";
            ServletFileUpload upload = new ServletFileUpload(new DiskFileItemFactory());

            List fileItems = upload.parseRequest(new ServletRequestContext(request));
            Iterator i = fileItems.iterator();
            while (i.hasNext()) {
                FileItem fi = (FileItem)i.next();
                if (!fi.isFormField()) {
                    String fileName = fi.getName();
                    file = new File(filePath + "fotoServidor.jpg");
                    fi.write(file);
                    out.println("Uploaded Filename: " + filePath + fileName + "<br>");
                }
            }
        %>
    </body>
</html>
