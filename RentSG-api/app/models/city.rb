class City < ApplicationRecord
  has_many :users, dependent: :destroy
  has_many :items, foreign_key: :user_id, class_name: 'Item', dependent: :destroy
end
