require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('adding a new stylist', {:type => :feature}) do
  it('adds a stylist on the index page') do
    visit('/')
    fill_in('stylists', :with => 'Lee')
    click_button('Add Stylist')
    expect(page).to have_content('Lee')
  end
end
describe('adding a new client', {:type => :feature}) do
  it('adds a client on the index page') do
    visit('/')
    fill_in('clients', :with => 'James')
    click_button('Add Client')
    expect(page).to have_content('James')
  end
end
describe('viewing all of the stylists', {:type => :feature}) do
  it('allows to see all of the stylists that have been created') do
    stylist = Stylist.new({:name => 'Lee', :id => nil})
    stylist.save()
    visit('/')
    expect(page).to have_content(stylist.name())
  end
end
describe('viewing all of the clients', {:type => :feature}) do
  it('allows to see all of the clients that have been created') do
    client = Client.new({:name => 'James', :id => nil, :stylist_id => 1})
    client.save()
    visit('/')
    expect(page).to have_content(client.name())
  end
end
describe('seeing clients for a stylist', {:type => :feature}) do
  it('allows to click a stylist to see the clients') do
    stylist = Stylist.new({:name => 'Lee', :id => nil})
    stylist.save()
    client = Client.new({:name => "James", :id => nil, :stylist_id => 1})
    client.save()
    visit('/')
    expect(page).to have_content(stylist.name())
  end
end
describe('seeing stylists for a client', {:type => :feature}) do
  it('allows to click a client to see the stylist') do
    client = Client.new({:name => "James", :id => nil, :stylist_id => 1})
    client.save()
    stylist = Stylist.new({:name => 'Lee', :id => nil})
    stylist.save()
    visit('/')
    expect(page).to have_content(client.name())
  end
end
