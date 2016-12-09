class Client
  attr_reader(:name, :id, :stylist_id)

  define_method(:initialize) do |attributes|
      @name = attributes.fetch(:name)
      @id = attributes.fetch(:id)
      @stylist_id = attributes.fetch(:stylist_id)
  end

  define_singleton_method(:all) do
    returned_clients = DB.exec("SELECT * FROM clients;")
    clients = []
    returned_clients.each do |client|
      name = client.fetch('name')
      id = client.fetch('id').to_i
      stylist_id = client.fetch('stylist_id').to_i
      clients.push(Client.new({:name => name, :id => id, :stylist_id => stylist_id}))
    end
    clients
  end
end
