class Category < ApplicationRecord
  #Add in associations
  has_many :movies
end
