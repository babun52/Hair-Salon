require('capybara/rspec')
require('./app')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('adding a new stylist', {:type => :feature}) do
  it('adds a stylist on the index page') do
    visit('/')
    fill_in('stylist', :with =>'Lee')
    click_button('Add Stylist')
    expect(page).to have_content('Lee')
  end
end
describe('adding a new client', {:type => :feature}) do
  it('adds a client on the index page') do
    visit('/')
    fill_in('client', :with =>'Lee')
    click_button('Add Client')
    expect(page).to have_content('James')
  end
end
