require "nokogiri"

module HeroicIcons
  class IconNotFound < RuntimeError
  end

  class Icons
    # Updated method signature to accept name and a hash for additional options
    def icon(name, **options)
      # Determine file path based on the new directory structure
      file_path = determine_file_path(name, options)

      begin
        file_data = File.read(file_path)
      rescue
        raise HeroicIcons::IconNotFound, "Icon not found: #{name}"
      end

      # Modify SVG with additional attributes if any
      file_data = modify_svg(file_data, name, options) unless options.empty?

      file_data.html_safe
    end

    private

    def determine_file_path(name, options)
      hi_style = options[:hi_style] || "solid"
      size_directory = case options[:size]
      when "micro"
        "20"
      when "mini"
        "16"
      else
        "24" # Default to "regular" size
      end

      # For micro and mini sizes, force to solid for now
      style_directory = (size_directory == "20" || size_directory == "16") ? "solid" : hi_style

      File.join(__dir__, "icons", size_directory, style_directory, "#{name}.svg")
    end

    def modify_svg(file_data, name, options)
      frag = Nokogiri::HTML.fragment(file_data)
      svg = frag.at_css("svg")

      options.each do |key, value|
        next if key == :hi_style || key == :size
        svg.set_attribute(key.to_s, value)
      end

      # For accessibility
      svg.set_attribute("alt", name) unless options.key?(:alt)

      frag.to_s
    end
  end
end
