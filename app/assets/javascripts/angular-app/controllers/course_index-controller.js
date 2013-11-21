App.controller('PageCourseIndex', ['$scope', '$http', function($scope, $http){

	var focus_duration = 800;
	

	//Description
	$scope.message = "Click to expand";
	$scope.toggleDescription= false;
	$scope.lock = false;
	
	$scope.expandDescription = function() {
	  if(!$scope.lock){
	  	$scope.lock = true;
		if($scope.toggleDescription){
			$("#description").fadeOut(focus_duration, function() {
				$scope.lock = false;
				$scope.toggleDescription = false;
				$scope.message = "Click to hide";
			});
		} else {
			$("#description").fadeIn(focus_duration, function() {
				$scope.lock = false;
				$scope.toggleDescription = true;
				$scope.message = "Click to expand";
			});
		}
	  }
	}

	$scope.formatDate = function (date) {
	    d_names = new Array("Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat");
	    m_names = new Array("Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec");
	    d = new Date(Date.parse(date));
	    curr_day = d.getDay();
	    curr_date = d.getDate();
	    curr_month = d.getMonth();
	    curr_year = d.getFullYear();
	    curr_hour = ("0" + d.getHours()).slice(-2);
	    curr_min = ("0" + d.getMinutes()).slice(-2);
	    curr_sec = ("0" + d.getSeconds()).slice(-2);
    return curr_date + " " + m_names[curr_month] + " " + curr_year + " " + curr_hour + ":" + curr_min + ":" + curr_sec;
 	}

	var average = function(array, name) {
		if(array.length > 0) {
			var sum = 0;
			for(var i = 0; i < array.length; i++){
				sum += array[i][name];
			}
			return Math.round(sum/array.length*10)/10;
		} else {
			return 'NaN';
		}
	}

	var readjustTeach = function(tArray) {
		//format
		var f = {
			year: 2013,
			professors: []
		}
     
		f = [];

		angular.forEach(tArray, function(value, key) {
			f.push({year: parseInt(key), professors:value});
		});

		return f;

	}
	var topComments = function(array) {
		if(array.length > 2) {
			var index1 = 0;
			var index2 = 1;

			for(var i =2;i<array.length;i++){
				
				if(array[index1].likes == array[i].likes){
					index1 = (array[index1].dislikes < array[i].dislikes) ? index1 : i
				}
				else if(array[index2].likes == array[i].likes){
					index1 = (array[index2].dislikes < array[i].dislikes) ? index1 : i
				}
				else if(array[index1].likes < array[i].likes ||
				   array[index2].likes < array[i].likes){
					
					if(array[index1].likes < array[i].likes && array[index2].likes > array[i].likes)
						index1 = i;
					else
						index2 = i;
				} 
			}

			return [array[index1], array[index2]];
		}
		else {
			return array;
		}
	}

	$scope.review = function() {
		var value = $('#review-post').val();
		if($scope.user_id != undefined && value != ''){
			var comment = {
				content: value,
				user_id: $scope.user_id,
				course_id: $scope.course_id
			}

			$http({method:'POST', url:'/comments.json', data:comment}).success(function(data) {
				$('#review-post').val('');
				data.like = false;
				data.dislike = false;
				data.created_at = $scope.formatDate(data.created_at);
				$scope.comments.push(data);
				$scope.top_comments = topComments($scope.comments);
			}).error(function(data) {

			})
;		}
	}
	$scope.like = function(comment) {
		$http({method:'POST', url:'/comments/' + comment.id + '/like'}).success(function(data, status) {
			if(status == 202) { //like
				comment.like = true;
				comment.likes = data;
			} else if(status == 203) { //unlike
				comment.like = false;
				comment.likes = data;
			}
		}).error(function(data) {
		});
	}
	$scope.dislike = function(comment) {
		$http({method:'POST', url:'/comments/' + comment.id + '/dislike'}).success(function(data,status) {
			if(status == 202) { //like
				comment.dislike = true;
				comment.dislikes = data;
			} else if(status == 203) { //unlike
				comment.dislike = false;
				comment.dislikes = data;
			}
		}).error(function(data) {
		});
	}

	$scope.init = function(id,userid) {
	$scope.course_id = id;
	if(userid != undefined) {
		$scope.user_id = userid;
		$scope.has_user = true;
	} else {
		$scope.user_id = null;
		$scope.has_user = false;
	}

	$http({method:'GET', url: '/courses/' + id + '.json'}).
		  success(function(data) {
		  		$scope.course = data;
				for(var i =0; i < $scope.course.comments.length; i++) {
					$scope.course.comments[i].created_at = $scope.formatDate($scope.course.comments[i].created_at);
				}
				$scope.comments = $scope.course.comments;
				$scope.top_comments = topComments($scope.comments);
				$scope.teaches = readjustTeach($scope.course.teaches);
				$scope.rating = {
					know_rating : average($scope.course.ratings,'know_rating'),
					diff_rating : average($scope.course.ratings,'diff_rating'),
					grade_rating : average($scope.course.ratings,'grade_rating')
				}

			}).error(function(data){

				console.log(data);
			});
	}

	
}]);