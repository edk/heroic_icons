# frozen_string_literal: true

require "test_helper"

class TestHeroicIcons < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::HeroicIcons::VERSION
  end

  def test_icon_with_default_classes
    HeroicIcons.configure do |config|
      config.default_classes = "default-class"
    end

    rendered_icon = HeroicIcons::Icons.new.icon("plus")
    assert_includes rendered_icon, "default-class"
  end

  def test_icon_with_default_class_override
    HeroicIcons.configure do |config|
      config.default_classes = "default-class"
    end

    rendered_icon = HeroicIcons::Icons.new.icon("plus", override_class: "override-class")
    refute_includes rendered_icon, "default-class"
    assert_includes rendered_icon, "override-class"
  end

  def test_icon_not_found
    assert_raises(HeroicIcons::IconNotFound) do
      HeroicIcons::Icons.new.icon("nonexistent")
    end
  end
end
