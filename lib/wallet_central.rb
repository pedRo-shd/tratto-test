require_relative 'build_clients'
require_relative 'transaction_operation'

class WalletCentral

  def self.output(name=nil)
    return search_client(build_clients, name) if name
    clients_and_wallets(build_clients)
  end

  def self.transfer(from_client, to_client, currency, value)
    begin
      load_clients = build_clients
      origin_client = find_client_for_object(load_clients, from_client)
      destination_client = find_client_for_object(load_clients, to_client)
      TransactionOperation.new(origin_client, destination_client, currency, value).call
    rescue => exception
      puts exception
    end
  end

  def self.search_client(data_clients, name)
    client = clients_and_wallets(data_clients).find { |user| user[:name] == name.to_s }
    raise Exception, "#{name} is not a client" unless client
    client
  end

  def self.clients_and_wallets(data_clients)
    begin
      data_clients.map(&:build_output)
    rescue => exception
      puts exception
    end
  end

  def self.build_clients
    BuildClients.new.load_clients
  end

  def self.find_client_for_object(objects_clients, client_name)
    objects_clients.find { |client| client.name == client_name }
  end

end
