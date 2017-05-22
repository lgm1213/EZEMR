class CreateMedicalRecords < ActiveRecord::Migration[5.0]
  def change
    create_table :medical_records do |t|
      t.integer :user_id

      t.timestamps
    end
    add_index :medical_records, :user_id
  end
end
