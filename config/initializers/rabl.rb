require 'rabl'
Rabl.configure do |config|
  config.include_json_root = false
  config.cache_all_output = true
  config.include_child_root = false
  config.view_paths = [Rails.root.join('app', 'views')]
end