require 'digest/md5'

class Ranter < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :rants

  has_many :follows_as_followee, class_name: 'Follow', foreign_key: :followee_id
  has_many :follows_as_follower, class_name: 'Follow', foreign_key: :follower_id

  has_many :followers, through: :follows_as_followee
  has_many :followees, through: :follows_as_follower

  def gravatar_url
    hash = Digest::MD5.hexdigest(email.downcase)
    image_src = "https://www.gravatar.com/avatar/#{hash}"
  end

  def follow!(followee)
    self.followees << followee
  end

  def followable?(follower)
    follower != self && !self.followers.include?(follower)
  end
end
