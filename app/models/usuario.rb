class Usuario < ActiveRecord::Base
  has_many :posts
  has_many :compras
  has_many :ultimos_posts, :class_name => "Post", :conditions => ["created_at >= ?", 30.minutes.ago]

  attr_accessor :password_confirmation

  before_save :encriptar_password

  validates_presence_of :nombre, :login
  validates_length_of :login, :in => 4..16, :unless => proc {|usuario| usuario.login.blank?}

  validates_confirmation_of :password

  @@tipos = {'admin' => "Administrador", 'usuario' => "Usuario"}

  def nombre_completo
    "#{nombre} #{apellido}"
  end

  def to_s
    nombre_completo
  end

  def tipo_p
    @@tipos[read_attribute(:tipo)]
  end

  def tipos
    @@tipos
  end

  # Sin instancia
  class << self
    def tipos_list
      #@@tipos.to_a.map{|v| [v[1], v[0]]}.sort_by{ |v| v[0]  }
      @@tipos.to_a.map{|v| [v[1], v[0]]}
    end
  end

  protected
  def encriptar_password
    self.password = Digest::SHA1.hexdigest(self.password)
  end

end
