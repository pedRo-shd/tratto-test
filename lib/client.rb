require 'ostruct'
require 'json'

class Client < OpenStruct
  def initialize(name, wallets=[])
    super(name: name, wallets: wallets)
  end


end
