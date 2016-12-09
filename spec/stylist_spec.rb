require('spec_helper')

describe(Stylist) do
  describe('#name') do
    it('will return a new stylist with name') do
      new_stylist = Stylist.new({:name => "Lee", :id => nil})
      expect(new_stylist.name()).to(eq("Lee"))
    end
  end
  describe("#id") do
    it("sets its ID when you save it") do
      new_stylist = Stylist.new({:name => "Lee", :id => nil})
      new_stylist.save()
      expect(new_stylist.id()).to(be_an_instance_of(Fixnum))
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
  describe('#==') do
    it('is the same stylist if it has the same name') do
      new_stylist = Stylist.new({:name => "Lee", :id => nil})
      new_stylist2 = Stylist.new({:name => "Lee", :id => nil})
      expect(new_stylist.name()).to(eq(new_stylist2.name()))
    end
  end
  describe('.find') do
    it('will look for a stylist by its ID') do
      new_stylist = Stylist.new({:name => "Lee", :id => nil})
      new_stylist.save()
      expect(Stylist.find(new_stylist.id())).to(eq(new_stylist))
    end
  end
  describe('#update') do
    it('updates the stylists in the database') do
      new_stylist = Stylist.new({:name => "Yun", :id => nil})
      new_stylist.save()
      new_stylist.update({:name => "Yun"})
      expect(new_stylist.name()).to(eq("Yun"))
    end
  end
  describe('#delete') do
    it("lets you delete a stylist from the database") do
      new_stylist = Stylist.new({:name => "Lee", :id => nil})
      new_stylist.save()
      new_stylist2 = Stylist.new({:name => "Yun", :id => nil})
      new_stylist2.save()
      new_stylist.delete()
      expect(Stylist.all()).to(eq([new_stylist2]))
    end
  end
end
