class CreateMedicalEntries < ActiveRecord::Migration[5.0]
  def change
    create_table :medical_entries do |t|
      t.integer :provider_id

      t.timestamps
    end
    add_index :medical_entries, :provider_id
  end
end
