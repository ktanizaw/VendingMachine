# VendingMachine
# How to use

````
$ irb
\> require './VendingMachine3.rb'
\> vm = VendingMachine.new
\> vm.slot_money (10) => 10
\> vm.slot_money (50) => 60
\> vm.slot_money (100) => 160
\> vm.slot_money (500) => 660
\> vm.slot_money (1000) => 1660
\> vm.slot_money (1) => false
\> vm.current_slot_money => 1660
\> vm.current_stock =>  {"cola"=>5, "redbull"=>5, "water"=>5}
\> vm.drink_check(Drink.cola) => colaを購入できます。
\> vm.drink_check(Drink.redbull) =>redbullを購入できます。
\> vm.drink_check(Drink.water) =>waterを購入できます。
\> vm.buy_drink(Drink.cola) =>colaを購入しました。残高は1540円です。
\> vm.buy_drink(Drink.redbull) =>redbullを購入しました。残高は1340円です。
\> vm.buy_drink(Drink.water) =>waterを購入しました。残高は1240円です。
\> vm.return_money => 1240
\> vm.sale_amount => 420
\> vm.drink_check(Drink.cola) =>colaを購入できませんでした。
\> vm.buy_drink(Drink.cola) =>colaを購入できません。
\> vm.current_stock =>  {"cola"=>4, "redbull"=>4, "water"=>4}
\> exit
````
