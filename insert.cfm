<!DOCTYPE html>
<cfset foo=cgi.auth_user>
    <!-- remove the IE\ or the ie\ from the beginning of the username-->
<cfset username=Mid(foo, 4, Len(foo))>
<cfparam name="form.studentName" default="">
<cfparam name="form.manager" default="">
<cfparam name="form.partner" default="">
<cfparam name="form.department" default="">
<cfparam name="form.start_date" default="0000-00-00">
<cfparam name="form.end_date" default="0000-00-00">
<cfparam name="form.strives_rating" default="">
<cfparam name="form.collaboration_rating" default="">
<cfparam name="form.impact_rating" default="">
<cfparam name="form.curiosity_rating" default="">
<cfparam name="form.judgement_rating" default="">
<cfparam name="form.strength_weakness" default="">
<cfparam name="form.motivation" default="">
<cfparam name="form.recommendation" default="">
<cfparam name="form.offerType" default="">
    


<!--- set the name of the table to a variable --->
<cfset #tblname# = 'student_conversion'>
    
    <cfquery datasource="Viperpeople" name="details" debug="yes" dbtype="ODBC">
        SELECT * 
        FROM people 
        WHERE cn LIKE '#username#';
    </cfquery>
    
    <cfquery datasource="Viperpeople" name="qpartnerDetails" debug="yes" dbtype="ODBC">
                SELECT sn, givenname, title, description, employeeID, mail 
                FROM people 
                WHERE employeeID = '#form.partner#';
    </cfquery>     

    
    <cfquery datasource="Viperpeople" name="qstudentDetails" debug="yes" dbtype="ODBC">
                SELECT sn, givenname, title, description, employeeID, mail 
                FROM people 
                WHERE employeeID = '#form.studentName#';
    </cfquery>

    
    <cfquery datasource="Viperpeople" name="qRecommendPartner" debug="yes" dbtype="ODBC">
                SELECT *
                FROM people
                WHERE employeeID = '#form.partnerRecommend#';
    </cfquery>
    
    
    
        <head>

          <meta http-equiv="X-UA-Compatible" content="IE=edge" />
          <meta name="viewport" content="width=device-width, initial-scale=1">
          <meta name="description" content="">
          <meta name="author" content="">
  
          <title>Student Conversion</title>
          <!-- Bootstrap Core CSS -->
          <link rel="stylesheet" type="text/css" href="http://www.kpmg.ie/global/css/bootstrap.min.css">
          <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
          <script type="text/javascript" src="http://www.kpmg.ie/global/js/jquery.min.js"></script>
          <script type="text/javascript" src="http://www.kpmg.ie/global/js/bootstrap.min.js"></script>
          <link href="css/stylesheet.css" rel="stylesheet" type="text/css">
            <link rel="stylesheet" type="text/css" href="/global/css/font-awesome.css" />

        </head>    
        <CFQUERY datasource="surveys" name="studentConversion" debug="yes" dbtype="ODBC">
        INSERT INTO #tblname#
        (
        studentName,
        manager,
        partner,
        department,
        start_date,
        end_date,
        strives_rating,
        collaboration_rating,
        impact_rating,
        curiosity_rating,
        judgement_rating,
        strength_weakness,
        motivation,
        recommendation,
        offerType
        )

        VALUES
        (
        <cfqueryparam value="#studentName#" cfsqltype="cf_sql_varchar">,
        <cfqueryparam value="#manager#" cfsqltype="cf_sql_varchar">,
        <cfqueryparam value="#partner#" cfsqltype="cf_sql_varchar">,
        <cfqueryparam value="#department#" cfsqltype="cf_sql_varchar">,
        <cfqueryparam value="#start_date#" cfsqltype="cf_sql_timestamp">,
        <cfqueryparam value="#end_date#" cfsqltype="cf_sql_timestamp">,
        <cfqueryparam value="#strives_rating#" cfsqltype="cf_sql_varchar">,
        <cfqueryparam value="#collaboration_rating#" cfsqltype="cf_sql_varchar">,
        <cfqueryparam value="#impact_rating#" cfsqltype="cf_sql_varchar">,
        <cfqueryparam value="#curiosity_rating#" cfsqltype="cf_sql_varchar">,
        <cfqueryparam value="#judgement_rating#" cfsqltype="cf_sql_varchar">,
        '#strength_weakness#',
        '#motivation#',
        <cfqueryparam value="#recommendation#" cfsqltype="cf_sql_varchar">,
        <cfqueryparam value="#offerType#" cfsqltype="cf_sql_varchar">

        )
        </CFQUERY>
            
            <cfif #form.recommendation# EQ 'offerRole'>
                <cfmail from="graduaterecruitment@kpmg.ie" to="christopher.hanna@kpmg.ie" subject="Student Conversion" server="10.128.93.172" port="25" type="text/html">
                    <body>
                        <div style="font-family: Arial, Helvetica, sans-serif; font-size: 14px">
                            <p>Dear <b>#qpartnerDetails.givenname#</b></p>
                            <p>Please see below for the details of the placement/intern that <b>#form.manager#</b> has requested you have a look at:</p>
                            <hr>
                            <h3>Details</h3>
                            <p><b>Employee name:</b> <a href="mailto:#qstudentDetails.mail#">#qstudentDetails.givenname# #qstudentDetails.sn#</a> </p>
                            <p><b>Start date:</b> #form.start_date#</p>
                            <p><b>End date:</b> #form.end_date#</p>
                            <p><b>Type: </b> #form.offerType#</p>
                            <hr>
                            <p>Please select whether you accept the placement:</p>
                            <p><a href="http://eolas.ie.kworld.kpmg.com/internal_surveys/hr/2017/student-conversion/offerIndex.cfm?employeeID=#qstudentDetails.employeeID#&accept=true&type=#form.offerType#">Accept</a></p>
                            <p><a href="http://eolas.ie.kworld.kpmg.com/internal_surveys/hr/2017/student-conversion/offerIndex.cfm?employeeID=#qstudentDetails.employeeID#&accept=false&type=#form.offerType#">Decline</a></p>
                        </div>
                    </body>
                </cfmail>
            </cfif>
            
            <cfif #form.recommendation# EQ 'doNotOfferRole'>
                <CFQUERY datasource="surveys" name="studentConversion" debug="yes" dbtype="ODBC">
                    INSERT INTO student_conversion_reject
                    (
                    studentName,
                    manager,
                    partner,
                    department
                    )

                    VALUES
                    (

                    '#EncodeForHTML(qstudentDetails.givenname)# #EncodeForHTML(qstudentDetails.sn)#',
                    '#EncodeForHTML(manager)#',
                    '#EncodeForHTML(qpartnerDetails.givenname)# #EncodeForHTML(qpartnerDetails.sn)#',
                    '#EncodeForHTML(department)#'

                    )
                </CFQUERY>
            </cfif>
            
            <cfif #form.recommendation# EQ 'anotherGroup'>
                <cfmail from="graduaterecruitment@kpmg.ie" to="christopher.hanna@kpmg.ie" subject="Student Conversion" server="10.128.93.172" port="25" type="text/html">
                    <body>
                        <div style="font-family: Arial, Helvetica, sans-serif; font-size: 14px">
                            <p>Dear <b>#qRecommendPartner.givenname#</b></p>
                            <p>Please see below for the details of the placement/intern that <b>#form.manager#</b> has requested you have a look at:</p>
                            <hr>
                            <h3>Details</h3>
                            <p><b>Employee name:</b> #qstudentDetails.givenname# #qstudentDetails.sn# </p>
                            <p><b>Start date:</b> #form.start_date#</p>
                            <p><b>End date:</b> #form.end_date#</p>
                            <p><b>Type: </b> #form.offerType#</p>
                            <p><b>Other notes: </b> #form.otherNotes#</p>
                            <hr>
                            <p>Please select whether you accept the placement:</p>
                            <p><a href="http://eolas.ie.kworld.kpmg.com/internal_surveys/hr/2017/student-conversion/offerIndex.cfm?employeeID=#qstudentDetails.employeeID#&accept=true&type=#form.offerType#">Accept</a></p>
                            <p><a href="http://eolas.ie.kworld.kpmg.com/internal_surveys/hr/2017/student-conversion/offerIndex.cfm?employeeID=#qstudentDetails.employeeID#&accept=false&type=#form.offerType#">Decline</a></p>
                        </div>
                    </body>
                </cfmail>
            </cfif>
            
            <cfif #form.recommendation# EQ 'interviewMilkround'>
                <CFQUERY datasource="surveys" name="studentConversion" debug="yes" dbtype="ODBC">
                    INSERT INTO student_conversion_milkround
                    (
                    studentName,
                    manager,
                    partner,
                    department
                    )

                    VALUES
                    (

                    '#EncodeForHTML(qstudentDetails.givenname)# #EncodeForHTML(qstudentDetails.sn)#',
                    '#EncodeForHTML(manager)#',
                    '#EncodeForHTML(qpartnerDetails.givenname)# #EncodeForHTML(qpartnerDetails.sn)#',
                    '#EncodeForHTML(department)#'

                    )
                </CFQUERY>
            </cfif>
        <body>
            <nav class="navbar navbar-default navbar-fixed-top" role="navigation" style="background-color:#FAFCFB"> 

                <div class="container-fluid">
                        <div class="navbar-header">
                            <a href="index.cfm"><img src="images/KPMG-logo.png" class="pull-left"/></a><span class="navbar-brand">&nbsp;&nbsp;Student Conversion</span>
                        </div>
                        <div class="navbar-text pull-right nav-username" id="userdetails">
                            <i class="fa fa-user-circle" aria-hidden="true"></i> <cfoutput>#details.givenname# #details.sn#</cfoutput>
                        </div>
                </div>
                </nav>

            <!-- Page Content -->
            <div class="container">

                <form action="insert.cfm" method="post" id="gradform" name="gradform" onSubmit="return validateForm(this)">
                    <div id="firstSection">
                        <!-- Page Header -->
                        <div class="row">
                            <div class="col-lg-12">
                                <h1 class="page-header">Student Conversion
                                    <small>to Graduate</small>
                                </h1>
                            </div>
                        </div>
                        <!-- /.row -->
                        <!-- Projects Row -->
                        <div class="row">
                            <div class="form-group col-xs-12 text-center">
                                <h5>Thank for you completing the form</h5>
                            </div>
                        </div>

                        <!-- /.row -->
                        <hr>
                    </div>
                </form>
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
