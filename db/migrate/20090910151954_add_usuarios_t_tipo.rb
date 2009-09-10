class AddUsuariosTTipo < ActiveRecord::Migration
  def self.up
    add_column :usuarios, :tipo, :string, :limit => 20
    add_column :usuarios, :email, :string
  end

  def self.down
    remove_column :usuarios, :tipo
    remove_column :usuarios, :email
  end
end
