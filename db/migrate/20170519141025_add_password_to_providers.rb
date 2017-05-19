class AddPasswordToProviders < ActiveRecord::Migration[5.0]
  def change
  	add_column :providers, :password_digest, :string
  end
end
