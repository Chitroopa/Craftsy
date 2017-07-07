require 'rails_helper'

describe "add new user" do
  it "adds a new user" do
    visit new_user_registration_path
    fill_in 'Username', :with=>'Test'
    fill_in 'Email', :with=>'test@test.com'
    fill_in 'Password', :with=>'123456'
    fill_in 'Password confirmation', :with=>'123456'
    click_on 'Sign up'
    expect(page).to have_content 'Welcome! You have signed up successfully.'
  end
  it "gives error when nothing is entered" do
    visit new_user_registration_path
    click_on 'Sign up'
    expect(page).to have_content 'errors'
  end
end
