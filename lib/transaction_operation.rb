class TransactionOperation

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
    client_origin_or_destination.wallets.find { |w| w.currency == @currency.to_s }
  end

  private

  def substracts_value
    find_wallets(@from_client).substract(@value)
  end

  def adds_value
    find_wallets(@to_client).add(@from_client, @to_client, @value)
  end

end
