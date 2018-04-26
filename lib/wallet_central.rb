require_relative 'build_clients'

class WalletCentral

  def self.output(name=nil)
    build_clients = BuildClients.new.load_clients
    return search_client(build_clients, name) if name
    clients_and_wallets(build_clients)
  end

  def self.search_client(data_clients, name)
    client = clients_and_wallets(data_clients).find { |user| user[:name] == name.to_s }
    raise Exception, "#{name} is not a client" unless client
    client
  end

  def self.clients_and_wallets(data_clients)
    data_clients.map(&:build_output)
  end
end
