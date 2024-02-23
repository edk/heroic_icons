
Originally based on the work originally done by https://github.com/andrewjmead  Full credit goes to him, though I ended up rewriting a bunch of it.

# Heroicons for Rails
Use icons from [heroicons.com](https://heroicons.com) in your Rails applications.

## Installation
Add this line to your application's Gemfile:

```ruby
gem "heroic_icons", git: "https://github.com/edk/heroic_icons"
```

Pick a ref, tag or branch as needed.

And then execute:
```bash
$ bundle
```

## Usage

To use the icon method, you need to specify the icon name and optionally pass additional attributes to add to the SVG.

```
heroic_icon(name, **options)
```

* `name`: The name of the icon you want to use. e.g. "plus", "trash", etc. Refer to the heroicons website.
* `**options`: A hash of options to customize the SVG. This is optional and can include several attributes described below.

The following options can be passed to customize the SVG icon:

* `hi_style:` Specifies the style of the icon for regular sizes. It can be either `outline` or `solid`. `solid` the default.  Solid is the only choice for mini and micro.
* `style`: This does not specify the heroicon style, but instead, the value of the style attribute of the svg element.
* `size:` There are 3 sizes. `micro`, `mini`, and `regular` (default).
* `class:` Sets the CSS attr of the SVG element.  If using default classes (see below) this is added to the default classes.
* `override_class:` Sets the CSS attr of the SVG element, and does NOT use the default classes.
* Any other HTML attributes: You can include attributes such as aria-label, role, etc.

### default class initialization

Create an initializer:
```
# config/initializers/heroic_icons.rb

HeroicIcons.configure do |config|
  config.default_classes = "h-6 w-6"
end
```

### Icon Usage Examples

```
<%= icon('camera', hi_style: 'outline') %>
```

To include a outline icon of mini size:

```
<%= icon('user', size: 'mini') %>
```

```
<%= icon('bell', class: 'alert-icon', 'aria-label': 'Notification') %>
```

BREAKING CHANGE:  Sorry, I decided to make a breaking change (it's a different gem after all)
to allow heroicon styles (outline, solid, etc) to be passed via `:hi_styles` option.
This was previously passed via the `:styles` option.
This is to allow for passing in actual styles to the the svg element.

## License
The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).
