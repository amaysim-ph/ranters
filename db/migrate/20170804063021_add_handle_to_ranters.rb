class AddHandleToRanters < ActiveRecord::Migration[5.1]
  def change
    add_column :ranters, :handle, :string
  end
end
