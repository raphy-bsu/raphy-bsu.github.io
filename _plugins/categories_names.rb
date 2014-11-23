require 'yaml'
require_relative 'cache'

module Jekyll
  module CategoriesNames
    def category_name(name)
      config = lazy('categories'){ YAML.load_file  File.expand_path(File.join(__FILE__, "../../", "categories.yml")) }
      config[name] || name
    end
  end
end

Liquid::Template.register_filter(Jekyll::CategoriesNames)
