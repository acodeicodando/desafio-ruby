require 'api_fossil'
namespace :fossil do
  desc 'Collect Products'
  task :collect_products => :environment do
    store = API::Fossil.new
    store.run
  end
end