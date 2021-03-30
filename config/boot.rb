# require kimurai gem and all modules
require 'kimurai'
require 'kimurai/all'

# require project gems
require 'bundler/setup'
Bundler.require(:default, Kimurai.env)

# require custom env variables located in .env file
require 'dotenv/load'

# require initializers
Dir.glob(File.join("./config/initializers", "*.rb"), &method(:require))

# require helpers
Dir.glob(File.join("./helpers", "*.rb"), &method(:require))

# require pipelines
Dir.glob(File.join("./pipelines", "*.rb"), &method(:require))

# require crawlers recursively in the crawlers folder
require_relative '../crawlers/application_crawler'
require_all "crawlers"

# require kimurai configuration
require_relative 'application'
