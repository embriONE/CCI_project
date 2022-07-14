class Account < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  include ImageUploader::Attachment.new(:image)

  has_many :posts
  has_many :likes
  has_many :followers

  def full_name
    "#{first_name} #{second_name}"
  end

  def total_followers
    Follower.where(follower_id: self.id).count
  end

  def total_following
    Follower.where(following_id: self.id).count
  end

end
