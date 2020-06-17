require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module ElTraining
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 6.0
    # 表示TimeZone
    config.time_zone = 'Tokyo'

    # DB保存時間をlocal(Tokyo)にする
    config.active_record.default_timezone = :local

    # i18n
    config.i18n.default_locale = :ja

    # config.paths.add 'lib', eager_load: true
    # config.autoload_paths += %W(#{config.root}/lib)
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
  end
end
