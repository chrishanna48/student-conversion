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
                SELECT * 
                FROM people 
                WHERE cn LIKE '#username#'
            </cfquery>

            <cfquery datasource="Viperpeople" name="placement" debug="yes" dbtype="ODBC">
                SELECT sn, givenname, title, description, employeeID 
                FROM people 
                WHERE (title LIKE 'Placement' OR title LIKE 'intern') 
                ORDER BY sn
            </cfquery>

            <cfquery datasource="Viperpeople" name="partner" debug="yes" dbtype="ODBC">
                SELECT sn, givenname, title, description, employeeID 
                FROM people 
                WHERE title LIKE 'Partner' 
                ORDER BY sn
            </cfquery>

            <title>Student Conversion</title>

            <!-- Bootstrap Core CSS -->
            <link rel="stylesheet" type="text/css" href="http://www.kpmg.ie/global/css/bootstrap.min.css">
            <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
            <script type="text/javascript" src="http://www.kpmg.ie/global/js/jquery.min.js"></script>
            <script type="text/javascript" src="http://www.kpmg.ie/global/js/bootstrap.min.js"></script>
            <link href="css/stylesheet.css" rel="stylesheet" type="text/css">


            <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.12.2/css/bootstrap-select.min.css">
            <script src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-select/1.12.2/js/bootstrap-select.min.js"></script>
            <script type="text/javascript" src="/global/js/moment.js"></script>
            <script type="text/javascript" src="/global/js/bootstrap-datetimepicker.js"></script>
            <link rel="stylesheet" type="text/css" href="/global/css/bootstrap-datetimepicker.css" />
            <link rel="stylesheet" type="text/css" href="/global/css/font-awesome.css" />
            
            
            <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/1000hz-bootstrap-validator/0.11.9/validator.js"></script>
            <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/1000hz-bootstrap-validator/0.11.9/validator.min.js"></script>

            <script>
                window.onload = function() {
                    $(document).ready(function() {
                        $('.selectpicker').selectpicker({
                            style: 'btn-info',
                            size: 10
                        });
                    });

                    $('#menu-toggle1').click(function() {
                        $(this).find('span').toggleClass('glyphicon-chevron-down').toggleClass('glyphicon-chevron-left');
                    });

                    $('#menu-toggle2').click(function() {
                        $(this).find('span').toggleClass('glyphicon-chevron-down').toggleClass('glyphicon-chevron-left');
                    });

                    $('#menu-toggle3').click(function() {
                        $(this).find('span').toggleClass('glyphicon-chevron-down').toggleClass('glyphicon-chevron-left');
                    });

                    $('#menu-toggle4').click(function() {
                        $(this).find('span').toggleClass('glyphicon-chevron-down').toggleClass('glyphicon-chevron-left');
                    });

                    $('#menu-toggle5').click(function() {
                        $(this).find('span').toggleClass('glyphicon-chevron-down').toggleClass('glyphicon-chevron-left');
                    });

                    $('#menu-toggle6').click(function() {
                        $(this).find('span').toggleClass('glyphicon-chevron-down').toggleClass('glyphicon-chevron-left');
                    });

                    $('#menu-toggle7').click(function() {
                        $(this).find('span').toggleClass('glyphicon-chevron-down').toggleClass('glyphicon-chevron-left');
                    });

                    $("#next").on("click", function() {
                        $("#firstSection").css("display", "none");
                        $("#secondSection").css("display", "");
                        $(window).scrollTop(0);
                    });

                    $("#back").on("click", function() {
                        $("#firstSection").css("display", "");
                        $("#secondSection").css("display", "none");
                        $(window).scrollTop(0);
                    });
                    
                    
                    $(document).ready(function() {
                        n =  new Date();
                        y = n.getFullYear();
                        m = n.getMonth() + 1;
                        d = n.getDate();
                        document.getElementById("date").innerHTML = d + "/" + m + "/" + y;   
                    });
                    
                    $("#partner").change(function (){
                        var partner = $('#partner option:selected').text();
                        $(".partnerSignature").text(partner);
                    });
                    
                    $('input[name=recommendation]').change(function() {
                       if($('.anotherGroup').is(':checked')) 
                       { 
                           $("#partnerRecommendDiv").show();
                           $("#offerStudentDiv").hide();
                       } 
                       if($('.offerRole').is(':checked')) 
                       { 
                           $("#partnerRecommendDiv").hide();
                           $("#offerStudentDiv").show();
                       } 
                       if($('.doNotOfferRole').is(':checked')) 
                       { 
                           $("#partnerRecommendDiv").hide();
                           $("#offerStudentDiv").hide();
                       } 
                       if($('.interviewMilkround').is(':checked')) 
                       { 
                           $("#partnerRecommendDiv").hide();
                           $("#offerStudentDiv").hide();
                       } 
                    });
                }
            </script>

            <script>
                $(document).ready(function() {
                    // Set Monday as start of wek
                    moment.updateLocale('en', {
                        week: {
                            dow: 1
                        }
                    });
                    // Initialize bootstrap-datetimepicker plugin
                    $('.datetimepickerStart').datetimepicker({
                        format: 'DD/MM/YYYY',
                        ignoreReadonly: true,
                        allowInputToggle: true
                    });
                    // Initialize bootstrap-datetimepicker plugin
                    $('.datetimepickerEnd').datetimepicker({
                        format: 'DD/MM/YYYY',
                        ignoreReadonly: true,
                        allowInputToggle: true
                    });
                });
            </script>
            
            <style type="text/css">
            #gradform .has-error .control-label,
            #gradform .has-error .help-block,
            #gradform .has-error .form-control-feedback {
                color: #f39c12;
            }

            #gradform .has-success .control-label,
            #gradform .has-success .help-block,
            #gradform .has-success .form-control-feedback {
                color: #18bc9c;
            }
            </style>
            
            

        </head>

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

                <form action="insert.cfm" method="post" id="gradform" name="gradform" data-toggle="validator" onSubmit="return validateForm(this)">
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
                            <div class="form-group col-xs-12 col-md-4">
                                <label for="studentName">Student Name:</label>
                                <select class="selectpicker" data-width="100%" data-live-search="true" id="studentName" name="studentName">
                                    <option value="Please select" selected>Please select</option>
                                      <cfloop query="placement">
                                          <cfoutput>
                                            <option value="#EncodeForHTML(employeeID)#">#EncodeForHTML(givenname)# #EncodeForHTML(sn)#</option>
                                          </cfoutput>
                                      </cfloop> 
                                </select>
                            </div>
                            <div class="form-group col-xs-12 col-md-4">
                                <label for="manager">Manager:</label>
                                <cfoutput>
                                    <input type="text" class="form-control" id="manager" name="manager" value="#details.givenname# #details.sn#" readonly>
                                </cfoutput>
                            </div>
                            <div class="form-group col-xs-12 col-md-4">
                                <label for="partner">Partner:</label>
                                <select class="selectpicker" data-width="100%" data-live-search="true" id="partner" name="partner">
                                    <option selected value="Please select">Please select</option>
                                      <cfloop query="partner">
                                          <cfoutput>
                                            <option value="#EncodeForHTML(employeeID)#">#EncodeForHTML(givenname)# #EncodeForHTML(sn)#</option>
                                          </cfoutput>
                                      </cfloop> 
                                </select>
                            </div>
                        </div>
                        <!-- Projects Row -->
                        <div class="row">
                            <div class="form-group col-xs-12 col-md-4">
                                <label for="department">Group:</label>
                                <cfoutput>
                                    <input type="text" class="form-control" value="#details.description#" id="department" name="department"  readonly>
                                </cfoutput>
                            </div>
                            <div class="form-group col-xs-12 col-md-4">
                                <label for="start_date">Start Date <span class="mandatory">*</span></label>
                                <div class='input-group date datetimepickerStart'>
                                    <input type='text' class="form-control" name="start_date" id="start_date" />
                                    <span class="input-group-addon">
                                        <span class="glyphicon glyphicon-calendar" aria-hidden="true"></span>
                                    </span>
                                </div>
                            </div>
                            <div class="form-group col-xs-12 col-md-4">
                                <label for="end_date">End Date <span class="mandatory">*</span></label>
                                <div class='input-group date datetimepickerEnd'>
                                    <input type='text' class="form-control" name="end_date" id="end_date" />
                                    <span class="input-group-addon">
                                        <span class="glyphicon glyphicon-calendar" aria-hidden="true"></span>
                                    </span>
                                </div>
                            </div>
                        </div>
                        <!-- /.row -->
                        <hr>
                        <!-- Projects Row -->
                        <div class="row">
                            <div class="col-xs-12">
                                <p>Please comment as appropriate on your students&#39; demonstration of competency in the areas below using the following ratings;</p>
                                <p>Rating Definitions</p>
                                <ul>
                                    <li>
                                        <p><b>Exceptional (E)</b> evidence the capability is present. Candidate cited multiple high quality, specific examples which demonstrated the capability</p>
                                    </li>
                                    <li>
                                        <p><b>Strong Evidence (S)</b> the capability is present. Candidate cited one or more high quality, specific examples which demonstrated the capability</p>
                                    </li>
                                    <li>
                                        <p><b>Average (A)</b> evidence the capability is present. Candidate provided at least one example which demonstrated that the capability is present </p>
                                    </li>
                                    <li>
                                        <p><b>Below Average (BA)</b> evidence the capability is present. Candidate had difficulty providing a specific example which demonstrated the capability. Answer provided some credibility that the competency was present</p>
                                    </li>
                                    <li>
                                        <p><b>Not Present (NP)</b> evidence the capability is not present</p>
                                    </li>
                                </ul>
                            </div>
                        </div>



                        <!-- /.row -->

                        <hr>

                        <div class="panel-group">
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h4 class="panel-title">
                                        Strives for Continual Improvement<a data-toggle="collapse" id="menu-toggle1" href="#collapse1"><span class="glyphicon glyphicon-chevron-down pull-right"></span></a>
                                    </h4>
                                </div>
                                <div id="collapse1" class="panel-collapse collapse in">
                                    <div class="panel-body">
                                        <p><b>The student is dedicated to achieving success and adding value to team or customer. They develop ambitious goals in order to challenge themselves and others around them to improve. They openly and positively receive personal feedback and invest in personal self-development to expand their knowledge base and improve their performance. They respond positively to difficult tasks and high pressure situations.</b></p>
                                        <ul>
                                            <li>
                                                <p>Goal and results oriented</p>
                                            </li>
                                            <li>
                                                <p>Proactively seeks performance feedback and receives feedback positively</p>
                                            </li>
                                            <li>
                                                <p>Make personal development a priority, strives to continually improve through action</p>
                                            </li>
                                        </ul>
                                        <p><b>Please select a rating:</b></p>
                                        <table class="table table-bordered">
                                            <tbody>
                                                <tr>
                                                    <td width="20%" class="text-center">
                                                        <p>Exceptional</p><input type="radio" id="strives_rating" name="strives_rating" value="exceptional" /></td>
                                                    <td width="20%" class="text-center">
                                                        <p>Strong</p><input type="radio" id="strives_rating" name="strives_rating" value="strong" /></td>
                                                    <td width="20%" class="text-center">
                                                        <p>Average</p><input type="radio" id="strives_rating" name="strives_rating" value="average" /></td>
                                                    <td width="20%" class="text-center">
                                                        <p>Below Average</p><input type="radio" id="strives_rating" name="strives_rating" value="belowAverage" /></td>
                                                    <td width="20%" class="text-center">
                                                        <p>Not Present</p><input type="radio" id="strives_rating" name="strives_rating" value="notPresent" /></td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="panel-group">
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h4 class="panel-title">
                                        Drives Collaboration & Inclusion<a data-toggle="collapse" id="menu-toggle2" href="#collapse2"><span class="glyphicon glyphicon-chevron-down pull-right"></span></a>
                                    </h4>
                                </div>
                                <div id="collapse2" class="panel-collapse collapse in">
                                    <div class="panel-body">
                                        <p><b>The student readily shares information and knowledge and works through silos to build positive relationships both internally and externally. They are culturally sensitive, globally minded and respect the views and opinions of others. There is evidence that they make a positive difference at work and in their community.</b></p>
                                        <ul>
                                            <li>
                                                <p>Openly values and respects the views of others and demonstrates a willingness to have two-way communication</p>
                                            </li>
                                            <li>
                                                <p>Proactively shares knowledge with others across departments and functions</p>
                                            </li>
                                            <li>
                                                <p>Builds positive constructive relationships and inspires positive action</p>
                                            </li>
                                        </ul>
                                        <p><b>Please select a rating:</b></p>
                                        <table class="table table-bordered">
                                            <tbody>
                                                <tr>
                                                    <td width="20%" class="text-center">
                                                        <p>Exceptional</p><input type="radio" id="collaboration_rating" name="collaboration_rating" value="exceptional" /></td>
                                                    <td width="20%" class="text-center">
                                                        <p>Strong</p><input type="radio" id="collaboration_rating" name="collaboration_rating" value="strong" /></td>
                                                    <td width="20%" class="text-center">
                                                        <p>Average</p><input type="radio" id="collaboration_rating" name="collaboration_rating" value="average" /></td>
                                                    <td width="20%" class="text-center">
                                                        <p>Below Average</p><input type="radio" id="collaboration_rating" name="collaboration_rating" value="belowAverage" /></td>
                                                    <td width="20%" class="text-center">
                                                        <p>Not Present</p><input type="radio" id="collaboration_rating" name="collaboration_rating" value="notPresent" /></td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="panel-group">
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h4 class="panel-title">
                                        Delivers Quality<a data-toggle="collapse" id="menu-toggle3" href="#collapse3"><span class="glyphicon glyphicon-chevron-down pull-right"></span></a>
                                    </h4>
                                </div>
                                <div id="collapse3" class="panel-collapse collapse in">
                                    <div class="panel-body">
                                        <p><b>The student is passionate about consistently delivering high quality work to meet customer needs. They effectively prioritize workload to ensure work is delivered on time. They demonstrate an ability to multi-task and will either consult with others or escalate issues that are beyond their understanding.</b></p>
                                        <ul>
                                            <li>
                                                <p>Prioritizes tasks according to urgency and importance</p>
                                            </li>
                                            <li>
                                                <p>Ability to multi-task and manage time effectively</p>
                                            </li>
                                            <li>
                                                <p>Proactively consults others in order to deliver a better quality product or service</p>
                                            </li>
                                        </ul>
                                        <p><b>Please select a rating:</b></p>
                                        <table class="table table-bordered">
                                            <tbody>
                                                <tr>
                                                    <td width="20%" class="text-center">
                                                        <p>Exceptional</p><input type="radio" id="quality_rating" name="quality_rating" value="exceptional" /></td>
                                                    <td width="20%" class="text-center">
                                                        <p>Strong</p><input type="radio" id="quality_rating" name="quality_rating" value="strong" /></td>
                                                    <td width="20%" class="text-center">
                                                        <p>Average</p><input type="radio" id="quality_rating" name="quality_rating" value="average" /></td>
                                                    <td width="20%" class="text-center">
                                                        <p>Below Average</p><input type="radio" id="quality_rating" name="quality_rating" value="belowAverage" /></td>
                                                    <td width="20%" class="text-center">
                                                        <p>Not Present</p><input type="radio" id="quality_rating" name="quality_rating" value="notPresent" /></td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="panel-group">
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h4 class="panel-title">
                                        Makes an Impact<a data-toggle="collapse" id="menu-toggle4" href="#collapse4"><span class="glyphicon glyphicon-chevron-down pull-right"></span></a>
                                    </h4>
                                </div>
                                <div id="collapse4" class="panel-collapse collapse in">
                                    <div class="panel-body">
                                        <p><b>The ability to inspire and incite people to change their thinking or take action. They present information clearly, concisely and adapt their communication style to suit the situation or the audience.</b></p>
                                        <ul>
                                            <li>
                                                <p>Presents ideas with confidence and passion</p>
                                            </li>
                                            <li>
                                                <p>Recognition that communication style needs to adapt to the situation or individual</p>
                                            </li>
                                            <li>
                                                <p>Direct, concise and clear in communication approach</p>
                                            </li>
                                        </ul>
                                        <p><b>Please select a rating:</b></p>
                                        <table class="table table-bordered">
                                            <tbody>
                                                <tr>
                                                    <td width="20%" class="text-center">
                                                        <p>Exceptional</p><input type="radio" id="impact_rating" name="impact_rating" value="exceptional" /></td>
                                                    <td width="20%" class="text-center">
                                                        <p>Strong</p><input type="radio" id="impact_rating" name="impact_rating" value="strong" /></td>
                                                    <td width="20%" class="text-center">
                                                        <p>Average</p><input type="radio" id="impact_rating" name="impact_rating" value="average" /></td>
                                                    <td width="20%" class="text-center">
                                                        <p>Below Average</p><input type="radio" id="impact_rating" name="impact_rating" value="belowAverage" /></td>
                                                    <td width="20%" class="text-center">
                                                        <p>Not Present</p><input type="radio" id="impact_rating" name="impact_rating" value="notPresent" /></td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="panel-group">
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h4 class="panel-title">
                                        Demonstrates Curiosity & Innovation<a data-toggle="collapse" id="menu-toggle5" href="#collapse5"><span class="glyphicon glyphicon-chevron-down pull-right"></span></a>
                                    </h4>
                                </div>
                                <div id="collapse5" class="panel-collapse collapse in">
                                    <div class="panel-body">
                                        <p><b>The student is adaptive to changing circumstances and responds in fluid environments. They both propose and build innovative solutions and are keen learners. They add value by seeking out new insights and perspectives, developing new ideas, while implementing practical solutions.</b></p>
                                        <ul>
                                            <li>
                                                <p>Curious, open minded approach to problem solving</p>
                                            </li>
                                            <li>
                                                <p>Seeks input, advice and information from numerous sources and applies knowledge to develop solutions</p>
                                            </li>
                                            <li>
                                                <p>Energized by change</p>
                                            </li>
                                        </ul>
                                        <p><b>Please select a rating:</b></p>
                                        <table class="table table-bordered">
                                            <tbody>
                                                <tr>
                                                    <td width="20%" class="text-center">
                                                        <p>Exceptional</p><input type="radio" id="curiosity_rating" name="curiosity_rating" value="exceptional" /></td>
                                                    <td width="20%" class="text-center">
                                                        <p>Strong</p><input type="radio" id="curiosity_rating" name="curiosity_rating" value="strong" /></td>
                                                    <td width="20%" class="text-center">
                                                        <p>Average</p><input type="radio" id="curiosity_rating" name="curiosity_rating" value="average" /></td>
                                                    <td width="20%" class="text-center">
                                                        <p>Below Average</p><input type="radio" id="curiosity_rating" name="curiosity_rating" value="belowAverage" /></td>
                                                    <td width="20%" class="text-center">
                                                        <p>Not Present</p><input type="radio" id="curiosity_rating" name="curiosity_rating" value="notPresent" /></td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="panel-group">
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h4 class="panel-title">
                                        Exercises Professional Judgement<a data-toggle="collapse" id="menu-toggle6" href="#collapse6"><span class="glyphicon glyphicon-chevron-down pull-right"></span></a>
                                    </h4>
                                </div>
                                <div id="collapse6" class="panel-collapse collapse in">
                                    <div class="panel-body">
                                        <p><b>The student exudes professionalism and integrity at all times, and in every aspect of their work. They have the ability to maintain objectiveness and will seek enough information to understand the circumstances before responding to a situation or drawing any final conclusions.</b></p>
                                        <ul>
                                            <li>
                                                <p>Considers information with the right degree of professional sceptism</p>
                                            </li>
                                            <li>
                                                <p>Asks relevant questions to get clarity on key issues and uses information and expertise to make informed decisions</p>
                                            </li>
                                            <li>
                                                <p>Acts with integrity and demonstrates ethical behaviour</p>
                                            </li>
                                        </ul>
                                        <p><b>Please select a rating:</b></p>
                                        <table class="table table-bordered">
                                            <tbody>
                                                <tr>
                                                    <td width="20%" class="text-center">
                                                        <p>Exceptional</p><input type="radio" id="judgement_rating" name="judgement_rating" value="exceptional" /></td>
                                                    <td width="20%" class="text-center">
                                                        <p>Strong</p><input type="radio" id="judgement_rating" name="judgement_rating" value="strong" /></td>
                                                    <td width="20%" class="text-center">
                                                        <p>Average</p><input type="radio" id="judgement_rating" name="judgement_rating" value="average" /></td>
                                                    <td width="20%" class="text-center">
                                                        <p>Below Average</p><input type="radio" id="judgement_rating" name="judgement_rating" value="belowAverage" /></td>
                                                    <td width="20%" class="text-center">
                                                        <p>Not Present</p><input type="radio" id="judgement_rating" name="judgement_rating" value="notPresent" /></td>
                                                </tr>
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <div class="panel-group">
                            <div class="panel panel-default">
                                <div class="panel-heading">
                                    <h4 class="panel-title">
                                        Summary of student's performance<a data-toggle="collapse" id="menu-toggle7" href="#collapse7"><span class="glyphicon glyphicon-chevron-down pull-right"></span></a>
                                    </h4>
                                </div>
                                <div id="collapse7" class="panel-collapse collapse in">
                                    <div class="panel-body">
                                        <div class="form-group">
                                            <label for="strength_weakness"><p>Please give a general summary of your students' strengths and weaknesses.</p></label>
                                            <textarea type="text" class="form-control" rows="5" id="strength_weakness" name="strength_weakness"></textarea>
                                            <div class="help-block with-errors"></div>
                                        </div>
                                        <div class="form-group">
                                            <label for="motivation"><p>Is the student's career motivation in line with the role and/or KPMG as a firm?</p></label>
                                            <textarea class="form-control" rows="5" id="motivation" name="motivation"></textarea>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <button type="button" class="btn btn-primary btn-md text-center" id="next" onclick="return validateForm(this);">Next</button>
                    </div>
                    <div class="row" id="secondSection" style="display:none; padding-top:30px;">
                        <div class="col-xs-12">
                            <h3>Hiring Recommendation: (if student is in their penultimate year)</h3>
                            <p style="padding-top: 30px;">As a result of the placement or internship, would you be happy to formally offer your Work Placement/ Intern a position as a trainee in your group prior to the Milkround process? If yes, please get Partner sign off below. </p>
                            
                            <div class="radio" style="padding-top: 30px;">
                                <label><input type="radio" class="offerRole" name="recommendation" id="recommendation" value="offerRole"><p>Offer the student a role in my group. (Please get partner sign off below). 
                                The offer will be communicated to the student in September.</p>
                                </label>
                            </div>
                            <div class="row" style="display:none" id="offerStudentDiv">
                                <div class="col-xs-12">
                                    <div class="form-group col-xs-12 col-md-12">
                                        <label for="offerType">Type of offer:</label><br>
                                        <label class="radio-inline"><input type="radio" name="offerType" id="offerType" value="Direct">Direct</label>
                                        <label class="radio-inline"><input type="radio" name="offerType" id="offerType" value="Masters">Masters</label>
                                    </div>
                                </div>
                                <div class="col-xs-12" style="margin-top: 10px;">
                                    <div class="form-group">
                                        <p class="text-center"><font color="red" size="3">Please note on submitting this form, an email will be sent to your Partner requesting approval immediately</font></p>
                                    </div>
                                </div>
                            </div>
                            <hr>
                            <div class="radio">
                                <label><input type="radio" class="doNotOfferRole" name="recommendation" id="recommendation" value="doNotOfferRole"><p>Do not offer the student.<br>This means that the student has been unsuccessful and isn't suitable for KPMG. If the student reapplies in the milkround, they are very unlikely to get an offer.</p></label>
                            </div>
                            <hr>
                            <div class="radio">
                                <label><input type="radio" class="anotherGroup" name="recommendation" id="recommendation" value="anotherGroup"><p>Recommend to another group.<br> If you are recommending this student to another group based on the students career motivation, please give details below.
                                </p></label>
                            </div>
                            <div class="row" style="display:none" id="partnerRecommendDiv">
                                <div class="col-xs-12">
                                    <div class="form-group col-xs-12 col-md-4">
                                        <label for="partnerRecommend">Partner name:</label>
                                        <select class="selectpicker" data-width="100%" data-live-search="true" id="partnerRecommend" name="partnerRecommend">
                                            <option selected value="Please select">Please select</option>
                                              <cfloop query="partner">
                                                  <cfoutput>
                                                    <option value="#EncodeForHTML(employeeID)#">#EncodeForHTML(givenname)# #EncodeForHTML(sn)#</option>
                                                  </cfoutput>
                                              </cfloop> 
                                        </select>
                                    </div>
                                    <div class="col-xs-12 col-md-2">
                                        <div class="form-group">
                                            <label for="offerType">Type of offer:</label><br>
                                            <input type="radio" name="offerType" id="offerType" value="Direct">&nbsp;Direct<br>
                                            <input type="radio" name="offerType" id="offerType" value="Masters">&nbsp;Masters
                                        </div>
                                    </div>
                                    <div class="col-xs-12 col-md-6"> 
                                        <label for="otherNotes">Other notes:</label>
                                        <cfoutput>
                                            <textarea type="text" class="form-control" id="otherNotes" name="otherNotes" rows="5" cols="5" ></textarea>
                                        </cfoutput>
                                    </div>
                                </div>
                                
                                <div class="col-xs-12" style="margin-top: 10px;">
                                    <div class="form-group">
                                        <p class="text-center"><font color="red" size="3">Please note on submitting this form, an email will be sent to the relevant Partner requesting approval immediately</font></p>
                                    </div>
                                </div>
                            </div>
                            <hr>
                            <cfoutput>
                            <cfif #details.description# EQ 'Transaction Services' OR #details.description# EQ 'Corporate Finance'>
                            <div class="radio">
                                <label><input type="radio" class="interviewMilkround" name="recommendation" id="recommendation" value="interviewMilkround"><p>Invite the student to interview at Milkround automatically<br>
                                This means that the student has been successful during their internship and placement. However your business unit is likely to be a smaller unit and would like to evaluate this student at interview.
                                </p></label>
                            </div>
                            <hr>
                            </cfif>
                            </cfoutput>
                            <div class="row">
                                <div class="form-group col-xs-12 col-md-9">
                                    <cfoutput>
                                        <p><b>Manager Signature:</b>&nbsp;&nbsp;#details.givenname# #details.sn#</p>
                                    </cfoutput>
                                </div>
                                <div class="form-group pull-right" style="padding-right: 30px;">
                                    <p for="date"><b>Date: </b><span id="date"></span></p>
                                </div>
                            </div>
                            <div class="row">
                                <div class="col-xs-12">
                                    <p><b>Partner Signature:</b> &nbsp;<span class="partnerSignature"></span></p>
                                </div>
                            </div>
                            <button type="button" class="btn btn-primary btn-md text-center" id="back">Back</button>
                            <div class=" text-center">
                                <button type="submit" class="btn btn-primary btn-lg text-center" id="submit">Submit</button>
                            </div>
                        </div>
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