angular.module('myApp.patients', ['ngRoute'])

.config ['$routeProvider', ($routeProvider) ->
  $routeProvider.when '/patients', {
    templateUrl: 'partials/patient/all.html'
    controller: 'PatientCtrl'
  }
  $routeProvider.when '/patients/:id', {
    templateUrl: 'partials/patient/detail.html'
    controller: 'PatientCtrl'
  }
]

.controller 'PatientCtrl', ["$scope", ($scope) ->
  $scope.patients = [
    {
      name: "Fernando Paredes"
      phone: "12345678"
    },
    {
      name: "Jimena Perez"
      phone: "11223344"
    },
  ]
    
]
