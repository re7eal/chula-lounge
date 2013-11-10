App.controller 'MainTradeController', ['$scope', 'Trade', ($scope, Trade) ->

  $scope.initTrades = ->
    $scope.page = 1
    $scope.more = true
    $scope.trades = Trade.query
      page : $scope.page
    , ((response) ->

    ), (response) ->
      console.log "Error" + response.status

  $scope.loadMoreTrades = ->
    Trade.query
      page : ++$scope.page
    , ((response) ->
      if response.length is 0
        $scope.more = false
      else
        $scope.trades.push.apply $scope.trades, response
    ), (response) ->
      console.log "Error" + response.status

]

App.controller 'NewTradeController', ['$scope', 'HaveCourse', 'WantCourse', 'Trade', ($scope, HaveCourse, WantCourse, Trade) ->
 
  $scope.haveCourses = []
  $scope.haveCourseNo = ""
  $scope.haveCourseName = ""
  $scope.haveCourseSection = ""

  $scope.wantCourses = []
  $scope.wantCourseNo = ""
  $scope.wantCourseName = ""
  $scope.wantCourseSection = ""

  $scope.tradeNote = ""

  $scope.errorMessage = ""

  $scope.haveAddCourse = ->
    if ($scope.haveCourseNo is "") or ($scope.haveCourseName is "") or ($scope.haveCourseSection is "")
      $scope.errorMessage = "Please enter a value in all input fields"
      $scope.alert = true
      return

    $scope.alert = false

    $scope.haveCourses.push
      course_number: $scope.haveCourseNo
      course_name: $scope.haveCourseName
      course_section: $scope.haveCourseSection

    $scope.haveCourseNo = ""
    $scope.haveCourseName = ""
    $scope.haveCourseSection = ""

  $scope.haveRemoveCourse = (index) ->
    $scope.haveCourses.splice index, 1

  $scope.wantAddCourse = ->
    if ($scope.wantCourseNo is "") or ($scope.wantCourseName is "") or ($scope.wantCourseSection is "")
      $scope.errorMessage = "Please enter a value in all input fields"
      $scope.alert = true
      return

    $scope.alert = false

    $scope.wantCourses.push
      course_number: $scope.wantCourseNo
      course_name: $scope.wantCourseName
      course_section: $scope.wantCourseSection

    $scope.wantCourseNo = ""
    $scope.wantCourseName = ""
    $scope.wantCourseSection = ""

  $scope.wantRemoveCourse = (index) ->
    $scope.wantCourses.splice index, 1

  $scope.checkInput = ->
    if ($scope.haveCourses.length <= 0) and ($scope.wantCourses.length <= 0)
      $scope.errorMessage = "Empty trade post"
      $scope.alert = true
      return true

  $scope.postTrade = ->
    if $scope.checkInput()
      return
    else
      $scope.working = true
      Trade.save
        note : $scope.tradeNote
        have_courses : $scope.haveCourses
        want_courses : $scope.wantCourses
      , ((response) ->
        console.log "Success"
        $scope.working = false
        window.location.href = "/trades/" + response.id
        ), (response) ->
          $scope.working = false
          console.log "Error" + response.status

]

App.controller 'TradeController', ['$scope', 'Trade', 'TradeMessage', ($scope, Trade, TradeMessage) ->

  $scope.tradeMessages = []
  $scope.message = ""
  $scope.finished = ""

  $scope.initShowTrade = (id) ->
    $scope.loadTradeMessages()
    $scope.loadTrade(id)

  $scope.loadTrade = (id) ->
    $scope.trade = Trade.get
      id : id
    , ((response) ->
      $scope.trade = response
      $scope.finished = "finished"  if response.finished
    ), (response) ->
      console.log "Error" + response.status
    

  $scope.loadTradeMessages = ->
    $scope.tradeMessages = TradeMessage.query(((response) ->

    ), (response) ->
      console.log "Error" + response.status
    )

  $scope.updateTradeNote = (id) ->
    Trade.update
      id : id
      note : $scope.trade.note
    , ((response) ->
      $scope.alert = false
      $scope.trade.note = response.note
      ), (response) ->
        $scope.errorMessage = "Error updating trade note"
        $scope.alert = true
        $scope.trade.note = $scope.tmpTradeNote
        console.log "Error" + response.status

  $scope.updateFinished = (id) ->
    Trade.update
      id : id
      finished : true
    , ((response) ->
      $scope.alert = false
      $scope.trade.finished = response.finished
      $scope.finished = "finished"
      ), (response) ->
        $scope.errorMessage = "Error updating trade"
        $scope.alert = true
        console.log "Error" + response.status

  $scope.postTradeMessage = ->
    if $scope.message is ""
      return
    else
      $scope.working = true
      TradeMessage.save
        content : $scope.message
      , ((response) ->
        $scope.alert = false
        $scope.tradeMessages.push response
        $scope.message = ""
        $scope.working = false
        ), (response) ->
          $scope.errorMessage = "Error posting message"
          $scope.alert = true
          $scope.working = false
          console.log "Error" + response.status

]

App.controller 'MyTradeController', ['$scope', 'Trade', ($scope, Trade) ->

  $scope.updateFinished = (id) ->
    Trade.update
      id : id
      finished : true
    , ((response) ->
      $scope.alert = false
      $scope.finished = "finished"
      ), (response) ->
        $scope.errorMessage = "Error updating trade"
        $scope.alert = true
        console.log "Error" + response.status

]