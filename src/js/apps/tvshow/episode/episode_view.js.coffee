@Kodi.module "TVShowApp.Episode", (Episode, App, Backbone, Marionette, $, _) ->


  class Episode.EpisodeTeaser extends App.Views.CardView
    triggers:
      "click .play" : "episode:play"
    initialize: ->
      super
      @model.set({label: @model.get('title'), subtitle: 'Episode ' + @model.get('episode')})

  class Episode.Empty extends App.Views.EmptyView
    tagName: "li"
    className: "episode-empty-result"

  class Episode.Episodes extends App.Views.CollectionView
    childView: Episode.EpisodeTeaser
    emptyView: Episode.Empty
    tagName: "ul"
    className: "card-grid--episode"


  class Episode.PageLayout extends App.Views.LayoutWithHeaderView
    className: 'episode-show detail-container'

  class Episode.HeaderLayout extends App.Views.LayoutDetailsHeaderView
    className: 'episode-details'

  class Episode.Details extends App.Views.ItemView
    template: 'apps/tvshow/episode/details_meta'
    triggers:
      'click .play': 'episode:play'
      'click .add': 'episode:add'
      'click .stream': 'episode:stream'
      'click .download': 'episode:download'
      
  class Episode.EpisodeDetailTeaser extends App.Views.CardView
    tagName: "div"
    className: "card-detail"
    triggers:
      "click .menu" : "episode-menu:clicked"

  class Episode.Content extends App.Views.LayoutView
    template: 'apps/tvshow/episode/content'
    className: "episode-content content-sections"
