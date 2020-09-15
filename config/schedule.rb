every 30.minutes do
  rake "timex:collect_products"
  rake "fossil:collect_products"
  rake "schumann:collect_products"
end