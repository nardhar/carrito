class CreateUsuarios < ActiveRecord::Migration
  def self.up
    create_table :usuarios do |t|
      t.string :nombre, :null => false
      t.string :apellido
      t.date :fecha_nacimiento
      t.string :login, :limit => 16, :null => false
      t.string :password, :limite => 40

      t.timestamps
    end
  end

  def self.down
    drop_table :usuarios
  end
end
