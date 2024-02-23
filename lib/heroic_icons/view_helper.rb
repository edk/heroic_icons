module HeroicIcons
  module ViewHelper
    def icon(name, **options)
      HeroIcons.new.icon(name, **options)
    end
  end
end
