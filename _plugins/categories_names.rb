require 'yaml'

module Jekyll
  module CategoriesNames
    def category_name(name)
      config = YAML.load_file  File.expand_path(File.join(__FILE__, "../../", "categories.yml"))
      puts config.inspect
      config[name] || name
    end
  end
end

Liquid::Template.register_filter(Jekyll::CategoriesNames)
