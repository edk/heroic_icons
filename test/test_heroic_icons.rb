# frozen_string_literal: true

require "test_helper"

class TestHeroicIcons < Minitest::Test
  def test_that_it_has_a_version_number
    refute_nil ::HeroicIcons::VERSION
  end

  def test_icon_not_found
    assert_raises(HeroicIcons::IconNotFound) do
      HeroicIcons::Icons.new.icon('nonexistent')
    end
  end

end
