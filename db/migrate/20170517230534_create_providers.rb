class CreateProviders < ActiveRecord::Migration[5.0]
  def change
    create_table :providers do |t|
      t.string :title
      t.string :first_name
      t.string :last_name
      t.string :middle_initial
      t.string :gender_cd
      t.string :speciality
      t.string :npi
      t.string :address
      t.string :city
      t.string :state
      t.string :zip
      t.string :phone
      t.string :fax_number

      t.timestamps
    end
  end
end
