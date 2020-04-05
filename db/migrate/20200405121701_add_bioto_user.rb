class AddBiotoUser < ActiveRecord::Migration[5.2]
  def change
  	add_column :users, :bio, :string, null: false, default: "Write something about yourself!"
  end
end
