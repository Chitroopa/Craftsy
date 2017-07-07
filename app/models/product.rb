class Product < ApplicationRecord

  has_attached_file :image, styles: { medium: '200x200', large: 'x800' }, default_url: "/images/:style/missing.jpg"
  validates_attachment_content_type :image, :content_type => /\Aimage\/.*\Z/
  validates :product_name, :description, :details, :cost, :category, :artist_name, :region, :presence => true
  belongs_to :user
  has_many :reviews

end
