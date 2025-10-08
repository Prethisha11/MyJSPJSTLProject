<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*" isELIgnored="false"%>
    <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<H1>The following are the registered leagues:</H1>


<%ArrayList<String> myLeagues=(ArrayList<String>)application.getAttribute("myLeagues");
%>

<c:set var="myLeagues" value="<%=myLeagues%>"></c:set>

<ul>
<c:forEach items="${myLeagues}" var="leagues">

<li>${leagues}</li>


</c:forEach>
</ul>



</body>
</html>