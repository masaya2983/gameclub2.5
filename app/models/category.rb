class Category < ApplicationRecord
  has_many :games, depedent: :destroy
end
