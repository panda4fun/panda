class LoginController extends AngularController
  @register App

  signIn: (user) =>
    @$rootScope.AuthService.signIn(user).then (respons) =>
      @$rootScope.AuthService.setUser respons.data.data
      @$rootScope.AuthService.redirect()
    , (respons) =>
      console.log 'error'

  signOut: =>
    @$rootScope.AuthService.signOut().then (respons) =>
      @$rootScope.$state.go 'login'