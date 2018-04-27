require_relative 'convert_currency'

class TransactionOperation
  attr_accessor :value

  def initialize(from_client, to_client, currency, value)
    @from_client = from_client
    @to_client   = to_client
    @currency    = currency
    @value       = value
  end

  def call
    substracts_value
    adds_value
  end

  def find_wallets(client_origin_or_destination)
    currency_wallet = client_origin_or_destination.wallets.find { |w| w.currency == @currency.to_s }
    apply_exceptions(client_origin_or_destination.name, currency_wallet)
    return convert_amount unless currency_wallet
    currency_wallet
  end

  private

  def substracts_value
    find_wallets(@from_client).substract(@value)
  end

  def adds_value
    find_wallets(@to_client).add(@from_client, @to_client, @value)
  end

  def convert_amount
    to_currency = @to_client.wallets.last
    convert_currency = ConvertCurrency.new(@currency, to_currency.currency, @value)
    @value = convert_currency.convert
    to_currency
  end

  def apply_exceptions(client_origin, currency_wallet)
    raise Exception, "You don't have the #{@currency} wallet you tried to transfer" if client_origin == @from_client.name && currency_wallet.nil?
    raise Exception, "Insufficient ballance to transfer" if client_origin == @from_client.name && @value > currency_wallet.amount
  end

end
