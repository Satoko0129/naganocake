class Item < ApplicationRecord
    #has_many :orders, through: :order_details #order_detailsを経由してordersのオブジェクトを取得する
    has_many :order_details #中間テーブル　※throughオプションを使うときに必要
    has_many :cart_items
    belongs_to :genre
    has_one_attached :image

    validates :price, presence: true

  def get_image(width, height)
    unless image.attached?
      file_path = Rails.root.join('app/assets/images/noimage.jpg')
      image.attach(io: File.open(file_path), filename: 'default-image.jpg', content_type: 'image/jpeg')
    end
    image.variant(resize_to_limit: [width, height]).processed
  end

  def tax_in_price
    price*1.1
  end

end
