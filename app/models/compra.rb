class Compra < ActiveRecord::Base
  belongs_to :usuario
  has_many :productos, :through => :compra_detalles
  has_many :compra_detalles

  accepts_nested_attributes_for :compra_detalles, :allow_destroy => true

end
