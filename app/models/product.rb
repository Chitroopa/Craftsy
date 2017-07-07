class Product < ApplicationRecord

  has_attached_file :image_path, styles: { medium: '300x300', large: 'x800' }, default_url: "/images/missing.png"
  validates_attachment_content_type :image_path, :content_type => /\Aimage\/.*\Z/
  belongs_to :user
  
end
