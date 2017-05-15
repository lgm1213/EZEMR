class ChangeDatetimeToDateForUser < ActiveRecord::Migration[5.0]
  def change
  	change_column :users, :dob, :date
  end
end
