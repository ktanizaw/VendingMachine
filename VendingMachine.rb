# require './lib/vending_machine'
# machine = VendingMachine.new
#
# machine.stock_info
# machine.store Drink.milk
# machine.store Drink.water
#
# machine.insert 100
# machine.insert 500
#
# machine.total
# machine.refund
#
# machine.purchasable_drink_names
# machine.purchasable? :milk
# machine.purchasable? :water
#
#
#
# machine.sale_amount
#
# exit
class Drink
  attr_reader :name, :price

  def self.milk
    self.new(100, :milk)
  end

  def self.water
    self.new(0, :water)
  end

  def initialize(price, name)
    @name = name
    @price = price
  end
end

class VendingMachine
  AVAILABLE_MONEY = [10, 20, 50, 100, 500, 1000].freeze

  attr_reader :total, :sale_amount

  def initialize
    @total = 0
    @sale_amount = 0
    @drink_table = {}
    store Drink.milk
  end

  def insert(money)
    if AVAILABLE_MONEY.include?(money)
      @total += money
      nil
    else
      money
    end
  end

  def refund
    total = @total
    @total = 0
    total
  end

  def store(drink)
    if @drink_table.has_key? drink.name
    else
      @drink_table[drink.name] = { price: drink.price, drinks: [] }
    end
    @drink_table[drink.name][:drinks] << drink
    nil
  end

  def purchase(drink_name)
    if purchasable? drink_name
      drink = @drink_table[drink_name][:drinks].pop
      @sale_amount += drink.price
      @total -= drink.price
      [drink, refund]
    end
  end

  def purchasable?(drink_name)
    purchasable_drink_names.include? drink_name
  end

  def purchasable_drink_names
    @drink_table.select{ |_, info| info[:price] <= total && info[:drinks].any? }.keys
  end

  def stock_info
    Hash[@drink_table.map { |name, info| [name, { price: info[:price], stock: info[:drinks].size }] }]
  end
end









# このコードをコピペしてrubyファイルに貼り付け、そのファイルをirbでrequireして実行しましょう。
# 例
# irb
#
# （↑のパスは、自動販売機ファイルが入っているパスを指定する）

# 初期設定（自動販売機インスタンスを作成して、vmという変数に代入する）
# vm = VendingMachine.new

# 作成した自動販売機に100円を入れる
# vm.slot_money (100)

# 作成した自動販売機に入れたお金がいくらかを確認する（表示する）
# vm.current_slot_money

# 作成した自動販売機に入れたお金を返してもらう
# vm.return_money

class VendingMachine
  # ステップ０　お金の投入と払い戻しの例コード
  # ステップ１　扱えないお金の例コード

  # 10円玉、50円玉、100円玉、500円玉、1000円札を１つずつ投入できる。
  MONEY = [10, 50, 100, 500, 1000].freeze

  # （自動販売機に投入された金額をインスタンス変数の @slot_money に代入する）

  def initialize
    # 最初の自動販売機に入っている金額は0円
    @slot_money = 0
  end

  # 投入金額の総計を取得できる。
  def current_slot_money
    # 自動販売機に入っているお金を表示する
    @slot_money
  end

  # 10円玉、50円玉、100円玉、500円玉、1000円札を１つずつ投入できる。
  # 投入は複数回できる。
  def slot_money(money)
    # 想定外のもの（１円玉や５円玉。千円札以外のお札、そもそもお金じゃないもの（数字以外のもの）など）
    # が投入された場合は、投入金額に加算せず、それをそのまま釣り銭としてユーザに出力する。
    return false unless MONEY.include?(money)
    # 自動販売機にお金を入れる
    @slot_money += money
  end

  # 払い戻し操作を行うと、投入金額の総計を釣り銭として出力する。
  def return_money
    # 返すお金の金額を表示する
    puts @slot_money　= money - @cola[:price] #追記　投入金額からジュース購入金額を引いた釣り銭
    # 自動販売機に入っているお金を0円に戻す
    @slot_money = 0
  end

  def cola
    @cola = {name: :cola, price: 120, stock: 5} #在庫数の変動を記入しないといけない。
  end
#追記　格納されているジュースの情報（値段と名前と在庫）を取得できる
  def cola_info
    puts @cola[1,2,3]
  end

  def redbull
    @redbull = {name: :redbull, price: 200, stock: 5} #在庫数の変動を記入しないといけない。
  end

  def redbull_info
    puts @redbull[1,2,3]
  end

  def water
    @water = {name: :water, price: 100, stock: 5} #在庫数の変動を記入しないといけない。
  end

  def water_info
    puts @water[1,2,3]
  end

  def list_confirm
    money_x
  end

  def buy
    money_x = get
    if @cola[:stock] > 0 && money_x >= @cola[:price]
      @cola[:stock] = @cola[:stock] - 1
      @slot_money = @slot_money + @cola[:price]
    end
  end

  def sales_money
    puts @slot_money
  end

  class Drink
    def
