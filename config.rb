require 'uglifier'
###
# Compass
###

compass_config do |config|
  # Require any additional compass plugins here.
  #config.add_import_path "bower_components/foundation/scss"

  # Set this to the root of your project when deployed:
  config.http_path = "/"
  config.css_dir = "stylesheets"
  config.sass_dir = "stylesheets"
  config.images_dir = "images"
  config.javascripts_dir = "javascripts"

  # You can select your preferred output style here (can be overridden via the command line):
  # output_style = :expanded or :nested or :compact or :compressed

  # To enable relative paths to assets via compass helper functions. Uncomment:
  # relative_assets = true

  # To disable debugging comments that display the original location of your selectors. Uncomment:
  # line_comments = false


  # If you prefer the indented syntax, you might want to regenerate this
  # project again passing --syntax sass, or you can uncomment this:
  # preferred_syntax = :sass
  # and then run:
  # sass-convert -R --from scss --to sass sass scss && rm -rf sass && mv scss sass

end

# Change Compass configuration
# compass_config do |config|
#   config.output_style = :compact
# end

###
# Page options, layouts, aliases and proxies
###

# Per-page layout changes:
#
# With no layout
# page "/path/to/file.html", :layout => false
#
# With alternative layout
# page "/path/to/file.html", :layout => :otherlayout
#
# A path which all have the same layout
# with_layout :admin do
#   page "/admin/*"
# end

# Proxy (fake) files
# page "/this-page-has-no-template.html", :proxy => "/template-file.html" do
#   @which_fake_page = "Rendering a fake page with a variable"
# end

###
# Helpers
###

# Automatic image dimensions on image_tag helper
# activate :automatic_image_sizes

# Methods defined in the helpers block are available in templates
# helpers do
#   def some_helper
#     "Helping"
#   end
# end

# Use LiveReload
# activate :livereload

# Compass configuration
set :css_dir, 'stylesheets'

set :js_dir, 'javascripts'

set :images_dir, 'images'

# Build-specific configuration
configure :build do
  ignore 'images/*.psd'

  ignore 'stylesheets/base/*'
  ignore 'stylesheets/modules/*'
  ignore 'stylesheets/templates/*'

  ignore 'javascripts/app/*'
  ignore 'javascripts/base/*'
  ignore 'javascripts/vendor/*'

  # For example, change the Compass output style for deployment
  activate :minify_css

  # Minify Javascript on build
  activate :minify_javascript
  set :js_compressor, Uglifier.new(mangle: false)

  # Enable cache buster
  activate :asset_hash

  # Use relative URLs
  activate :relative_assets

  # Compress PNGs after build
  # First: gem install middleman-smusher
  # require "middleman-smusher"
  # activate :smusher

  # Or use a different image path
  # set :http_path, "/Content/images/"
end
# activate :deploy do |deploy|
#   deploy.build_before = true
#   deploy.method = :rsync
#   deploy.host   = ''
#   deploy.user   = 'deploy'
#   deploy.path   = '/u/'
# end

Angular::Html2js.configure do |config|
  config.module_name = 'AppTemplates'
end
