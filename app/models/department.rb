class Department < ApplicationRecord
    has_many :units, dependent: :destroy
end
