

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<sql:setDataSource var="dataSource" driver="com.microsoft.sqlserver.jdbc.SQLServerDriver" url="jdbc:sqlserver://localhost:1433;databaseName=MAINGENIUSDBS" user="SEM2" password="sem2"/>


<!--GETTING OUR ID PARAMETER FROM OUR INDEX PAGE....-->
            <%
                String Id = request.getParameter("Id");
            %>

            <!--USING THE SQL CORE TAG TO SELECT FROM OUR ID PARAMETER...-->
            <sql:update var="ids" dataSource="${dataSource}">
                DELETE FROM StudentDetails WHERE Id =<%=Id%>;
            </sql:update>>
               
                
                <%
                    RequestDispatcher requestDispatcher = getServletContext().getRequestDispatcher("/index.jsp");
                    requestDispatcher.include(request, response);
                %>
