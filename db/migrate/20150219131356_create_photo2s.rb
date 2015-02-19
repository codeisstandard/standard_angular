class CreatePhoto2s < ActiveRecord::Migration
  def change
    create_table :photo2s do |t|
      t.string :url
      t.string :name

      t.timestamps null: false
    end
  end
end
