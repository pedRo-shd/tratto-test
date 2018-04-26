require 'ostruct'
require 'json'

class Client < OpenStruct
  def initialize(name, wallets=[])
    super(name: name, wallets: wallets)
  end

  def build_output
    { name: name, wallets: build_wallets }
  end

  def build_wallets
    wallets.map { |wallet| [wallet.currency, wallet.amount] }.to_h
  end

end
