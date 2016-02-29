
angular.module('myApp.patients', ['ngRoute'])

.config ['$routeProvider', ($routeProvider) ->
  $routeProvider.when '/patients',
    templateUrl: '/partials/patient/all'
    controller: 'PatientListCtrl'
  
  $routeProvider.when '/patients/:id',
    templateUrl: 'partials/patient/detail'
    controller: 'PatientDetailCtrl'
]

.controller 'PatientListCtrl', ["$scope", ($scope) ->
  $scope.patients = patients
]

.controller 'PatientDetailCtrl', ["$scope", "$routeParams", "$location"
  ($scope, $routeParams, $location) ->
      $scope.patient = p for p in patients when p.id == $routeParams.id
]

# ############################################################################
# Esto sera reemplazado por una API RESTful
patients = [
  {
    id: "asd123f2d3123922"
    name: "Fernando Paredes"
    phone: "12345678"
  },
  {
    id: "1a902339bc3d3eff87f"
    name: "Jimena Perez"
    phone: "11223344"
  },
  {
    id: "abcdef1234567890"
    name: "Susana Horia"
    phone: "22334455"
  },
]
# ############################################################################
