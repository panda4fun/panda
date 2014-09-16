class AuthService extends AngularService
  @register App

  @inject '$http', '$state'

  signIn: (user) =>
    @$http.post "#{baseApiPath}/auth", user

  signOut: =>
    @$http.delete "#{baseApiPath}/auth"

  validateUser: =>
    @user?

  getUser: =>
    @user

  setUser: (user) =>
    @user = user

  redirect: =>

