class AddTokenColumnsToProviders < ActiveRecord::Migration[5.0]
  def change
  	add_column :providers, :remember_digest, :string
  	add_column :providers, :activation_digest, :string
  	add_column :providers, :activated, :boolean
  	add_column :providers, :activated_at, :datetime
  	add_column :providers, :reset_digest, :string
  	add_column :providers, :reset_sent_at, :datetime
  	add_column :providers, :admin, :boolean
  end
end
