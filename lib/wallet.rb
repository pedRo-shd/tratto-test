require 'ostruct'
require_relative 'client'
require_relative 'transaction_operation'

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

  def add(origin_client, destination_client, value)
    self.amount += value
    success_message(origin_client, destination_client, value)
  end

  private

  def build_array(clients)
    clients.wallets << self
    return
  end

  def success_message(origin_client, destination_client, value)
    notice = []

    notice << "Transfer #{value} to #{destination_client.name} was successfull"
    notice << "Balance from #{origin_client.name} client:"
    notice << origin_client.build_output[:wallets].map {|w| w}
    notice << "Balance from #{destination_client.name} client:"
    notice << destination_client.build_output[:wallets].map {|w| w}
  end

end
