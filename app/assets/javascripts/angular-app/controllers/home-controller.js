App.controller('PageIndex', ['$scope', '$http',function($scope, $http){

	$http({method:'GET', url: '/faculties'}).
		success(function(data){
			$scope.faculties = data;		
		});
}]);