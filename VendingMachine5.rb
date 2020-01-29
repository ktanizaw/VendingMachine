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

  def drink_check(drink_name)
    if @slot_money >= @price[drink_name] && @stock[drink_name] > 0
      puts "#{@name[drink_name]}を購入できます"
    else
      puts "#{@name[drink_name]}を購入できませんでした。"
    end
  end

  def buy_drink(drink_name)
    name = @name[drink_name]
    price = @price[drink_name]
    stock = @stock[drink_name]
    if @slot_money >= price && stock > 0
        puts "#{name}を購入しました"
        @sale_amount += price
        stock -= 1
        return_change = @slot_money -= price
        puts "お釣りは#{return_change}円です。"
    else
      puts "#{name}を購入できません。"
    end
  end

  def sale_amount
    @sale_amount
  end
end
