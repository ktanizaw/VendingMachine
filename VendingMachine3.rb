# このコードをコピペしてrubyファイルに貼り付け、そのファイルをirbでrequireして実行しましょう。

# irb
# require '/Users/tanizawakenta/workspace/work/VendingMachine3.rb'
# （↑のパスは、自動販売機ファイルが入っているパスを指定する）

# 初期設定（自動販売機インスタンスを作成して、vmという変数に代入する）
# vm = VendingMachine.new
#
# 作成した自動販売機に100円を入れる
# vm.slot_money (1000)
#
# 作成した自動販売機に入れたお金がいくらかを確認する（表示する）
# vm.current_slot_money
#
# 作成した自動販売機に入れたお金を返してもらう
# vm.return_money

class Drink
  attr_accessor :name, :price

  def initialize(name, price)
    @name = name
    @price = price
  end

  def self.cola
    self.new("cola", 120)
  end

  def self.redbull
    self.new("redbull", 200)
  end

  def self.water
    self.new("water", 100)
  end
end

class VendingMachine
MONEY = [10, 50, 100, 500, 1000].freeze
  def initialize
    @slot_money = 0
    @sale_amount = 0
    @stock = {"cola" => 5, "redbull" => 5, "water" => 5}
  end

  def current_slot_money
    @slot_money
  end

  def current_stock
    @stock
  end

  def slot_money(money)
    return false unless MONEY.include?(money)
    @slot_money += money
  end

  def return_money
    puts @slot_money
    @slot_money = 0
  end

  def drink_check(drink) #Drink.cola のような形で引数を渡す
    if @slot_money >= drink.price && @stock["#{drink.name}"] > 0
      puts "#{drink.name}を購入できます。"
    else
      puts "#{drink.name}を購入できませんでした。"
    end
  end

  def buy_drink(drink) # Drink.cola のような形で引数を渡す
    name = drink.name
    price = drink.price
    if @slot_money >= price && @stock["#{drink.name}"] > 0
        puts "#{name}を購入しました。"
        @sale_amount += price
        @stock["#{drink.name}"] -= 1
        return_change = @slot_money -= price
        puts "残高は#{return_change}円です。"
    else
      puts "#{name}を購入できません。"
    end
  end

  def sale_amount
    @sale_amount
  end
end
