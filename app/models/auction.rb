class Auction < ApplicationRecord
  validates :title, uniqueness: true
  validates :title, presence: true
  validates :description, presence: true
  validates :start_time, presence: true
  validates :end_time, presence: true
  # validates :photo, presence: true
  has_many :auction_items, dependent: :destroy
  has_many :artworks, through: :auction_items
  #has_many :bids, through: :auction_items
  belongs_to :user
  has_one_attached :photo

  # DATEPICKER_JS = {
  #   format: 'YYYY-MM-DD HH:mm',
  #   showTodayButton: true,
  #   icons: {
  #     time: 'fa fa-clock-o',
  #     date: 'fa fa-calendar',
  #     up: 'fa fa-arrow-up',
  #     down: 'fa fa-arrow-down',
  #     previous: 'fa fa-chevron-left',
  #     next: 'fa fa-chevron-right',
  #     today: 'fa fa-calendar-check-o',
  #     clear: 'fa fa-delete',
  #     close: 'fa fa-times'
  #   }
  # }
end
