# Tratto Programming Exercise

Dependencies:
* Ruby: 2.5.0

Ruby plain code to load all the users and wallets, and be available to output the data in json:

* Load the lib
  ```
  load './lib/wallet_central.rb'
  ```

* All users and wallets
  ```
  WalletCentral.output
  ```

* To specific user
  ```
  WalletCentral.output('jon')
  ```

* To transfer amount between users.
* The converions is applied if destination client not have currency wallet.
* Can not transfer value if origin client does not have wallet
* Can not transfer value if origin client does not have sufficient balance
  ```
  WalletCentral.transfer('jon', 'littlefinger', 'EUR', 100)
  ```
