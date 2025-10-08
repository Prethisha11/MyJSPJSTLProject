<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="java.util.*,java.text.*" isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
    
    String myIdStr = request.getParameter("id");
    String[] myFieldArray = request.getParameterValues("myField");
    String myUpdateQuery = "UPDATE Employees12 SET ";
    int myKey = Integer.parseInt(myIdStr);

    if(myIdStr != null && myFieldArray != null) {
      
        
        for(int i=0;i<myFieldArray.length;i++){
            if(i<myFieldArray.length-1){
                myUpdateQuery += myFieldArray[i] + "=?,";
            } else {
                myUpdateQuery += myFieldArray[i] + "=? WHERE id=?";
            }
        }
    }
%>

<c:set var="myQuery" value="<%=myUpdateQuery%>"/>
<c:set var="myKey" value="<%=myKey%>"/>

<sql:setDataSource var="myDB" driver="com.mysql.cj.jdbc.Driver" 
    url="jdbc:mysql://localhost:3306/my_schema" 
    user="root" password="Prethi@123"/>

<sql:update dataSource="${myDB}" var="count">
${myQuery}
<%
        for(int k=0;k<myFieldArray.length;k++){
            String fieldName = myFieldArray[k] + "Input";
            String fieldValue = request.getParameter(fieldName);

            if(myFieldArray[k].equals("Age")){
                int ageValue = Integer.parseInt(fieldValue);
%>
<sql:param value="<%=ageValue%>"/>
<%
            } else if(myFieldArray[k].equals("join_date")){
                SimpleDateFormat s = new SimpleDateFormat("yyyy-MM-dd'T'HH:mm");
                Date joinDateUpdate = null;
                try{
                    joinDateUpdate = s.parse(fieldValue);
                } catch(ParseException pe){
                    pe.printStackTrace();
                }
                SimpleDateFormat dbFormat = new SimpleDateFormat("yyyy-MM-dd");
%>
<sql:param value="<%=dbFormat.format(joinDateUpdate)%>"/>
<%
            } else {
%>
<sql:param value="<%=fieldValue%>"/>
<%
            }
        }
%>
<sql:param value="${myKey}"/>
</sql:update>

<div id="output">
<H1>Record updated Successfully</H1>
<button onclick="history.back()">Go Back</button>
</div>


</body>
</html>