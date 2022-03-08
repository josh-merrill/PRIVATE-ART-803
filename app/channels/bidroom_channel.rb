class BidroomChannel < ApplicationCable::Channel
  def subscribed
    # stream_from "some_channel"
    @auction_item = AuctionItem.find(params[:id])
    stream_for @auction_item
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
  end
end
