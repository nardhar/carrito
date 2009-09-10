class CreatePosts < ActiveRecord::Migration
  def self.up
    create_table :posts do |t|
      t.references :usuario
      t.string :titulo
      t.text :comentario
      t.timestamps
    end
  end
  
  def self.down
    drop_table :posts
  end
end
