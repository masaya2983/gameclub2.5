class Game < ApplicationRecord
  belongs_to :member
  has_many :coments, dependent: :destroy
  has_many :favorites, dependent: :destroy
end
