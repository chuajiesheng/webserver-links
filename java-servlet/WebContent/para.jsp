<%@ page language="java" contentType="text/html; charset=US-ASCII"
    pageEncoding="US-ASCII"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=US-ASCII">
<title>parameter</title>
</head>
<body>

        <p>
            <a href="hello.jsp">hello</a>
        </p>
        <p>
            <a href="world.jsp">world</a>
        </p>
        <p>
            <strong><%= request.getParameter("input") %></strong>
        </p>
</body>
</html>