require 'spec_helper'
require 'convert_currency'

RSpec.describe ConvertCurrency do

  describe ".convert" do
    context "when transfer EUR to wallet that have USD" do
      before do
        @convert_currency = ConvertCurrency.new('EUR', 'USD', 50.0)
      end

      it "must convert EUR to USD" do
        @convert_currency.convert
        expect(@convert_currency.value).to eql(62.50)
      end

      context "when transfer EUR to wallet that have BRL" do
        before do
          @convert_currency = ConvertCurrency.new('EUR', 'BRL', 50.0)
        end

        it "must convert EUR to BRL" do
          @convert_currency.convert
          expect(@convert_currency.value).to eql(246.88)
        end
      end

      context "when transfer USD to wallet that have EUR" do
        before do
          @convert_currency = ConvertCurrency.new('USD', 'EUR', 50.0)
        end

        it "must convert USD to EUR" do
          @convert_currency.convert
          expect(@convert_currency.value).to eql(40.0)
        end
      end

      context "when transfer USD to wallet that have BRL" do
        before do
          @convert_currency = ConvertCurrency.new('USD', 'BRL', 50.0)
        end

        it "must convert USD to BRL" do
          @convert_currency.convert
          expect(@convert_currency.value).to eql(158.0)
        end
      end

      context "when transfer BRL to wallet that have EUR" do
        before do
          @convert_currency = ConvertCurrency.new('BRL', 'EUR', 50.0)
        end

        it "must convert BRL to EUR" do
          @convert_currency.convert
          expect(@convert_currency.value).to eql(10.13)
        end
      end

      context "when transfer BRL to wallet that have USD" do
        before do
          @convert_currency = ConvertCurrency.new('BRL', 'USD', 50.0)
        end

        it "must convert BRL to USD" do
          @convert_currency.convert
          expect(@convert_currency.value).to eql(15.82)
        end
      end
    end
  end

end
