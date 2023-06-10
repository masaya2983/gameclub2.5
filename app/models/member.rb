class Member < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatabl
         
  has_many :game
  has_many :comments, dependent: :destroy
  has_many :favorites, dependent: :destroy

  #自分がフォローされる（被フォロー）
  has_many :reverse_of_relationships, class_name: "Relationship",foreign_key: "followed_id",dependent: :destroy
  #自分をフォローしている方
  has_many :followers, through: :reverse_of_relationships, source: :follower
  #自分がフォローする方
  has_many :relationship, class_name: "Relationship",foreign_key: "follower_id",dependent: :destroy
  #自分がフォローをしている方
  has_many :followings, through: :relationships, souce: :followed
  
  has_one_attached :profile_image

end
