require("sinatra")
require("sinatra/reloader")
also_reload("lib/**/*.rb")
require("./lib/client")
require("./lib/stylist")
require("pg")

DB = PG.connect({:dbname => "hair_salon"})

get('/') do
  erb(:index)
end

post('/stylists') do
  name = params.fetch('stylists')
  stylist = Stylist.new({:name => name, :id => nil})
  stylist.save()
  @stylists = Stylist.all()
  @clients = Client.all()
  erb(:index)
end

get("/stylists/:id") do
  @stylist = Stylist.find(params.fetch("id").to_i())
  erb(:index)
end

post('/clients') do
  name = params.fetch('clients')
  stylist_id = params.fetch('stylist_id').to_i()
  client = Client.new({:name => name, :id => nil, :stylist_id => stylist_id})
  client.save()
  @stylists = Stylist.all()
  @clients = Client.all()
  erb(:index)
end
