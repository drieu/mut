<@ page contentType="text/html;charset=UTF-8" >
<html xmlns="http://www.w3.org/1999/html" xmlns="http://www.w3.org/1999/html">
    <head>
        <meta name="layout" content="main"/>
        <r:require modules="bootstrap"/>
    </head>
    <body>
        <section>
            <div class="container">
                <sec:ifLoggedIn>
                    <p>Your Logged in!</p>
                </sec:ifLoggedIn>
                <sec:ifAllGranted roles="ROLE_ADMIN">
                <div class="row">
                    <header class="page-header">
                        <h3>User <small class="lead">Liste des utilisateurs</small></h3>
                    </header>
                    <div class="span3">
                            <g:link class="btn btn-block btn-link" action="create">
                                Create New User
                            </g:link>
                        <div class="well">
                            <ul class="nav nav-list">
                                <li class="nav-header">People</li>
                                <li class="active">
                                    <a id="view-all" href="#">
                                        <i class="icon-chevron-right pull-right"></i>
                                        <b>View All</b>
                                    </a>
                                </li>
                            <g:each in="${ people }" var="user" status="i">
                                <li>
                                    <a href="#User-${user.id}">
                                        <i class="icon-chevron-right pull-right"></i>
                                        ${ "${ user.login }" }
                                    </a>
                                </li>
                            </g:each>
                            </ul>
                        </div>
                    </div>
                    <div class="span9">
                    <g:each in="${ people }" var="user" status="i">
                        <div id="User-${ user.id }" class="well well-small">
                            <table class="table table-bordered table-striped">
                                <caption>
                                    ${ "${ user.login }" }: List of known addresses
                                </caption>
                                <thead>
                                    <tr>
                                        <th>State</th>
                                        <th>City</th>
                                        <th>Street</th>
                                        <th>Zip Code</th>
                                        <th>Options</th>
                                    </tr>
                                </thead>
                                <tbody>
<!--                                <g:each in="${ user.addresses }" var="address">
                                    <tr>
                                        <td>${ address.state }</td>
                                        <td>${ address.city }</td>
                                        <td>${ address.streetAddress }</td>
                                        <td>${ address.zipCode }</td>
                                        <td><g:link class="btn btn-small btn-inverse" controller="address"
                                                    action="edit" id="${address.id}">
                                                <i class="icon-edit icon-white"></i>
                                            </g:link>
                                        </td>
                                    </tr>
                                </g:each>-->
                                </tbody>
                            </table>
                            <div class="btn-group">
                                <g:link class="btn btn-primary" action="edit" id="${user.id}">
                                    <i class="icon-edit icon-white"></i>Edit
                                </g:link>
                            </div>
                        </div>
                    </g:each>
                    </div>
                  </sec:ifAllGranted>
                </div>
            </div>
        </section>
        <g:javascript>
            $('ul.nav > li > a').click(function(e){
                if($(this).attr('id') == "view-all"){
                    $('div[id*="User-"]').fadeIn('fast');
                }else{
                    var aRef = $(this);
                    var tablesToHide = $('div[id*="User-"]:visible').length > 1
                            ? $('div[id*="User-"]:visible') : $($('.nav > li[class="active"] > a').attr('href'));

                    tablesToHide.hide();
                    $(aRef.attr('href')).fadeIn('fast');
                }
                $('.nav > li[class="active"]').removeClass('active');
                $(this).parent().addClass('active');
            });
        </g:javascript>
    </body>
</html>