class Event < ApplicationRecord
  has_many :catalogs
  has_many :attachments, through: :catalogs
end
