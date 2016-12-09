require("sinatra")
require("sinatra/reloader")
also_reload("lib/**/*.rb")
require("./lib/client")
require("./lib/stylist")
require("pg")

DB = PG.connect({:dbname => "hair_salon"})

get('/') do
  @stylists = Stylist.all()
  @clients = Client.all()
  erb(:index)
end

post('/new_stylists') do
  name = params.fetch('stylist')
  stylist = Stylist.new({:name => name, :id => nil})
  stylist.save()
  @stylists = Stylist.all()
  erb(:index)
end

post('/new_clients') do
  name = params.fetch('client')
  client = Client.new({:name => name, :id => nil})
  client.save()
  @clients = Client.all()
  erb(:index)
end
