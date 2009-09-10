class CreateCompraDetalles < ActiveRecord::Migration
  def self.up
    create_table :compra_detalles do |t|
      t.references :producto
      t.references :compra
      t.integer :cantidad
      t.decimal :precio, :scale => 12, :precision => 2

      t.timestamps
    end
  end

  def self.down
    drop_table :compra_detalles
  end
end
