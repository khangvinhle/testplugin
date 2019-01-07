class MappingRate < ApplicationRecord
  belongs_to TimeEntryActivity
  belongs_to :service_pack
end
