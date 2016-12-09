require('rspec')
require('pg')
require('client')

DB = PG.connect({:dbname => 'hair_salon'})

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM clients *;")
  end
end

describe(Client) do
  describe('#name') do
    it('will return a new client with name') do
      new_client = Client.new({:name => "James", :id => nil, :stylist_id => nil})
      expect(new_client.name()).to(eq("James"))
    end
  end
  describe('.all') do
    it('is empty at first') do
      expect(Client.all()).to(eq([]))
    end
  end
end
