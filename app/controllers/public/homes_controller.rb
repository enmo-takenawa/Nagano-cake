class Public::HomesController < ApplicationController
  def top
        #新着商品4つ表示させるバランスを見て5個とかでもいいかも？
    # @goods = Goods.first(4) #view表示のため一旦コメントアウトしました（8/18山本）
    #もしもジャンル検索を適用するなら下のコメントアウトの＃消してください
    #@genre = Genre.all
  end
  
  def about
  end

end
