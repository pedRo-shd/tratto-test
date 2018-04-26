require 'ostruct'

class Wallet
  def initialize(currency, amount, client=nil, obj_array=nil)
    @source = OpenStruct.new(currency: currency, amount: amount)
  end
end
