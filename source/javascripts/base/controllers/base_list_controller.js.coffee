class @BaseListController extends AngularController

  @inject '$location', 'PreloaderService'

  initialize: =>
#   Обявляем данные для content и filter контроллеров
    @$scope.items = []
    @$scope.total = 0
    @$scope.conditions = {
      pager:  {}
      filter: {}
    }

    @_preloaderPub()

#   Парсим url при инициализации контроллера и получаем исходные данные
    @_parse_query()

#   Изменяем url и подгружаем данные при изменении фильтра или пагинатора
    @$scope.$watch 'conditions', =>
      @$location.search @_queryHash()
      @_reload @_queryHash(), false
    , true

    @$rootScope.$on 'reload', () =>
      @_reload @_queryHash(), false

# private
  _queryHash: =>
    angular.extend {}, @$scope.conditions.filter, @$scope.conditions.pager

  _parse_query: =>
    queryHash = @$location.search()
    @$scope.conditions.pager.page = queryHash.page
    @$scope.conditions.pager.per_page = queryHash.per_page
    delete queryHash.page
    delete queryHash.per_page
    @$scope.conditions.filter = queryHash

  _reload: (conditions, union) =>
    @_loadStart()
    @_getData(conditions, union)

  _getData: (conditions, union) =>
    @resource().index(conditions).then (list) =>
      @$scope.total = list.meta.pager.total_records
      #      @$scope.items = if union? then _.union @$scope.items || [], list else list
      @$scope.items = list
      @_loadStop()

  _preloaderPub: =>

  _loadStart: =>

  _loadStop: =>