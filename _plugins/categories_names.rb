require 'yaml'
require_relative 'cache'

module Jekyll
  module CategoriesNames
    def category_name(name)
      filename = File.expand_path(File.join(__FILE__, "../../", "categories.yml"))
      config = YAML.load_file filename
      config[name] || name
    end
  end
end

Liquid::Template.register_filter(Jekyll::CategoriesNames)
