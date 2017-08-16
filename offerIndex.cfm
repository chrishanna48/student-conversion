<!DOCTYPE html>
<cfset foo=cgi.auth_user>
    <!-- remove the IE\ or the ie\ from the beginning of the username-->
    <cfset username=Mid(foo, 4, Len(foo))>

        <head>

            <meta http-equiv="X-UA-Compatible" content="IE=edge" />
            <meta name="viewport" content="width=device-width, initial-scale=1">
            <meta name="description" content="">
            <meta name="author" content="">
        

            <cfquery datasource="Viperpeople" name="details" debug="yes" dbtype="ODBC">
                SELECT * FROM 
                people WHERE 
                cn LIKE '#username#'
            </cfquery>

            <cfquery datasource="Viperpeople" name="qStudentDetails" debug="yes" dbtype="ODBC">
                SELECT sn, givenname, title, description, employeeID, mail, telephonenumber
                FROM people 
                WHERE employeeID = '#url.employeeID#'
            </cfquery>

            <cfquery datasource="Viperpeople" name="qStudentNotes" debug="yes" dbtype="ODBC">
                SELECT sn, givenname, title, description, employeeID, mail, telephonenumber
                FROM people 
                WHERE employeeID = '#url.employeeID#'
            </cfquery>
            
            <script>
                var urlParams;
                (window.onpopstate = function () {
                    var match,
                        pl     = /\+/g,  // Regex for replacing addition symbol with a space
                        search = /([^&=]+)=?([^&]*)/g,
                        decode = function (s) { return decodeURIComponent(s.replace(pl, " ")); },
                        query  = window.location.search.substring(1);

                    urlParams = {};
                    while (match = search.exec(query))
                       urlParams[decode(match[1])] = decode(match[2]);
                })();
            </script>
            


            <title>Student Conversion</title>

            <!-- Bootstrap Core CSS -->
            <link rel="stylesheet" type="text/css" href="http://www.kpmg.ie/global/css/bootstrap.min.css">
            <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
            <script type="text/javascript" src="http://www.kpmg.ie/global/js/jquery.min.js"></script>
            <script type="text/javascript" src="http://www.kpmg.ie/global/js/bootstrap.min.js"></script>
            <link href="css/stylesheet.css" rel="stylesheet" type="text/css">


            <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.12.2/css/bootstrap-select.min.css">
            <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.12.2/js/bootstrap-select.min.js"></script>
            <link rel="stylesheet" type="text/css" href="/global/css/font-awesome.css" />
            
            <style>
                .red{
                    color:red;
                    }
                .form-area
                {
                    background-color: #FAFAFA;
                    padding: ;
                    margin: 10px 0px 60px;
                    border: 1px solid GREY;float: none;
                    margin: 0 auto;
                }
            </style>
        </head>

        <body>
            
                <nav class="navbar navbar-default navbar-fixed-top" role="navigation" style="background-color:#FAFCFB"> 

                <div class="container-fluid">
                        <div class="navbar-header">
                            <a href="index.cfm"><img src="images/KPMG-logo.png" class="pull-left"/></a><span class="navbar-brand">&nbsp;&nbsp;Student Conversion</span>
                        </div>
                            <!---Check if user has authenticated successfully, if not then don't attempt to display actions / username on navbar--->
                        <CFIF details.cn NEQ "">
                        <div class="navbar-text pull-right nav-username" id="userdetails">
                            <i class="fa fa-user-circle" aria-hidden="true"></i> <cfoutput>#details.givenname# #details.sn#</cfoutput>
                        </div>
                    </CFIF>
                </div>
                </nav> 
            
            <!-- Page Content -->
            <div class="container">
                    <div id="firstSection">
                         <!-- Page Header -->
                        <div class="row">
                            <div class="col-lg-12">
                                <h1 class="page-header">Student Conversion
                                    <small>to Graduate</small>
                                </h1>
                            </div>
                        </div>
                        <div class="row">
                            <div class="col-xs-12">
                                <cfoutput>
                                    <h4>Thank you <b>#details.givenname# #details.sn# - Partner name</b></h4>
                                </cfoutput>
                            </div>    
                        </div>
                        <cfif #url.accept# EQ "true">
                        <div class="row">
                            <div class="col-xs-12">
                                <p>You have <b>accepted</b> the following student:</p>
                                
                            </div>    
                        </div>
                        <div class="row col-md-5 form-area">
                            <h3 style="margin-bottom: 25px; text-align: center;">Student Details</h3>
                            <div class="form-group">
                                <cfoutput>
                                    <label for="">Student name:</label>
                                    <input type="text" class="form-control" value="#qStudentDetails.givenname# #qStudentDetails.sn#" readonly>
                                </cfoutput>
                            </div>
                            <div class="form-group">
                                <cfoutput>
                                    <label for="">Student email:</label>
                                    <a href="mailto:#qStudentDetails.mail#"><input type="text" class="form-control" value="#qStudentDetails.mail#" readonly></a>
                                </cfoutput>
                            </div>
                            <div class="form-group">
                                <cfoutput>
                                    <label for="">Student title:</label>
                                    <input type="text" class="form-control" value="#qStudentDetails.title#" readonly>
                                </cfoutput>
                            </div>
                            <div class="form-group">
                                <cfoutput>
                                    <label for="">Student telephone number:</label>
                                    <input type="text" class="form-control" value="#qStudentDetails.telephonenumber#" readonly>
                                </cfoutput>
                            </div>
                        </div>
                        <CFQUERY datasource="surveys" name="studentConversion" debug="yes" dbtype="ODBC">
                        INSERT INTO student_conversion_offer_partner
                        (
                        partnerName,
                        partnerDepartment,
                        studentName,
                        email,
                        title,
                        number,
                        type,
                        offerAccepted
                        )

                        VALUES
                        (
                        '#EncodeForHTML(details.givenname)# #EncodeForHTML(details.sn)#',
                        '#EncodeForHTML(details.description)#',
                        '#EncodeForHTML(qStudentDetails.givenname)# #EncodeForHTML(qStudentDetails.sn)#',
                        '#EncodeForHTML(qStudentDetails.mail)#',
                        '#EncodeForHTML(qStudentDetails.title)#',
                        '#EncodeForHTML(qStudentDetails.telephonenumber)#',
                        '#url.type#',
                        '#url.accept#'

                        )
                        </CFQUERY>
                        </cfif>
                        <cfif #url.accept# EQ "false">
                        <div class="row">
                            <div class="col-xs-12">
                                <p>You have <b>declined</b> the following student:</p>
                                
                            </div>    
                        </div>
                        <div class="row col-md-5 form-area">
                            <h3 style="margin-bottom: 25px; text-align: center;">Student Details</h3>
                            <div class="form-group">
                                <cfoutput>
                                    <label for="">Student name:</label>
                                    <input type="text" class="form-control" value="#qStudentDetails.givenname# #qStudentDetails.sn#" readonly>
                                </cfoutput>
                            </div>
                            <div class="form-group">
                                <cfoutput>
                                    <label for="">Student email:</label>
                                    <a href="mailto:#qStudentDetails.mail#"><input type="text" class="form-control" value="#qStudentDetails.mail#" readonly></a>
                                </cfoutput>
                            </div>
                            <div class="form-group">
                                <cfoutput>
                                    <label for="">Student title:</label>
                                    <input type="text" class="form-control" value="#qStudentDetails.title#" readonly>
                                </cfoutput>
                            </div>
                            <div class="form-group">
                                <cfoutput>
                                    <label for="">Student telephone number:</label>
                                    <input type="text" class="form-control" value="#qStudentDetails.telephonenumber#" readonly>
                                </cfoutput>
                            </div>
                        </div>
                        <CFQUERY datasource="surveys" name="studentConversion" debug="yes" dbtype="ODBC">
                        INSERT INTO student_conversion_offer_partner
                        (
                        partnerName,
                        partnerDepartment,
                        studentName,
                        email,
                        title,
                        number,
                        type,
                        offerAccepted
                        )

                        VALUES
                        (
                        '#EncodeForHTML(details.givenname)# #EncodeForHTML(details.sn)#',
                        '#EncodeForHTML(details.description)#',
                        '#EncodeForHTML(qStudentDetails.givenname)# #EncodeForHTML(qStudentDetails.sn)#',
                        '#EncodeForHTML(qStudentDetails.mail)#',
                        '#EncodeForHTML(qStudentDetails.title)#',
                        '#EncodeForHTML(qStudentDetails.telephonenumber)#',
                        '#url.type#',
                        '#url.accept#'

                        )
                        </CFQUERY>
                        </cfif>
                    </div>
                <!-- Footer -->
                <footer>
                    <div class="row">
                        <div class="col-lg-12 text-center">
                            <p style="font-size: 10px;">&copy; 2017 KPMG, an Irish partnership and a member firm of the KPMG network of independent member firms affiliated with KPMG International Cooperative ("KPMG International"), a Swiss entity. All rights reserved. KPMG, the KPMG logo and "cutting through complexity" are registered trademarks of KPMG International. All rights reserved. </p>
                        </div>
                    </div>
                    <!-- /.row -->
                </footer>

            </div>
            <!-- /.container -->
        </body>

        </html>