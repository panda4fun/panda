@App.config [
  '$stateProvider',
  '$urlRouterProvider',

  ($stateProvider, $urlRouterProvider) ->

    $urlRouterProvider.otherwise('/')

    $stateProvider
#   base
    .state 'index',
      url: ''
      controller: 'IndexController'
      templateUrl: 'app/views/index'

#   login
    .state 'login',
      url: '/login'
      controller: 'LoginController'
      templateUrl: 'app/views/login'

]