class CreateRants < ActiveRecord::Migration[5.1]
  def change
    create_table :rants do |t|
      t.references :ranter
      t.string :message

      t.timestamps
    end
  end
end
