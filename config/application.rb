require_relative 'boot'
require 'rails/all'
Bundler.require(*Rails.groups)
module NisegramApp
  class Application < Rails::Application
    config.load_defaults 5.2
    config.time_zone = 'Tokyo'
    config.i18n.default_locale = :ja
    config.active_record.default_timezone = :local
    config.generators do |g|
      g.assets false
      g.helper false
    end
  end
end