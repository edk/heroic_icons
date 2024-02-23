# lib/heroic_icons/config.rb

module HeroicIcons
  class << self
    def configuration
      @configuration ||= Configuration.new
    end

    def configure
      yield(configuration)
    end
  end

  class Configuration
    attr_accessor :default_classes

    def initialize
      @default_classes = ""
    end
  end
end
