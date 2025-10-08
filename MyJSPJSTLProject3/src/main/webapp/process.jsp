<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" import="sl314.myclasses.*,java.util.*,java.io.*"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<%
ArrayList<String> errorMsgs=new ArrayList<String>();
String yearString=request.getParameter("yearForm");
 
String season=request.getParameter("seasonForm");
String title=request.getParameter("titleForm");

int year=0;
try
{
	year=Integer.parseInt(yearString);
}
catch(NumberFormatException nfe)
{
	errorMsgs.add("Year must be Number");
}

if(season.equals("UNKNOWN"))
{
	errorMsgs.add("Please select a valid season");
}
if(!errorMsgs.isEmpty())
{
 %>
<H1>Please fix the following errors:</H1>
<ul>
<%for(String str:errorMsgs)
{
%>
<li><%=str%></li>
<%}%>
</ul>
<jsp:include page="Index (2).html"></jsp:include>

<%}
else{
     FileWriter fw=null;
     try
     {
	fw=new FileWriter("C:/Users/New/eclipse-workspace/MyJSPJSTLProject7/src/main/webapp/WEB-INF/leagues.txt",true);
	String str=year+","+season+","+title+"\n";
	fw.write(str);
	fw.flush();
			
     }
     catch(IOException ioe)
     {
    	 ioe.printStackTrace();
     }
     finally
     {
    	 try
    	 {
    		 fw.close();
    	 }
    	 catch(IOException ioe)
    	 {
    		 ioe.printStackTrace();
    	 }
     }
	
%>
<jsp:useBean id="league" scope="request" class="sl314.myclasses.League">
<jsp:setProperty name="league" property="year" param="yearForm"></jsp:setProperty>
<jsp:setProperty name="league" property="season" param="seasonForm"></jsp:setProperty>
<jsp:setProperty name="league" property="title" param="titleForm"></jsp:setProperty>
</jsp:useBean>

<jsp:forward page="success.jsp"></jsp:forward>

<%}%>





</body>
</html>