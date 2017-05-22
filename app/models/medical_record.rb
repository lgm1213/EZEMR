class MedicalRecord < ApplicationRecord
	belongs_to :users
	has_many :medical_entries
end
