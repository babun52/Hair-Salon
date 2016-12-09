require('spec_helper')

describe(Stylist) do
  describe('#name') do
    it('will return a new stylist with name') do
      new_stylist = Stylist.new({:name => "Lee", :id => nil})
      expect(new_stylist.name()).to(eq("Lee"))
    end
  end
end
