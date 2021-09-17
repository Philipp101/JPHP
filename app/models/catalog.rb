class Catalog < ApplicationRecord
  belongs_to :events
  belongs_to :attachments
end
