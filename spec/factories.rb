FactoryGirl.define do

  factory(:user) do
    username('test')
    email('test@test.com')
    password(123456)
    password_confirmation(123456)
  end

  factory(:product) do
    product_name("test")
    description("test")
    details("test")
    cost(12)
    artist_name("test")
    region("test")
    category("Painting")
    image_file_name("sample_product.jpg")
    image_content_type("image/jpg")
    user_id(1)
  end

  factory(:review) do
    comment("test review")
    rating(5)
    user_id(1)
    product_id(1)
  end

end
