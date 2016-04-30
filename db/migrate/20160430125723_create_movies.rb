class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.string :name
      t.integer :rate
      t.string :country
      t.string :genre

      t.timestamps null: false
    end
  end
end
