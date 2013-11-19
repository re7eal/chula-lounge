App.controller('PageNav', ['$scope','$http', function($scope, $http, Course){
			
			//Scrollbar
			setTimeout(function() {
				$("#year").niceScroll({
					cursorfixedheight: 50,
					cursorwidth:3,
					cursorpacitymax: 0.5
				});
				$("#course").niceScroll({
					cursorfixedheight: 50,
					cursorwidth:3,
					cursorpacitymax: 0.5
				});
			});

			//Searchbar
			var initSearchBar = function(){
			   	var focus_duration = 800;
			   	var wait_duration = 2000;

				$("#search-tool .footer").click(function() {
					if(!$("#search-course").is(":focus")){
						$("#search-course").focus();
					}
				});

				$("#search-course").focus(function(){
					$("#search-tool").clearQueue().switchClass("span4", "span12", focus_duration);
				});

				$("#search-course").blur(function(){
					setTimeout(function(){
						if(!$("#search-course").is(":focus") && $("#search-course").val() == ""){
						$("#search-tool").clearQueue().switchClass("span12", "span4", focus_duration);
						
					}},wait_duration);
				});
			}

			//Typeahead
			$('#search-course').typeahead({
				valueKey : 'title',
				remote:{
					url: '/query/courses.json?q=',
					replace: function (url, query) {
							return url + query + '&f=' + $scope.id;
						}
					},
				template: [
					'<div class="search-suggestion">',
					'<h4>{{title}}</h4>',
					'<p>{{number}}</p>',
					'</div>'				
					].join(''),
				engine: Hogan,
				limit: 5

			});

			$('#search-course').on('typeahead:selected', function(e, datum){
				window.location.href= $scope.id+"/course/"+datum.id;
				console.log($scope.id+"/course/"+datum.id);
			});

			$('#search-tool .tt-dropdown-menu').css({
				'top':'',
				'bottom':'153%',
				'width' : '113%'
			});

			$('#search-tool .tt-dropdown-menu').watch('display', function() {
				$('#search-tool .tt-dropdown-menu').css('left','-29px');
			});

			//Which column is currently selected?
			$scope.selectedColumn = function(i) {
				if(i == 3){
					return $scope.curriculumSelected != null && $scope.yearSelected != null;
				} else if(i==2){
					return $scope.yearSelected == null && $scope.curriculumSelected != null;
				} else {
					return $scope.curriculumSelected == null && $scope.yearSelected == null;
				}
			}

			$scope.resize = function(height) {
				$('#year').height(height);
				$('#course').height(height);
			}


			$scope.curriculumClick = function(c) {
				if($scope.curriculumSelected == c){
					$scope.curriculumSelected = null;
					$scope.yearSelected = null;
				}
				else if($scope.curriculumSelected != c && $scope.curriculumSelected != null){
					$scope.yearSelected = null;
					$scope.curriculumSelected = c;
				}
				else {
					$scope.curriculumSelected = c;
				}
			}


			$scope.yearClick = function(c) {
				if($scope.yearSelected == c)
					$scope.yearSelected = null;
				else {

					$scope.courses = [];
					$scope.yearSelected = c;
					
					$http({method:'GET', url: '/query/curriculums.json',
						params: {
							id: $scope.curriculumSelected.id,
							year: c.y,
							semester: c.s
						}
					}).success(function(data) {
						$scope.courses = data;
					});
				}
			}

			$scope.init = function(id) {
				$scope.id = id;
				$http({method:'GET', url: '/faculties/' + id + '.json'}).
						success(function(data){
							$scope.curriculums = data.curriculums;		
						});
				$scope.years = [
					{y:1,s:1},
					{y:1,s:2},
					{y:2,s:1},
					{y:2,s:2},
					{y:3,s:1},
					{y:3,s:2},
						{y:4,s:1},
					{y:4,s:2}
				];

				$scope.courses = [];
			}

			$scope.curriculumSelected = null;
			$scope.yearSelected = null;

			initSearchBar();

			var mainHeight = function(){return $('#nav-main').height(); }
			
			$scope.$watch(mainHeight, function(newValue, oldValue){
				if(newValue != oldValue) $scope.resize(newValue);
			});
			
		}]);