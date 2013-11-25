App.controller('PageIndex', ['$scope', '$http', function($scope, $http){

	$http({method:'GET', url: '/faculties.json'}).
		success(function(data){
			$scope.faculties = data;
			console.log($scope.faculties);		
		});
}]);