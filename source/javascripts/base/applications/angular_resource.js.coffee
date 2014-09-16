class @AngularResource extends AngularService

  @inject 'Restangular'

  @url: (baseUrl) ->
    @baseUrl = baseUrl

  constructor: (args...) ->
    super(args...)
    @base = @Restangular.one(@constructor.baseUrl)

  index: (conditions) =>
    @base.getList('', conditions)

  show: (id) =>
    @Restangular.all(@constructor.baseUrl).get(id)

  create: (object) =>
    @Restangular.all(@constructor.baseUrl).post(object)


