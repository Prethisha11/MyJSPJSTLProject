<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,java.sql.*, java.sql.*,java.io.*, java.text.*,mydata.*" isELIgnored="false"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>



<h2>List of Users</h2>
<table border="1" cellpadding="5" cellspacing="0">
    <tr>
        <th>ID</th>
        <th>First Name</th>
        <th>Last Name</th>
        <th>age</th>
        <th>phone_number</th>
        <th>date</th>
    </tr>
    
  <%GetData g=(GetData)application.getAttribute("myResults");
  ResultSet rs=g.returnResultSet();
   while(rs.next())
   {
  
   %>
    
   <tr>
            <td><%=rs.getInt(1)%></td>
            <td><%=rs.getString(2)%></td>
            <td><%=rs.getString(3)%></td>
            <td><%=rs.getInt(4) %></td>
            <td><%=rs.getString(5) %></td>
            <td><%=rs.getDate(6)%></td>
        </tr>
   <% }%>  
</table>



<style>
    body {
        font-family: Arial, sans-serif;
        background: #f4f7fa;
        margin: 0;
        padding: 20px;
    }

    h2 {
        text-align: center;
        margin-bottom: 20px;
        color: #333;
    }

    table {
        width: 90%;
        margin: auto;
        border-collapse: collapse;
        background: #fff;
        box-shadow: 0px 4px 10px rgba(0,0,0,0.1);
        border-radius: 10px;
        overflow: hidden;
    }

    th, td {
        padding: 12px 15px;
        text-align: center;
    }

    th {
        background: #007BFF;
        color: #fff;
        text-transform: uppercase;
        font-size: 14px;
    }

    tr:nth-child(even) {
        background: #f9f9f9;
    }

    tr:hover {
        background: #e6f2ff;
    }

    td {
        color: #555;
    }
</style>

</body>
</html>