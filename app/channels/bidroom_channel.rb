class BidroomChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    @auction_item = AuctionItem.find(params[:id])
    stream_for current_user
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
