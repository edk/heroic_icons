# frozen_string_literal: true

require_relative "heroic_icons/version"
require "action_view"
require "heroic_icons/view_helper"

module HeroicIcons
  class Error < StandardError; end

  def self.root
    File.dirname(__dir__)
  end
end

# ActionView::Base.send :include, HeroicIcons::ViewHelper
