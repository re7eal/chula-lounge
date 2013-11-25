Array.prototype.removeIf = function(callback) {
    var i = this.length;
    while (i--) {
        if (callback(this[i], i)) {
            this.splice(i, 1);
        }
    }
};

App.controller('PageCourseRegister', ['$scope','$window', '$http', 'Professor', 
	function($scope,$window, $http, Professor) {
	
	$('#error').hide();

	var today = new Date();
	$scope.years = [];
	
	for(var i = 0; i < 10;i++){
		$scope.years.push(today.getFullYear()-i);
	}
	$scope.ayears = [1,2,3,4];

	$scope.editCourseMode = false;
	$scope.editDescMode = false;
	$scope.editMetaMode = false;


	$scope.init = function(id) {
		console.log($scope.data);
	}
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
	$scope.profs = function(prof) {
		var profs = $scope.professor_list.concat([]);
		var array = $scope.teach.professors.concat($scope.teach.professor);
		
		for(var i=0;i< array.length;i++){
				var index = profs.indexOf(array[i]);
				
				if(array[i] != prof && index != -1){
					profs.splice(index,1);
				}
		}
		return profs;
 	}
	$http({method:'GET', url: '/faculties.json'}).
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

		if(index > -1) 
			$scope.years.splice(index, 1);

		if($scope.teach.professors.length <= 0) 
			return;

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
			return res;
	}

	var delete_teach_professor = function (array){
		for(var i=0; i< array.length; i++){
			delete array[i].professor;
		}
		return array;
	}

	var adjust_professors = function(array) {
		var res= [];
		for(var i=0;i<array.length;i++){
			res.push({
				id: array[i].id
			})
		}
		return res;
	}

	var adjust_teaches = function(array){
		var res = [];
		for(var i=0;i < array.length;i++){
			res.push({
				professors: adjust_professors(array[i].professors),
				year: array[i].year
			});
		}
		return res;
	}

	var adjust_curriculums = function(array){
		var res = [];
		for(var i=0;i < array.length;i++){
			res.push({
				id: array[i].id
			});
		}
		return res;
	}
	$scope.save = function() {
		var c = flatten_array_curr($scope.data.curriculums);
		delete_teach_professor($scope.data.teaches);

		var send = {
			course : $scope.data.course
		}
		delete send.course.curriculums;
		send.teaches = adjust_teaches($scope.data.teaches);
		send.curriculums = adjust_curriculums(c);
		$http({method:"POST", url:'/save/courses.json', data: send}).success(function(data) {
			console.log(data);
			$window.location.href="../pages/nav/" + 1 + "/course/" + data.id;
		}).error(function(data) {
			var msg = "";
			angular.forEach(data, function(value, key){
				for(var i=0;i<value.length;i++){
					msg += "course " + key + " " + value[i] + "<br/>";
				}
			});
			$('#error').html(msg);
			$('#error').show();
		});
	}
	$scope.cancel = function() {
		$window.location.href="../../courses";
	}
}]);

