require 'ostruct'
require_relative 'client'

class Wallet
  def initialize(currency, amount, client=nil, obj_array=nil)
    @source = OpenStruct.new(currency: currency, amount: amount)
    @obj_array = obj_array
    @client = client
  end

  def build_client
    clients = @obj_array.find{|client| client.name == @client }
    return Client.new(@client, [@source]) unless clients
    build_array(clients)
  end

  private

  def build_array(clients)
    clients.wallets << @source
    return
  end
end
