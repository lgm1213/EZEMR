class AddColumnGendercdColumnToUsers < ActiveRecord::Migration[5.0]
  def change
  	add_column :users, :gender_cd, :integer
  end
end
