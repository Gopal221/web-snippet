var snippetControllerModule = angular.module('snippet.controllers');

var SnippetController = function($scope, $http) {
	$scope.token = "239823dsjdsjndsk2892389";
}

snippetControllerModule.controller('SnippetController', [ '$scope', '$http', SnippetController]);

