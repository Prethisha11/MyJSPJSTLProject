<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,java.text.*" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Delete employee</title>
</head>
<body>

<%
  
    String myIdStr = request.getParameter("empId");

    
        int myId = Integer.parseInt(myIdStr);
%>


<sql:setDataSource var="myDB" driver="com.mysql.cj.jdbc.Driver" 
    url="jdbc:mysql://localhost:3306/my_schema" 
    user="root" password="Prethi@123"/>
    
<sql:update dataSource="${myDB}" var="count">
    DELETE FROM Employees12 WHERE id = ?
    <sql:param value="<%=myId%>"/>
</sql:update>

<div id="output">
<H1> Record Deleted Successfully</H1>
<button onclick="history.back()">Go Back</button>
</div>
  
</body>
</html>