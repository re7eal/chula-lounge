App.controller 'ApplicationController', ['$scope', ($scope) ->

  $scope.formatDate = (date) ->
    d_names = new Array("Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat")
    m_names = new Array("Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Aug", "Sep", "Oct", "Nov", "Dec")
    d = new Date(date)
    curr_day = d.getDay()
    curr_date = d.getDate()
    curr_month = d.getMonth()
    curr_year = d.getFullYear()
    curr_hour = ("0" + d.getHours()).slice(-2)
    curr_min = ("0" + d.getMinutes()).slice(-2)
    curr_sec = ("0" + d.getSeconds()).slice(-2)
    d_names[curr_day] + ", " + curr_date + " " + m_names[curr_month] + " " + curr_year + " " + curr_hour + ":" + curr_min + ":" + curr_sec

]