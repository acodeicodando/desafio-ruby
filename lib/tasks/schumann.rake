namespace :schumann do
  desc 'Collect Products'
  task :collect_products => :environment do
    store = Store.where(name: 'Schumann').first
    unless store.nil?
      begin
        response = Faraday.get(store.api)
      rescue => exception
        puts "Schumann Products API it's with problem"
      end
    end
  end
end