class Public::HomesController < ApplicationController
  def top
        #新着商品4つ表示させるバランスを見て5個とかでもいいかも？
    @goods = Goods.first(4)
    #もしもジャンル検索を適用するなら下のコメントアウトの＃消してください
    #@genre = Genre.all
  end

end
