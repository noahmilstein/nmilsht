class Post < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  acts_as_taggable

  validates :title, presence: true, length: { minimum: 3 }
  validates :body, presence: true, length: { minimum: 20 }
end
