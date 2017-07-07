require 'rails_helper'

describe "add new product" do
  before(:each) do
    User.destroy_all
    Product.destroy_all
    Review.destroy_all
    @user = FactoryGirl.create(:user)
    @user.update({:admin=>true})
    login_as(@user, :scope=>:user)
    visit new_user_product_path(@user)
    attach_file "Image", "spec/assest_specs/photos/sample_product.jpg"
    fill_in 'Product name', :with => 'test'
    fill_in 'Description', :with => 'test'
    fill_in 'Details', :with => 'test'
    fill_in 'Cost', :with => 20
    fill_in 'Description', :with => 'test'
    fill_in 'Artist name', :with => 'test'
    fill_in 'Region', :with => 'test'
    choose 'product_category_painting'
    click_on 'Create Product'
  end

  it "add new product" do
    expect(page).to have_content 'All products'
  end

  it "navigates to product display" do
    click_on 'Sample product'
    expect(page).to have_content 'User Reviews'
  end
end
