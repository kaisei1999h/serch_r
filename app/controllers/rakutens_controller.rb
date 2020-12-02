class RakutensController < ApplicationController
  def search
    if params[:keyword].present?
      items = RakutenWebService::Ichiba::Item.search(keyword: params[:keyword],  sort: params[:order])

      @items_full = []
      page = 1
      while page <= 2 do
        items.page(page).each do |item|
          @items_full.push(item)
        end
        page += 1
      end
      # items.each do |item|
      #   @items_full.push(item)
      # end

      @items = Kaminari.paginate_array(@items_full, total_count: 60 ).page(params[:page]).per(30)
    elsif
      @items = "キーワードを入力してください"
    end
  end

  def index
     @posts = Rakuten.all
  end

  def new
    @post = Rakuten.new
    @item_name = params[:item_name]
    @item_price = params[:item_price]
    @item_url = params[:item_url]
  end
  
  def create
    rakuten = Rakuten.create(item: post_params[:item],memo: post_params[:memo],price: post_params[:price],url: post_params[:url])
    redirect_to rakuten
  end

  def show
    @post = Rakuten.find(params[:id])
  end

  def edit
    @post = Rakuten.find(params[:id])
  end

  def update
    post = Rakuten.find(params[:id])
    # モデルの更新は、クラスメソッドのupdateメソッドで行える
    post.update(post_params)

    # リダイレクト処理
    redirect_to rakuten_path
  end

  def destroy
    post = Rakuten.find(params[:id])
    post.delete

    # 投稿一覧へリダイレクト
    redirect_to rakutens_path
  end

  private

  def post_params
    params.require(:rakuten).permit(:day, :item, :memo, :price, :number, :url)
  end
end

