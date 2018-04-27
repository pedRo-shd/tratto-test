require 'spec_helper'
require 'transaction_operation'
require 'wallet_central'

RSpec.describe TransactionOperation do

  describe ".find_wallets" do
    before do
      build_clients         = WalletCentral.build_clients
      @origin_client        = WalletCentral.find_client_for_object(build_clients, 'jon')
      @destination_client   = WalletCentral.find_client_for_object(build_clients, 'littlefinger')
      @destination_client2  = WalletCentral.find_client_for_object(build_clients, 'aray')
      @transaction          = TransactionOperation.new(@origin_client, @destination_client, 'EUR', 100)
      @transaction2         = TransactionOperation.new(@origin_client, @destination_client2, 'USD', 500)
      @transaction3         = TransactionOperation.new(@origin_client, @destination_client2, 'BRL', 500)
      @transaction4         = TransactionOperation.new(@origin_client, @destination_client2, 'USD', 5000)
    end

    context "when destination client not have EURO wallet from transfer but have USD" do
      it "muts convert value EURO to USD" do
        @transaction.find_wallets(@destination_client)
        expect(@transaction.value).to eql(125.0)
      end
    end

    context "when destination client have same USD wallet" do
      it "muts convert value EURO to USD" do
        @transaction2.find_wallets(@destination_client2)
        expect(@transaction2.value).to eql(500)
      end
    end

    context "when origin client not have the currency wallet" do
      it "mustn't trasnfer and return message" do
        expect { @transaction3.find_wallets(@origin_client) }.to raise_error("You don't have the BRL wallet you tried to transfer")
      end
    end

    context "when origin client not have the sufficient amount to transfer" do
      it "mustn't trasnfer and return message" do
        expect { @transaction4.find_wallets(@origin_client) }.to raise_error("Insufficient ballance to transfer")
      end
    end
  end

end
