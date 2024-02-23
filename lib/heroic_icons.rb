# frozen_string_literal: true

require_relative "heroic_icons/version"

module HeroicIcons
  class Error < StandardError; end

  # Method to define the gem's root directory
  def self.root(path = nil)
    base = File.expand_path("../..", __FILE__)
    path ? File.join(base, path) : base
  end
end
