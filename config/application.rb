require_relative "boot"

require "rails/all"

Bundler.require(*Rails.groups)

module App
  class Application < Rails::Application
    config.load_defaults 7.2

    config.autoload_lib(ignore: %w[assets tasks])

    config.i18n.default_locale = :ja

    config.generators do |g|
      g.test_framework :rspec,
        fixtures: false,
        view_specs: false,
        helper_specs: false,
        routing_specs: false,
        controller_specs: false,
        request_specs: true

      g.fixture_replacement :factory_bot, dir: "spec/factories"

      g.helper false
      g.assets false
      g.stylesheets false
      g.javascripts false

      g.skip_routes true
    end
  end
end
