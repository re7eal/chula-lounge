Array.prototype.removeIf = function(callback) {
    var i = this.length;
    while (i--) {
        if (callback(this[i], i)) {
            this.splice(i, 1);
        }
    }
};

App.controller('PageCourseRegister', ['$scope', '$http', 'Professor','Teach', 
	
	function($scope, $http, Professor, Teach) {

	var today = new Date();
	$scope.years = [];
	
	for(var i = 0; i < 10;i++){
		$scope.years.push(today.getFullYear()-i);
	}

	$scope.ayears = [1,2,3,4];

	$scope.editCourseMode = false;
	$scope.editDescMode = false;
	$scope.editMetaMode = false;

	$scope.data = {
		course : {
			title: "Course Title",
			number: "XXXXXXX",
			description : "Course Description",
			year : 1,
			semester : 1
		},
		curriculums: [],
		teaches : [] 
	};

	$scope.teach = {
		professors: [],
		professor: {}
	};

	$scope.course = { 
		year: 1,
		curriculums: []
	}; 
	$scope.description = "";
	$scope.professor_list = Professor.query();
	$scope.profs = $scope.professor_list;
 	
	$http({method:'GET', url: '/faculties'}).
		success(function(data){
			$scope.faculties = data;		
		}
	);

	$scope.removeCurr = function(obj) {
		var index = $scope.course.curriculums.indexOf(obj);
		if(index != -1)
			$scope.course.curriculums.splice(index,1);
	}

	$scope.addCurr = function() {
		$scope.course.curriculums.push({});
	}

	$scope.removeProf = function(obj) {
		var index = $scope.teach.professors.indexOf(obj);
		if(index != -1)
			$scope.teach.professors.splice(index,1);
	}

	$scope.addProf = function() {
		$scope.teach.professors.push({});
	}

	$scope.addTeach = function() {
		$scope.teach.professors.push($scope.teach.professor);
		$scope.teach.professors.removeIf(function(value, index) {
			if(value == undefined)
				return true;
			if('name' in value)
				return false;
			return true;
		});
		var index = $scope.years.indexOf($scope.teach.year);

		if(index > -1) $scope.years.splice(index, 1);

		$scope.data.teaches.push($scope.teach);
		$scope.teach = {
			professors: []
		};
	}
	$scope.removeTeach = function(obj){
		var index = $scope.data.teaches.indexOf(obj);
		if(index != -1)
		{
			$scope.years.push(obj.year);
			$scope.years.sort();
			$scope.years.reverse();
			$scope.data.teaches.splice(index, 1);
		}
	}
	$scope.editCourse = function(enter){
		$scope.course.title = $scope.data.course.title;
		$scope.course.number = $scope.data.course.number;
		$scope.editCourseMode = enter;
	}
	$scope.saveCourse = function() {
		$scope.data.course = $scope.course;
		$scope.editCourseMode = false;
	}

	$scope.editDesc = function(enter) {
		$scope.description = $scope.data.course.description;
		$scope.editDescMode = enter;
	}

	$scope.saveDesc = function() {
		$scope.data.course.description = $scope.description;
		$scope.editDescMode = false;
	}

	$scope.editMeta = function(enter) {
		$scope.course.year = $scope.data.course.year;
		$scope.course.semester = $scope.data.course.semester;
		$scope.course.curriculums = $scope.data.curriculums;
		$scope.editMetaMode = enter;
	}

	$scope.saveMeta = function() {
		$scope.data.course.year = $scope.course.year;
		$scope.data.course.semester = $scope.course.semester;
		$scope.data.curriculums = $scope.course.curriculums;

		if($scope.course.semester == 1){
			$('#s1').addClass('active');
			$('#s2').removeClass('active');
		}
		else {
			$('#s2').addClass('active');
			$('#s1').removeClass('active');
		}
		$scope.editMetaMode = false;
	}

	var flatten_array_curr = function(array) {
			var res = [];
			for(var i =0; i< array.length;i++){
				res.push(array[i].curriculum);
			}
			return res
	}

	var delete_teach_professor = function (array){
		for(var i=0; i< array.length; i++){
			delete array[i].professor;
		}
		return array;
	}
	$scope.save = function() {
		$scope.data.curriculums = flatten_array_curr($scope.data.curriculums);
		delete_teach_professor($scope.data.teaches);
		$http({method:"POST", url:'/save/courses', data: $scope.data}).success(function(data) {
			console.log(data);
		}).error(function(data) {
			console.log(data);
		});
	}
}]);

