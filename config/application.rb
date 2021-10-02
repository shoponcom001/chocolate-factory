require_relative 'boot'

require 'rails/all'

# Require the gems listed in Gemfile, including any gems
# you've limited to :test, :development, or :production.
Bundler.require(*Rails.groups)

module ChocolateFactory
  class Application < Rails::Application
    # Initialize configuration defaults for originally generated Rails version.
    config.load_defaults 5.2
    config.paths.add 'lib', eager_load: true
    config.i18n.default_locale = :ja
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration can go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded after loading
    # the framework and any gems in your application.
  end

  {"responses"=>[
    {"labelAnnotations"=>[
      {"mid"=>"/m/01yrx", "description"=>"Cat", "score"=>0.99598557, "topicality"=>0.99598557},
      {"mid"=>"/m/04rky", "description"=>"Mammal", "score"=>0.9890478, "topicality"=>0.9890478},
      {"mid"=>"/m/09686", "description"=>"Vertebrate", "score"=>0.9851104, "topicality"=>0.9851104},
      {"mid"=>"/m/07k6w8", "description"=>"Small to medium-sized cats", "score"=>0.978553, "topicality"=>0.978553},
      {"mid"=>"/m/0307l", "description"=>"Felidae", "score"=>0.96784574, "topicality"=>0.96784574},
      {"mid"=>"/m/01l7qd", "description"=>"Whiskers", "score"=>0.9676093, "topicality"=>0.9676093},
      {"mid"=>"/m/0k8hs", "description"=>"Domestic long-haired cat", "score"=>0.9523555, "topicality"=>0.9523555},
      {"mid"=>"/m/09b5_s", "description"=>"Asian semi-longhair", "score"=>0.939401, "topicality"=>0.939401},
      {"mid"=>"/m/01lrl", "description"=>"Carnivore", "score"=>0.9342105, "topicality"=>0.9342105},
      {"mid"=>"/m/08b02s", "description"=>"British semi-longhair", "score"=>0.92185485, "topicality"=>0.92185485}]
    }
  ]
}
end
