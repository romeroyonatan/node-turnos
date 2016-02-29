#=require patients/patients
# Declare app level module which depends on views, and components
angular.module('myApp', [
  'ngRoute',
  'myApp.patients',
]).

config ['$routeProvider', ($routeProvider) ->
  $routeProvider.otherwise {redirectTo: '/patient'}
]
