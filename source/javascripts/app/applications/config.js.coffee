@baseApiPath = ''

@App.run ['$rootScope', '$state', '$stateParams', 'AuthService', '$http', ($rootScope, $state, $stateParams, AuthService, $http) ->

  $rootScope.$state = $state
  $rootScope.$stateParams = $stateParams
  $rootScope.AuthService = AuthService
  $http.get("#{baseApiPath}/auth").then (respons) =>
    $rootScope.AuthService.setUser respons.data.data
    $rootScope.AuthService.redirect()

]

@App.config [
  '$locationProvider',
  '$compileProvider',

  ($locationProvider, $compileProvider) ->

    $compileProvider.aHrefSanitizationWhitelist(/^\s*(https?|ftp|mailto|skype):/)

]