sc = angular.module('sc',[
  'templates',
  'ngRoute',
  'ngResource',
  'controllers',
])

sc.config([ '$routeProvider',
  ($routeProvider)->
    $routeProvider
      .when('/',
        templateUrl: "index.html"
        controller: 'PhotosController'
      )
])

photos = [
  {
    id: 1
    name: 'Beach 1'
  },
  {
    id: 2
    name: 'Awesome stuff',
  },
  {
    id: 3
    name: 'Beach 2',
  },
  {
    id: 4
    name: 'Party time!',
  },
]
controllers = angular.module('controllers',[])
controllers.controller("PhotosController", [ '$scope', '$routeParams', '$location', '$resource'
  ($scope,$routeParams,$location,$resource)->
    $scope.search = (keywords)->  $location.path("/").search('keywords',keywords)
    Photo = $resource('/photos/index.json', {})
    
    if $routeParams.keywords
      #keywords = $routeParams.keywords.toLowerCase()
      #$scope.photos = photos.filter (photo)-> photo.name.toLowerCase().indexOf(keywords) != -1
      Photo.query(keywords: $routeParams.keywords, (results)-> $scope.photos = results)
    else
      $scope.photos = []
])
