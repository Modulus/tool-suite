'use strict';

/**
 * @ngdoc function
 * @name toolSuiteApp.controller:MainCtrl
 * @description
 * # MainCtrl
 * Controller of the toolSuiteApp
 */

  angular.module('toolSuiteApp')
    .controller('MainCtrl',function($scope, $http){
      $scope.tools = [];
      function getData(){
        $http.get("http://localhost:5000/api").then(function(response){
          $scope.tools = response.data;
        });
      }

      getData($scope.tools);




    });





