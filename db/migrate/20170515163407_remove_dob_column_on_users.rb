class RemoveDobColumnOnUsers < ActiveRecord::Migration[5.0]
  def change
  	remove_column :users, :dob, :string
  	add_column :users, :dob, :datetime
  end
end
