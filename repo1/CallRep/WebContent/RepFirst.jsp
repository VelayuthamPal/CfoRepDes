<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" import="java.sql.*"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
<style>
table, th, td {
    
    border-collapse: collapse;
}
th, td {
    padding: 15px;
}
</style>
</head>
<body>
<% Connection con; %>
<%
try
{
Class.forName("oracle.jdbc.driver.OracleDriver");
con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl", "scott", "tiger");
System.out.println("Connection established");

Statement st=con.createStatement();
ResultSet rs=st.executeQuery("SELECT * FROM DTLIST");
%>
<div class="records">
<table id="tb">
<tr><th>Account Number</th>
	<th>Days Elapsed</th>
	<th>Promise Days</th>
	<th>Due Amount</th>
	<th>Status</th>
	<th>Flag</th>
	<th>Action</th></tr>
	<tr>
	

<% while(rs.next())
{%>
	<td><%= rs.getInt(1) %></td>
	<td><%= rs.getInt(2) %></td>
	<td><%= rs.getInt(3) %></td>
	<td><%= rs.getInt(4) %></td>
	<td><%= rs.getInt(5) %></td>
	<td><%= rs.getString(6) %></td>
	<td>
	<form id="formsub" action="RepFirst" method="get">
	<input type="hidden" id="accountNumber" name="accountNumber" value='<%=rs.getInt(1) %>'/>
	<input type="submit" value="Send Mail"/>
	</form>
	</td></tr>
<%}
}catch (ClassNotFoundException e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
	
} catch (SQLException e) {
	// TODO Auto-generated catch block
	e.printStackTrace();
}%>

</table>
</div>
</body>
</html>