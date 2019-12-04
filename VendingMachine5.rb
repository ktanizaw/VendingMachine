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
  # ステップ０お金の投入と払い戻しの例コード
  # ステップ１扱えないお金の例コード
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
    @slot_money = money + @slot_money
  end
  # 払い戻し操作を行うと、投入金額の総計を釣り銭として出力する。
  def return_money
    # 返すお金の金額を表示する
    puts @slot_money = @money - @drink_list[0][:price]
    # 自動販売機に入っているお金を0円に戻す
  end
  def cola_buy
    @money = gets.chomp.to_i
    @cola={name: "コーラ",price: 120,stock: 5}
    if @cola[:stock] > 0 && money >= @cola[:price]
      @cola[:stock] = @cola[:stock] - 1
      @slot_money = @slot_money + @cola[:price]
    end
  end
  def redbull_buy
    @money = gets.chomp.to_i
    @redbull={name: "レッドブル",price: 120,stock: 5}
    if @redbull[:stock] > 0 && money >= @redbull[:price]
      @redbull[:stock] = @redbull[:stock] - 1
      @slot_money = @slot_money + @redbull[:price]
    end
  end
    def water_buy
      @money = gets.chomp.to_i
      @water={name: "水",price: 120,stock: 5}
      if @water[:stock] > 0 && money >= @water[:price]
         @water[:stock] = @water[:stock] - 1
         @slot_money = @slot_money + @water[:price]
      end
  end
  def sales_money
    puts "お値段は#{@slot_money}円になります"
    puts "お釣りは#{@money} - #{@slot_money}円です。"
  end
end
vm = VendingMachine.new
puts "お金を投入してください"
vm.cola_buy
vm.sales_money
puts "お買い上げありがとうございました"
