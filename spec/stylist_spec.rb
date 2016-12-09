require('spec_helper')

describe(Stylist) do
  describe('#name') do
    it('will return a new stylist with name') do
      new_stylist = Stylist.new({:name => "Lee", :id => nil})
      expect(new_stylist.name()).to(eq("Lee"))
    end
  end
  describe('.all') do
    it('is empty at first') do
      expect(Stylist.all()).to(eq([]))
    end
  end
  describe('#save') do
    it('saves a stylist into the database') do
      new_stylist = Stylist.new({:name => "Lee", :id => nil})
      new_stylist.save()
      expect(Stylist.all()).to(eq([new_stylist]))
    end
  end
end
