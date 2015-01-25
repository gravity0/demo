var topPageModule = angular.module('myApp', ['ngResource']);

var mainController = topPageModule.controller('mainController', ['$resource',
    function($resource){
      var createResource = $resource('/server', {});
      var t = createResource.get();
      console.log(t);
      console.log(createResource);

      //$scope.hoge = "aaa";
    }
    
]);
