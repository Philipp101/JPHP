class Attachment < ApplicationRecord
  has_one_attached :photo, dependent: :destroy
  has_many :catalogs
  has_many :events, through: :catalogs
end
