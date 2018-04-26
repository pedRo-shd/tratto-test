require_relative 'build_clients'

class WalletCentral

  def self.output(name=nil)
    build_clients = BuildClients.new.load_clients
    build_clients.map(&:build_output)
  end
end
