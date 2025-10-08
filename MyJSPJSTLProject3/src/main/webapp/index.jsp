<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"  isELIgnored="false"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert Employee Record</title>
<style>
  body {
    font-family: 'Segoe UI', Tahoma, sans-serif;
    background: #f4f7fb;
    margin: 0;
    padding: 20px;
  }

  h2, h3 {
    color: #2c3e50;
    border-bottom: 2px solid #3498db;
    padding-bottom: 5px;
    margin-top: 40px;
  }

  form {
    background: #fff;
    padding: 20px 25px;
    margin-bottom: 30px;
    border-radius: 12px;
    box-shadow: 0px 2px 8px rgba(0,0,0,0.1);
  }

  label {
    display: inline-block;
    width: 150px;
    margin-bottom: 10px;
    font-weight: bold;
    color: #34495e;
  }

  input[type="text"],
  input[type="number"],
  input[type="date"],
  select {
    padding: 8px;
    width: 250px;
    border: 1px solid #ccc;
    border-radius: 6px;
    font-size: 14px;
    transition: all 0.2s;
  }

  input[type="text"]:focus,
  input[type="number"]:focus,
  input[type="date"]:focus,
  select:focus {
    border-color: #3498db;
    outline: none;
    box-shadow: 0px 0px 5px rgba(52, 152, 219, 0.5);
  }

  .form-section {
    margin-bottom: 20px;
  }

  button, input[type="submit"] {
    background: #3498db;
    color: #fff;
    padding: 10px 20px;
    border: none;
    border-radius: 6px;
    cursor: pointer;
    font-size: 15px;
    margin-top: 10px;
    transition: background 0.3s;
  }

  button:hover, input[type="submit"]:hover {
    background: #2980b9;
  }

  select {
    width: 80px;
  }

  .container {
    max-width: 700px;
    margin: auto;
  }

  .section-title {
    font-size: 1.5rem;
    margin-bottom: 10px;
  }

  input[type="checkbox"] {
    margin-right: 5px;
  }

  .field-group {
    margin-bottom: 15px;
  }
  .p {
  fontweight: bold;
  }
  
  /* --- Update Record Section --- */
.update-form {
  background: #fff;
  padding: 25px 30px;
  max-width: 650px;
  margin: 20px auto;
  border-radius: 12px;
  box-shadow: 0 2px 8px rgba(0,0,0,0.1);
}

.update-form select {
  width: 100px;
  padding: 8px;
  margin-bottom: 20px;
  border-radius: 6px;
  border: 1px solid #ccc;
}

.update-form fieldset {
  border: none;
  padding: 0;
  margin: 0;
  display: grid;
  grid-template-columns: 180px 1fr;
  row-gap: 15px;
  column-gap: 10px;
  align-items: center;
}

.update-form label {
  font-weight: 600;
  color: #34495e;
}

.update-form input[type="text"],
.update-form input[type="number"],
.update-form input[type="datetime-local"] {
  width: 100%;
  padding: 8px;
  border: 1px solid #ccc;
  border-radius: 6px;
  font-size: 14px;
}

.update-form input[type="checkbox"] {
  margin-right: 6px;
}

.update-form input[type="submit"] {
  grid-column: 1 / -1;
  justify-self: start;
  background: #3498db;
  color: #fff;
  padding: 10px 20px;
  border: none;
  border-radius: 6px;
  cursor: pointer;
  font-size: 15px;
  transition: background 0.3s;
}

.update-form input[type="submit"]:hover {
  background: #2980b9;
}
  
  

</style>
</head>
<body>

<h2>Insert New Employee</h2>

<form action="welcome.jsp" method="GET">
<fieldset>
<legend>Enter Employee Details:</legend>

<label>First Name:</label>
<input type="text" name="FirstName" required><br><br>

<label>Last Name:</label>
<input type="text" name="LastName" required><br><br>

<label>Age:</label>
<input type="number" name="Age" required><br><br>

<label>Phone Number:</label>
<input type="text" name="PhoneNumber" required><br><br>

<label>Join Date:</label>
<input type="date" name="join_date" required><br><br>

<input type="submit" value="Insert Record">
</fieldset>
</form>
<h2>Update Record form</h2>
<sql:setDataSource var="myDB" driver="com.mysql.cj.jdbc.Driver" 
    url="jdbc:mysql://localhost:3306/my_schema" 
    user="root" password="Prethi@123" />
    <sql:query dataSource="${myDB}" var="myIds">
    
    select id from Employees12
    </sql:query>
<form action="UpdateEmployees.jsp" method="POST">
<select name="id" >

<c:forEach var="myId" items="${myIds.rows}">
<option value="${myId.id}">${myId.id}</option>

</c:forEach>
</select>
<fieldset>
<label>Field:</label><input type="checkbox" name="myField" value="FirstName">FirstName<label>Value :</label><input type="text" name="FirstNameInput"><br>
<label>Field:</label><input type="checkbox" name="myField" value="LastName">LastName<label>Value :</label><input type="text" name="LastNameInput"><br>
<label>Field:</label><input type="checkbox" name="myField" value="Age">Age<label>Value :</label><input type="text" name="AgeInput"><br>
<label>Field:</label><input type="checkbox" name="myField" value="PhoneNumber">PhoneNumber<label>Value :</label><input type="text" name="PhoneNumberInput"><br>
<label>Field:</label><input type="checkbox" name="myField" value="join_date">join_date<label>Value :</label><input type="datetime-Local" name="join_dateInput"><br>
<input type="submit" value="submit">

</fieldset>
</form>

<h2>Delete Record</h2>
<sql:setDataSource var="myDB" driver="com.mysql.cj.jdbc.Driver" 
    url="jdbc:mysql://localhost:3306/my_schema" 
    user="root" password="Prethi@123" />
<sql:query dataSource="${myDB}" var="myIds">
    SELECT id FROM Employees12
</sql:query>

<form action="delete employee.jsp" method="POST">
<select name="empId" >
<c:forEach var="myId" items="${myIds.rows}">
<option value="${myId.id}">${myId.id}</option>
</c:forEach>
</select>

<input type="submit" value="delete Record">

</form>

</form>

<form action="listusers.jsp" method="GET">
<h2>Get Data</h2>
<input type="submit" value="submit">

</form>


</body>
</html>
