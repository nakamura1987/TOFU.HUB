class Shop < ApplicationRecord
  has_one_attached :image
  validates :store_name, presence: true
  validates :address, presence: true
  validates :phone_number, presence: true
  validates :open_hour, presence: true
  validate :image_check

  def image_check
    if image.present?
      unless image.content_type.in?(%w(image/jpeg image/png))
        errors.add(:image, 'にはjpegまたはpngファイルを添付してください')
      end
    else
      unless image.attached?
        errors.add(:image, 'ファイルを添付してください')
      end
    end
  end  
end
