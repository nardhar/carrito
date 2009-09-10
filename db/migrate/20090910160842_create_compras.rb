class CreateCompras < ActiveRecord::Migration
  def self.up
    create_table :compras do |t|
      t.references :usuario
      t.datetime :fecha
      t.decimal :total, :scale => 12, :precision => 2

      t.timestamps
    end
  end

  def self.down
    drop_table :compras
  end
end
