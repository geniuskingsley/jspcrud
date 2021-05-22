<%-- 
    Document   : index
    Created on : May 21, 2021, 2:15:11 PM
    Author     : Genius
--%>

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


        <h1 class="h1 text-center display-5 p-3 mb-2 bg-secondary text-white font-weight-bold">GENIUS REGISTRATION SYSTEM
        </h1>

        <br>

        <div class="row container">


            <!-- FORM -->
            <div class="col-sm-4">

                <form action="InsertServlet" method="post">

                    <!-- STUDENT NAME -->
                    <div alight="left">
                        <label class="form-label font-weight-bold" for="sname">STUDENT NAME</label>
                        <input required type="text" class="form-control" placeholder="Student Name" name="Names" id="sname">
                    </div>

                    <!-- STUDENT COURSE -->
                    <div alight="left">
                        <label class="form-label font-weight-bold" for="course">COURSE</label>
                        <input required type="text" class="form-control" placeholder="Course" name="Courses" id="course">
                    </div>

                    <!-- STUDENT AGE -->
                    <div alight="left">
                        <label class="form-label font-weight-bold" for="age">AGE</label>
                        <input required type="text" class="form-control" placeholder="Course" name="Ages" id="age">
                    </div>

                    <br>

                    <!-- SUBMIT BUTTON -->
                    <div alight="right">
                        <input class="btn btn-info" id="submit" value="Submit" type="submit">
                        <input class="btn btn-warning" id="reset" value="Reset" type="reset">

                    </div>

                </form>

            </div>
            <!-- END OF FORM -->



            <!-- TABLE  -->
            <div style="padding-left: 150px;" class="col-sm-8">

                <div class="panel-body">

                    <table id="tbl-student" class="table table-responsive table-bordered" cellpadding="0" width="100%">

                        <!-- TABLE HEADING, STATIC -->
                        <thead>
                            <tr>
                                <th>#IDS</th>
                                <th>STUDENT NAMES</th>
                                <th>COURSES</th>
                                <th>AGE'S</th>
                                <th>EDIT</th>
                                <th>DELETE</th>
                            </tr>
 
                            
                            <sql:query var="users" dataSource="${dataSource}">
                                SELECT *FROM StudentDetails;
                            </sql:query>
                                
                                <c:forEach var="row" items="${users.rows}">
                                    
                                    <!-- TABLE DATA -->
                            <tr>

                                <td> <c:out value="${row.Id}"/> </td>
                                <td> <c:out value="${row.Names}" /> </td>
                                <td> <c:out value="${row.Courses}" /> </td>
                                <td> <c:out value="${row.Ages}" /> </td>
                                <td> <a href="update.jsp?Id=${row.Id}">Edit</a> </td>
                                <td> <a href="delete.jsp?Id=${row.Id}">Delete</a> </td>
                            </tr>
                                    
                                </c:forEach>

                    </table>
                    
                    

                </div>

            </div>
            <!-- END OF TABLE -->

        </div>


        <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.1/dist/js/bootstrap.bundle.min.js"
                integrity="sha384-gtEjrD/SeCtmISkJkNUaaKMoLD0//ElJ19smozuHV6z3Iehds+3Ulb9Bn9Plx0x4"
        crossorigin="anonymous"></script>
    </body>

</html>
