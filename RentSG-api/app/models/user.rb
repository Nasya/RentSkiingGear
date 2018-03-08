class User < ApplicationRecord
  include Reviewable

  has_many :items, dependent: :destroy
  has_many :bookings, dependent: :destroy
  has_many :reviews, dependent: :destroy
end
