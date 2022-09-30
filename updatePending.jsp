<%@ page language="java" contentType="text/html"
pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%! String driverName = "com.mysql.jdbc.Driver";%>
<%!String url = "jdbc:mysql://localhost:3306/ecommerce?serverTimezone=UTC";%>
<%!String user = "root";%>
<%!String psw = "0000";%>
<%
String id = request.getParameter("id");
String status=request.getParameter("status");
String decide=request.getParameter("decide");
if(decide =="accept"){
	if(id != null)
	{
		Connection con = null;
		PreparedStatement ps = null;
		int productID = Integer.parseInt(id);
		try
		{
			Class.forName(driverName);
			con = DriverManager.getConnection(url,user,psw);
			String sql="Update products set status='Accepted' where product_id= ?";
			ps = con.prepareStatement(sql);
			ps.setInt(1,productID);
			int i = ps.executeUpdate();
			if(i > 0){
				response.sendRedirect("managePending.jsp");
			}
			else{
				out.print("There is a problem in updating Record.");
			} 
		}
		catch(SQLException sql)
		{
			request.setAttribute("error", sql);
			out.println(sql);
		}
	}
}
else{
	if(id != null)
	{
		Connection con = null;
		PreparedStatement ps = null;
		int productID = Integer.parseInt(id);
		try
		{
			Class.forName(driverName);
			con = DriverManager.getConnection(url,user,psw);
			String sql="Update products set status='Rejected' where product_id= ?";
			ps = con.prepareStatement(sql);
			ps.setInt(1,productID);
			int i = ps.executeUpdate();
			if(i > 0){
				response.sendRedirect("managePending.jsp");
			}
			else{
				out.print("There is a problem in updating Record.");
			} 
		}
		catch(SQLException sql)
		{
			request.setAttribute("error", sql);
			out.println(sql);
		}
	}
	
}
%>