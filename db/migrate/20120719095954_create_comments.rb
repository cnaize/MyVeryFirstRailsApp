class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.string :descr
      t.integer :story_id

      t.timestamps
    end
  end
end
