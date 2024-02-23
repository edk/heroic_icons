require "heroic_icons/heroic_icons"

module HeroicIcons
  module ViewHelper
    def heroicon(name, **options)
      HeroicIcons::Icons.new.icon(name, **options)
    end
  end
end
