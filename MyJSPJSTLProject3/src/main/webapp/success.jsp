<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="sl314.myclasses.*" isELIgnored="false"%>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<H1>League Successfully created:</H1>
<jsp:useBean id="league" scope="request" class="sl314.myclasses.League"></jsp:useBean>
<ul>
<li><jsp:getProperty name="league" property="year"></jsp:getProperty></li>
<li><jsp:getProperty name="league" property="season"></jsp:getProperty></li>
<li>${league.title}</li>
</ul>
<%String str="I am example for expression output:"; %>
<c:set var="myString" value="<%=str%>"></c:set>



<c:set var="year" value="${league.year}"></c:set>
<H1>${myString}</H1>


<ul>

<c:if test="${year>2010}">
<li><H2>Year is greater than 2010</H2></li>
</c:if>

<c:if test="${year<=2010}">
<li><H2>Year is lesser than or equal to 2010</H2></li>
</c:if>
</ul>


<ol>
<c:choose>

<c:when test="${year==2005}">

<li><h4>Year is equal to 2005</h4></li>

</c:when>

<c:when test="${year>2005}">

<li><h4>Year is greater than 2005</h4></li>

</c:when>

<c:otherwise>

<li><h4>Year is less than 2005</h4></li>
</c:otherwise>
</c:choose>

<c:forEach var="i" begin="1" end="10">

<li>Item number:<c:out value="${i}"></c:out></li>


</c:forEach>


</ol>





</body>
</html>