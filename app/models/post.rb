class Post < ApplicationRecord
  default_scope { order created_at: :desc }
  include ImageUploader::Attachment.new(:image)
  belongs_to :account
  has_many :likes, dependent: :destroy
  has_many :comments
  before_create :set_active

  scope :active, -> { where active: true }

  def already_liked?
    Like.where(user_id: current_account.id, post_id:
      params[:post_id]).exists?
  end

  def total_likes
    0
  end

  private

  def set_active
    self.active = true
  end
end
