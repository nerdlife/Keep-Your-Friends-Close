class AddAllowTextingToUsers < ActiveRecord::Migration
  def change
    add_column :users, :allow_texting, :boolean, default: :true
    add_column :users, :allow_location, :boolean, default: :true
  end
end
