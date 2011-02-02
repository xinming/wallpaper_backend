# Load the rails application
require File.expand_path('../application', __FILE__)


ENV['RAILS_ASSET_ID'] = ''
PUBLIC_FOLDER = File.expand_path('../../public', __FILE__)
# Initialize the rails application
Wallpaper::Application.initialize!
