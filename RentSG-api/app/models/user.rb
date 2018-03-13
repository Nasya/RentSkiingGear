class User < ApplicationRecord
  include Reviewable

  has_many :items, dependent: :destroy
  has_many :bookings, dependent: :destroy
  has_many :authored_reviews, foreign_key: :user_id, class_name: 'Review', dependent: :destroy
end
