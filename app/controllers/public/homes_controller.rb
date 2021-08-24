class Public::HomesController < ApplicationController
  def top
    @goods = Good.first(4) #新着商品4つ表示させるバランスを見て5個とかでもいいかも？
    #もしもジャンル検索を適用するなら下のコメントアウトの＃消してください
    #@genre = Genre.all
  end
  
  def about
  end

end
