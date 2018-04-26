require 'csv'
require_relative 'wallet'

class BuildClients

  def initialize
    @parse_csv = CSV.foreach(file_path, headers: true)
  end

  def load_clients
    csv = @parse_csv.to_a.map(&:to_hash)
    result(csv)
  end

  private

  def file_path
    File.open('lib/resources/wallets.csv', 'r')
  end

  def result(all_data)
    @objects_array = []

    for full_customers in all_data do

      customers = create_customer(OpenStruct.new(full_customers))
      @objects_array << customers if customers

    end

    @objects_array
  end

  def create_customer(obj)
    Wallet.new(obj.Currency, obj.Amount.to_f, obj.Client, @objects_array)
  end

end
