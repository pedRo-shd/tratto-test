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

  private

  # def verified_currency
  #   substract
  #   add
  # end

  def substracts_value
    find_wallets(@from_client).substract(@value)
  end

  def adds_value
    find_wallets(@to_client).add(@value)
  end

  def find_wallets(client)
    client.wallets.find { |w| w.currency == @currency.to_s }
  end
end
