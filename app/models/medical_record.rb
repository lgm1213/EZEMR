class MedicalRecord < ApplicationRecord
	belongs_to :user
	validates :user_id, presence: true
	has_many :medical_entries
	has_many :providers, through: :medical_entries
end
