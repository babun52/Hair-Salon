require('rspec')
require('client')

describe(Client) do
  describe('#initialize') do
    it('will return a new client with name and id') do
      new_client = Client.new({:name => "James", :id => nil, :stylist_id => 1})
      expect(new_client.name()).to(eq("James"))
    end
  end
end
