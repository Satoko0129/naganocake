class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         #アソシエーション(1:Nの1の方)
        has_many :addresses, dependent: :destroy
        has_many :cart_items, dependent: :destroy
        has_many :orders, dependent: :destroy

  def full_name  #last_name（姓）とfirst_name（名）を結合してフルネームを返すようにする。
    last_name + '' + first_name
  end

  def full_name_kana
    last_name_kana + '' + first_name_kana
  end

  def customer_status  #is_deletedフラグに基づいて、顧客のステータス（有効 or 退会）を返すようにする。
    if is_deleted == true
      "退会"
    else
      "有効"
    end
  end

   #退会したユーザーがログインできないようにするためのメソッド。
  def active_for_authentication?
    super && (self.is_deleted == false)
  end

      #バリデーションヘルパー(presence=空でないこと)
      validates :last_name, presence:true
      validates :first_name, presence:true
      validates :last_name_kana, presence:true
      validates :first_name_kana, presence:true
      validates :telephone_number, presence:true
      validates :postal_code, presence:true
      validates :address, presence:true
      #has_secure_password
      #validates :password, presence: true, length: { minimum: 6 }


end
