class AddPhotoToRants < ActiveRecord::Migration[5.1]
  def change
    add_column :rants, :photo, :string
  end
end
