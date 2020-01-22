require 'bundler/setup'
Bundler.require()

#silence AR logger
ActiveRecord::Base.logger = nil 

require_all 'lib'