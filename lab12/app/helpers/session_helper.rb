require 'digest'

module SessionHelper
  def hashpass(password)
    Digest::SHA2.new(256).hexdigest password
  end
end
