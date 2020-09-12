namespace :timex do
  desc 'Collect Products'
  task :collect_products => :enviroment do
    store = Store.where(name: 'Timex').first
    unless store.nil?
      begin
        response = Faraday.get(store.api)
      rescue => exception
        puts "Timex Products API it's with problem"
      end
    end
  end
end