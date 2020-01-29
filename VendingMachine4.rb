# このコードをコピペしてrubyファイルに貼り付け、そのファイルをirbでrequireして実行しましょう。

# irb
# require '/Users/tanizawakenta/workspace/work/VendingMachine3.rb'
# （↑のパスは、自動販売機ファイルが入っているパスを指定する）

# 初期設定（自動販売機インスタンスを作成して、vmという変数に代入する）
# vm = VendingMachine.new
# dr = Drink.new
# 作成した自動販売機に100円を入れる
# vm.slot_money (1000)
#
# 作成した自動販売機に入れたお金がいくらかを確認する（表示する）
# vm.current_slot_money
#
# 作成した自動販売機に入れたお金を返してもらう
# vm.return_money

class Drink
  attr_reader :name, :price
  # def initialize
  #    @name = ["cola", "redbull", "water"]
  #    @price = [120, 200, 100]
  # end
  # p @drink_price['cola']

  # def check_price(drink_name)
  #   drink_name = drink_name.to_s
  #   puts @drink_price[drink_name]
  # end

  # def self.piyo(msg: 'fuga')
  # p msg
  # end
  #
  # Hoge.piyo(msg: 'fugafuga')

  def initialize(name,price)
    @name = name
    @price = price
  end
  # def self.drink
  #   @drink_price = {"cola"=> 120, "redbull"=> 200, "water"=> 100}
  #   puts @drink_price
  # end

  def self.cola
    @cola = self.new(:cola, 120)
  end

  def self.redbull
    self.new(:redbull, 200)
  end

  def self.water
    self.new(:water, 100)
  end

end

class VendingMachine
  MONEY = [10, 50, 100, 500, 1000].freeze

  def initialize
    @slot_money = 0
    @sale_amount = 0
    @stock = {"cola"=> 5, "redbull"=> 5, "water"=> 5}
    # @drink_price = {"cola"=> 120, "redbull"=> 200, "water"=> 100}
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

  def drink_info(drink_name)

    @drink_price = drink[drink_name]
    if @slot_money >= @drink.price && @stock[drink_name] > 0
      puts "#{drink_name}を購入できます"
    return true
    end
  end

  # def drink_info(drink_name)
  #   drink = Drink.drink
  #   binding.irb
  #   @drink_price = drink[drink_name]
  #   if @slot_money >= @drink_price && @stock[drink_name] > 0
  #     puts "#{drink_name}を購入できます"
  #   return true
  #   end
  # end

  def cola_info
    if @slot_money >= Drink.cola.price && self.current_stock[:cola] > 0
      puts "コーラを購入できます"
    binding.irb
    return true
    end
  end

  def buy_cola
    if @slot_money >= Drink.cola.price && self.current_stock[:cola] > 0
        puts "コーラを購入しました"
      @sale_amount += Drink.cola.price
        self.current_stock[:cola] -= 1
        return_change = @slot_money -= Drink.cola.price
        puts "お釣りは#{return_change}円です。"
      return true
    else
      puts "コーラを購入できません。"
    end
  end

  def redbull_info
    if @slot_money >= Drink.redbull.price && self.current_stock[:redbull] > 0
      puts "水を購入できます"
      return true
    end
  end

  def buy_redbull
    if @slot_money >= Drink.redbull.price && self.current_stock[:redbull] > 0
      puts "レッドブルを購入しました"
      @sale_amount += Drink.redbull.price
      x = self.current_stock[:redbull] - 1
      self.current_stock[:redbull] = x
      return_change = @slot_money -= Drink.redbull.price
      puts "お釣りは#{return_change}円です。"
      return true
    else
      puts "レッドブルを購入できません。"
    end
  end

  def water_info
    if @slot_money >= Drink.water.price && self.current_stock[:water] > 0
      puts "水を購入できます"
      return true
    end
  end

  def buy_water
    if @slot_money >= Drink.water.price && self.current_stock[:water] > 0
      puts "水を購入しました"
      @sale_amount += Drink.water.price
      x = self.current_stock[:water] - 1
      self.current_stock[:water] = x
      return_change = @slot_money -= Drink.water.price
      puts "お釣りは#{return_change}円です。"
      return true
    else
      puts "水を購入できません。"
    end
  end

  def sale_amount
    @sale_amount
  end
end
