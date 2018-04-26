require 'spec_helper'
require 'build_clients'

RSpec.describe BuildClients do

  describe ".new.load_clients" do
    before do
      @build_clients = BuildClients.new.load_clients
    end

    it "must return all clients" do
      expect(@build_clients.count).to eql(11)
    end

    it "must return clients jon" do
      expect(@build_clients[0][:name]).to eql('jon')
    end

    it "must return all wallets from jon" do
      expect(@build_clients[0][:wallets].count).to eql(2)
    end

    it "must return last client" do
      expect(@build_clients[10][:name]).to eql('littlefinger')
    end

    it "must return wallets currency 'EUR' and 'USD' from jon " do
      expect(@build_clients[0][:wallets][0].currency).to eql('EUR')
      expect(@build_clients[0][:wallets][1].currency).to eql('USD')
    end

    it "must return all wallets from littlefinger" do
      expect(@build_clients[10][:wallets].count).to eql(2)
    end

    it "must return wallets currency 'BRL' and 'USD' from jon " do
      expect(@build_clients[10][:wallets][0].currency).to eql('BRL')
      expect(@build_clients[10][:wallets][1].currency).to eql('USD')
    end
  end

end
