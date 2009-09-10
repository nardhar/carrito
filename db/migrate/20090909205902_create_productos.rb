class CreateProductos < ActiveRecord::Migration
  def self.up
    create_table :productos do |t|
      t.string :nombre
      t.decimal :precio, :precision => 12, :scale => 2
      t.string :foto_file_name
      t.integer :foto_file_size
      t.string :foto_content_type, :limit => 50

      t.timestamps
    end
  end

  def self.down
    drop_table :productos
  end
end
