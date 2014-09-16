class IndexController extends AngularController
  @register App
  @inject '$http'

  initialize: =>
    unless @$rootScope.AuthService.validateUser()
      @$rootScope.$state.go 'login'

