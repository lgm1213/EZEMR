class AddMedicalRecordIdToMedicalEntry < ActiveRecord::Migration[5.0]
  def change
  	add_column :medical_entries, :medical_record_id, :integer
  	add_index :medical_entries, :medical_record_id 
  end
end
