require 'spec_helper'
require 'wallet_central'

RSpec.describe WalletCentral do

  describe ".new.load_clients" do
    before do
      @wallet_central = WalletCentral.output
    end

    it "must return all clients" do
      expect(@wallet_central.count).to eql(11)
    end

  end
end
