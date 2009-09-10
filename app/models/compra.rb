class Compra < ActiveRecord::Base
  belongs_to :usuario
  has_many :productos, :through => :compra_detalles
  has_many :compra_detalles
end
