class SearchController < ApplicationController
  def search
    @value = params["search"]["value"]         #データを代入
    @how = params["search"]["how"]             #データを代入
    @datas = search_for(@how, @value)          #def search_forを実行(引数に検索ワードと検索方法)
  end

  private

  def match(value)
    #.orを使用することで、valueに一致するカラムのデータをnameカラムとgenre_idカラムから探してきます。
    Good.where(name: value).or(Good.where(genre_id: value))
  end

  def forward(value)                              #forward以降は商品名検索の定義しかしてません。
    Good.where("name LIKE ?", "#{value}%")
  end

  def backward(value)
    GOod.where("name LIKE ?", "%#{value}")
  end

  def partical(value)
    Good.where("name LIKE ?", "%#{value}%")
  end


  def search_for(how, value)
    case how                     #引数のhowと一致する処理に進むように定義しています。
    when 'match'                 #ジャンル検索の場合はmatchで固定してるので、必ず'match'の処理に進みます。
      match(value)
    when 'forward'
      forward(value)
    when 'backward'
      backward(value)
    when 'partical'
      partical(value)
    end
  end
end
