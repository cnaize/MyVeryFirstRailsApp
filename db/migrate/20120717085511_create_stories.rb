class CreateStories < ActiveRecord::Migration
  def change
    create_table :stories do |t|
      t.string :responsible
      t.string :descr
      t.string :state

      t.timestamps
    end
  end
end
