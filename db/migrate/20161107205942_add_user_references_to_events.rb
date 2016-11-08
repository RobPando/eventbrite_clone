class AddUserReferencesToEvents < ActiveRecord::Migration[5.0]
  def change
    add_reference :events, :creator, foreign_key: true, index: true
  end
end
