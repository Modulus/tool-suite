'use strict';

/**
 * @ngdoc function
 * @name toolSuiteApp.controller:MainCtrl
 * @description
 * # MainCtrl
 * Controller of the toolSuiteApp
 */

  angular.module('toolSuiteApp')
    .controller('MainCtrl',function($scope, $http, $log){
      $scope.tools = [];
      getData($scope.tools)


      function getData(tools){
        $http.get("http://localhost:5000/api").then(function(response){
          $log(response);
          tools = response;
        })
      }

    });





