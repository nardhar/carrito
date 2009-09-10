class CompraDetalle < ActiveRecord::Base
  belongs_to :producto
  belongs_to :compra
end
