require 'spec_helper'
require 'build_clients'

RSpec.describe BuildClients do

  describe ".new.load_clients" do
    before do
      @build_clients = BuildClients.new.load_clients
    end

    it "must return all currency wallets" do
      expect(@build_clients.count).to eql(20)
    end
  end

end
