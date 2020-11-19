class CreateLists < ActiveRecord::Migration[5.2]
  def change
    create_table :lists do |t|
      t.text :body

      t.timestamps
    end
  end
end
