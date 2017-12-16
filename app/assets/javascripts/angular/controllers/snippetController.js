var snippetControllerModule = angular.module('snippet.controllers');

var SnippetController = function($scope, $http) {
	// $scope.token = "239823dsjdsjndsk2892389";

	var getToken = function(){
		$http.get('api/v1/user/get_token').success(function(response){
			console.log(response);
			$scope.token = response.access_token;
		})
	}

	getToken();

	$scope.generateToken = function(){
		$http.get('api/v1/user/create_token').success(function(response){
			console.log(response);
			$scope.token = response.access_token;

		})
	}

	var getAllSnippet = function(){
		$http.get('api/v1/snippet').success(function(response){
			console.log(response);
			$scope.allSnippets = response.data;
		})
	}

	getAllSnippet();
}

snippetControllerModule.controller('SnippetController', [ '$scope', '$http', SnippetController]);

