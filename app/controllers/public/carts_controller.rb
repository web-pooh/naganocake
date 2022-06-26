class Public::CartsController < ApplicationController
before_action :authenticate_customer!

    # カート商品一覧を表示
    def index
        @carts = current_customer.carts
        @total_price = @carts.sum{|cart|cart.item.price * cart.count * 1.1}
        # sumメソッド：合計金額を出す
        # 1行目の@cart_itemsにsumメソッドを用いて{}の||ブロック変数にcart_itemを代入している。(each do || end の文章と同じイメージ)
        # cart_item.item.price_without_tax：アソシエーションしているのでドットでつなげる。
        # 『このcart_itemのitemのprice_without_tax』 → 『このカート商品の商品（単体）の税抜き価格』
        # cart_item.quantity：『このカート商品の個数』
    end

    # カート商品を追加する
    def create
        # @cart_item = current_customer.cart_items.build(item_id: params[:item_id])
        @cart = Cart.new(cart_params)
        @cart.customer_id = current_customer.id
        @cart.item_id = params[:item_id]
        # byebug
        if @cart.save
           flash[:notice] = "#{@cart.item.name}をカートに追加しました。"
           redirect_to items_path
        else
            @item = Item.find(params[:cart][:item_id])
            @cart = Cart.new
            flash[:alert] = "個数を選択してください"
            render "public/items/show"
        end
    end

    # 削除や個数を変更した際、カート商品を再計算する
    def update
        @cart = Cart.find(params[:id])
        #@cart.units += cart_params[:units].to_i
        @cart.update(cart_params)
        redirect_to carts_path
    end

    # カート商品を一つのみ削除
    def destroy
        @cart = Cart.find(params[:id])
        @cart.destroy
        flash.now[:alert] = "#{@cart.item.name}を削除しました"
        redirect_to carts_path
    end

    # カート商品を空ににする
    def all
        @cart = current_customer.carts
        @cart.all
        flash[:alert] = "カートの商品を全て削除しました"
        redirect_to carts_path
    end

    private

      def cart_params
        params.require(:cart).permit(:count, :item_id, :customer_id)
      end

end