class Auction < ApplicationRecord
  validates :description, presence: true
  validates :address, presence: true
  validates :date, presence: true
  validates :status, presence: true
  validates :start_time, presence: true
  validates :end_time, presence: true
  has_many :auction_items, dependent: :destroy

  belongs_to :artist, class_name: "User"
  belongs_to :buyer, class_name: "User"

  DATEPICKER_JS = {
    format: 'YYYY-MM-DD HH:mm',
    showTodayButton: true,
    icons: {
      time: 'fa fa-clock-o',
      date: 'fa fa-calendar',
      up: 'fa fa-arrow-up',
      down: 'fa fa-arrow-down',
      previous: 'fa fa-chevron-left',
      next: 'fa fa-chevron-right',
      today: 'fa fa-calendar-check-o',
      clear: 'fa fa-delete',
      close: 'fa fa-times'
    }
  }
end
