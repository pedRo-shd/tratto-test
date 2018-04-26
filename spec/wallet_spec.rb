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

    context "when search client" do
      it "must return client jon" do
        expect(@set_client_jon[:name]).to eql('jon')
      end

      it "must return client sansa" do
        expect(@set_client_sansa[:name]).to eql('sansa')
      end

      it "mustn't return client that not exists" do
        expect { WalletCentral.output('elliot') }.to raise_error('elliot is not a client')
      end
    end

  end
end
