# このコードをコピペしてrubyファイルに貼り付け、そのファイルをirbでrequireして実行しましょう。

# irb
# require '/Users/tanizawakenta/workspace/work/VendingMachine5.rb'
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
  attr_reader :name, :price, :stock
  def self.cola
    self.new(“コーラ“, 120, 5)
  end
  def self.redbull
    self.new(“レッドブル“, 200, 5)
  end
  def self.water
    self.new(“水”, 100, 5)
  end
  def initialize(name, price, stock)
    @name = name
    @price = price
    @stock = stock
  end
end

class VendingMachine
MONEY = [10, 50, 100, 500, 1000].freeze
  def initialize
    @slot_money = 0
    @sale_amount = 0
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
    if @slot_money >= drink.price && drink.stock > 0
      puts “#{drink.name}を購入できます”
    else
      puts “#{drink.name}を購入できませんでした。”
    end
  end

  def buy_drink(drink) # Drink.cola のような形で引数を渡す
    name = drink.name
    price = drink.price
    stock = drink.stock
    if @slot_money >= price && stock > 0
        puts “#{name}を購入しました”
        @sale_amount += price
        stock -= 1
        return_change = @slot_money -= price
        puts “お釣りは#{return_change}円です。”
    else
      puts “#{name}を購入できません。”
    end
  end
  def sale_amount
    @sale_amount
  end
end
