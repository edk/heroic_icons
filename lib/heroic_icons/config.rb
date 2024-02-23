module HeroicIcons
  class << self
    attr_accessor :configuration
  end

  def self.configure
    self.configuration ||= Configuration.new
    yield(configuration)
  end

  class Configuration
    attr_accessor :default_classes

    def initialize
      @default_classes = ""
    end
  end
end
