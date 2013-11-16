App.factory "Trade", ["$resource", ($resource) ->
  $resource "/trades/:id.json", {id:'@id'},
    update:
      method: "PUT"
]

App.factory 'TradeMessage', ['$resource', ($resource) ->
  $resource '/trade_messages.json'
]

App.factory 'HaveCourse', ['$resource', ($resource) ->
  $resource '/have_courses.json'
]

App.factory 'WantCourse', ['$resource', ($resource) ->
  $resource '/want_courses.json'
]

App.factory 'Professor', ['$resource', ($resource) ->
  $resource '/professors.json'
]

App.factory 'Teach', ['$resource', ($resource) ->
  $resource '/professors.json'
]