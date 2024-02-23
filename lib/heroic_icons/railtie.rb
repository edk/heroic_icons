module HeroicIcons
  class Railtie < ::Rails::Railtie
    initializer "heroic_icons.view_helpers" do
      ActiveSupport.on_load(:action_view) do
        include HeroicIcons::ViewHelper
      end
    end
  end
end
