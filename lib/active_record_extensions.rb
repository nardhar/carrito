ActiveRecord::Base.instance_eval do
  def list(options={})
    all(options).map{|v| [v.to_s, v.id]}
  end
end