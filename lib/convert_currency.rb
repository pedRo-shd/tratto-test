class ConvertCurrency
  # USD to BRL = 1 USD is 3.16 BRL
  # USD to EUR = 1 USD is 0.80 EUR
  attr_accessor :from_currency, :to_currency, :value

  def initialize(from_currency, to_currency, value)
    @from_currency = from_currency
    @to_currency   = to_currency
    @value         = value
  end

  def convert
    return from_eur if @from_currency == 'EUR'
    return from_usd if @from_currency == 'USD'
    return from_brl if @from_currency == 'BRL'
  end

  private

  def from_eur
    @value = case @to_currency
             when 'BRL'
               @value = ((@value *= 3.95) / 0.8).round(2)
             else
               @value = (@value /= 0.8).round(2)
             end
  end

  def from_usd
    @value = case @to_currency
             when 'EUR'
               @value = (@value *= 0.8).round(2)
             else
               @value = (@value *= 3.16).round(2)
             end
  end

  def from_brl
    @value = case @to_currency
             when 'EUR'
               @value = ((@value /= 3.95) * 0.8).round(2)
             else
               @value = (@value /= 3.16).round(2)
             end
  end


end
