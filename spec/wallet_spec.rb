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
        expect(@set_client_jon).to eql({:name=>"jon", :wallets=>{"EUR"=>868.65, "USD"=>463.39}})
      end

      it "must return client sansa" do
        expect(@set_client_sansa).to eql({:name=>"sansa", :wallets=>{"EUR"=>1065.45, "BRL"=>586.28}})
      end

      it "mustn't return client that not exists" do
        expect { WalletCentral.output('elliot') }.to raise_error('elliot is not a client')
      end
    end
  end

  describe ".transfer" do
    before do
      @transfer1 = WalletCentral.transfer('jon', 'tyrion', 'USD', 100)
    end

    context "when are same currency" do
      it "must add to client amount" do
        expect(@set_client_jon).to eql({:name=>"tyrion", :wallets=>{"EUR"=>868.65, "USD"=>1068.12}})
      end

      # it "must substract to client amount" do
      # end
    end
  end

end
