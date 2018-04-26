require 'spec_helper'
require 'wallet_central'

RSpec.describe WalletCentral do

  describe ".output" do
    before do
      @wallet_central   = WalletCentral.output
      @set_client_jon   = WalletCentral.output('jon')
      @set_client_sansa = WalletCentral.output('sansa')
    end

    context "when set all clients" do
      it "must return all clients" do
        expect(@wallet_central.count).to eql(11)
      end
    end

    context "when search one client" do
      it "must return client jon" do
        expect(@set_client).to eql('jon')
      end

      it "must return client sansa" do
        expect(@set_client_jon[0][:name]).to eql('sansa')
      end
    end

  end
end
