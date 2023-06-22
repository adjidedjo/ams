class Position < ApplicationRecord
  belongs_to :department
  has_ancestry
end
