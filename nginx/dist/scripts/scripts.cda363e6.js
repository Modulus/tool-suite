"use strict";angular.module("toolSuiteApp",["ngAnimate","ngCookies","ngResource","ngRoute","ngSanitize","ngTouch"]).config(["$routeProvider",function(a){a.when("/",{templateUrl:"views/main.html",controller:"MainCtrl",controllerAs:"main"}).when("/about",{templateUrl:"views/about.html",controller:"AboutCtrl",controllerAs:"about"}).otherwise({redirectTo:"/"})}]),angular.module("toolSuiteApp").controller("MainCtrl",["$scope","$http",function(a,b){function c(){b.get("http://localhost:5000").then(function(b){a.tools=b.data})}a.tools=[],c(a.tools)}]),angular.module("toolSuiteApp").controller("AboutCtrl",function(){this.awesomeThings=["HTML5 Boilerplate","AngularJS","Karma"]}),angular.module("toolSuiteApp").run(["$templateCache",function(a){a.put("views/about.html","<p>This is the about view.</p>"),a.put("views/main.html",'<div data-ng-model="tools"> <div class="jumbotron"> <h1>{{tools.header}}</h1> <!--<p class="lead">\n      <img src="images/yeoman.c582c4d1.png" alt="I\'m Yeoman"><br>\n      Tools for this client\n    </p>--> <!--<p><a class="btn btn-lg btn-success" ng-href="#/">Splendid!<span class="glyphicon glyphicon-ok"></span></a></p>--> </div> <fieldset> <legend>Repositories</legend> <table class="table table-striped table-hover"> <tr> <th>#</th><th>Tool</th><th>Where</th> </tr> <tr ng-repeat="link in tools.repos.links"> <td><b>{{$index}}</b></td><td>{{link.label}}</td><td><a href="{{link.url}}">{{link.url}}</a></td> </tr> </table> </fieldset> <fieldset> <legend>Tools</legend> <table class="table table-striped table-hover"> <tr> <th>#</th><th>Tool</th><th>Where</th> </tr> <tr ng-repeat="link in tools.tools.links"> <td><b>{{$index}}</b></td><td>{{link.label}}</td><td><a href="{{link.url}}">{{link.url}}</a></td> </tr> </table> </fieldset> <fieldset> <legend>Wikis</legend> <table class="table table-striped table-hover"> <tr> <th>#</th><th>Tool</th><th>Where</th> </tr> <tr ng-repeat="link in tools.wikis.links"> <td><b>{{$index}}</b></td><td>{{link.label}}</td><td><a href="{{link.url}}">{{link.url}}</a></td> </tr> </table> </fieldset> </div>')}]);
