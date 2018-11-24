class Movie < ApplicationRecord
  #Add in associations
  belongs_to :user
  belongs_to :category
  has_many :reviews
  #Allowing image upload and setting the size of the image
  has_attached_file :image, styles: { medium: "400x600#"}, default_url: "/images/:style/missing.png"
  #Simple validations
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
  validates :title , :description, :movie_length, :director, :rating, :image, :presence=> true
  #Validates on the rating that it is less than 10
  validates :rating, numericality: { less_than_or_equal_to: 10, only_double: true }
  searchkick
end
