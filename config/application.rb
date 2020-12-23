# frozen_string_literal: true

require_relative "boot"

require "rails/all"

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module AlphaBlog
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0

    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.

    # Look for models in the sub-dirs we have for the different sub-apps.
    # byebug
    # config.autoload_paths += Dir[Rails.root.join("app", "models", "{*/}")]
    # ActiveSupport::Dependencies.autoload_paths += Dir[Rails.root.join("app", "models", "{*/}")]
    # brk = true

    # Pre-Rails 6
    # config.autoloader = :classic

    # `Rails` is undefined... Rails.root.join("app", "models", "{*/}")
    autoload :Article, "app/models/blog/article.rb"
    autoload :Category, "app/models/blog/category.rb"
    autoload :ArticleCategory, "app/models/blog/article_category.rb"
  end
end
