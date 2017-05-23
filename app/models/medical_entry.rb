class MedicalEntry < ApplicationRecord
	belongs_to :medical_record
	belongs_to :provider
end
