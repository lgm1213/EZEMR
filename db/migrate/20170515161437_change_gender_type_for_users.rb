class ChangeGenderTypeForUsers < ActiveRecord::Migration[5.0]
  def change
  	remove_column :users, :gender_cd, :string
  end
end
