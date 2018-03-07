class Item < ApplicationRecord
  belongs_to :user
  has_many :reviews, dependent: :destroy
  has_one :booking, dependent: :destroy
end
