require 'ostruct'
require_relative 'client'

class Wallet < OpenStruct
  def initialize(currency, amount, client=nil, obj_array=nil)
    super(currency: currency, amount: amount)
    @obj_array = obj_array
    @client = client
  end

  def build_client
    clients = @obj_array.find{|client| client.name == @client }
    return Client.new(@client, [self]) unless clients
    build_array(clients)
  end

  def substract(value)
    self.amount -= value
  end

  def add(value)
    self.amount += value
  end

  private

  def build_array(clients)
    clients.wallets << self
    return
  end
end
