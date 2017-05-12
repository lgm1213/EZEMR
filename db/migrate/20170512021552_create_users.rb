class CreateUsers < ActiveRecord::Migration[5.0]
  def change
    create_table :users do |t|
      t.string :first_name
      t.string :middle_initial
      t.string :last_name
      t.string :dob
      t.string :gender_cd
      t.string :height
      t.string :weight
      t.string :ssn
      t.string :address
      t.string :city
      t.string :state
      t.string :zip
      t.string :phone
      t.string :email
      t.string :username
      t.string :password_digest

      t.timestamps
    end
  end
end
