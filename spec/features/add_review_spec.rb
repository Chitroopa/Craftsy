require 'rails_helper'

describe "add new review to product" do
  before(:each) do
    User.destroy_all
    Product.destroy_all
    Review.destroy_all
    @user = FactoryGirl.create(:user)
    @user.update({:admin=>true})
    login_as(@user, :scope=>:user)
    @product = FactoryGirl.create(:product, :user_id=> @user.id)
    @review = FactoryGirl.create(:review, :user_id=> @user.id, :product_id=>@product.id)
    visit user_product_path(@user, @product)
  end

  it "add new review" do
    fill_in 'Review', :with=> "test review"
    fill_in 'Rating', :with=> 5
    click_on "Save"
    expect(page).to have_content 'Review added successfully!'
  end

  it "add empty review" do
    click_on "Save"
    expect(page).to have_content 'Error while adding review. Please add review again!'
  end


end
