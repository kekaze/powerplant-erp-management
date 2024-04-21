class ReservedMaterial < ApplicationRecord
  belongs_to :reservation
  belongs_to :material
end
