# frozen_string_literal: true

require_relative "lib/heroic_icons/version"

Gem::Specification.new do |spec|
  spec.name = "heroic_icons"
  spec.version = HeroicIcons::VERSION
  spec.authors = ["Ed Kim"]
  spec.email = ["54091+edk@users.noreply.github.com"]

  spec.summary = "Render heroicons svg inline"
  spec.description = "Simple render heroicons svg inline"
  spec.homepage = "https://github.com/edk/heroic_icons"
  spec.license = "MIT"
  spec.required_ruby_version = ">= 2.6.0"

  spec.metadata["allowed_push_host"] = "https://rubygems.org"

  spec.metadata["homepage_uri"] = spec.homepage
  spec.metadata["source_code_uri"] = "https://github.com/edk/heroic_icons"
  spec.metadata["changelog_uri"] = "https://github.com/edk/heroic_icons/blob/main/CHANGELOG.md"

  spec.files = Dir.chdir(__dir__) do
    `git ls-files -z`.split("\x0").reject do |f|
      (File.expand_path(f) == __FILE__) ||
        f.start_with?(*%w[bin/ test/ spec/ features/ .git .github appveyor Gemfile])
    end
  end
  spec.bindir = "exe"
  spec.executables = spec.files.grep(%r{\Aexe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  spec.add_runtime_dependency "actionview", ">= 6.0"
  spec.add_dependency "nokogiri", ">= 1.14"

  spec.add_development_dependency "minitest", ">= 5.16"
  spec.add_development_dependency "appraisal"
  spec.add_development_dependency "pry"
end
