# このコードをコピペしてrubyファイルに貼り付け、そのファイルをirbでrequireして実行しましょう。

# 例

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
  attr_reader :name, :price

  def self.cola
    self.new(:cola, 120)
  end

  def self.redbull
    self.new(:redbull, 200)
  end

  def self.water
    self.new(:water, 100)
  end

  def initialize(name,price)
    @name = name
    @price = price
  end
end

class VendingMachine
  # ステップ０　お金の投入と払い戻しの例コード
  # ステップ１　扱えないお金の例コード

  # 10円玉、50円玉、100円玉、500円玉、1000円札を１つずつ投入できる。
  MONEY = [10, 50, 100, 500, 1000].freeze

  # （自動販売機に投入された金額をインスタンス変数の @slot_money に代入する）
  def initialize
    # 最初の自動販売機に入っている金額は0円
    @slot_money = 0
    # 追記：最初の売上金額は０円
    @sale_amount = 0

    @stock = {cola: 5, redbull: 5, water: 5}
  end

  # 投入金額の総計を取得できる。
  def current_slot_money
    # 自動販売機に入っているお金を表示する
    @slot_money
  end

  def current_stock
    # 自動販売機に入っているお金を表示する
    @stock
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
      puts @slot_money
    # 自動販売機に入っているお金を0円に戻す
    @slot_money = 0
  end

  def cola_info
    if @slot_money > Drink.cola.price && self.current_stock[:cola] > 0
    puts "コーラを購入できます"
    end
  end

  def buy_cola
    if @slot_money > Drink.cola.price && self.current_stock[:cola] > 0
      puts "コーラを購入しました"
      @sale_amount += Drink.cola.price
      # cola_stock = Drink.cola.stock
      # cola_stock - 1
      x = self.current_stock[:cola] - 1
      self.current_stock[:cola] = x
      return_money = @slot_money -= Drink.cola.price
      puts "お釣りは#{return_money}円です。"
      return true
    else
      puts "コーラを購入できません。"
    end
  end

  def sale_amount #現在の売上金額を取得できる
    @sale_amount
  end

end
