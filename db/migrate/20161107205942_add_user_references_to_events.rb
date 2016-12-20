class AddUserReferencesToEvents < ActiveRecord::Migration[5.0]
  def change
    add_column :events, :creator, :integer, index: true
  end
end
