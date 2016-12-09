require('rspec')
require('pg')
require('client')

DB = PG.connect({:dbname => 'hair_salon_test'})

RSpec.configure do |config|
  config.after(:each) do
    DB.exec("DELETE FROM clients *;")
  end
end

describe(Client) do
  describe('#name') do
    it('will return a new client with name') do
      new_client = Client.new({:name => "James", :id => nil, :stylist_id => 1})
      expect(new_client.name()).to(eq("James"))
    end
  end
  describe("#id") do
    it("sets its ID when you save it") do
      new_client = Client.new({:name => "James", :id => nil, :stylist_id => 1})
      new_client.save()
      expect(new_client.id()).to(be_an_instance_of(Fixnum))
    end
  end
  describe("#stylist_id") do
    it("lets you read the list ID out") do
      new_client = Client.new({:name => "James", :id => nil, :stylist_id => 1})
      expect(new_client.stylist_id()).to(eq(1))
    end
  end
  describe('.all') do
    it('is empty at first') do
      expect(Client.all()).to(eq([]))
    end
  end
  describe('#save') do
    it('saves a client into the database') do
      new_client = Client.new({:name => "James", :id => nil, :stylist_id => 1})
      new_client.save()
      expect(Client.all()).to(eq([new_client]))
    end
  end
  describe('#==') do
    it('is the same client if it has the same name and stylist id') do
      new_client = Client.new({:name => "James", :id => nil, :stylist_id => 1})
      new_client2 = Client.new({:name => "James", :id => nil, :stylist_id => 1})
      expect(new_client).to(eq(new_client2))
    end
  end
  describe('.find') do
    it('returns a client by its ID number') do
      new_client = Client.new({:name => "James", :id => nil, :stylist_id => 1})
      new_client.save()
      expect(Client.find(new_client.id())).to(eq(new_client))
    end
  end
end
