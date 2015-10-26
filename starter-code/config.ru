require 'rubygems'
require 'bundler'
Bundler.require

# Models
require "./models/course"
require "./models/ingredient"
require "./models/recipe"

# Controllers
require "./app"

run RecipeApp