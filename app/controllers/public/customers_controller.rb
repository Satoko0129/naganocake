class Public::CustomersController < ApplicationController


  def show #顧客のマイページ
    @customer = current_customer
  end

  def edit #顧客の登録情報編集画面
    @customer = current_customer
  end

  def update
    @customer = current_customer
    if @customer.update(customer_params)
      flash[:success] = "登録情報を更新しました。"
      redirect_to customers_my_page_path
    else
      flash.now[:danger] = "登録に失敗しました。"
      render 'edit'
    end
  end

  def quit #顧客の退会確認画面

  end

  def withdraw
    @customer = current_customer
    @customer.update(is_deleted: true) #ステータスの更新
    reset_session #ログアウトさせる
    redirect_to root_path
  end


  private
    def customer_params
      params.require(:customer).permit(:last_name, :first_name, :last_name_kana, :first_name_kana, :postal_code, :address, :telephone_number, :email)
      #requireメソッドがデータのオブジェクト名を定め、permitメソッドで変更を加えられる（保存の処理ができる）キーを指定
    end
end
