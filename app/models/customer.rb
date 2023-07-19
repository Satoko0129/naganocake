class Customer < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

         #アソシエーション(1:Nの1の方)
         has_many :cart_items, dependent: :destroy
         has_many :orders, dependent: :destroy
         has_many :addresses, dependent: :destroy

   #退会
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
