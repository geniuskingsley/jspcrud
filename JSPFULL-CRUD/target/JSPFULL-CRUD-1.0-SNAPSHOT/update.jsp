

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@taglib prefix="sql" uri="http://java.sun.com/jsp/jstl/sql" %>
<sql:setDataSource var="dataSource" driver="com.microsoft.sqlserver.jdbc.SQLServerDriver" url="jdbc:sqlserver://localhost:1433;databaseName=MAINGENIUSDBS" user="SEM2" password="sem2"/>

<!DOCTYPE html>
<html lang="en">

    <head>
        <meta charset="UTF-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/css/bootstrap.min.css" rel="stylesheet"
              integrity="sha384-+0n0xVW2eSR5OomGNYDnhzAbDsOXxcvSN1TPprVMTNDbiYZCxYbOOl7+AMvyTG2x" crossorigin="anonymous">
        <title>Document</title>
    </head>

    <body>


        <h1 class="h1 text-center display-5 p-3 mb-2 bg-secondary text-white font-weight-bold">UPDATE DETAILS
        </h1>

        <br>

        <div class="row container">


            <!--GETTING OUR ID PARAMETER FROM OUR INDEX PAGE....-->
            <%
                String Id = request.getParameter("Id");
            %>

            <!--USING THE SQL CORE TAG TO SELECT FROM OUR ID PARAMETER...-->
            <sql:query var="ids" dataSource="${dataSource}">
                SELECT *FROM StudentDetails WHERE Id =<%=Id%>;
            </sql:query>

            <c:forEach var="row" items="${ids.rows}"> 


                <!-- FORM -->
                <div style="padding-left: 400px;" class="col-sm-10" >

                    <!-- IN EACH OF OUR INPUT WE USED THE VALUE
                     ATTRIBUTE TO POPULATE OUR INPUT TEXT FORM...
                    --> 
                    <form action="Update" method="post">
                        
<!--                        HIDDEN FORM FIELD FOR OUR ID-->
                        <input type="hidden" name="ids" value="${row.Id}"> 

                        <!-- STUDENT NAME -->
                        <div alight="left">
                            <label class="form-label font-weight-bold" for="sname">STUDENT NAME</label>
                            <input required type="text" value="${row.Names}" class="form-control" placeholder="Student Name" name="Names" id="sname">
                        </div>

                        <!-- STUDENT COURSE -->
                        <div alight="left">
                            <label class="form-label font-weight-bold" for="course">COURSE</label>
                            <input required type="text" value="${row.Courses}" class="form-control" placeholder="Course" name="Courses" id="course">
                        </div>

                        <!-- STUDENT AGE -->
                        <div alight="left">
                            <label class="form-label font-weight-bold" for="age">AGE</label>
                            <input required type="text" value="${row.Ages}" class="form-control" placeholder="Course" name="Ages" id="age">
                        </div>

                    </c:forEach>


                    <br>

                    <!-- SUBMIT BUTTON -->
                    <div alight="right">
                        <input style="margin-left: 200px;" class="btn btn-info" id="submit" value="Update" type="submit">

                        <a href="index.jsp">Go back</a>

                    </div>

                </form>

            </div>
            <!-- END OF FORM -->
    </body>
</html>
