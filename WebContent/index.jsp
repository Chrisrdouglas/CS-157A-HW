<%@ page import="java.sql.*" %>
<html>
	<head>
		<title>JDBC Connection example</title>
	</head>
	<body>
		<h1>JDBC Connection example</h1>
			<%
				String db = "cs157a"; //or root
				String user = "root"; //assumes database name is the same as username
				String ret = "";
				String table = "<table border = \"4\" cellpadding = \"2\" width = \"100%\" ><tr><th>Name</th><th>Employee ID</th><th>Age</th></tr>";
				try {
					java.sql.Connection con;
					Class.forName("org.gjt.mm.mysql.Driver");
					con = DriverManager.getConnection("jdbc:mysql://localhost/"+db, user, "Douglass410");
					out.println ("<p>"+db+ "database successfully opened.</p>");
					ResultSet rs = con.createStatement().executeQuery("select * from emp");
					while(rs.next())
					{
						String name = rs.getString(2);
						int id = rs.getInt(1);
						int age = rs.getInt(3);
						ret += ("<p>"+name+"'s Employee ID is " + id + ". His age is "+ age+ ".\n</p>");
						table += "<tr><td>" + name + "</td><td>" + id + "</td><td>" + age + "</td></tr>";
					}
					}
				catch(SQLException e) {
					out.println("SQLException caught: " +e.getMessage());
					}
				out.print(ret);
				out.print(table);
			%>
	</body>
</html>