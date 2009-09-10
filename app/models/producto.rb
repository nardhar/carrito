class Producto < ActiveRecord::Base
  has_many :compra_detalles
  has_many :compras, :through => :compra_detalles
  has_attached_file :foto, :styles => { :small => '90x90>', :medium => '300x300>'}

  cattr_reader :per_page
  @@per_page = 2

end
