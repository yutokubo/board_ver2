class Post < ApplicationRecord 
  belongs_to :user
 
  # validates :name, presence: true, on: :create
end
