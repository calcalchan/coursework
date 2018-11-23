class Movie < ApplicationRecord
  #Add in associations
  belongs_to :user
  belongs_to :category
  has_many :reviews
  has_attached_file :image, styles: { medium: "400x600#"}, default_url: "/images/:style/missing.png"
  #Simple validations
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\z/
  validates :title , :description, :movie_length, :director, :rating, :image, :presence=> true
  validates :rating, numericality: { less_than_or_equal_to: 10, only_double: true }
  searchkick
end
